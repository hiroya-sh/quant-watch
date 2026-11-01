---
id: "2026-W45-039"
type: paper
title: "ResCom: Activation Residual Compensation for Large Language Model Quantization"
url: "https://arxiv.org/abs/2610.35955"
discovered: "2026-11-02"
published: "2026-10-25"
updated: "2026-10-25"
version: "v1"
authors: ["Ning Yang", "Bohan Cui", "Zhuowen Liu", "Yuting Wang"]
venue: "arXiv"
arxiv_categories: ["cs.LG", "cs.AI"]
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

**Title**: ResCom: Activation Residual Compensation for Large Language Model Quantization

Low-bit weight--activation quantization reduces the memory and computation needed to deploy large language models, but activation rounding can still degrade accuracy after calibration. Reconstruction from rounded inputs cannot distinguish activations within the same quantization bin. We propose ResCom, a low-rank correction that uses the activation rounding residual to compensate for the resulting...

(本記事は arXiv の abstract を機械要約せず原文抜粋のみ掲載。詳細は原著参照。)

## 手法

(arXiv abstract より) Low-bit weight--activation quantization reduces the memory and computation needed to deploy large language models, but activation rounding can still degrade accuracy after calibration. Reconstruction from rounded inputs cannot distinguish activations within the same quantization bin. We propose ResCom, a low-rank correction that uses the activation rounding residual to compensate for the resulting layer-output error. An output-aware calibration procedure selects residual directions by their contribution to output reconstruction and computes the correction in closed form, without gradient train...

## 評価

- 対象モデル: abstract 参照
- ビット幅: abstract 参照
- 精度劣化: abstract 参照
- スループット/メモリ: abstract 参照

## 既存手法との差分

(原著参照 — 詳細な比較は本文の Related Work / Experiments を参照)

## 原著 Abstract (抜粋)

Low-bit weight--activation quantization reduces the memory and computation needed to deploy large language models, but activation rounding can still degrade accuracy after calibration. Reconstruction from rounded inputs cannot distinguish activations within the same quantization bin. We propose ResCom, a low-rank correction that uses the activation rounding residual to compensate for the resulting layer-output error. An output-aware calibration procedure selects residual directions by their contribution to output reconstruction and computes the correction in closed form, without gradient training or updates to the calibrated weights. On Llama-3-8B with 4-bit weights and activations, rank-32 attention corrections reduce WikiText-2 perplexity from 7.708 to 7.147, improve MMLU by 2.89 percent...

## 注目度コメント

**NORMAL** — 監視対象。
