---
id: "2026-W45-028"
type: paper
title: "Is 2:4 Sparsity Still Worth It? Semi-Structured Sparsity versus Quantization in LLM Inference"
url: "https://arxiv.org/abs/2610.28947"
discovered: "2026-11-02"
published: "2026-10-20"
updated: "2026-10-20"
version: "v1"
authors: ["Xiuyi Qin"]
venue: "arXiv"
arxiv_categories: ["cs.LG", "cs.PF"]
models: []
architectures: ["transformer", "dense"]
methods: []
tech: ["low-bit-fp4", "low-bit-fp8"]
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約

**Title**: Is 2:4 Sparsity Still Worth It? Semi-Structured Sparsity versus Quantization in LLM Inference

NVIDIA tensor cores have supported 2:4 semi-structured sparsity since Ampere, and the pattern composes with quantization. When the two are combined, the practical question is which step to take next: from a given precision, add 2:4 sparsity or drop to the next lower precision? We compare the two at equal bits, with sparsity metadata counted, and at equal nominal tensor-core tiers, over all six GEM...

(本記事は arXiv の abstract を機械要約せず原文抜粋のみ掲載。詳細は原著参照。)

## 手法

(arXiv abstract より) NVIDIA tensor cores have supported 2:4 semi-structured sparsity since Ampere, and the pattern composes with quantization. When the two are combined, the practical question is which step to take next: from a given precision, add 2:4 sparsity or drop to the next lower precision? We compare the two at equal bits, with sparsity metadata counted, and at equal nominal tensor-core tiers, over all six GEMM operands of a transformer layer, with kernels measured on three GPU generations and online pruning and quantization included. Our results show that as long as a lower precision is available, adding ...

## 評価

- 対象モデル: abstract 参照
- ビット幅: abstract 参照
- 精度劣化: abstract 参照
- スループット/メモリ: abstract 参照

## 既存手法との差分

(原著参照 — 詳細な比較は本文の Related Work / Experiments を参照)

## 原著 Abstract (抜粋)

NVIDIA tensor cores have supported 2:4 semi-structured sparsity since Ampere, and the pattern composes with quantization. When the two are combined, the practical question is which step to take next: from a given precision, add 2:4 sparsity or drop to the next lower precision? We compare the two at equal bits, with sparsity metadata counted, and at equal nominal tensor-core tiers, over all six GEMM operands of a transformer layer, with kernels measured on three GPU generations and online pruning and quantization included. Our results show that as long as a lower precision is available, adding 2:4 is the worse step, both less accurate and slower, because the energy that 2:4 discards from each group of four along the hardware-forced axis does not shrink with bits, while quantization error do...

## 注目度コメント

**NORMAL** — 監視対象。
