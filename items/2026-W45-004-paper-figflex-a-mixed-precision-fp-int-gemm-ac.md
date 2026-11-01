---
id: "2026-W45-004"
type: paper
title: "FIGFLEX: A Mixed-Precision FP-INT GEMM Accelerator Co-Designed with Low-Bit LLM Quantization"
url: "https://arxiv.org/abs/2610.30480"
discovered: "2026-11-02"
published: "2026-10-21"
updated: "2026-10-21"
version: "v1"
authors: ["Faraz Tahmasebi", "Haocheng Xu", "Andrew Trauger", "Yomal Perera", "Zhenyu Tang"]
venue: "arXiv"
arxiv_categories: ["cs.AR", "cs.LG"]
models: []
architectures: []
methods: ["GPTQ", "AWQ", "QuIP"]
tech: ["low-bit-2", "mixed-precision", "ptq", "weight-only"]
priority: high
sources: [arxiv]
status: new
related: []
---

## 日本語要約

**Title**: FIGFLEX: A Mixed-Precision FP-INT GEMM Accelerator Co-Designed with Low-Bit LLM Quantization

Weight-only quantization keeps LLM activations in floating point and stores weights as low-bit integers, turning the dominant workload into floating-point-integer (FP-INT) general matrix multiplication. Recent quantizers reach a 2-3-bit average with mixed precision, but hardware has not kept pace: GPUs dequantize weights to FP16 before the tensor-core multiply-accumulate, and bit-parallel FP-INT a...

(本記事は arXiv の abstract を機械要約せず原文抜粋のみ掲載。詳細は原著参照。)

## 手法

(arXiv abstract より) Weight-only quantization keeps LLM activations in floating point and stores weights as low-bit integers, turning the dominant workload into floating-point-integer (FP-INT) general matrix multiplication. Recent quantizers reach a 2-3-bit average with mixed precision, but hardware has not kept pace: GPUs dequantize weights to FP16 before the tensor-core multiply-accumulate, and bit-parallel FP-INT accelerators run at a single weight precision, so fewer bits save memory but not computation. In this paper, we present FIGFLEX, an algorithm-hardware co-designed mixed-precision accelerator whose bit-...

## 評価

- 対象モデル: abstract 参照
- ビット幅: abstract 参照
- 精度劣化: abstract 参照
- スループット/メモリ: abstract 参照

## 既存手法との差分

(原著参照 — 詳細な比較は本文の Related Work / Experiments を参照)

## 原著 Abstract (抜粋)

Weight-only quantization keeps LLM activations in floating point and stores weights as low-bit integers, turning the dominant workload into floating-point-integer (FP-INT) general matrix multiplication. Recent quantizers reach a 2-3-bit average with mixed precision, but hardware has not kept pace: GPUs dequantize weights to FP16 before the tensor-core multiply-accumulate, and bit-parallel FP-INT accelerators run at a single weight precision, so fewer bits save memory but not computation. In this paper, we present FIGFLEX, an algorithm-hardware co-designed mixed-precision accelerator whose bit-parallel datapath scales throughput as precision falls. FIGFLEX contributes (1) a shift-add, radix-4 reformulation of FP-INT multiplication that fuses the multiply-accumulate into a unified, precision...

## 注目度コメント

**HIGH** — 定例議題候補。
