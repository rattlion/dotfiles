#!/bin/zsh
# Claude Code statusLine command — reuses ~/.dotfiles/zsh/prompt.zsh
# And is referenced in ~/.claude/settings.json
#   "statusLine": {
#     "type": "command",
#     "command": "zsh /Users/mattryan/.dotfiles/claude/statusline.sh"
#   },

input=$(cat)
cwd=$(echo "$input" | jq -r '.cwd')

# --- Left side: reuse shell prompt ---

source ~/.dotfiles/zsh/prompt.zsh
cd "$cwd" 2>/dev/null

# (e) expands command substitutions, -P expands %{...%} prompt escapes, strip arrow line
left=$(print -Pn "${(e)PROMPT}" | head -1)

# --- Right side: model, context bar, cost, tokens ---

model=$(echo "$input" | jq -r '.model.display_name // "?"' | sed 's/ (.*//')
used_pct=$(echo "$input" | jq -r '.context_window.used_percentage // 0')
cost=$(echo "$input" | jq -r '.cost.total_cost_usd // 0')
input_tokens=$(echo "$input" | jq -r '.context_window.total_input_tokens // 0')
output_tokens=$(echo "$input" | jq -r '.context_window.total_output_tokens // 0')

# Format cost
cost_fmt=$(printf "$%.2f" "$cost")

# Format tokens (k/M)
total_tokens=$((input_tokens + output_tokens))
if [ "$total_tokens" -ge 1000000 ]; then
  tokens_fmt=$(awk "BEGIN {printf \"%.1fM\", $total_tokens / 1000000}")
elif [ "$total_tokens" -ge 1000 ]; then
  tokens_fmt=$(awk "BEGIN {printf \"%.1fk\", $total_tokens / 1000}")
else
  tokens_fmt="${total_tokens}"
fi

# Progress bar (10 chars wide)
bar_width=10
filled=$(awk "BEGIN {printf \"%d\", ($used_pct / 100) * $bar_width}")
empty=$((bar_width - filled))

bar=""
for ((i=0; i<filled; i++)); do bar+="█"; done
for ((i=0; i<empty; i++)); do bar+="░"; done

# Color the bar: green <60%, yellow 60-80%, red >80%
pct_int=$(printf "%.0f" "$used_pct")
if [ "$pct_int" -ge 80 ]; then
  bar_color="31"
elif [ "$pct_int" -ge 60 ]; then
  bar_color="33"
else
  bar_color="32"
fi

pct_fmt=$(printf "%.1f%%" "$used_pct")

right=$(printf "\033[0;36m%s\033[0m  \033[0;%sm%s\033[0m %s  %s  %s tok" \
  "$model" "$bar_color" "$bar" "$pct_fmt" "$cost_fmt" "$tokens_fmt")

# --- Combine ---
printf "%s    %s" "$left" "$right"
