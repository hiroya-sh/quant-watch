---
id: "2026-W45-041"
type: paper
title: "One Vector or Many? Clustered Optimal-Transport Steering under Quantization"
url: "https://arxiv.org/abs/2610.40055"
discovered: "2026-11-02"
published: "2026-10-29"
updated: "2026-10-29"
version: "v1"
authors: ["Illia Makarov"]
venue: "arXiv"
arxiv_categories: ["cs.LG", "cs.AI", "cs.CL"]
models: []
architectures: []
methods: ["NF4"]
tech: []
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約

**Title**: One Vector or Many? Clustered Optimal-Transport Steering under Quantization

Activation steering changes what a language model generates by editing its hidden states at inference time. Its most common form adds one vector, the difference of class means (DiM), to every hidden state. CHaRS (concept heterogeneity-aware representation steering) uses optimal transport instead: an entropic plan pairs the clusters of the two classes, and each hidden state moves along a mixture of...

(本記事は arXiv の abstract を機械要約せず原文抜粋のみ掲載。詳細は原著参照。)

## 手法

(arXiv abstract より) Activation steering changes what a language model generates by editing its hidden states at inference time. Its most common form adds one vector, the difference of class means (DiM), to every hidden state. CHaRS (concept heterogeneity-aware representation steering) uses optimal transport instead: an entropic plan pairs the clusters of the two classes, and each hidden state moves along a mixture of the cluster displacements, weighted toward its nearest clusters. We study this family of clustered optimal-transport maps for toxicity mitigation in Gemma-2-2B and Granite-3.1-2B, and ask what the pl...

## 評価

- 対象モデル: abstract 参照
- ビット幅: abstract 参照
- 精度劣化: abstract 参照
- スループット/メモリ: abstract 参照

## 既存手法との差分

(原著参照 — 詳細な比較は本文の Related Work / Experiments を参照)

## 原著 Abstract (抜粋)

Activation steering changes what a language model generates by editing its hidden states at inference time. Its most common form adds one vector, the difference of class means (DiM), to every hidden state. CHaRS (concept heterogeneity-aware representation steering) uses optimal transport instead: an entropic plan pairs the clusters of the two classes, and each hidden state moves along a mixture of the cluster displacements, weighted toward its nearest clusters. We study this family of clustered optimal-transport maps for toxicity mitigation in Gemma-2-2B and Granite-3.1-2B, and ask what the plan adds to DiM and whether that survives INT8 and NF4 quantization.
  We prove an identity: whatever the plan, the displacements averaged with the cluster sizes as weights equal DiM, so a clustered ma...

## 注目度コメント

**NORMAL** — 監視対象。
