---
id: "2026-W45-014"
type: paper
title: "KV Cache Quantization for Diffusion Language Models"
url: "https://arxiv.org/abs/2610.39853"
discovered: "2026-11-02"
published: "2026-10-29"
updated: "2026-10-29"
version: "v1"
authors: ["Yan Tai", "Yunan Ding", "Guangzhao Li", "Siqi Luo", "Chaoyang Zhang"]
venue: "arXiv"
arxiv_categories: ["cs.CL"]
models: []
architectures: []
methods: ["KVQuant"]
tech: ["calibration", "kv-cache-quant", "low-bit-2"]
priority: high
sources: [arxiv]
status: new
related: []
---

## 日本語要約

**Title**: KV Cache Quantization for Diffusion Language Models

KV cache quantization is well studied for autoregressive language models, where cached prefix states are exact under causal attention and quantization is mainly a cache reconstruction problem. Diffusion language models (dLLMs) break this assumption. Fast dLLM inference reuses KV states across denoising steps, but bidirectional token representations can change as masked tokens are revealed, so the...

(本記事は arXiv の abstract を機械要約せず原文抜粋のみ掲載。詳細は原著参照。)

## 手法

(arXiv abstract より) KV cache quantization is well studied for autoregressive language models, where cached prefix states are exact under causal attention and quantization is mainly a cache reconstruction problem. Diffusion language models (dLLMs) break this assumption. Fast dLLM inference reuses KV states across denoising steps, but bidirectional token representations can change as masked tokens are revealed, so the reused cache may already differ from full recomputation before quantization is applied. We study KV cache quantization under this cache-reuse error. We adapt KIVI and KVQuant to Fast-dLLM-style prefix...

## 評価

- 対象モデル: abstract 参照
- ビット幅: abstract 参照
- 精度劣化: abstract 参照
- スループット/メモリ: abstract 参照

## 既存手法との差分

(原著参照 — 詳細な比較は本文の Related Work / Experiments を参照)

## 原著 Abstract (抜粋)

KV cache quantization is well studied for autoregressive language models, where cached prefix states are exact under causal attention and quantization is mainly a cache reconstruction problem. Diffusion language models (dLLMs) break this assumption. Fast dLLM inference reuses KV states across denoising steps, but bidirectional token representations can change as masked tokens are revealed, so the reused cache may already differ from full recomputation before quantization is applied. We study KV cache quantization under this cache-reuse error. We adapt KIVI and KVQuant to Fast-dLLM-style prefix and dual cache reuse, and introduce TRACE and dLLM-KVQ. TRACE reconstructs feasible dLLM reveal trajectories from prompt-answer pairs, providing calibration states that match iterative masked decodin...

## 注目度コメント

**HIGH** — 定例議題候補。
