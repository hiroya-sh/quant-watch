# quant-watch

LLM量子化技術の週次ウォッチ。月曜朝に Claude が前週の論文・実装・モデル情報を収集して PR を投げる。Hiroya がレビューして merge すると Obsidian vault に反映される。

## 週次ワークフロー

```
月曜 07:55  Mac が自動起床 (pmset wake)
月曜 08:00  launchd が scripts/run.sh を起動
              ↓ arXiv / GitHub releases / Hugging Face を巡回
              ↓ items/ と weekly/ に日本語サマリ md を生成
              ↓ claude/week-{ISO週} ブランチに commit
              ↓ main 向け PR を open
月曜中      Hiroya が GitHub で PR 内容を確認 → Merge pull request を押す
              ↓ Obsidian Git が main を auto-pull (60分間隔)
              ↓ vault 更新完了 → 火曜定例の議題判断
```

## ディレクトリ構成

```
quant-watch/
├── items/              # 週次生成アイテム詳細 (1アイテム1md)
├── weekly/             # 週次サマリ
├── my-notes/           # Hiroya専用メモ
│   ├── decisions.md    # 設定変更の理由記録
│   ├── trends.md       # 長期トレンドメモ
│   └── cowork-prompts.md  # セッション開始テンプレ
├── state/
│   ├── taxonomy.yml    # タグ正規化辞書
│   ├── keywords.yml    # 収集フィルタ語彙
│   ├── repos.yml       # GitHub releases 監視対象
│   ├── priorities.yml  # 注目トピック
│   └── seen.json       # 重複排除キー (触らない)
├── scripts/
│   └── run.sh          # launchd から呼ばれる実行スクリプト
├── templates/          # アイテム・週次サマリのテンプレ
├── routine-prompt.md   # Claude への収集・要約指示書
├── HANDOFF.md          # Coworkセッション引き継ぎ資料
├── SETUP-LOCAL.md      # Hiroya の自動実行環境セットアップ
└── SETUP-MEMBER.md     # チームメンバー向けセットアップ
```

## セットアップ

- **自動収集環境を作る (Hiroya のみ)** → [SETUP-LOCAL.md](SETUP-LOCAL.md)
- **閲覧・議論参加のみ (チームメンバー)** → [SETUP-MEMBER.md](SETUP-MEMBER.md)

## カスタマイズ (Hiroya 向け)

設定変更は main へ直 push でOK。Routine は次回起動時に最新を読む。
変更理由は `my-notes/decisions.md` に記録する。

| ファイル | 内容 | 変更タイミング |
|---|---|---|
| `state/taxonomy.yml` | タグ辞書 | weekly の「新規タグ候補」に出たら追加 |
| `state/keywords.yml` | 収集フィルタ語彙 | 取りこぼし・誤検出が出たら |
| `state/repos.yml` | GitHub releases 監視対象 | 監視プロジェクト追加・削除時 |
| `state/priorities.yml` | 注目トピック | 関心が変わったら |
| `routine-prompt.md` | Claude への指示書 | 要約粒度・構成を変えたい時 |

## 運用ルール

- `items/`, `weekly/`, `state/seen.json` は Routine が書く領域。手動編集しない
- 自分のメモは `my-notes/` に書く
- Cowork で設定変更した場合は必ず `git commit && git push`
