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
caffeinate -is claude -p "$(cat routine-prompt.md)" --dangerously-skip-permissions --output-format text --max-turns 200

# === レビュー用: 生成された週ブランチへローカルを自動切替 ===
# claude が main から claude/week-{ISO_WEEK} ブランチを作成・push する前提。
# 実行後ローカル working tree をそのブランチに合わせ、Obsidian でそのまま確認できるようにする。
echo "Syncing local working tree to the new week branch for review..."
git fetch origin --prune --quiet || true

ISO_WEEK="$(date +%G)-W$(date +%V)"          # 例: 2026-W23
WEEK_BRANCH="claude/week-${ISO_WEEK}"
if git show-ref --verify --quiet "refs/remotes/origin/${WEEK_BRANCH}"; then
    TARGET="$WEEK_BRANCH"
else
    # フォールバック: origin 上で最も新しい claude/week-* ブランチ
    TARGET="$(git for-each-ref --sort=-committerdate \
        --format='%(refname:short)' 'refs/remotes/origin/claude/week-*' 2>/dev/null | head -1)"
    TARGET="${TARGET#origin/}"
fi

if [ -n "$TARGET" ]; then
    if git checkout -B "$TARGET" "origin/$TARGET"; then
        echo ">>> ローカルは '$TARGET' に切り替わりました。Obsidian で内容を確認 → GitHub で PR をマージ承認してください。"
    else
        echo "WARN: '$TARGET' へのチェックアウトに失敗(未コミットの変更が残っている可能性)。'git status' を確認してください。"
    fi
else
    echo "WARN: origin 上に claude/week-* ブランチが見つかりませんでした。収集が0件 or PR未作成の可能性。"
fi

echo "=== quant-watch run completed at $(date) ==="
