---
id: "2026-W36-015"
type: paper
title: "PuzzleKV: Page-Wise Low-Rank Decomposition for KV Cache Compression"
url: "https://arxiv.org/abs/2608.23843"
discovered: "2026-09-01"
published: "2026-08-24"
venue: "arXiv (cs.LG)"
models: []
architectures: [transformer]
methods: []
tech: [kv-cache-compression-non-quant, long-context-quant, calibration-free, paged-attention]
priority: normal
sources: [arxiv]
status: new
related: []
---
## 日本語要約
長文脈推論は KV cache のメモリに律速される。低ランク圧縮は全トークンを低次元で表現できる点で魅力的だが、既存の低ランク手法は (a) モデル重みから固定射影空間を導く、(b) 校正活性から固定空間を作る、(c) 広いキャッシュ領域に共有基底を張る、のいずれかで、細かいが重要な情報を捉えきれない。

## 手法
各ヘッドの KV cache を**固定長の論理ページ**に分割すると、個々のページ内に実質的な低ランク構造があることを観察。これに基づき **PuzzleKV** — **学習不要・校正不要**のページ単位低ランク分解。

## 評価
- 学習・校正いずれも不要

## 既存手法との差分
グローバルな基底ではなくページ局所の基底を使う。paged attention の粒度と自然に整合。

## 注目度コメント
量子化ではないが、vLLM の paged KV 管理とページ粒度が一致するため実装親和性が高い。KV 量子化と直交して積める可能性。
