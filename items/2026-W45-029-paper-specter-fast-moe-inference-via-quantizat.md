---
id: "2026-W45-029"
type: paper
title: "Specter: Fast MoE Inference via Quantization-Enabled Multi-Step Speculative Offloading"
url: "https://arxiv.org/abs/2511.14102"
discovered: "2026-11-02"
published: "2026-10-21"
updated: "2026-10-21"
version: "v1"
authors: []
venue: "arXiv"
arxiv_categories: []
models: []
architectures: ["moe"]
methods: []
tech: ["moe-quant", "weight-only"]
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約

**Title**: Specter: Fast MoE Inference via Quantization-Enabled Multi-Step Speculative Offloading

Mixture-of-experts (MoE) models often exceed a single accelerator's memory capacity. Offloading experts to host memory creates a severe PCIe I/O bottleneck because data-dependent routing keeps transfers on the critical path. We present Specter, an inference system that uses quantization to combine speculative decoding with expert offloading. Its lightweight quantized draft model runs efficiently o...

(本記事は arXiv の abstract を機械要約せず原文抜粋のみ掲載。詳細は原著参照。)

## 手法

(arXiv abstract より) Mixture-of-experts (MoE) models often exceed a single accelerator's memory capacity. Offloading experts to host memory creates a severe PCIe I/O bottleneck because data-dependent routing keeps transfers on the critical path. We present Specter, an inference system that uses quantization to combine speculative decoding with expert offloading. Its lightweight quantized draft model runs efficiently on device while preserving high-fidelity expert activation patterns. This provides accurate multi-step lookahead over future expert usage, allowing the runtime to organize expert movement and execution...

## 評価

- 対象モデル: abstract 参照
- ビット幅: abstract 参照
- 精度劣化: abstract 参照
- スループット/メモリ: abstract 参照

## 既存手法との差分

(原著参照 — 詳細な比較は本文の Related Work / Experiments を参照)

## 原著 Abstract (抜粋)

Mixture-of-experts (MoE) models often exceed a single accelerator's memory capacity. Offloading experts to host memory creates a severe PCIe I/O bottleneck because data-dependent routing keeps transfers on the critical path. We present Specter, an inference system that uses quantization to combine speculative decoding with expert offloading. Its lightweight quantized draft model runs efficiently on device while preserving high-fidelity expert activation patterns. This provides accurate multi-step lookahead over future expert usage, allowing the runtime to organize expert movement and execution ahead of verification and improve both communication and execution efficiency. Under single-request inference, Specter achieves an average 1.50x (up to 1.88x) speedup in time per output token (TPOT) ...

## 注目度コメント

**NORMAL** — 監視対象。
