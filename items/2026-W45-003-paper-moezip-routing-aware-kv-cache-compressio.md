---
id: "2026-W45-003"
type: paper
title: "MoEZip: Routing-Aware KV Cache Compression for Sparse Mixture-of-Experts LLMs"
url: "https://arxiv.org/abs/2610.30206"
discovered: "2026-11-02"
published: "2026-10-21"
updated: "2026-10-21"
version: "v1"
authors: ["Minsang Kim", "Seungjun Baek"]
venue: "arXiv"
arxiv_categories: ["cs.LG", "cs.AI"]
models: []
architectures: ["transformer", "moe", "dense"]
methods: []
tech: []
priority: high
sources: [arxiv]
status: new
related: []
---

## 日本語要約

**Title**: MoEZip: Routing-Aware KV Cache Compression for Sparse Mixture-of-Experts LLMs

Mixture-of-Experts (MoE) language models scale model capacity efficiently by activating a small subset of parameters per token. However, in long-context inference, memory remains a major bottleneck because the KV cache grows linearly with sequence length. Existing KV cache compression methods reduce this cost for dense transformers, but overlook a problem specific to MoE: KV eviction can change wh...

(本記事は arXiv の abstract を機械要約せず原文抜粋のみ掲載。詳細は原著参照。)

## 手法

(arXiv abstract より) Mixture-of-Experts (MoE) language models scale model capacity efficiently by activating a small subset of parameters per token. However, in long-context inference, memory remains a major bottleneck because the KV cache grows linearly with sequence length. Existing KV cache compression methods reduce this cost for dense transformers, but overlook a problem specific to MoE: KV eviction can change which experts are selected during answer generation, degrading the generation quality. We propose MoEZip, a routing-aware KV cache compression for sparse MoE language models. To estimate the sensitivity...

## 評価

- 対象モデル: abstract 参照
- ビット幅: abstract 参照
- 精度劣化: abstract 参照
- スループット/メモリ: abstract 参照

## 既存手法との差分

(原著参照 — 詳細な比較は本文の Related Work / Experiments を参照)

## 原著 Abstract (抜粋)

Mixture-of-Experts (MoE) language models scale model capacity efficiently by activating a small subset of parameters per token. However, in long-context inference, memory remains a major bottleneck because the KV cache grows linearly with sequence length. Existing KV cache compression methods reduce this cost for dense transformers, but overlook a problem specific to MoE: KV eviction can change which experts are selected during answer generation, degrading the generation quality. We propose MoEZip, a routing-aware KV cache compression for sparse MoE language models. To estimate the sensitivity of expert routing to perturbation, we propose a novel metric based on the Fisher information matrix of routing distributions. MoEZip combines this metric with attention weights for routing-aware scor...

## 注目度コメント

**HIGH** — 定例議題候補。
