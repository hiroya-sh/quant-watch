# チームメンバー向けセットアップ

quant-watch は Obsidian で読む想定の知識ベースです。Obsidian をセットアップすれば、毎週月曜に自動更新された内容が手元に届きます。

## 前提

- Git が使える環境
- Obsidian をインストールしていない場合は [obsidian.md](https://obsidian.md) からダウンロード

## 手順

### 1. リポジトリを clone

```bash
git clone https://github.com/hiroya-sh/quant-watch.git
```

任意の場所に置いてOK。以後このディレクトリを vault として使います。

### 2. Obsidian で開く

1. Obsidian を起動
2. 「Open folder as vault」→ clone したディレクトリを選択
3. 「信頼するフォルダとして開く」を選択

### 3. コミュニティプラグインを有効化

設定（歯車アイコン）→「コミュニティプラグイン」→「制限モードをオフ」

以下の2つを有効化（すでにインストール済みの状態でリポジトリに入っています）：

- **Dataview** — タグ・属性でアイテムを横断検索するビュー
- **Obsidian Git** — リポジトリの自動 pull

### 4. Obsidian Git の設定確認

設定 → Obsidian Git：

- `Pull on startup` → ON
- `Auto pull interval (minutes)` → `60`（推奨）

これで毎週月曜に Hiroya が PR を merge すると、1時間以内に手元の vault に新しい内容が届きます。

## 何が見られるか

| 場所 | 内容 |
|---|---|
| `weekly/` | 週次サマリ。議題候補・概況・カテゴリ別新着 |
| `items/` | 論文・実装・モデルごとの詳細メモ |
| `by-method.md` 等 | タグ別の横断ビュー（Dataview） |

## 注意事項

- **push 不要・push しないでください**。自動収集ブランチへの干渉を避けるため、pull のみで使ってください。
- `my-notes/` は Hiroya のメモ領域です。チームメンバーのメモを置きたい場合は Hiroya に相談してください。
- 毎週月曜に Hiroya が GitHub の PR を確認・merge した後に内容が反映されます。merge 前は先週のままです。
