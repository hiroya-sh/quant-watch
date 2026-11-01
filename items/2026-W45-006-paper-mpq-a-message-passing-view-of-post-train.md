---
id: "2026-W45-006"
type: paper
title: "MPQ: A Message-Passing View of Post-Training Quantization"
url: "https://arxiv.org/abs/2610.32127"
discovered: "2026-11-02"
published: "2026-10-23"
updated: "2026-10-23"
version: "v1"
authors: ["Yanshuo Chen", "Chenxi Liu", "Reza Shirkavand", "Heng Huang"]
venue: "arXiv"
arxiv_categories: ["cs.AI", "cs.LG"]
models: []
architectures: ["dense"]
methods: ["GPTQ"]
tech: ["low-bit-2", "ptq"]
priority: high
sources: [arxiv]
status: new
related: []
---

## 日本語要約

**Title**: MPQ: A Message-Passing View of Post-Training Quantization

Post-training quantization (PTQ) is a key technique for efficiently deploying large language models, as it compresses weights into low-bit representations without retraining. Existing PTQ solvers, including GPTQ, LDLQ, and block coordinate descent, commit each weight block to a single codeword before its neighbors are considered, leaving near-optimal alternatives unexplored. In this work, we cast...

(本記事は arXiv の abstract を機械要約せず原文抜粋のみ掲載。詳細は原著参照。)

## 手法

(arXiv abstract より) Post-training quantization (PTQ) is a key technique for efficiently deploying large language models, as it compresses weights into low-bit representations without retraining. Existing PTQ solvers, including GPTQ, LDLQ, and block coordinate descent, commit each weight block to a single codeword before its neighbors are considered, leaving near-optimal alternatives unexplored. In this work, we cast row-wise PTQ as posterior inference over discrete codebooks, in which existing solvers correspond to a zero-temperature, hard-decision limit retaining only the top codeword per block. We propose Messa...

## 評価

- 対象モデル: abstract 参照
- ビット幅: abstract 参照
- 精度劣化: abstract 参照
- スループット/メモリ: abstract 参照

## 既存手法との差分

(原著参照 — 詳細な比較は本文の Related Work / Experiments を参照)

## 原著 Abstract (抜粋)

Post-training quantization (PTQ) is a key technique for efficiently deploying large language models, as it compresses weights into low-bit representations without retraining. Existing PTQ solvers, including GPTQ, LDLQ, and block coordinate descent, commit each weight block to a single codeword before its neighbors are considered, leaving near-optimal alternatives unexplored. In this work, we cast row-wise PTQ as posterior inference over discrete codebooks, in which existing solvers correspond to a zero-temperature, hard-decision limit retaining only the top codeword per block. We propose Message-Passing Quantization (MPQ), which preserves soft posterior information across blocks during inference and commits to hard codewords only at the output stage. MPQ first uses vector approximate messa...

## 注目度コメント

**HIGH** — 定例議題候補。
