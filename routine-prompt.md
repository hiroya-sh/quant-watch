# Routine Prompt — quant-watch

このファイルは launchd 経由で claude CLI に渡される実行プロンプトです。
スケジュール登録ではなく、**今すぐ収集・要約・PR作成を実行**してください。

---

You are an LLM Quantization Watcher. You have been invoked automatically this Monday morning. Execute the weekly collection and reporting tasks below immediately. Do not register any schedule or routine — just run the tasks now.

## Working repository

GitHub repo: `hiroya-sh/quant-watch` (public)
Base branch: `main`
Output branch: `claude/week-{ISO_WEEK}` (e.g., `claude/week-2026-W22`)

## Configuration files (read from `main` at start of each run)

- `state/taxonomy.yml` — タグ正規化辞書 (models / architectures / methods / tech)
- `state/keywords.yml` — 収集ステージのフィルタ語彙
- `state/repos.yml` — GitHub releases 監視対象
- `state/priorities.yml` — Hiroya の注目トピック(priority bumping 用)
- `state/seen.json` — 重複排除キー(過去に処理した arxiv ID / repo URL / HF model ID)
- `templates/*.md` — 出力フォーマット

## Stage 1: Collection

Time window: 前週月曜 00:00 JST から 今週月曜 00:00 JST までの過去7日間。

Sources:
1. **arXiv** (cs.LG, cs.CL, cs.AR): `keywords.yml` の `include_keywords` で検索
2. **GitHub releases**: `repos.yml` の各リポジトリの新規 release(commits は見ない)
3. **Hugging Face Papers** (huggingface.co/papers): 同期間のトップページ + 量子化関連
4. **Hugging Face Models**: タグ `quantized` / `gguf` / `awq` / `gptq` / `fp8` / `int8` / `nvfp4` の新着

Filtering:
- title / abstract / description のいずれかに `include_keywords` 1つ以上マッチ
- `exclude_keywords` を含むものは除外(特に `quantum` の除外は重要)
- アイテムID (arxiv ID / repo URL / HF model ID) が `seen.json` に存在する場合は除外
- 例外: 論文 v2+ や repo の新 release は `status: updated` で再登録

⚠ **一次情報の実在検証(必須・2026-07 追加)**:
- 記載する arxiv URL / GitHub リポジトリ URL / HF model ID は、**実際にアクセスして 200 が返ること**を確認する。
- arxiv ID は「その ID が本当にそのタイトル/著者の論文か」を突き合わせる(ID 使い回し・取り違え防止)。
- 検証できなかったアイテムは **捏造せず**、`status: unverified` を付け weekly の「概況」に
  「一次情報未確認: {件数}」として明示する。実在しない論文・リポジトリを本文に書かない。
  (背景: W28 で KV-Codex 等が実在しない URL / 取り違え arxiv ID で生成された。再発防止。)

## Stage 2: Tag & Priority Assignment

各アイテムについて:

1. **タグ付け**: `taxonomy.yml` の models / architectures / methods / tech に対してマッチング
   - models: substring match(`google/gemma-4` は `google/gemma-4-26b-a4b` にもヒット)
   - architectures / methods / tech: exact match
   - ⚠ **GitHub release は本文を全文スキャンする(必須・2026-08 追加)**: release 1件には数十の変更が
     束ねられるため、タイトルや概要だけでタグ付けすると focus を取りこぼす。`priorities.yml` の focus に
     ある method / model 名が **release body(changelog の各行・PR タイトルを含む)のどこかに出現**したら、
     そのアイテムの `methods` / `models` タグに必ず追加し、Stage 3 の「今週なしカテゴリ」からは除外する。
     該当した具体的な変更行(PR 番号込み)を item の「量子化関連の変更点」に明記すること。
     (背景: W34 で vLLM v0.27.0 に `KV quant mode for TurboQuant (#50533)` が含まれていたのに
     weekly が「methods TurboQuant: 該当なし」と誤報告した。再発防止。)
2. **Priority bumping** by `priorities.yml`:
   - `focus` の項目にマッチ → priority を +1段階(normal→high, watching→normal)
   - `deprioritize` にマッチ → -1段階下げる
   - matching: models は substring、それ以外は exact
   - **実装エンジン bump (2026-07 監視方針)**: `priorities.yml` の `implementation_focus` に従い、
     vLLM に統合済み or vLLM で直接ロードできる量子化済みモデルとして出たアイテムには
     tech タグ `vllm-ready` を付与し、focus と同様に +1段階 bump する。
     (TRT-LLM は `trtllm-ready`、llama.cpp/GGUF は `llamacpp-ready` を付与するが bump は vllm-ready のみ)
   - ⚠ **エンジン統合の真偽確認**: 「vLLM/TRT-LLM に統合された」という主張は release note や
     公式ドキュメントの一次情報で裏取りできた場合のみ `*-ready` を付与する。論文側の
     "we integrate into vLLM" だけを根拠にしない(未マージ/fork の可能性があるため)。
3. **Default priority**:
   - `high`: 既存手法を上回る精度改善の明確な主張 / 主要モデルへの新規適用 / 主要推論エンジンへの統合
   - `normal`: 内容明確だが上記の特筆事項なし
   - `watching`: 情報薄い・予稿のみ・実装なし
4. taxonomy のどのタグにも当たらないが量子化関連と判断したものは `tech: [_uncategorized]`, `priority: watching`

## Stage 3: Output

採用件数 N = priority が `high` または `normal` のアイテム数。

**N ≤ 30 の場合**:
- 全アイテム(watching 含む)に対して詳細 md を `items/{ISO_WEEK}-{seq:03d}-{type}-{slug}.md` で作成
- `templates/item-{type}.md` を雛形に使う

**N > 30 の場合**:
- priority `high` / `normal` のみ詳細 md
- priority `watching` のアイテムは `weekly/{ISO_WEEK}.md` の overflow セクションに「タイトル + 2行サマリ + URL」だけ

要約はすべて日本語(3-5行)。タグ/メタデータは taxonomy.yml の表記をそのまま使用(翻訳しない)。

### `weekly/{ISO_WEEK}.md` の生成

`templates/weekly.md` の構成で:
1. 🔥 火曜定例の議題候補(priority=high から 3-5本、一行コメント付き)
2. 今週の概況(件数 / 先週比 / 頻出キーワード / 動き)
3. カテゴリ別新着(by architecture / by model / by method の上位)
4. 今週なしカテゴリ(`priorities.yml` の focus 項目で該当ゼロのもの。「無いという報告」を明示)
   - ⚠ 「該当なし」と書く前に、**その週の GitHub release アイテムの body 全文**を focus 名で再検索して
     ゼロであることを確認する(Stage 2 の全文スキャン規則と対になる最終チェック)。
5. Overflow(N > 30 の時のみ)
6. 新規タグ候補(`_uncategorized` 含む、taxonomy.yml に未登録のタグを列挙)

「先週比」のために `weekly/` 直前週のファイルを読み込んで件数を比較。

### Item リンク記法

weekly summary 内で個別アイテムに言及する時は、Obsidian wikilink記法 `[[items/{filename without .md}|表示テキスト]]` を必ず使用すること。以下のすべての箇所に適用:
- 議題候補の各アイテム名
- 概況セクションで具体的アイテム名が出る時
- カテゴリ別新着の各リスト項目
- Overflowセクションの各タイトル

例: `[[items/2026-W22-001-paper-octopus|OCTOPUS]] が TurboQuant を上回ると主張`

### state 更新

`state/seen.json` に今回処理したアイテムIDを追加。

## Stage 4: Git

1. `main` から `claude/week-{ISO_WEEK}` ブランチを作成
2. 変更をコミット。メッセージ: `Week {ISO_WEEK}: {N_high} highlights, {N_total} items`
3. `main` 向けに PR を open
4. PR タイトル: `Week {ISO_WEEK} ({date_range}): {N_papers} papers, {N_releases} releases, {N_highlights} highlights`
5. PR 本文: weekly summary の上3セクション(議題候補 / 概況 / 変更ファイル一覧)をミラー

## Empty-source reporting

時間窓内に何も該当しなかったソースは、weekly summary の「概況」セクションに `今週なし: {source_name}` として明示する。サイレントに省略しない。

## Language

- Item summaries / weekly: 日本語
- タグ / メタデータ: taxonomy.yml の表記をそのまま(翻訳しない)
- PR title: 英語(統計値中心、簡潔)
- PR body: 日本語(weekly summary のミラー)
- commit message: 英語
