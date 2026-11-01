---
id: "2026-W45-033"
type: paper
title: "RIFT: KV Cache Compression for Draft Models with Complementary Compressibility Training"
url: "https://arxiv.org/abs/2610.31098"
discovered: "2026-11-02"
published: "2026-10-22"
updated: "2026-10-22"
version: "v1"
authors: ["Dor Tsur", "Maor Ashkenazi", "Maximilian Golub", "Peter Hicks", "Yaniv Galron"]
venue: "arXiv"
arxiv_categories: ["cs.CL"]
models: []
architectures: []
methods: []
tech: []
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約

**Title**: RIFT: KV Cache Compression for Draft Models with Complementary Compressibility Training

Speculative decoding is a popular decode acceleration method. As such, it is particularly relevant to long-output generation, which requires an increasingly large KV cache. KV cache compression offers a way to constrain costs in long-context drafting. However, compression methods that focus on prefill information can lose relevance as the output length grows. We term this phenomenon decode stalene...

(本記事は arXiv の abstract を機械要約せず原文抜粋のみ掲載。詳細は原著参照。)

## 手法

(arXiv abstract より) Speculative decoding is a popular decode acceleration method. As such, it is particularly relevant to long-output generation, which requires an increasingly large KV cache. KV cache compression offers a way to constrain costs in long-context drafting. However, compression methods that focus on prefill information can lose relevance as the output length grows. We term this phenomenon decode staleness and show that it degrades draft model accuracy under selection-based KV cache compression. We introduce RIFT, a family of selection-based KV cache compression strategies that balance prefill inform...

## 評価

- 対象モデル: abstract 参照
- ビット幅: abstract 参照
- 精度劣化: abstract 参照
- スループット/メモリ: abstract 参照

## 既存手法との差分

(原著参照 — 詳細な比較は本文の Related Work / Experiments を参照)

## 原著 Abstract (抜粋)

Speculative decoding is a popular decode acceleration method. As such, it is particularly relevant to long-output generation, which requires an increasingly large KV cache. KV cache compression offers a way to constrain costs in long-context drafting. However, compression methods that focus on prefill information can lose relevance as the output length grows. We term this phenomenon decode staleness and show that it degrades draft model accuracy under selection-based KV cache compression. We introduce RIFT, a family of selection-based KV cache compression strategies that balance prefill information and recent generated tokens. We show that refreshing the KV cache selection during token generation significantly improves the drafter's quality at the cost of additional decode latency. To alle...

## 注目度コメント

**NORMAL** — 監視対象。
