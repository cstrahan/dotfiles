#!/bin/sh

# Status Line for Claude Code, with usage meters.
#
# Looks like:
#
#     Opus 4.6 (1M context)  ctx:[░░░░░░░░░░]2%  1.4/5h:[█░░░░░░░░░]7%  3.1/7d:[███░░░░░░░]31%
#
# Usage:
#   bash statusline-command.sh --install   Install into ~/.claude/settings.json

if [ "$1" = "--install" ]; then
  # Resolve the absolute path to this script
  script_dir="$(cd "$(dirname "$0")" && pwd)"
  script_path="${script_dir}/$(basename "$0")"

  settings="$HOME/.claude/settings.json"

  # Ensure settings file exists
  if [ ! -f "$settings" ]; then
    echo "{}" > "$settings"
  fi

  # Print previous statusLine so the user can restore it
  prev=$(jq '.statusLine // empty' "$settings")
  if [ -n "$prev" ]; then
    echo "Previous statusLine setting:"
    echo "$prev"
  else
    echo "No previous statusLine setting found."
  fi

  # Write the new statusLine config
  jq --arg cmd "bash $script_path" '.statusLine = {"type": "command", "command": $cmd}' "$settings" > "${settings}.tmp" \
    && mv "${settings}.tmp" "$settings"

  echo ""
  echo "statusLine installed. New setting:"
  jq '.statusLine' "$settings"
  exit 0
fi

input=$(cat)

make_bar() {
  pct="$1"
  filled=$(echo "$pct" | awk '{printf "%d", ($1 / 10 + 0.5)}')
  bar=""
  i=0
  while [ "$i" -lt 10 ]; do
    if [ "$i" -lt "$filled" ]; then
      bar="${bar}█"
    else
      bar="${bar}░"
    fi
    i=$((i + 1))
  done
  printf "%s" "$bar"
}

# Get display width of a string (character count, not bytes)
display_width() {
  printf '%s' "$1" | wc -m | tr -d ' '
}

model=$(echo "$input" | jq -r '.model.display_name // "Unknown"')
ctx_used=$(echo "$input" | jq -r '.context_window.used_percentage // empty')
five_hour=$(echo "$input" | jq -r '.rate_limits.five_hour.used_percentage // empty')
five_hour_resets=$(echo "$input" | jq -r '.rate_limits.five_hour.resets_at // empty')
seven_day=$(echo "$input" | jq -r '.rate_limits.seven_day.used_percentage // empty')
seven_day_resets=$(echo "$input" | jq -r '.rate_limits.seven_day.resets_at // empty')

# Build segments
seg_model="$model"

seg_ctx=""
if [ -n "$ctx_used" ]; then
  bar=$(make_bar "$ctx_used")
  pct=$(printf "%.0f" "$ctx_used")
  seg_ctx="ctx:[${bar}]${pct}%"
fi

seg_5h=""
if [ -n "$five_hour" ]; then
  bar=$(make_bar "$five_hour")
  pct=$(printf "%.0f" "$five_hour")
  if [ -n "$five_hour_resets" ]; then
    now=${now:-$(date +%s)}
    hours_in=$(echo "$five_hour_resets $now" | awk '{
      remaining = ($1 - $2) / 3600
      h = 5 - remaining
      if (h < 0) h = 0
      if (h > 5) h = 5
      if (h == int(h)) printf "%.0f", h
      else printf "%.1f", h
    }')
    seg_5h="${hours_in}/5h:[${bar}]${pct}%"
  else
    seg_5h="5h:[${bar}]${pct}%"
  fi
fi

seg_7d=""
if [ -n "$seven_day" ]; then
  bar=$(make_bar "$seven_day")
  pct=$(printf "%.0f" "$seven_day")
  if [ -n "$seven_day_resets" ]; then
    now=${now:-$(date +%s)}
    days_in=$(echo "$seven_day_resets $now" | awk '{
      remaining = ($1 - $2) / 86400
      d = 7 - remaining
      if (d < 0) d = 0
      if (d > 7) d = 7
      if (d == int(d)) printf "%.0f", d
      else printf "%.1f", d
    }')
    seg_7d="${days_in}/7d:[${bar}]${pct}%"
  else
    seg_7d="7d:[${bar}]${pct}%"
  fi
fi

# Get terminal width, default to 80
cols=$(stty size < /dev/tty 2>/dev/null | awk '{print $2}')
cols=${cols:-80}
sep="  "
sep_w=2

# Greedily pack segments onto lines
line=""
line_w=0
result=""

for seg in "$seg_model" "$seg_ctx" "$seg_5h" "$seg_7d"; do
  [ -z "$seg" ] && continue
  seg_w=$(display_width "$seg")

  if [ "$line_w" -eq 0 ]; then
    # First segment on this line
    line="$seg"
    line_w=$seg_w
  elif [ $((line_w + sep_w + seg_w)) -le "$cols" ]; then
    # Fits on current line
    line="${line}${sep}${seg}"
    line_w=$((line_w + sep_w + seg_w))
  else
    # Wrap to new line
    if [ -n "$result" ]; then
      result="${result}
${line}"
    else
      result="$line"
    fi
    line="$seg"
    line_w=$seg_w
  fi
done

# Flush last line
if [ -n "$line" ]; then
  if [ -n "$result" ]; then
    result="${result}
${line}"
  else
    result="$line"
  fi
fi

printf "%s" "$result"
