---
id: "2026-W45-035"
type: paper
title: "Different Tasks, Different Timesteps: Temporal Task-Aware Quantization for Diffusion Language Models"
url: "https://arxiv.org/abs/2610.31198"
discovered: "2026-11-02"
published: "2026-10-23"
updated: "2026-10-23"
version: "v1"
authors: []
venue: "arXiv"
arxiv_categories: []
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

**Title**: Different Tasks, Different Timesteps: Temporal Task-Aware Quantization for Diffusion Language Models

Diffusion Language Models (DLMs) introduce unique quantization challenges due to their iterative denoising process. In this work, we reveal that quantization sensitivity is both taskand time-dependent, with different downstream tasks exhibiting distinct precision requirements across denoising steps. We further show that these patterns can be predicted without groundtruth labels or task-specific ev...

(本記事は arXiv の abstract を機械要約せず原文抜粋のみ掲載。詳細は原著参照。)

## 手法

(arXiv abstract より) Diffusion Language Models (DLMs) introduce unique quantization challenges due to their iterative denoising process. In this work, we reveal that quantization sensitivity is both taskand time-dependent, with different downstream tasks exhibiting distinct precision requirements across denoising steps. We further show that these patterns can be predicted without groundtruth labels or task-specific evaluation metrics. Building on these findings, we introduce T 2Quant, a task and time-aware mixedprecision quantization framework that uses a label-free sensitivity signal to optimally allocate activat...

## 評価

- 対象モデル: abstract 参照
- ビット幅: abstract 参照
- 精度劣化: abstract 参照
- スループット/メモリ: abstract 参照

## 既存手法との差分

(原著参照 — 詳細な比較は本文の Related Work / Experiments を参照)

## 原著 Abstract (抜粋)

Diffusion Language Models (DLMs) introduce unique quantization challenges due to their iterative denoising process. In this work, we reveal that quantization sensitivity is both taskand time-dependent, with different downstream tasks exhibiting distinct precision requirements across denoising steps. We further show that these patterns can be predicted without groundtruth labels or task-specific evaluation metrics. Building on these findings, we introduce T 2Quant, a task and time-aware mixedprecision quantization framework that uses a label-free sensitivity signal to optimally allocate activation precision across denoising steps under a fixed bit-width budget. Extensive experiments across three DLMs and six benchmarks demonstrate that T 2Quant consistently improves the average accuracy of ...

## 注目度コメント

**NORMAL** — 監視対象。
