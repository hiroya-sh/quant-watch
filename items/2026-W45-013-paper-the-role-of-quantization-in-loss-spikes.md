---
id: "2026-W45-013"
type: paper
title: "The Role of Quantization in Loss Spikes"
url: "https://arxiv.org/abs/2610.38277"
discovered: "2026-11-02"
published: "2026-10-28"
updated: "2026-10-28"
version: "v1"
authors: ["Zaiqian Chen", "Aditya Somasundaram", "Sophie Li", "Sean McLeish", "John Kirchenbauer"]
venue: "arXiv"
arxiv_categories: ["cs.LG", "cs.AI"]
models: []
architectures: []
methods: []
tech: []
priority: high
sources: [arxiv]
status: new
related: []
---

## 日本語要約

**Title**: The Role of Quantization in Loss Spikes

Loss spikes in language model pretraining can waste substantial compute and derail otherwise healthy training runs. A primary driver of these instabilities is the growth and divergence of output logits in the final language modeling (LM) head. In this work, we study a particularly costly form of this instability associated with output logit growth: delayed, terminal divergences that emerge only af...

(本記事は arXiv の abstract を機械要約せず原文抜粋のみ掲載。詳細は原著参照。)

## 手法

(arXiv abstract より) Loss spikes in language model pretraining can waste substantial compute and derail otherwise healthy training runs. A primary driver of these instabilities is the growth and divergence of output logits in the final language modeling (LM) head. In this work, we study a particularly costly form of this instability associated with output logit growth: delayed, terminal divergences that emerge only after prolonged training, which we call time-bomb spikes. We find that these instabilities are preceded by rapidly growing quantization error in the LM head, which eventually culminates in a loss spike....

## 評価

- 対象モデル: abstract 参照
- ビット幅: abstract 参照
- 精度劣化: abstract 参照
- スループット/メモリ: abstract 参照

## 既存手法との差分

(原著参照 — 詳細な比較は本文の Related Work / Experiments を参照)

## 原著 Abstract (抜粋)

Loss spikes in language model pretraining can waste substantial compute and derail otherwise healthy training runs. A primary driver of these instabilities is the growth and divergence of output logits in the final language modeling (LM) head. In this work, we study a particularly costly form of this instability associated with output logit growth: delayed, terminal divergences that emerge only after prolonged training, which we call time-bomb spikes. We find that these instabilities are preceded by rapidly growing quantization error in the LM head, which eventually culminates in a loss spike. Crucially, reducing numerical precision accelerates time-bomb spikes, while increasing precision improves stability. We then propose a simple yet effective mitigation that replaces AdamW on the LM he...

## 注目度コメント

**HIGH** — 定例議題候補。
