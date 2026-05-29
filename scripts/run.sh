#!/usr/bin/env bash
#
# quant-watch weekly run script
# launchd または手動で呼ばれる前提
#
set -euo pipefail

# === パス自動検出 ===
# このスクリプトが {repo}/scripts/run.sh にあることを前提に repo root を取得
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

# === ログ ===
LOG_DIR="$REPO_DIR/.logs"
mkdir -p "$LOG_DIR"
LOG_FILE="$LOG_DIR/$(date +%Y-%m-%d_%H%M%S).log"
exec > >(tee -a "$LOG_FILE") 2>&1

echo "=== quant-watch run started at $(date) ==="
echo "REPO_DIR: $REPO_DIR"

# === 多重実行防止 (PIDロック) ===
LOCK_FILE="/tmp/quant-watch.lock"
if [ -f "$LOCK_FILE" ]; then
    OLD_PID=$(cat "$LOCK_FILE")
    if kill -0 "$OLD_PID" 2>/dev/null; then
        echo "ERROR: Another instance (PID $OLD_PID) is running. Exiting."
        exit 1
    fi
fi
echo $$ > "$LOCK_FILE"
trap "rm -f $LOCK_FILE" EXIT

# === PATH補強(launchdは最小PATHで起動するため) ===
export PATH="/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:$HOME/.local/bin:$PATH"

# === claude CLI 存在確認 ===
if ! command -v claude >/dev/null 2>&1; then
    echo "ERROR: claude CLI not found in PATH"
    echo "PATH=$PATH"
    exit 1
fi
echo "claude binary: $(command -v claude)"

# === gh CLI 存在確認 ===
if ! command -v gh >/dev/null 2>&1; then
    echo "ERROR: gh CLI not found in PATH"
    exit 1
fi

# === 実行 ===
cd "$REPO_DIR"

echo "Pulling latest main..."
git checkout main
git pull --ff-only origin main

echo "Starting Claude run..."
caffeinate -is claude -p "$(cat routine-prompt.md)" \
    --dangerously-skip-permissions \
    --output-format text \
    --max-turns 200

echo "=== quant-watch run completed at $(date) ==="
