# quant-watch

LLM量子化技術の週次ウォッチ。月曜朝に Claude Code Routine が前週の論文/実装/モデル情報を収集して PR を投げる。

## ワークフロー

```
月曜 08:00 JST: Routine 起動
  ↓ arXiv / GitHub releases / HF クロール
  ↓ items/ と weekly/ にmd生成
  ↓ claude/week-{ISO週} ブランチに commit
  ↓ main 向け PR open
月曜 10:00 JST: Hiroya が PR レビュー → merge
  ↓ Obsidian Git が main を auto-pull
  ↓ vault 更新完了 → 火曜定例の議題判断
```

## ディレクトリ構成

```
quant-watch/
├── items/                       # 1アイテム1md(正典)
├── weekly/                      # 週次サマリ
├── views/                       # Dataview クエリページ
├── templates/                   # アイテム生成テンプレ
├── state/
│   ├── taxonomy.yml             # タグ正規化辞書
│   ├── keywords.yml             # 収集時フィルタ語彙
│   ├── repos.yml                # GitHub releases 監視対象
│   ├── priorities.yml           # Hiroyaの注目トピック
│   └── seen.json                # 重複排除キー
├── routine-prompt.md            # Routine本体に貼り付ける指示書
└── README.md
```

## セットアップ手順

### 1. GitHub repo

```bash
gh repo create quant-watch --public --description "Weekly LLM quantization tech watch"
cd quant-watch
# このリポジトリの中身を全部置いて
git add .
git commit -m "Initial setup"
git push -u origin main
```

### 2. Claude Code Routine

1. Claude Code Desktop を起動
2. GitHub connector を有効化(claude.ai → Settings → Connectors → GitHub)
3. quant-watch リポジトリへのアクセスを許可
4. Desktop sidebar → Schedule → New task → **New remote task**
5. プロンプト欄に `routine-prompt.md` の中身をコピペ
6. Schedule: Weekly, Monday, 08:00 (local time = JST)
7. Save

### 3. 初回テスト

Routine 一覧から手動 Run now で1回走らせる。PR が来ることを確認。

### 4. Obsidian (準備でき次第)

```bash
brew install --cask obsidian
```

1. Obsidian 起動 → Open folder as vault → quant-watch ディレクトリを選択
2. Community plugins ON
3. インストール: Dataview, Obsidian Git
4. Obsidian Git 設定: Pull on startup = ON, Auto pull interval = 60 minutes 推奨

## カスタマイズ

| ファイル | 役割 | 編集タイミング |
|---|---|---|
| `state/taxonomy.yml` | 認識タグの辞書 | 新規タグ候補が weekly に出たら追加 |
| `state/keywords.yml` | 収集時フィルタ | 取りこぼし/誤検出が出たら調整 |
| `state/repos.yml` | GitHub 監視対象 | プロジェクト変更で追加/削除 |
| `state/priorities.yml` | 注目トピック | 関心が変わったら随時 |

## 運用ルール

- `items/`, `weekly/`, `state/seen.json` は Routine が書く領域。**手動編集しない**
- 自分のメモは `my-notes/` を作ってそこに書く(items から `related:` でリンクすれば連携可)
- taxonomy / keywords / priorities / repos の編集は main 直 push でOK(Routine は次回起動時に最新を読む)
