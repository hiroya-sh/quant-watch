---
id: "2026-W45-005"
type: paper
title: "BeNice! Closing Looping's Inference-Memory Gap via KV-Sharing"
url: "https://arxiv.org/abs/2610.31633"
discovered: "2026-11-02"
published: "2026-10-22"
updated: "2026-10-22"
version: "v1"
authors: ["Hayden Prairie", "Jacob M. Ryan", "Taylor Berg-Kirkpatrick", "Daniel Y. Fu"]
venue: "arXiv"
arxiv_categories: ["cs.LG"]
models: []
architectures: []
methods: ["NVFP4"]
tech: ["kv-cache-quant", "low-bit-fp4", "low-bit-fp8"]
priority: high
sources: [arxiv]
status: new
related: []
---

## 日本語要約

**Title**: BeNice! Closing Looping's Inference-Memory Gap via KV-Sharing

Looped architectures scale quality while keeping parameter count fixed by repeatedly passing activations through the same block of layers. During inference, each recurrence generates independent KV-caches, causing memory to grow linearly. To address this challenge, prior work has proposed KV-sharing (i.e., sharing KV-caches across depth), finding that, in some cases, the KV-cache of the final recu...

(本記事は arXiv の abstract を機械要約せず原文抜粋のみ掲載。詳細は原著参照。)

## 手法

(arXiv abstract より) Looped architectures scale quality while keeping parameter count fixed by repeatedly passing activations through the same block of layers. During inference, each recurrence generates independent KV-caches, causing memory to grow linearly. To address this challenge, prior work has proposed KV-sharing (i.e., sharing KV-caches across depth), finding that, in some cases, the KV-cache of the final recurrence can be shared with the earlier recurrences without quality loss, a property we denote as KV-shareability. However, the mechanisms underlying KV-shareability remain poorly understood, with even ...

## 評価

- 対象モデル: abstract 参照
- ビット幅: abstract 参照
- 精度劣化: abstract 参照
- スループット/メモリ: abstract 参照

## 既存手法との差分

(原著参照 — 詳細な比較は本文の Related Work / Experiments を参照)

## 原著 Abstract (抜粋)

Looped architectures scale quality while keeping parameter count fixed by repeatedly passing activations through the same block of layers. During inference, each recurrence generates independent KV-caches, causing memory to grow linearly. To address this challenge, prior work has proposed KV-sharing (i.e., sharing KV-caches across depth), finding that, in some cases, the KV-cache of the final recurrence can be shared with the earlier recurrences without quality loss, a property we denote as KV-shareability. However, the mechanisms underlying KV-shareability remain poorly understood, with even identically trained looped architectures not consistently exhibiting it. In this paper, we study how KV-shareability can be enabled in looped models. We propose a two-stage method: in the first stage,...

## 注目度コメント

**HIGH** — focus method: NVFP4 にマッチ。
