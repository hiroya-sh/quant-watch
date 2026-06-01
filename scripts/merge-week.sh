#!/usr/bin/env bash
#
# merge-week.sh
# レビュー済みの週ブランチ (claude/week-{ISO_WEEK}) を「ローカルで」main にマージし、
# push して main に戻る。GitHub の Web UI を開かずにマージ承認を完了する用途。
#
# 使い方:
#   bash scripts/merge-week.sh                       # 現在の週ブランチ(無ければ最新の claude/week-*)を対象
#   bash scripts/merge-week.sh claude/week-2026-W23  # ブランチを明示指定
#
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
cd "$REPO_DIR"
export PATH="/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:$PATH"

# === 対象ブランチの決定 ===
if [ "${1:-}" != "" ]; then
    BRANCH="$1"
elif git rev-parse --abbrev-ref HEAD | grep -q '^claude/week-'; then
    BRANCH="$(git rev-parse --abbrev-ref HEAD)"
else
    git fetch origin --prune --quiet || true
    BRANCH="$(git for-each-ref --sort=-committerdate \
        --format='%(refname:short)' 'refs/remotes/origin/claude/week-*' 2>/dev/null | head -1)"
    BRANCH="${BRANCH#origin/}"
fi
[ -n "$BRANCH" ] || { echo "ERROR: マージ対象の claude/week-* ブランチが見つかりません。"; exit 1; }
echo "Merge対象ブランチ: $BRANCH"

# === 未コミットの変更があれば中断(取りこぼし防止) ===
if ! git diff --quiet || ! git diff --cached --quiet; then
    echo "ERROR: 未コミットの変更があります。commit するか取り消してから再実行してください:"
    git status -s
    exit 1
fi

# === 最新化 ===
git fetch origin --prune

# ローカルに週ブランチがあればそれを(レビュー中の手元コミットを優先)、無ければ origin を使う
if git show-ref --verify --quiet "refs/heads/${BRANCH}"; then
    MERGE_REF="$BRANCH"
else
    MERGE_REF="origin/$BRANCH"
fi
echo "マージ元: $MERGE_REF"

git checkout main
git pull --ff-only origin main

# === マージ(マージコミットを残す = PR をマージしたのと同じ履歴) ===
if ! git merge --no-ff "$MERGE_REF" -m "Merge $BRANCH into main (local review approved)"; then
    echo "ERROR: マージ衝突が発生しました。中断します。手動で解決してください。"
    git merge --abort || true
    exit 1
fi

# === リモート main を同期 ===
git push origin main

# === 後片付け: 取り込み済みの週ブランチを削除 (local + remote) ===
# main に取り込まれたことで、GitHub 上の対応 PR は自動的に Merged 扱いになる
git branch -d "$BRANCH" 2>/dev/null || true
git push origin --delete "$BRANCH" 2>/dev/null || true

echo ""
echo "✅ 完了: '$BRANCH' を main にマージ → push → main に戻りました。"
echo "   GitHub の PR は自動的に Merged になります。Obsidian も main の最新状態です。"
git log --oneline -3
