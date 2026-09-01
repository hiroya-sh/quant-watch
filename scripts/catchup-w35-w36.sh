#!/usr/bin/env bash
# ---------------------------------------------------------------------------
# quant-watch: W33/W34 のマージと、Cowork で生成した W35/W36 のブランチ整理
#
#   使い方:  bash ~/quant-watch/scripts/catchup-w35-w36.sh
#
#   前提: Cowork セッション (2026-09-01) が作業ツリーに以下を直接生成済み
#           items/2026-W35-*.md  items/2026-W36-*.md
#           weekly/2026-W35.md   weekly/2026-W36.md
#           state/seen.json (W35/W36 分を追記済み)
#         Cowork サンドボックスからは .git のロックを消せず branch/checkout が
#         できないため、git 操作だけをローカルに切り出したもの。
#
#   やること:
#     1. 残った .git ロックを掃除
#     2. 生成物を退避し、seen.json を一旦 HEAD に戻す
#     3. main に claude/week-2026-W33 → claude/week-2026-W34 の順でマージ
#        (seen.json が衝突したら W34 側 = 和集合 を採用)
#     4. claude/week-2026-W35 を切って W35 分をコミット
#     5. claude/week-2026-W36 を切って W36 分 + seen.json をコミット
#     6. 両方を main にマージして push
# ---------------------------------------------------------------------------
set -euo pipefail

REPO="${HOME}/quant-watch"
STASH="$(mktemp -d /tmp/quant-watch-catchup.XXXXXX)"
cd "$REPO"

echo "==> 1. .git のロックファイルを掃除"
rm -f .git/*.lock .git/index.lock.stale 2>/dev/null || true
find .git/objects -name 'tmp_obj_*' -delete 2>/dev/null || true

echo "==> 2. 生成物を $STASH に退避"
mkdir -p "$STASH/w35/items" "$STASH/w36/items" "$STASH/w35/weekly" "$STASH/w36/weekly"
cp items/2026-W35-*.md  "$STASH/w35/items/"
cp items/2026-W36-*.md  "$STASH/w36/items/"
cp weekly/2026-W35.md   "$STASH/w35/weekly/"
cp weekly/2026-W36.md   "$STASH/w36/weekly/"
cp state/seen.json      "$STASH/seen.json"
cp scripts/catchup-w35-w36.sh "$STASH/" 2>/dev/null || true

rm -f items/2026-W35-*.md items/2026-W36-*.md weekly/2026-W35.md weekly/2026-W36.md
git checkout -- state/seen.json
git status --short

echo "==> 3. main に W33 / W34 をマージ"
git checkout main
git pull --ff-only origin main || echo "   (pull 失敗: オフライン等。ローカルのまま続行)"

git merge --no-ff claude/week-2026-W33 -m "Merge claude/week-2026-W33 into main" || {
  echo "   W33 マージで衝突 -> state/seen.json は W33 側を採用"
  git checkout --theirs state/seen.json && git add state/seen.json
  git commit --no-edit
}

git merge --no-ff claude/week-2026-W34 -m "Merge claude/week-2026-W34 into main" || {
  echo "   W34 マージで衝突 -> state/seen.json は W34 側(和集合)を採用"
  git checkout --theirs state/seen.json && git add state/seen.json
  git commit --no-edit
}

echo "==> 4. claude/week-2026-W35 を作成してコミット"
git checkout -b claude/week-2026-W35
cp "$STASH"/w35/items/*.md  items/
cp "$STASH"/w35/weekly/*.md weekly/
git add items/2026-W35-*.md weekly/2026-W35.md scripts/catchup-w35-w36.sh
git commit -m "Week 2026-W35: 6 highlights, 25 items (manual catch-up)"

echo "==> 5. claude/week-2026-W36 を作成してコミット"
git checkout -b claude/week-2026-W36
cp "$STASH"/w36/items/*.md  items/
cp "$STASH"/w36/weekly/*.md weekly/
cp "$STASH"/seen.json state/seen.json
git add items/2026-W36-*.md weekly/2026-W36.md state/seen.json
git commit -m "Week 2026-W36: 7 highlights, 27 items (manual catch-up, extended window to 2026-09-01)"

echo "==> 6. main にマージして push"
git checkout main
git merge --no-ff claude/week-2026-W35 -m "Merge claude/week-2026-W35 into main"
git merge --no-ff claude/week-2026-W36 -m "Merge claude/week-2026-W36 into main"

git push origin main
git push origin claude/week-2026-W35 claude/week-2026-W36 || true

echo
echo "==> 完了。main が W36 まで進みました。"
echo "    退避ディレクトリ: $STASH (問題なければ削除して構いません)"
git log --oneline -8
