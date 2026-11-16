---
id: "2026-W47-015"
type: paper
title: "One-Sided Expert-Parallel All-to-All for Mixture-of-Experts Inference over NVLink"
url: "https://arxiv.org/abs/2611.13188"
discovered: "2026-11-16"
published: "2026-11-10"
authors: [arxiv:2611.13188]
venue: "arXiv:2611.13188"
models: []
architectures: [moe]
methods: []
tech: [moe-quant]
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約
MoE の EP では layer ごとに dispatch と combine の 2 回の all-to-all が入る。推論は batch あたりトークン数が少ないため、**データ量ではなく固定コスト**(sync, header, kernel 起動)が latency を支配する。本稿は **one-sided put/get** ベースの EP all-to-all を NVLink に乗せ、両側の barrier を省いて固定コストを削減する。

## 手法
- NVLink 上の one-sided put(sender が receiver バッファに直接書く)
- 暗黙の tag で ordering、barrier は layer 末尾でのみ
- dispatch と combine を**同じ kernel** に融合

## 評価
- MoE decoder(expert 数・per-rank token 数で sweep)
- vLLM の既存 EP と比較: latency, CUDA Graph 互換

## 既存手法との差分
W46 GC-MoE の persistent Green Context + fused all-to-all は **CUDA Graph 内融合**、本稿は **comm プリミティブ**側(one-sided)から攻める。両者は組合せ可能。

## 注目度コメント
moe-quant focus と直交する moe-serving 論文。NVFP4 MoE weight と組んだときに **固定コストが支配的な batch** での end-to-end 改善が見込める。
