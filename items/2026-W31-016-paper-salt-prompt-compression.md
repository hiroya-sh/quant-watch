---
id: "2026-W31-016"
type: paper
title: "SALT: Salience-Aware Lexical Trie for Long-Context Compression"
url: "https://arxiv.org/abs/2607.17486"
discovered: "2026-07-27"
published: "2026-07-20"
authors: []
venue: "arXiv (cs.PF, cs.AI, cs.LG)"
models: []
architectures: [transformer]
methods: []
tech: [kv-cache-compression-non-quant]
priority: watching
sources: [arxiv]
status: new
verified: "2026-07-27 arXiv API 直取得(ID/タイトル一致確認済み)"
related: []
---

## 日本語要約
入力レベルのプロンプト圧縮において、スカラー関連度で文をランキングする既存手法が「支配的テーマが予算を独占し、頻度の低いタスク関連テーマが捨てられる(theme collapse)」問題を指摘。文ごとのキーワードを文頻度順の trie に組織化し、テーマ横断で予算を配分するモデル非依存の抽出型フレームワーク SALT を提案。

## 手法
multi-anchor retrieval でクエリキーワードにラベル付けされた trie ノードを任意深さで活性化。trie は対話ターンをまたいで持続し、文書の再エンコードなしにマルチターン利用可能。

## 評価
- 対象モデル: モデル非依存
- ビット幅: (量子化ではない・入力圧縮)
- 精度劣化: テーマ被覆の保持により tight budget 下の劣化を抑制
- スループット/メモリ: 長文脈 prefill 計算と KV メモリを削減、decode 側 KV 手法と合成可能

## 既存手法との差分
LLMLingua 系のスコアベース圧縮に対し、文書のテーマ構造を明示的にモデル化する点。

## 注目度コメント
KV 量子化と直交・合成可能な入力側圧縮。実装/ベンチ詳細の続報待ちで watching。
