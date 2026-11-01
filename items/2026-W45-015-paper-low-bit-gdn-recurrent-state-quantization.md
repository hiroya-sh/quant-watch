---
id: "2026-W45-015"
type: paper
title: "Low-Bit GDN Recurrent-State Quantization: Global Gradient-aware Allocation and Pure-Write Sliding Windows"
url: "https://arxiv.org/abs/2610.39931"
discovered: "2026-11-02"
published: "2026-10-29"
updated: "2026-10-29"
version: "v1"
authors: ["Qinghang Huang", "Xuchu Huang", "Xunzhao Yin"]
venue: "arXiv"
arxiv_categories: ["cs.LG"]
models: []
architectures: []
methods: []
tech: ["low-bit-fp8", "mixed-precision"]
priority: high
sources: [arxiv]
status: new
related: []
---

## 日本語要約

**Title**: Low-Bit GDN Recurrent-State Quantization: Global Gradient-aware Allocation and Pure-Write Sliding Windows

Linear attention stores historical information in a recurrent state of fixed size, providing a compact memory representation for long-context inference. Reducing state precision further lowers per-request storage requirements, but quantized writeback errors enter subsequent recurrences, degrade prediction quality on long-reasoning tasks, and can be accompanied by repetitive generation and excessiv...

(本記事は arXiv の abstract を機械要約せず原文抜粋のみ掲載。詳細は原著参照。)

## 手法

(arXiv abstract より) Linear attention stores historical information in a recurrent state of fixed size, providing a compact memory representation for long-context inference. Reducing state precision further lowers per-request storage requirements, but quantized writeback errors enter subsequent recurrences, degrade prediction quality on long-reasoning tasks, and can be accompanied by repetitive generation and excessively long outputs. We propose Global Gradient-aware Allocation (GGA) and the Pure-Write Sliding Window (PW) to address precision allocation and recent-information maintenance. GGA combines candidate qu...

## 評価

- 対象モデル: abstract 参照
- ビット幅: abstract 参照
- 精度劣化: abstract 参照
- スループット/メモリ: abstract 参照

## 既存手法との差分

(原著参照 — 詳細な比較は本文の Related Work / Experiments を参照)

## 原著 Abstract (抜粋)

Linear attention stores historical information in a recurrent state of fixed size, providing a compact memory representation for long-context inference. Reducing state precision further lowers per-request storage requirements, but quantized writeback errors enter subsequent recurrences, degrade prediction quality on long-reasoning tasks, and can be accompanied by repetitive generation and excessively long outputs. We propose Global Gradient-aware Allocation (GGA) and the Pure-Write Sliding Window (PW) to address precision allocation and recent-information maintenance. GGA combines candidate quantization residuals with gradient sensitivity to future prediction loss to allocate head bit widths under a model-wide mixed-precision budget. PW independently maintains recent pure writes as FP8 vec...

## 注目度コメント

**HIGH** — 定例議題候補。
