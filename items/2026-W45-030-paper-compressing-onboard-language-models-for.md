---
id: "2026-W45-030"
type: paper
title: "Compressing Onboard Language Models for Space Robots under a Behavioral-Fidelity Requirement"
url: "https://arxiv.org/abs/2610.29302"
discovered: "2026-11-02"
published: "2026-10-21"
updated: "2026-10-21"
version: "v1"
authors: ["Jia Deng", "Zizhe Wang", "Xin Lu", "Yi Huang", "Zehao Jia"]
venue: "arXiv"
arxiv_categories: ["cs.RO", "cs.LG"]
models: []
architectures: []
methods: ["GPTQ", "AWQ", "AutoRound"]
tech: ["ptq"]
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約

**Title**: Compressing Onboard Language Models for Space Robots under a Behavioral-Fidelity Requirement

Language models are being explored as the interface through which space robots interpret operator commands and select among verified skills. Running them onboard calls for low-bit compression, and flight use adds requirements that generic post-training quantization leaves implicit: a fixed memory budget and storage format, a static artifact under configuration control, and behavior close to the fu...

(本記事は arXiv の abstract を機械要約せず原文抜粋のみ掲載。詳細は原著参照。)

## 手法

(arXiv abstract より) Language models are being explored as the interface through which space robots interpret operator commands and select among verified skills. Running them onboard calls for low-bit compression, and flight use adds requirements that generic post-training quantization leaves implicit: a fixed memory budget and storage format, a static artifact under configuration control, and behavior close to the full-precision model validated on the ground. We treat compression as a ground-segment step and study QSelect, which composes one static low-bit model from compatible AWQ, GPTQ, and AutoRound checkpoint...

## 評価

- 対象モデル: abstract 参照
- ビット幅: abstract 参照
- 精度劣化: abstract 参照
- スループット/メモリ: abstract 参照

## 既存手法との差分

(原著参照 — 詳細な比較は本文の Related Work / Experiments を参照)

## 原著 Abstract (抜粋)

Language models are being explored as the interface through which space robots interpret operator commands and select among verified skills. Running them onboard calls for low-bit compression, and flight use adds requirements that generic post-training quantization leaves implicit: a fixed memory budget and storage format, a static artifact under configuration control, and behavior close to the full-precision model validated on the ground. We treat compression as a ground-segment step and study QSelect, which composes one static low-bit model from compatible AWQ, GPTQ, and AutoRound checkpoints by assigning each linear module to one quantizer family and scoring every substitution at the final next-token distribution. The default fidelity mode needs no labels or tuned thresholds and accepts...

## 注目度コメント

**NORMAL** — 監視対象。
