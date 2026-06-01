# 設定変更の決定記録

設定変更(taxonomy/keywords/priorities/repos等)を行った際、**なぜその変更をしたか**を残す。
後のセッションで「なぜこうなっているか」を再説明しなくて済むためのログ。

---

## 2026-06-01

- **routine-prompt.mdの冒頭を修正**: 「Run this routine every Monday」という文言をClaudeがスケジュール登録指示と誤解し、Remote Routineを登録しようとする問題が発生。「今すぐ実行せよ」と明示する文言に変更。
- **launchd + フルディスクアクセス**: launchd経由の自動実行が`Operation not permitted`で失敗。原因はmacOSのTCC保護。`/bin/bash`をフルディスクアクセスに追加することで解決。
- **W23初回自動収集**: 手動実行で正常完了。PR #2が作成された。launchd経由の次回自動実行は2026-06-08(月)08:00。

## 2026-05-29

- **セットアップ完了**: quant-watch の初期構築。ローカル launchd + caffeinate + claude CLI による月曜自動収集体制を確立。
- **Nemotron を focus から外した**: 視野を狭めないため。タグ自体は taxonomy に残してあり、ウォッチ対象から完全に除外したわけではない。
- **mamba アーキテクチャタグを focus から外した**: 同様に視野を狭めないため。taxonomy には残存。
- **weekly サマリから items へのリンク**: W22 は後付けで手動追加。W23 以降は routine-prompt.md に組み込み済みのため自動生成される。
