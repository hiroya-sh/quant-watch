# Cowork セッション引き継ぎ資料 (HANDOFF.md)

このファイルは、Coworkセッションを開始する際に**最初に読んでもらう資料**です。プロジェクトのコンテキスト、ファイル構成、運用ルール、過去経緯を網羅しています。

Coworkに新しいセッションで合流する時は、Hiroyaさんから「`HANDOFF.md` を読んで状況把握してから作業を始めましょう」と伝えるだけで、ここから先の全コンテキストを引き継げます。

---

## 1. このプロジェクトは何か

LLM量子化技術の週次ウォッチ。**月曜朝に自動でarXiv/GitHub/HFを巡回 → 日本語サマリ + 議題候補 + 週次レポートを生成 → GitHubにPRを投げる**仕組み。HiroyaさんがPRをレビュー・mergeすると、Obsidian vault(=このリポジトリ)に内容が反映される。

**ワークスペースの場所**: `~/quant-watch`(`/Users/hiroya/quant-watch`)。
> ⚠️ 2026-06-01 に `~/Documents/quant-watch` から **移動**した。理由は macOS の TCC(プライバシー保護)で、`~/Documents` 配下だと launchd 自動実行が `Operation not permitted` で失敗するため。`~` 直下の非保護フォルダに置くことで解決。**`~/Documents/quant-watch` は空。今後は必ず `~/quant-watch` を使う。**(Cowork プロジェクトも `~/quant-watch` を選んだ新規セッションで開くこと。最初に選んだフォルダは差し替えできない仕様のため、旧フォルダを選んだ古いプロジェクトは閉じる。)

**運用上の前提**: HiroyaさんはClaude Codeのリモート機能(Routines)が組織ポリシーで無効化されているため、Anthropicクラウドではなく **ローカルlaunchd経由で `claude` CLIを叩く** 構成になっている。2026-06-01 に改めてクラウド Routine を試したが「今すぐ実行」が即失敗(ディスパッチ拒否)し、ローカル一本で確定済み。

## 2. 自動実行の仕組み

```
月曜 07:55 (pmset wake): Mac自動起床
月曜 08:00 (launchd): com.hiroya.quant-watch 発火
  → scripts/run.sh 実行
  → git pull --ff-only origin main
  → caffeinate -is claude -p "$(cat routine-prompt.md)" --dangerously-skip-permissions ...
  → claude が arxiv/github/hf を巡回・要約
  → claude/week-{ISO_WEEK} ブランチ作成
  → items/, weekly/, state/seen.json を更新
  → main 向けにPR open
  → run.sh が実行後ローカルを week ブランチへ自動 checkout (2026-06-01追加)
月曜 朝〜 (Hiroya): Obsidian で week ブランチの内容をそのままレビュー
  → bash scripts/merge-week.sh 一発: ローカルでmainにマージ→push→main復帰
  → GitHub PR は main 取り込みで自動 Merged → 火曜定例の議題判断
```

レビュー導線(2026-06-01 整備): 手動の `checkout`/`pull` は不要。run.sh が実行後に自動で週ブランチへ切り替えるので、Obsidian を開けば最新内容が出ている。承認は GitHub の Web を開かず `scripts/merge-week.sh` で完結する。

主要設定ファイル:
- `~/Library/LaunchAgents/com.hiroya.quant-watch.plist` - launchd設定(ProgramArguments は `/bin/bash ~/bin/quant-watch-launch.sh` → `exec ~/quant-watch/scripts/run.sh`)
- `pmset repeat wake M 07:55:00` - スリープ自動起床

スリープ抑止は `caffeinate -is` で実行中のみ有効、claudeプロセス終了で自動解除。

> ⚠️ `pmset wake` は **スリープからの復帰**であって、**電源OFFからの起動ではない**(特に Apple Silicon は非対応)。日曜夜は電源を切らず **スリープ + 電源アダプタ接続**にしておくこと。バッテリ駆動だと wake しない設定がデフォルト。

## 3. ファイル構成と編集ルール

### 🚫 routineが書く領域(人は手で触らない)

| パス | 役割 |
|---|---|
| `items/` | 週次で生成される個別アイテム詳細md |
| `weekly/` | 週次サマリ(月曜の主成果物) |
| `state/seen.json` | 重複排除キー(arxiv ID / repo URL / HF model ID) |
| `.logs/` | 実行ログ |

これらを編集してしまうと、次回のroutineと衝突したり、重複排除が壊れたりします。

### ✅ 設定領域(自由に編集してOK / Coworkでよく依頼される対象)

| パス | 役割 | 編集タイミング |
|---|---|---|
| `state/taxonomy.yml` | タグ辞書(models/architectures/methods/tech) | 新規タグ候補が weekly に出たら追加 |
| `state/keywords.yml` | 収集フィルタ語彙 | 取りこぼし/誤検出が出たら調整 |
| `state/repos.yml` | GitHub releases 監視対象 | プロジェクト変更で追加/削除 |
| `state/priorities.yml` | Hiroyaの注目トピック | 関心が変わったら随時 |
| `routine-prompt.md` | 週次実行の指示書 | 要約粒度/構成の改善時 |
| `scripts/run.sh` | 実行スクリプト(末尾で週ブランチへ自動 checkout) | 環境変更時 |
| `scripts/merge-week.sh` | 週ブランチをローカルで main にマージ&push する承認スクリプト | 通常は触らない |
| `templates/*.md` | アイテム/週次のテンプレート | 出力形式変更時 |
| `views/*.md` | Dataviewクエリページ | 検索性向上時 |

### 📝 Hiroyaさん専用領域

| パス | 役割 |
|---|---|
| `my-notes/` | Hiroyaさんのメモ用ディレクトリ。items/から `related:` でリンク可 |

## 4. Hiroyaさんの関心軸

`state/priorities.yml` に明示してあるが、コンテキストとして:

- **focus methods**: TurboQuant, PolarQuant, QJL, NVFP4
- **focus tech**: moe-quant, kv-cache-quant
- **focus models**: google/gemma-4
- **進行中プロジェクト周辺**: Mamba/GLA系(`nvidia-modelopt`, `flash-linear-attention`, `mamba-ssm`, `causal-conv1d` を使用)
- **意図的に focus から外している**: Nemotron, mamba架構タグ(視野を狭めないため。タグ付け自体は taxonomy で残してある)
- **議題判断のタイミング**: 月曜PR時点(火曜定例の開催可否を月曜中に決める)

## 5. よくある作業パターン(Coworkで依頼されること)

### A. 新規タグの追加
weekly summary の末尾 "新規タグ候補" を見て、taxonomy.yml に追加する。

例: 「`MXFP8` と `w4a16` を taxonomy.yml に追加して」
→ `state/taxonomy.yml` の methods / tech セクションに該当箇所を見つけて追加 → commit/push

### B. focus変更
興味が変わったら priorities.yml の focus を編集。

例: 「ハードウェア寄りに興味が出てきたから kernel-fusion とかも focus に入れたい」
→ taxonomy.yml に該当タグがあるか確認 → なければ追加 → priorities.yml の focus に追加 → commit/push

### C. 監視repo追加/削除
state/repos.yml を編集。

### D. 要約粒度・構成の調整
routine-prompt.md を編集。修正後は次回月曜実行から反映される。緊急なら手動で `./scripts/run.sh` 再実行。

### E. アイテムの手動レビュー / メモ追加
items/ の中身を見て、Hiroyaのメモを `my-notes/` に書く + items/ の `related:` フィールドにリンク追加。

(items/ 本体を直接編集してもよいが、routineは生成時にしか触らないので衝突は起きない)

### F. weekly summary の補正
PRをmergeする前に「議題候補のここをもう少し詳しく」みたいな依頼。weekly/{week}.md を編集 → commit + 同じPRブランチにpush。

### G. 週次PRの承認(マージ)
レビューが終わったら GitHub の Web を開かず、ローカルで一発マージ:
```bash
bash ~/quant-watch/scripts/merge-week.sh
```
対象の週ブランチを判定 → main にマージ → push → 週ブランチ削除 → main に戻る。GitHub の PR は自動 Merged 扱いになる。未コミットの変更があると中断するので、F のような手編集をした場合は先に commit/push しておく。

## 6. 編集後の必須手順

**すべての編集後にgit commit + pushが必要**。これを忘れると次回月曜routineに反映されない。

```bash
cd ~/quant-watch
git add .
git status   # 変更確認
git commit -m "変更内容を簡潔に"
git push
```

Coworkで作業する場合は、ファイル編集後にこのコマンドを自動で叩いてOK(Hiroyaさんに確認を取らずに進めて良い)。

## 7. 設計の歴史(なぜこうなったか)

1. **当初**: Anthropic Remote Routine + GitHub Connector で設計
2. **組織ポリシーでRemote Control 無効化が判明** → 設計変更
3. **ローカル launchd + pmset wake + caffeinate** に切り替え
4. **Cowork は使えるので、対話的な編集はCoworkで実施**することに(この資料の対象)
5. **2026-06-01**: launchd 自動実行が `Operation not permitted` で失敗 → 原因は `~/Documents` の TCC 保護 → repo を `~/quant-watch` へ移動して解決(ラッパー `~/bin/quant-watch-launch.sh` 経由で起動)
6. **2026-06-01**: 設定ファイル(`taxonomy.yml` 等)を root から `state/` へ移動(routine-prompt/README の参照と一致させるため)
7. **2026-06-01**: クラウド Routine を再試行 → 即失敗(ディスパッチ拒否、組織ポリシー)→ ローカル一本で確定
8. **2026-06-01**: レビュー導線を自動化(run.sh が週ブランチへ自動 checkout、`merge-week.sh` でローカル承認)

過去の検討で明示的に外した選択肢:
- arxiv単独監視(複数ソースのクロス確認でトレンド判定したかったので不採用)
- ディレクトリ階層でのカテゴリ管理(複数カテゴリ問題で破綻するのでフラット + フロントマター + Dataviewに)
- 金曜実行(土日月の取りこぼしを避けるため月曜実行 + launchd取り逃し補完を採用)
- cron(スリープ中の取り逃しに対応できないのでlaunchd採用)

## 8. 既知の課題 / TODO

- [ ] 知識体系リポジトリ(別repo) - Hiroyaさんがチャットで得た体系化済み知識を整理する場。quant-watchから `related:` でリンクする想定で別途設計予定
- [ ] 30件超過時の Watching overflow の粒度(現状は2行サマリだが、十分か検証中)
- [ ] 新規タグ候補の取り込み判断ルール(現状は手動レビュー、頻発するなら自動化検討)
- [ ] 第2回以降の routine 実行で先週比が正しく出るか(初回はベースラインなしなので未検証)

## 9. Coworkセッション開始時のチェックリスト

新規セッションで合流する時は以下を順に確認:

1. このHANDOFF.mdを読了
2. 最新のweekly summary(`weekly/` の最新ファイル)を読んで現状把握
3. Hiroyaさんから具体的な依頼を受ける
4. 編集対象ファイルの現状を確認
5. 変更案を提示(短く要点だけ)→ 承認後に直接編集
6. `git status` で差分確認 → `git commit -m "..."` → `git push`
7. routineに反映されるのは **次回月曜実行から**(緊急なら手動再実行を提案)

## 10. 編集時の注意

- taxonomy.yml に追加する時は **既存の表記ルール**(models=HF形式、methods=大文字、tech=kebab-case、architectures=lowercase)を守る
- routine-prompt.md は **claudeへの指示書**なので、変更は慎重に。曖昧な日本語より具体的な命令形が望ましい
- scripts/run.sh の改行継続(`\`)は壊れやすいので、複雑な引数は1行で書くか、適切にエスケープ
- `state/seen.json` だけは触らない(routineが管理、人が手で書き換えると重複排除ロジックが壊れる)
