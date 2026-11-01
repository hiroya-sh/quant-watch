---
id: "2026-W45-009"
type: paper
title: "End-to-End MXFP8 Reinforcement Learning on Blackwell: What Matching Buys, When It Pays Off, and How It Fails"
url: "https://arxiv.org/abs/2610.34915"
discovered: "2026-11-02"
published: "2026-10-26"
updated: "2026-10-26"
version: "v1"
authors: ["Wengee Zhang"]
venue: "arXiv"
arxiv_categories: ["cs.LG"]
models: []
architectures: ["transformer", "gla", "moe", "dense"]
methods: []
tech: ["kv-cache-quant", "low-bit-fp8", "moe-quant", "per-token"]
priority: high
sources: [arxiv]
status: new
related: []
---

## 日本語要約

**Title**: End-to-End MXFP8 Reinforcement Learning on Blackwell: What Matching Buys, When It Pays Off, and How It Fails

Low-precision arithmetic can make reinforcement learning (RL) for large language models cheaper, but RL requires the sampler and the learner to agree. Several frameworks now run FP8 on both sides. We implement end-to-end MXFP8 RL in verl (Megatron/Transformer Engine training; vLLM and SGLang rollout; dense and MoE models) and measure on B200 GPUs, with Qwen3-8B and Qwen3-30B-A3B, what this design...

(本記事は arXiv の abstract を機械要約せず原文抜粋のみ掲載。詳細は原著参照。)

## 手法

(arXiv abstract より) Low-precision arithmetic can make reinforcement learning (RL) for large language models cheaper, but RL requires the sampler and the learner to agree. Several frameworks now run FP8 on both sides. We implement end-to-end MXFP8 RL in verl (Megatron/Transformer Engine training; vLLM and SGLang rollout; dense and MoE models) and measure on B200 GPUs, with Qwen3-8B and Qwen3-30B-A3B, what this design buys, when it is faster, and how it fails. (1) Matching. For an MXFP8 learner, a sampler on the learner's grid is more consistent than a higher-precision BF16 sampler: in one engine at fixed weights, ...

## 評価

- 対象モデル: abstract 参照
- ビット幅: abstract 参照
- 精度劣化: abstract 参照
- スループット/メモリ: abstract 参照

## 既存手法との差分

(原著参照 — 詳細な比較は本文の Related Work / Experiments を参照)

## 原著 Abstract (抜粋)

Low-precision arithmetic can make reinforcement learning (RL) for large language models cheaper, but RL requires the sampler and the learner to agree. Several frameworks now run FP8 on both sides. We implement end-to-end MXFP8 RL in verl (Megatron/Transformer Engine training; vLLM and SGLang rollout; dense and MoE models) and measure on B200 GPUs, with Qwen3-8B and Qwen3-30B-A3B, what this design buys, when it is faster, and how it fails. (1) Matching. For an MXFP8 learner, a sampler on the learner's grid is more consistent than a higher-precision BF16 sampler: in one engine at fixed weights, train-rollout KL is 11% lower with half of the sampler's linear layers on the grid and 16% lower with all of them, and the synchronized weights we checked equal the learner's FP8 forward weights byte ...

## 注目度コメント

**HIGH** — 定例議題候補。
