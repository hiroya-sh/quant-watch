---
id: "2026-W46-024"
type: paper
title: "Balancing hierarchical representation and quantization: A performance trade-off in text embeddings"
url: "https://arxiv.org/abs/2611.06859"
discovered: "2026-11-09"
published: "2026-11-04"
authors: ["Kai Ponel", "Marco Polignano", "Erasmo Purificato", "Aylin Julia Temizkan"]
venue: "arXiv:2611.06859"
models: []
architectures: ["transformer"]
methods: []
tech: ["low-bit-2"]
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約

Text embedding の hierarchical (Matryoshka) 表現と quantization の相互作用を 4 モデル × 38 MTEB タスク × 168 設定で評価。INT8 は float32 と pair classification/re-ranking で統計的区別不能、全体で最悪 1.5pt 劣化。binary は全カテゴリで有意に悪化。dimension を 1 回半減は m=16 以上で統計的に検出不能、2 回半減は常に検出可能。8x 次元削減 + INT8 で 32x storage 削減 @ 94.4% baseline。「retrieval はどのカテゴリよりも急速に劣化する」。

## 手法

MTEB 38 task, 4 模型, 4 階層 x 3 quant = 168 設定、Friedman + Nemenyi post-hoc 有意差検定。

## 評価

- モデル: 4 transformer embedding models
- データ: MTEB 38 task
- 結論: INT8 は pair cls/re-rank で float32 と区別なし, binary は常に有意劣化
- Pareto: 8x 次元削減 + INT8 で 32x storage @ 94.4%

## 注目度コメント

embedding 側の "量子化 vs 次元削減" の順序。retrieval 用途は特に注意要。実運用の意思決定材料。
