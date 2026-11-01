---
id: "2026-W45-036"
type: paper
title: "HAWK: Heterogeneity-Aware KV Cache Transfer for Efficient GPU-NPU Phase-Disaggregated LLM Inference"
url: "https://arxiv.org/abs/2610.29873"
discovered: "2026-11-02"
published: "2026-10-21"
updated: "2026-10-23"
version: "v2"
authors: ["Junhyeok Park", "Jungeun Yoon", "Kyungmin Kim", "Hunsoon Lee", "Shinyoung Ahn"]
venue: "arXiv"
arxiv_categories: ["cs.AR", "cs.DC"]
models: []
architectures: []
methods: []
tech: []
priority: normal
sources: [arxiv]
status: updated
related: []
---

## 日本語要約

**Title**: HAWK: Heterogeneity-Aware KV Cache Transfer for Efficient GPU-NPU Phase-Disaggregated LLM Inference

Large language model (LLM) inference exhibits distinct computational characteristics across its two phases: prefill is compute-intensive, whereas decode is more memory-bound. As a result, AI accelerators achieve varying levels of efficiency across the two phases. GPUs are well suited to prefill, but are often underutilized during decode. By contrast, NPUs can utilize their compute resources more e...

(本記事は arXiv の abstract を機械要約せず原文抜粋のみ掲載。詳細は原著参照。)

## 手法

(arXiv abstract より) Large language model (LLM) inference exhibits distinct computational characteristics across its two phases: prefill is compute-intensive, whereas decode is more memory-bound. As a result, AI accelerators achieve varying levels of efficiency across the two phases. GPUs are well suited to prefill, but are often underutilized during decode. By contrast, NPUs can utilize their compute resources more effectively during decode. Motivated by this observation, we explore a heterogeneous architecture that integrates GPUs and NPUs, mapping prefill to GPUs and decode to NPUs to achieve high performance a...

## 評価

- 対象モデル: abstract 参照
- ビット幅: abstract 参照
- 精度劣化: abstract 参照
- スループット/メモリ: abstract 参照

## 既存手法との差分

(原著参照 — 詳細な比較は本文の Related Work / Experiments を参照)

## 原著 Abstract (抜粋)

Large language model (LLM) inference exhibits distinct computational characteristics across its two phases: prefill is compute-intensive, whereas decode is more memory-bound. As a result, AI accelerators achieve varying levels of efficiency across the two phases. GPUs are well suited to prefill, but are often underutilized during decode. By contrast, NPUs can utilize their compute resources more effectively during decode. Motivated by this observation, we explore a heterogeneous architecture that integrates GPUs and NPUs, mapping prefill to GPUs and decode to NPUs to achieve high performance and efficiency. However, realizing such heterogeneous integration is challenging because LLM phase disaggregation requires KV cache transfer from prefill to decode (that is, from GPUs to NPUs), which i...

## 注目度コメント

**NORMAL** — 監視対象。
