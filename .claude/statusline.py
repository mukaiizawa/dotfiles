#!/usr/bin/env python3
import json
import os
import subprocess
import sys
import tempfile
import time

sys.stdout = open(sys.stdout.fileno(), mode='w', encoding='utf-8', buffering=1)

# --- ANSI colors ---
CYAN   = '\033[36m'
GREEN  = '\033[32m'
YELLOW = '\033[33m'
RED    = '\033[31m'
RESET  = '\033[0m'

def color_for_pct(pct):
    if pct >= 90: return RED
    if pct >= 70: return YELLOW
    return GREEN

def git_run(*args, cwd):
    r = subprocess.run(['git', '-C', cwd] + list(args),
                       capture_output=True, text=True)
    return r.stdout.strip() if r.returncode == 0 else None

# --- Parse input ---
data    = json.loads(sys.stdin.read())
model   = data.get('model', {}).get('display_name', '')
cur_dir = data.get('workspace', {}).get('current_dir', '')
ctx_pct = int(data.get('context_window', {}).get('used_percentage') or 0)

bar_color = color_for_pct(ctx_pct)

# --- Git (cached, refreshed every 5s) ---
CACHE     = os.path.join(tempfile.gettempdir(), 'claude_statusline_git_cache')
CACHE_AGE = 5

if not (os.path.exists(CACHE) and time.time() - os.path.getmtime(CACHE) <= CACHE_AGE):
    is_repo = git_run('rev-parse', '--git-dir', cwd=cur_dir) is not None
    if is_repo:
        branch = git_run('branch', '--show-current', cwd=cur_dir) or ''
        staged = len((git_run('diff', '--cached', '--numstat', cwd=cur_dir) or '').splitlines())
    else:
        branch, staged = '', 0
    with open(CACHE, 'w') as f:
        f.write(f'{branch}|{staged}')

with open(CACHE) as f:
    raw    = f.read().split('|')
    branch = raw[0] if len(raw) > 0 else ''
    staged = int(raw[1]) if len(raw) > 1 and raw[1] else 0

# --- Assemble output ---
parts = [cur_dir]

if branch:
    parts.append(f"@{branch}")
if staged > 0:
    parts.append(f"{GREEN}+{staged}{RESET}")

parts.append(f"{bar_color}{ctx_pct}%{RESET}")

rate_limits = data.get('rate_limits')
if rate_limits is not None:
    for key, label in [('five_hour', '5h'), ('seven_day', '7d')]:
        entry = rate_limits.get(key)
        if entry is not None:
            pct = int(entry.get('used_percentage') or 0)
            parts.append(f"{color_for_pct(pct)}{label}:{pct}%{RESET}")
else:
    cost = data.get('cost', {}).get('total_cost_usd') or 0
    if cost > 0:
        parts.append(f"{YELLOW}${cost:.4f}{RESET}")

parts.append(f"{CYAN}[{model}]{RESET}")

sys.stdout.write(' '.join(parts) + '\n')
