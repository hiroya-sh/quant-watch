---
id: "2026-W45-038"
type: paper
title: "SpectrumQuant: Spectrum Alignment for LLM Quantization"
url: "https://arxiv.org/abs/2610.20303"
discovered: "2026-11-02"
published: "2026-10-14"
updated: "2026-10-23"
version: "v2"
authors: ["Dwaipayan Haldar", "Indranil Patra", "Azhar Yousuf", "Chandra Sekhar Seelamantula"]
venue: "arXiv"
arxiv_categories: ["cs.LG", "stat.ML"]
models: []
architectures: []
methods: ["SpinQuant"]
tech: ["calibration", "ptq", "rotation"]
priority: normal
sources: [arxiv]
status: updated
related: []
---

## 日本語要約

**Title**: SpectrumQuant: Spectrum Alignment for LLM Quantization

Orthogonal transforms have emerged as an effective tool for low-bit quantization of large language models (LLMs), as they reshape activation distributions without changing the underlying model function. Existing approaches typically rely either on fixed data-agnostic transforms, such as Hadamard rotations, or on calibration-time optimization of learned rotations. We study rotation selection from f...

(本記事は arXiv の abstract を機械要約せず原文抜粋のみ掲載。詳細は原著参照。)

## 手法

(arXiv abstract より) Orthogonal transforms have emerged as an effective tool for low-bit quantization of large language models (LLMs), as they reshape activation distributions without changing the underlying model function. Existing approaches typically rely either on fixed data-agnostic transforms, such as Hadamard rotations, or on calibration-time optimization of learned rotations. We study rotation selection from first principles and show that maximizing covariance leads to spectral alignment and provides a principled criterion for constructing quantization-friendly orthogonal transforms. Based on this insight,...

## 評価

- 対象モデル: abstract 参照
- ビット幅: abstract 参照
- 精度劣化: abstract 参照
- スループット/メモリ: abstract 参照

## 既存手法との差分

(原著参照 — 詳細な比較は本文の Related Work / Experiments を参照)

## 原著 Abstract (抜粋)

Orthogonal transforms have emerged as an effective tool for low-bit quantization of large language models (LLMs), as they reshape activation distributions without changing the underlying model function. Existing approaches typically rely either on fixed data-agnostic transforms, such as Hadamard rotations, or on calibration-time optimization of learned rotations. We study rotation selection from first principles and show that maximizing covariance leads to spectral alignment and provides a principled criterion for constructing quantization-friendly orthogonal transforms. Based on this insight, we propose SpectrumQuant, a closed-form rotation method that estimates activation covariance from calibration data and uses it to construct a covariance-aware orthogonal transform for post-training q...

## 注目度コメント

**NORMAL** — 監視対象。
