# 設定変更の決定記録

設定変更(taxonomy/keywords/priorities/repos等)を行った際、**なぜその変更をしたか**を残す。
後のセッションで「なぜこうなっているか」を再説明しなくて済むためのログ。

---

## 2026-05-29

- **セットアップ完了**: quant-watch の初期構築。ローカル launchd + caffeinate + claude CLI による月曜自動収集体制を確立。
- **Nemotron を focus から外した**: 視野を狭めないため。タグ自体は taxonomy に残してあり、ウォッチ対象から完全に除外したわけではない。
- **mamba アーキテクチャタグを focus から外した**: 同様に視野を狭めないため。taxonomy には残存。
- **weekly サマリから items へのリンク**: W22 は後付けで手動追加。W23 以降は routine-prompt.md に組み込み済みのため自動生成される。
