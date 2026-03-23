#!/usr/bin/env bash
input=$(cat)

# --- Extract fields ---
MODEL=$(echo "$input" | jq -r '.model.display_name')
DIR=$(echo "$input"   | jq -r '.workspace.current_dir')
PCT=$(echo "$input"   | jq -r '.context_window.used_percentage // 0' | cut -d. -f1)
COST=$(echo "$input"  | jq -r '.cost.total_cost_usd // 0')


# --- Colors ---
CYAN='\033[36m'
GREEN='\033[32m'
YELLOW='\033[33m'
RED='\033[31m'
RESET='\033[0m'

# --- Context bar (10 chars) ---
if   [ "$PCT" -ge 90 ]; then BAR_COLOR="$RED"
elif [ "$PCT" -ge 70 ]; then BAR_COLOR="$YELLOW"
else                          BAR_COLOR="$GREEN"
fi
FILLED=$((PCT / 10)); EMPTY=$((10 - FILLED))
BAR=""
[ "$FILLED" -gt 0 ] && printf -v F "%${FILLED}s" && BAR="${F// /█}"
[ "$EMPTY"  -gt 0 ] && printf -v E "%${EMPTY}s"  && BAR="${BAR}${E// /░}"

# --- Cost ---
COST_INT=$(echo "$COST" | awk '{printf "%d", $1 * 10000}')
[ "$COST_INT" -gt 0 ] && COST_FMT=" $(printf "${YELLOW}"'$%.4f'"${RESET}" "$COST")" || COST_FMT=""

# --- Git (cached, refreshed every 5 s) ---
CACHE="/tmp/claude_statusline_git_cache"
CACHE_AGE=5
stale=1
if [ -f "$CACHE" ]; then
    NOW=$(date +%s)
    MTIME=$(date -r "$CACHE" +%s 2>/dev/null || echo 0)
    [ $(( NOW - MTIME )) -le $CACHE_AGE ] && stale=0
fi

if [ "$stale" -eq 1 ]; then
    if git -C "$DIR" rev-parse --git-dir > /dev/null 2>&1; then
        BRANCH=$(git -C "$DIR" branch --show-current 2>/dev/null)
        STAGED=$(git -C "$DIR" diff --cached --numstat 2>/dev/null | wc -l | tr -d ' ')
        MODIFIED=$(git -C "$DIR" diff --numstat 2>/dev/null | wc -l | tr -d ' ')
        printf '%s|%s|%s' "$BRANCH" "$STAGED" "$MODIFIED" > "$CACHE"
    else
        printf '||' > "$CACHE"
    fi
fi
IFS='|' read -r BRANCH STAGED MODIFIED < "$CACHE"

# --- Line 1: model / dir / git ---
GIT_INFO=""
if [ -n "$BRANCH" ]; then
    GIT_INFO=" $BRANCH"
    [ "${STAGED:-0}"   -gt 0 ] && GIT_INFO="${GIT_INFO} ${GREEN}+${STAGED}${RESET}"
    [ "${MODIFIED:-0}" -gt 0 ] && GIT_INFO="${GIT_INFO} ${YELLOW}~${MODIFIED}${RESET}"
fi

# Right-align model name
COLS=$(tput cols 2>/dev/null || echo 80)
LEFT="${DIR##*/}${GIT_INFO} ${BAR_COLOR}${PCT}%${RESET}${COST_FMT}"
LEFT_LEN=$(printf '%b' "$LEFT" | sed 's/\x1b\[[0-9;]*m//g' | tr -d '\n' | wc -m | tr -d ' ')
MODEL_LABEL="[${MODEL}]"
MODEL_LEN=${#MODEL_LABEL}
PAD=$(( COLS - LEFT_LEN - MODEL_LEN ))
[ "$PAD" -lt 1 ] && PAD=1
printf '%b%*s%b\n' "$LEFT" "$PAD" "" "${CYAN}${MODEL_LABEL}${RESET}"
