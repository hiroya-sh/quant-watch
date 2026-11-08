---
id: "2026-W46-034"
type: paper
title: "Muir: Linear Attention with Sensitivity-Allocated Gating and Matched-Filter Readout"
url: "https://arxiv.org/abs/2611.08376"
discovered: "2026-11-09"
published: "2026-11-06"
authors: []
venue: "arXiv:2611.08376"
models: []
architectures: ["transformer"]
methods: []
tech: []
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約

Gated DeltaNet-2 (GDN-2) の channel-wise decay + decoupled full-rank erase/write gates を分析。key activation + unit normalization は key energy を sparse channel に集中させ、erase gate は低ランク化可能、slow-decay row の norm が大きく unweighted readout を支配、write-time に強い erase を強いる。Muir は全 gate を sensitivity-allocated low-rank projection に融合し、state row を matched-filter readout gate で再加重、節約分を広い FFN に再投資。166M-1.34B で GDN-2 比 PPL -1.8-2.0%, Transformer 比 -2.5-3.6%, commonsense +1.9pt。1.34B で multi-hop/multi-needle recall 両超え、4k 訓練長から 10M token streams へ 2,560x 外挿。

## 手法

low-rank sensitivity-allocated gating + matched-filter readout + 大 FFN 投資。large chunk での数値安定化のために並列 update を再設計。

## 評価

- サイズ: 166M-1.34B
- 精度: PPL -1.8-2.0% vs GDN-2, commonsense +1.9pt
- 外挿: 4k → 10M token (2,560x)

## 注目度コメント

linear-attention + gated RNN 最新。HF daily paper 12 upvote。長文 extrapolation の新基盤。
