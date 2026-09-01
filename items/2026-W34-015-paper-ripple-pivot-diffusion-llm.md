---
id: "2026-W34-015"
type: paper
title: "Ripple-Pivot Search: Active Parallel Decoding for Diffusion Large Language Models"
url: "https://arxiv.org/abs/2608.11742"
discovered: "2026-08-17"
published: "2026-08-12"
authors: [Yushi Ye, Xu Chen, Haoyun Jiang, Jinsong Lan]
venue: "arXiv"
models: []
architectures: []
methods: []
tech: [_uncategorized]
priority: watching
sources: [arxiv]
status: new
related: []
---
## 日本語要約
拡散 LLM (dLLM) は並列デコードで高速化余地がある。既存 scheduler は per-position 基準を満たした位置のみ確定し、早期確定の下流効果を見落とす。本研究は「中エントロピの pivot 位置を先行確定すると残りの masked 位置の不確実性が大きく下がる」ripple 効果を発見し、Ripple-Pivot Search (RPS) を提案(training-free)。3 dLLM・4ベンチで 4〜10倍の高速化。

## 手法
lookahead 評価で pivot 位置と割当トークンを選ぶ training-free デコード。

## 評価
- 対象: 3 dLLM
- 効果: 4〜10倍のデコード高速化
- 手法: training-free

## 既存手法との差分
dLLM の並列デコード scheduler を ripple 効果で改良。量子化ではなく推論高速化。

## 注目度コメント
量子化外だが inference throughput 文脈。dLLM 高速化として watching。新タグ候補 diffusion-llm-decoding。
