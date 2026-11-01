---
id: "2026-W45-024"
type: paper
title: "The KV-Surgeon: Compensation-Aware Offline KV-Cache Compaction"
url: "https://arxiv.org/abs/2610.25933"
discovered: "2026-11-02"
published: "2026-10-19"
updated: "2026-10-19"
version: "v1"
authors: ["Moritz Wagner", "Christophe Roux", "Max Zimmer", "Sebastian Pokutta"]
venue: "arXiv"
arxiv_categories: ["cs.LG", "cs.AI"]
models: []
architectures: ["dense"]
methods: []
tech: ["calibration"]
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約

**Title**: The KV-Surgeon: Compensation-Aware Offline KV-Cache Compaction

Offline compaction of the key--value cache (KV-cache) reduces the cost of repeatedly querying a fixed context by constructing a smaller cache once and reusing it subsequently. The central challenge of compaction is deciding which cache entries to delete and which to retain. Existing methods score each candidate for deletion on its own, with the rest of the cache being held fixed. However, softmax...

(本記事は arXiv の abstract を機械要約せず原文抜粋のみ掲載。詳細は原著参照。)

## 手法

(arXiv abstract より) Offline compaction of the key--value cache (KV-cache) reduces the cost of repeatedly querying a fixed context by constructing a smaller cache once and reusing it subsequently. The central challenge of compaction is deciding which cache entries to delete and which to retain. Existing methods score each candidate for deletion on its own, with the rest of the cache being held fixed. However, softmax renormalization of the attention operation couples these decisions in a nonlinear manner: removing one entry changes the attention weights of every remaining one. In this work, we introduce KV-Surgeon...

## 評価

- 対象モデル: abstract 参照
- ビット幅: abstract 参照
- 精度劣化: abstract 参照
- スループット/メモリ: abstract 参照

## 既存手法との差分

(原著参照 — 詳細な比較は本文の Related Work / Experiments を参照)

## 原著 Abstract (抜粋)

Offline compaction of the key--value cache (KV-cache) reduces the cost of repeatedly querying a fixed context by constructing a smaller cache once and reusing it subsequently. The central challenge of compaction is deciding which cache entries to delete and which to retain. Existing methods score each candidate for deletion on its own, with the rest of the cache being held fixed. However, softmax renormalization of the attention operation couples these decisions in a nonlinear manner: removing one entry changes the attention weights of every remaining one. In this work, we introduce KV-Surgeon, which uses calibration data to take interactions into account in a tractable way. We derive a quadratic surrogate that admits closed-form expressions for jointly making the optimal greedy removal de...

## 注目度コメント

**NORMAL** — 監視対象。
