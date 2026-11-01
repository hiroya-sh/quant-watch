---
id: "2026-W45-027"
type: paper
title: "When Dynamic Scaling Fails: A Scale-State Feedback Governs Recurrent-State Quantization in Linear-Attention and SSM LLMs"
url: "https://arxiv.org/abs/2610.15139"
discovered: "2026-11-02"
published: "2026-10-10"
updated: "2026-10-20"
version: "v2"
authors: ["Yuhang Jiang"]
venue: "arXiv"
arxiv_categories: ["cs.LG"]
models: []
architectures: ["linear-attention"]
methods: []
tech: ["outlier-handling"]
priority: normal
sources: [arxiv]
status: updated
related: []
---

## 日本語要約

**Title**: When Dynamic Scaling Fails: A Scale-State Feedback Governs Recurrent-State Quantization in Linear-Attention and SSM LLMs

Linear-attention and state-space LLMs carry long context in a fixed-size recurrent state, and quantizing that state is the natural way to cut its cost during long decode. Unlike a weight tensor, the state is rewritten at every step, so a quantizer applied at each step sits inside the recurrence and its errors compound. INT4 that leaves synthetic recall perfectly intact at the start destroys it a t...

(本記事は arXiv の abstract を機械要約せず原文抜粋のみ掲載。詳細は原著参照。)

## 手法

(arXiv abstract より) Linear-attention and state-space LLMs carry long context in a fixed-size recurrent state, and quantizing that state is the natural way to cut its cost during long decode. Unlike a weight tensor, the state is rewritten at every step, so a quantizer applied at each step sits inside the recurrence and its errors compound. INT4 that leaves synthetic recall perfectly intact at the start destroys it a thousand steps later. The mechanism is a feedback between the quantizer scale and the state it is derived from. Yoking that scale to a full-precision reference removes the resulting norm explosion enti...

## 評価

- 対象モデル: abstract 参照
- ビット幅: abstract 参照
- 精度劣化: abstract 参照
- スループット/メモリ: abstract 参照

## 既存手法との差分

(原著参照 — 詳細な比較は本文の Related Work / Experiments を参照)

## 原著 Abstract (抜粋)

Linear-attention and state-space LLMs carry long context in a fixed-size recurrent state, and quantizing that state is the natural way to cut its cost during long decode. Unlike a weight tensor, the state is rewritten at every step, so a quantizer applied at each step sits inside the recurrence and its errors compound. INT4 that leaves synthetic recall perfectly intact at the start destroys it a thousand steps later. The mechanism is a feedback between the quantizer scale and the state it is derived from. Yoking that scale to a full-precision reference removes the resulting norm explosion entirely, yet recovers only 1.8 of the 5.4 nats lost, so numerical instability and functional degradation are separable failures. The remainder is resolution-dependent, and in our per-step setting every o...

## 注目度コメント

**NORMAL** — 監視対象。
