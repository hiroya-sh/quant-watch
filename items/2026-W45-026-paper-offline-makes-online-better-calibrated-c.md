---
id: "2026-W45-026"
type: paper
title: "Offline Makes Online Better: Calibrated Cache Compression for Video Generation"
url: "https://arxiv.org/abs/2610.28192"
discovered: "2026-11-02"
published: "2026-10-20"
updated: "2026-10-20"
version: "v1"
authors: ["Zhen Wang", "Ning Lai", "Qingtao Yu"]
venue: "arXiv"
arxiv_categories: ["cs.CV", "cs.AI", "cs.LG"]
models: []
architectures: []
methods: []
tech: ["calibration"]
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約

**Title**: Offline Makes Online Better: Calibrated Cache Compression for Video Generation

Token merging is an effective approach to reducing KV-cache memory consumption in autoregressive video generation by clustering temporally redundant tokens and retaining only a small set of representatives. Existing methods, however, typically apply a uniform merging ratio across all attention layers and heads. We observe that different layers and heads exhibit substantially different yet jointly...

(本記事は arXiv の abstract を機械要約せず原文抜粋のみ掲載。詳細は原著参照。)

## 手法

(arXiv abstract より) Token merging is an effective approach to reducing KV-cache memory consumption in autoregressive video generation by clustering temporally redundant tokens and retaining only a small set of representatives. Existing methods, however, typically apply a uniform merging ratio across all attention layers and heads. We observe that different layers and heads exhibit substantially different yet jointly correlated sensitivities to token merging, and that these sensitivity patterns remain consistent across prompts. Based on this observation, we introduce CALM, a Calibrated Allocation for Layer-Head Me...

## 評価

- 対象モデル: abstract 参照
- ビット幅: abstract 参照
- 精度劣化: abstract 参照
- スループット/メモリ: abstract 参照

## 既存手法との差分

(原著参照 — 詳細な比較は本文の Related Work / Experiments を参照)

## 原著 Abstract (抜粋)

Token merging is an effective approach to reducing KV-cache memory consumption in autoregressive video generation by clustering temporally redundant tokens and retaining only a small set of representatives. Existing methods, however, typically apply a uniform merging ratio across all attention layers and heads. We observe that different layers and heads exhibit substantially different yet jointly correlated sensitivities to token merging, and that these sensitivity patterns remain consistent across prompts. Based on this observation, we introduce CALM, a Calibrated Allocation for Layer-Head Merging that uses offline calibration to improve online cache compression. Exhaustively evaluating all possible layer-head allocations is prohibitively expensive. To enable efficient calibration, we sho...

## 注目度コメント

**NORMAL** — 監視対象。
