#!/usr/bin/env python3
"""
Claude Code hook for logging Bash tool calls to atuin history.

Handles both PreToolUse (records start time) and PostToolUse (inserts entry
via `atuin history start/end` CLI for proper encryption and sync support).

Install by adding to ~/.claude/settings.json:
{
  "hooks": {
    "PreToolUse": [{"matcher": "Bash", "hooks": [{"type": "command", "command": "python3 ~/.local/bin/claude-atuin-hook.py"}]}],
    "PostToolUse": [{"matcher": "Bash", "hooks": [{"type": "command", "command": "python3 ~/.local/bin/claude-atuin-hook.py"}]}]
    "PostToolUseFailure": [{"matcher": "Bash", "hooks": [{"type": "command", "command": "python3 ~/.local/bin/claude-atuin-hook.py"}]}]
  }
}

Writing to a separate atuin database:
  Atuin derives its database paths from XDG_DATA_HOME:
    history.db  → $XDG_DATA_HOME/atuin/history.db
    records.db  → $XDG_DATA_HOME/atuin/records.db
    key         → $XDG_DATA_HOME/atuin/key
    host_id     → $XDG_DATA_HOME/atuin/host_id

  To write to a separate database (e.g., for Claude-specific history), set
  XDG_DATA_HOME in the hook command's environment. The hook command in
  settings.json supports environment variable syntax:

  {
    "hooks": {
      "PreToolUse": [{"matcher": "Bash", "hooks": [{"type": "command", "command": "XDG_DATA_HOME=~/.local/share/claude-atuin python3 ~/.local/bin/claude-atuin-hook.py"}]}],
      "PostToolUse": [{"matcher": "Bash", "hooks": [{"type": "command", "command": "XDG_DATA_HOME=~/.local/share/claude-atuin python3 ~/.local/bin/claude-atuin-hook.py"}]}]
      "PostToolUseFailure": [{"matcher": "Bash", "hooks": [{"type": "command", "command": "XDG_DATA_HOME=~/.local/share/claude-atuin python3 ~/.local/bin/claude-atuin-hook.py"}]}]
    }
  }

  This creates an isolated atuin data directory at ~/.local/share/claude-atuin/atuin/
  with its own history.db, records.db, and encryption key.

  Alternatively, for more granular control (e.g., sharing the same encryption
  key but using a different DB file), set ATUIN_CONFIG_DIR to point to a
  directory containing a config.toml with custom db_path/record_store_path:

    # ~/.config/claude-atuin/config.toml
    db_path = "~/.local/share/claude-atuin/atuin/history.db"
    record_store_path = "~/.local/share/claude-atuin/atuin/records.db"

  Then use ATUIN_CONFIG_DIR=~/.config/claude-atuin in the hook command.

Searching Claude history from zsh:
  If you've sourced the atuin zsh plugin and are writing to a separate database,
  you can add a keybinding to interactively search just the Claude history.
  Add the following to your ~/.zshrc (after `eval "$(atuin init zsh)"`):

    _atuin_claude_search() {
      emulate -L zsh
      zle -I

      local output
      output=$(XDG_DATA_HOME=~/.local/share/claude-atuin ATUIN_SHELL=zsh ATUIN_LOG=error ATUIN_QUERY=$BUFFER atuin search -i 3>&1 1>&2 2>&3)

      zle reset-prompt
      echo -n ${zle_bracketed_paste[1]} >/dev/tty

      if [[ -n $output ]]; then
        RBUFFER=""
        LBUFFER=$output
        if [[ $LBUFFER == __atuin_accept__:* ]]; then
          LBUFFER=${LBUFFER#__atuin_accept__:}
          zle accept-line
        fi
      fi
    }
    zle -N claude-atuin-search _atuin_claude_search
    bindkey '^X^R' claude-atuin-search  # Ctrl-X Ctrl-R

  Adjust the XDG_DATA_HOME value to match what you used in the hook command,
  and change the keybinding ('^X^R') to your preference.
"""

# Hook input JSON examples (Bash tool):
#
# PreToolUse:
#   {
#     "session_id": "99dce4b4-...",
#     "transcript_path": "/Users/.../.claude/projects/.../99dce4b4-....jsonl",
#     "cwd": "/Users/cstrahan/src/project",
#     "permission_mode": "default",
#     "hook_event_name": "PreToolUse",
#     "tool_name": "Bash",
#     "tool_input": {"command": "echo hello", "description": "Run echo"},
#     "tool_use_id": "toolu_017yme1zyeym1BuTevLyFRCy"
#   }
#
# PostToolUse (success, exit code 0):
#   {
#     "session_id": "99dce4b4-...",
#     "transcript_path": "/Users/.../.claude/projects/.../99dce4b4-....jsonl",
#     "cwd": "/Users/cstrahan/src/project",
#     "permission_mode": "default",
#     "hook_event_name": "PostToolUse",
#     "tool_name": "Bash",
#     "tool_input": {"command": "echo hello", "description": "Run echo"},
#     "tool_response": {"stdout": "hello", "stderr": "", "interrupted": false, "isImage": false},
#     "tool_use_id": "toolu_017yme1zyeym1BuTevLyFRCy"
#   }
#
# PostToolUseFailure (non-zero exit):
#   {
#     "session_id": "99dce4b4-...",
#     "transcript_path": "/Users/.../.claude/projects/.../99dce4b4-....jsonl",
#     "cwd": "/Users/cstrahan/src/project",
#     "permission_mode": "default",
#     "hook_event_name": "PostToolUseFailure",
#     "tool_name": "Bash",
#     "tool_input": {"command": "exit 7", "description": "Failing command"},
#     "tool_use_id": "toolu_01RDBuTWEVKLvAUcTUsnoUfo",
#     "error": "Exit code 7\nsome output",
#     "is_interrupt": false
#   }

# References:
#   https://code.claude.com/docs/en/plugins-reference#hooks
#   https://code.claude.com/docs/en/hooks
#   https://code.claude.com/docs/en/hooks-guide

from __future__ import annotations

import json
import os
import subprocess
import sys
import time
from pathlib import Path
from typing import Any, TypeAlias

CACHE_DIR: Path = Path.home() / ".cache" / "claude-code" / "atuin-hooks"
SESSIONS_DIR: Path = CACHE_DIR / "sessions"
DEBUG: bool = bool(os.environ.get("CLAUDE_ATUIN_DEBUG"))
LOG_FILE: Path = CACHE_DIR / "debug.jsonl"

HookData: TypeAlias = dict[str, Any]


def debug_log(event: str, **fields: Any) -> None:
    """Append a structured JSON log line to the debug log file."""
    if not DEBUG:
        return
    CACHE_DIR.mkdir(parents=True, exist_ok=True)
    entry: dict[str, Any] = {"ts": time.time(), "event": event, **fields}
    with LOG_FILE.open("a") as f:
        f.write(json.dumps(entry) + "\n")


def get_atuin_session(claude_session_id: str) -> str | None:
    """Map a Claude Code session_id to a stable atuin UUID v7.

    Generates a UUID v7 via `atuin uuid` on first invocation per session,
    then caches it. The embedded timestamp gives atuin's SessionPreload
    filter an accurate session start time.
    """
    if not claude_session_id:
        return None

    SESSIONS_DIR.mkdir(parents=True, exist_ok=True)
    session_file: Path = SESSIONS_DIR / claude_session_id

    if session_file.exists():
        cached: str = session_file.read_text().strip()
        if cached:
            return cached

    result: subprocess.CompletedProcess[str] = subprocess.run(
        ["atuin", "uuid"],
        capture_output=True,
        text=True,
        timeout=5,
    )
    if result.returncode != 0:
        return None

    atuin_uuid: str = result.stdout.strip()
    if not atuin_uuid:
        return None

    session_file.write_text(atuin_uuid)
    return atuin_uuid


def handle_pre_tool_use(data: HookData) -> None:
    """Record the start time for duration tracking."""
    tool_use_id: str = data.get("tool_use_id", "")
    if not tool_use_id:
        debug_log("pre_tool_use_skip", reason="no tool_use_id")
        return

    start_ns: int = time.time_ns()
    CACHE_DIR.mkdir(parents=True, exist_ok=True)
    (CACHE_DIR / tool_use_id).write_text(str(start_ns))
    debug_log("pre_tool_use", tool_use_id=tool_use_id, start_ns=start_ns)


def record_command(data: HookData) -> None:
    """Insert the completed command into atuin history."""
    command: str = data.get("tool_input", {}).get("command", "")
    if not command:
        debug_log("record_command_skip", reason="no command")
        return

    # PostToolUse implies success (exit 0).
    # PostToolUseFailure provides error string starting with "Exit code N\n...".
    event: str = data.get("hook_event_name", "")
    if event == "PostToolUse":
        exit_code: int = 0
    else:
        exit_code = 1
        error_str: str = data.get("error", "")
        first_line: str = error_str.split("\n", 1)[0]
        if first_line.startswith("Exit code "):
            try:
                exit_code = int(first_line.removeprefix("Exit code "))
            except ValueError:
                pass

    cwd: str = data.get("cwd") or os.getcwd()
    tool_use_id: str = data.get("tool_use_id", "")
    session_id: str = data.get("session_id", "")

    debug_log(
        "record_command_start",
        tool_use_id=tool_use_id,
        command=command,
        exit_code=exit_code,
        cwd=cwd,
        hook_event=event,
    )

    # Calculate duration from cached start time
    duration_ns: int = 0
    start_file_found: bool = False
    if tool_use_id:
        start_file: Path = CACHE_DIR / tool_use_id
        start_file_found = start_file.exists()
        if start_file_found:
            try:
                start_ns: int = int(start_file.read_text().strip())
                duration_ns = time.time_ns() - start_ns
            except (ValueError, OSError) as e:
                debug_log("duration_error", error=str(e))
            finally:
                try:
                    start_file.unlink()
                except OSError:
                    pass

    debug_log(
        "duration_calc",
        start_file_found=start_file_found,
        duration_ns=duration_ns,
        duration_s=duration_ns / 1e9,
    )

    # Map Claude session to a stable atuin UUID v7
    env: dict[str, str] = os.environ.copy()
    atuin_session: str | None = get_atuin_session(session_id)
    if atuin_session:
        env["ATUIN_SESSION"] = atuin_session

    # Step 1: Create the history entry
    start_cmd: list[str] = ["atuin", "history", "start", "--", command]
    result: subprocess.CompletedProcess[str] = subprocess.run(
        start_cmd,
        cwd=cwd,
        env=env,
        capture_output=True,
        text=True,
        timeout=5,
    )
    debug_log(
        "atuin_history_start",
        returncode=result.returncode,
        stdout=result.stdout.strip(),
        stderr=result.stderr.strip(),
    )

    if result.returncode != 0:
        return

    history_id: str = result.stdout.strip()
    if not history_id:
        debug_log("post_tool_use_skip", reason="no history_id from start")
        return

    # Step 2: Complete the entry with exit code and duration
    # Use --exit=N syntax to avoid clap interpreting negative values as flags
    end_cmd: list[str] = [
        "atuin",
        "history",
        "end",
        f"--exit={exit_code}",
        f"--duration={duration_ns}",
        "--",
        history_id,
    ]
    end_result: subprocess.CompletedProcess[str] = subprocess.run(
        end_cmd,
        env=env,
        capture_output=True,
        text=True,
        timeout=5,
    )
    debug_log(
        "atuin_history_end",
        returncode=end_result.returncode,
        stdout=end_result.stdout.strip(),
        stderr=end_result.stderr.strip(),
        history_id=history_id,
        exit_code=exit_code,
        duration_ns=duration_ns,
    )


def main() -> None:
    try:
        data: HookData = json.load(sys.stdin)
    except (json.JSONDecodeError, EOFError, ValueError) as e:
        debug_log("stdin_parse_error", error=str(e))
        return

    tool_name: str = data.get("tool_name", "")
    event: str = data.get("hook_event_name", "")
    debug_log(
        "hook_invoked",
        tool_name=tool_name,
        hook_event=event,
        XDG_DATA_HOME=os.environ.get("XDG_DATA_HOME"),
        ATUIN_CONFIG_DIR=os.environ.get("ATUIN_CONFIG_DIR"),
    )

    if tool_name != "Bash":
        return

    if event == "PreToolUse":
        handle_pre_tool_use(data)
    elif event in ("PostToolUse", "PostToolUseFailure"):
        record_command(data)


if __name__ == "__main__":
    try:
        main()
    except Exception as e:
        debug_log("unhandled_exception", error=str(e), type=type(e).__name__)
        # Never interfere with Claude Code operation
