---
id: "2026-W31-012"
type: paper
title: "HijackKV: New Threat in Position-Independent KV Cache Reuse"
url: "https://arxiv.org/abs/2607.19957"
discovered: "2026-07-27"
published: "2026-07-22"
authors: []
venue: "arXiv (cs.CR, cs.AI, cs.LG)"
models: []
architectures: [transformer]
methods: []
tech: [_uncategorized]
priority: watching
sources: [arxiv]
status: new
verified: "2026-07-27 arXiv API 直取得(ID/タイトル一致確認済み)"
related: []
---

## 日本語要約
位置非依存 KV cache 再利用(同一テキストチャンクなら位置に関係なく KV を再利用する最適化)の脆弱性を突く攻撃フレームワーク。KV はトークン一致で検索されるが元の計算文脈をエンコードしているため、良性に見えるチャンクの KV に攻撃者制御の prefix の影響を仕込める。被害者クエリで再利用された汚染 KV が、入力に攻撃文字列が一切現れないままモデル挙動を乗っ取る。

## 手法
後続の一般的な良性テキストの KV に攻撃目標がエンコードされるよう攻撃者 prefix を最適化。テキスト自体は不変なので将来の cache hit も維持される。

## 評価
- 対象モデル: 複数モデル(black-box 転移あり)
- 成功率: 単発平均 94%、低ヒット率 (10%)・高頻度再計算 (50%) でも有効、マルチターン持続
- 補足: 安全な KV 再利用システムの設計指針も提示

## 既存手法との差分
プロンプトインジェクションではなく「KV cache そのもの」を攻撃面にした初の体系的フレームワーク。

## 注目度コメント
CacheBlend 系の position-independent KV 再利用を採用するサービング基盤への実質的な警告。KV 再利用系を本番導入する場合の必読。セキュリティ寄りのため watching。
