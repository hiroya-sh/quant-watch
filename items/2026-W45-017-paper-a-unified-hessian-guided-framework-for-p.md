---
id: "2026-W45-017"
type: paper
title: "A Unified Hessian-Guided Framework for Post-Training Quantization"
url: "https://arxiv.org/abs/2610.40345"
discovered: "2026-11-02"
published: "2026-10-29"
updated: "2026-10-29"
version: "v1"
authors: ["Mads Toftrup", "Marco Federici", "Boris van Breugel", "Paul Whatmough", "Markus Nagel"]
venue: "arXiv"
arxiv_categories: ["cs.LG", "cs.AI"]
models: []
architectures: []
methods: []
tech: ["block-wise", "ptq"]
priority: high
sources: [arxiv]
status: new
related: []
---

## 日本語要約

**Title**: A Unified Hessian-Guided Framework for Post-Training Quantization

Low-bit quantization enables efficient deployment of large language models by reducing memory footprint and computational cost. Achieving high accuracy at low precision requires selecting quantization ranges, linear transformations, and weight rounding decisions. Existing approaches typically optimize these components independently using local reconstruction objectives, which fail to account for t...

(本記事は arXiv の abstract を機械要約せず原文抜粋のみ掲載。詳細は原著参照。)

## 手法

(arXiv abstract より) Low-bit quantization enables efficient deployment of large language models by reducing memory footprint and computational cost. Achieving high accuracy at low precision requires selecting quantization ranges, linear transformations, and weight rounding decisions. Existing approaches typically optimize these components independently using local reconstruction objectives, which fail to account for the varying impact of quantization errors on downstream predictions. Direct optimization of task-level metrics would provide a more faithful objective, but is challenging due to the discontinuous natur...

## 評価

- 対象モデル: abstract 参照
- ビット幅: abstract 参照
- 精度劣化: abstract 参照
- スループット/メモリ: abstract 参照

## 既存手法との差分

(原著参照 — 詳細な比較は本文の Related Work / Experiments を参照)

## 原著 Abstract (抜粋)

Low-bit quantization enables efficient deployment of large language models by reducing memory footprint and computational cost. Achieving high accuracy at low precision requires selecting quantization ranges, linear transformations, and weight rounding decisions. Existing approaches typically optimize these components independently using local reconstruction objectives, which fail to account for the varying impact of quantization errors on downstream predictions. Direct optimization of task-level metrics would provide a more faithful objective, but is challenging due to the discontinuous nature of quantization operations and the high computational cost of evaluating their downstream effects.
  In this work, we derive a Hessian-guided approximation of the output change induced by joint weig...

## 注目度コメント

**HIGH** — 定例議題候補。
