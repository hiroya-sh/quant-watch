---
id: "2026-W45-001"
type: paper
title: "Double KV Cache Optimization on Apple Silicon: Block-FP4, Radial Quantization, and Fused Metal Kernels"
url: "https://arxiv.org/abs/2610.33076"
discovered: "2026-11-02"
published: "2026-10-21"
updated: "2026-10-21"
version: "v1"
authors: ["Ibrokhimsho Abduchaborov"]
venue: "arXiv"
arxiv_categories: ["cs.AR"]
models: []
architectures: []
methods: ["QJL", "PolarQuant"]
tech: ["low-bit-fp4", "rotation"]
priority: high
sources: [arxiv]
status: new
related: []
---

## 日本語要約

**Title**: Double KV Cache Optimization on Apple Silicon: Block-FP4, Radial Quantization, and Fused Metal Kernels

Key-value (KV) cache capacity and memory traffic are primary bottlenecks in long-context autoregressive inference. We evaluate five cache paths on an Apple Silicon M5 Max using MLX: a native bf16 baseline, block-scaled E2M1 FP4, a Python reference implementing radial quantization with a QJL-style residual, sequential FP4-to-Polar composition, and a fused Metal Polar kernel. On Apple Silicon M5 Max...

(本記事は arXiv の abstract を機械要約せず原文抜粋のみ掲載。詳細は原著参照。)

## 手法

(arXiv abstract より) Key-value (KV) cache capacity and memory traffic are primary bottlenecks in long-context autoregressive inference. We evaluate five cache paths on an Apple Silicon M5 Max using MLX: a native bf16 baseline, block-scaled E2M1 FP4, a Python reference implementing radial quantization with a QJL-style residual, sequential FP4-to-Polar composition, and a fused Metal Polar kernel. On Apple Silicon M5 Max, fused Metal PolarQuant achieves 46.8 tok/s at 3,456 B/token - 3.64x compression versus the bf16 baseline and 1.84x faster than the Python Polar reference (25.4 tok/s), while slightly outperforming b...

## 評価

- 対象モデル: abstract 参照
- ビット幅: abstract 参照
- 精度劣化: abstract 参照
- スループット/メモリ: abstract 参照

## 既存手法との差分

(原著参照 — 詳細な比較は本文の Related Work / Experiments を参照)

## 原著 Abstract (抜粋)

Key-value (KV) cache capacity and memory traffic are primary bottlenecks in long-context autoregressive inference. We evaluate five cache paths on an Apple Silicon M5 Max using MLX: a native bf16 baseline, block-scaled E2M1 FP4, a Python reference implementing radial quantization with a QJL-style residual, sequential FP4-to-Polar composition, and a fused Metal Polar kernel. On Apple Silicon M5 Max, fused Metal PolarQuant achieves 46.8 tok/s at 3,456 B/token - 3.64x compression versus the bf16 baseline and 1.84x faster than the Python Polar reference (25.4 tok/s), while slightly outperforming block-FP4 (41.5 tok/s at 3.62x compression). Sequential composition of FP4 and Polar (Double Optimization) yields no additive benefit: 4,241 B/token at 15.1 tok/s, worse than FP4 alone on both axes. Th...

## 注目度コメント

**HIGH** — focus method: QJL / focus method: PolarQuant にマッチ。
