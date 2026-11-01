---
id: "2026-W45-012"
type: paper
title: "DCKV: Learned Transform Coding of the Prompt KV Cache in Hybrid Language Models"
url: "https://arxiv.org/abs/2610.36950"
discovered: "2026-11-02"
published: "2026-10-27"
updated: "2026-10-27"
version: "v1"
authors: ["Egor Maximov", "Aleksei Merkelov", "Vasiliy Alekseev", "Ivan Krivorotov", "Valentin Beliaev"]
venue: "arXiv"
arxiv_categories: ["cs.LG", "cs.AI"]
models: []
architectures: ["hybrid"]
methods: []
tech: []
priority: high
sources: [arxiv]
status: new
related: []
---

## 日本語要約

**Title**: DCKV: Learned Transform Coding of the Prompt KV Cache in Hybrid Language Models

Hybrid language models keep a key-value (KV) cache only in their few full-attention layers, but this cache is still the part of a prompt's state that grows with the prompt and that must be stored or moved to reuse it. We present DCKV, a differentiable codec for the KV cache and the first KV-cache codec that is trained end to end. Its transform, its quantizer and its entropy models, which are condi...

(本記事は arXiv の abstract を機械要約せず原文抜粋のみ掲載。詳細は原著参照。)

## 手法

(arXiv abstract より) Hybrid language models keep a key-value (KV) cache only in their few full-attention layers, but this cache is still the part of a prompt's state that grows with the prompt and that must be stored or moved to reuse it. We present DCKV, a differentiable codec for the KV cache and the first KV-cache codec that is trained end to end. Its transform, its quantizer and its entropy models, which are conditioned on the prompt tokens and on already decoded neighbouring positions, are optimized together against the frozen language model, both for the code length that the entropy models assign and for the...

## 評価

- 対象モデル: abstract 参照
- ビット幅: abstract 参照
- 精度劣化: abstract 参照
- スループット/メモリ: abstract 参照

## 既存手法との差分

(原著参照 — 詳細な比較は本文の Related Work / Experiments を参照)

## 原著 Abstract (抜粋)

Hybrid language models keep a key-value (KV) cache only in their few full-attention layers, but this cache is still the part of a prompt's state that grows with the prompt and that must be stored or moved to reuse it. We present DCKV, a differentiable codec for the KV cache and the first KV-cache codec that is trained end to end. Its transform, its quantizer and its entropy models, which are conditioned on the prompt tokens and on already decoded neighbouring positions, are optimized together against the frozen language model, both for the code length that the entropy models assign and for the change of the model's output. On Qwen3.5-2B, DCKV stores a compressed token in more than 55 times fewer bytes than bf16 at a loss of at most 1.8 points on three long-context benchmarks, and in more t...

## 注目度コメント

**HIGH** — 定例議題候補。
