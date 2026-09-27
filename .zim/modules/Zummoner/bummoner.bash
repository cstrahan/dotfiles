bummoner() {
  local QUESTION="${READLINE_LINE:-}"
  local PROMPT="
  You are an experienced Linux engineer with expertise in all Linux
  commands and their functionality across different Linux systems.

  Given a task, generate a single command or a pipeline
  of commands that accomplish the task efficiently.
  This command is to be executed in the current shell, bash.
  For complex tasks or those requiring multiple
  steps, provide a pipeline of commands.
  Ensure all commands are safe and prefer modern ways. For instance,
  homectl instead of adduser, ip instead of ifconfig, systemctl, journalctl, etc.
  Make sure that the command flags used are supported by the binaries
  usually available in the current system or shell.
  If a command is not compatible with the
  system or shell, provide a suitable alternative.

  The system information is: $(uname -a) (generated using: uname -a).
  The user is $USER. Use sudo when necessary

  Create a command to accomplish the following task: $QUESTION

  If there is text enclosed in paranthesis, that's what ought to be changed.
  If there's a comment (#), then the stuff after is is the instructions, you should put the stuff there.

  Output only the command as a single line of plain text, with no
  quotes, formatting, or additional commentary. Do not use markdown or any
  other formatting. Do not include the command into a code block.
  Don't include the shell itself (bash, zsh, etc.) in the command.
  "
  if which llcat >& /dev/null; then
    alias _ll="llcat -k $LLC_KEY -u $LLC_SERVER"
    [[ -n "$LLC_MCP" ]] && _ll="$_ll -mf $LLC_MCP"
    model="$LLC_MODEL"
  else
    alias _ll="llm"

    if [[ -r "$HOME/$config/io.datasette.llm/default_model.txt" ]]; then
      model=$(cat "$HOME/$config/io.datasette.llm/default_model.txt")
    else
      model=$(llm models default)
    fi
  fi

  echo ""
  echo "$QUESTION ... $model"
  local response=$(_ll -m "$model" "$PROMPT")
  local COMMAND=$(echo "$response" | sed 's/```//g' | tr -d '\n')
  if [[ -n "$COMMAND" ]]; then
    if [[ -n "$ZUMMONER_SPELL" ]]; then
      [[ "$QUESTION" = *"#"* ]] && QUESTION="${QUESTION#*\# }"
      READLINE_LINE="${COMMAND%%\#*} # $QUESTION"
    else
      READLINE_LINE="$COMMAND"
    fi
    READLINE_POINT=${#READLINE_LINE}
  else
    READLINE_LINE="$QUESTION ... no results"
  fi
}

bind -x '"\C-Xx": bummoner'
