---
id: "2026-W45-008"
type: paper
title: "RAQ-MLA: Role-Aware Quantization for Multi-Head Latent Attention Caches"
url: "https://arxiv.org/abs/2610.33625"
discovered: "2026-11-02"
published: "2026-10-24"
updated: "2026-10-24"
version: "v1"
authors: ["Tianqi Chen", "Xunchao Li", "Linchuan Xie", "Guanghua Yu", "Jianchen Zhu"]
venue: "arXiv"
arxiv_categories: ["cs.AI", "cs.LG"]
models: []
architectures: []
methods: []
tech: ["kv-cache-quant"]
priority: high
sources: [arxiv]
status: new
related: []
---

## 日本語要約

**Title**: RAQ-MLA: Role-Aware Quantization for Multi-Head Latent Attention Caches

Multi-Head Latent Attention (MLA) has been adopted by recent frontier large language models. Instead of per-head keys and values, MLA caches a compressed KV latent that is up-projected into keys and values at decode time, together with a narrow positional key that carries position information into the attention score. Existing KV-cache quantization methods are designed around the keys and values o...

(本記事は arXiv の abstract を機械要約せず原文抜粋のみ掲載。詳細は原著参照。)

## 手法

(arXiv abstract より) Multi-Head Latent Attention (MLA) has been adopted by recent frontier large language models. Instead of per-head keys and values, MLA caches a compressed KV latent that is up-projected into keys and values at decode time, together with a narrow positional key that carries position information into the attention score. Existing KV-cache quantization methods are designed around the keys and values of standard attention and do not account for what MLA actually caches, which costs accuracy at low bit widths. We analyze the MLA cache both in activation distribution and in how quantization error pro...

## 評価

- 対象モデル: abstract 参照
- ビット幅: abstract 参照
- 精度劣化: abstract 参照
- スループット/メモリ: abstract 参照

## 既存手法との差分

(原著参照 — 詳細な比較は本文の Related Work / Experiments を参照)

## 原著 Abstract (抜粋)

Multi-Head Latent Attention (MLA) has been adopted by recent frontier large language models. Instead of per-head keys and values, MLA caches a compressed KV latent that is up-projected into keys and values at decode time, together with a narrow positional key that carries position information into the attention score. Existing KV-cache quantization methods are designed around the keys and values of standard attention and do not account for what MLA actually caches, which costs accuracy at low bit widths. We analyze the MLA cache both in activation distribution and in how quantization error propagates to the attention output, and show that the two cached tensors play different roles: the latent mainly supplies the values, whereas the positional key dominates the attention score. We therefor...

## 注目度コメント

**HIGH** — 定例議題候補。
