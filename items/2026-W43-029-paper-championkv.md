---
id: "2026-W43-029"
type: paper
title: "ChampionKV: Head-Wise Adaptive Budget Allocation for KV Cache Compression"
url: "https://arxiv.org/abs/2610.18026"
discovered: "2026-10-19"
published: "2026-10-13"
authors: ["Yuechuan Chen", "Yanda Guo", "Xiaoxi Liu", "Weilin Ruan", "Huanbo Xu"]
venue: "arXiv:2610.18026v1"
models: []
architectures: [transformer]
methods: []
tech: [kv-cache-compression-non-quant, mixed-precision]
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約
ヘッドごとに KV cache の予算を適応配分する ChampionKV。ヘッド特性(sink 強度・局所性)を見て重要ヘッドに予算を寄せる。KV cache compression 系で量子化とは直交。

## 手法 / 評価のポイント
- 対象: KV cache 予算配分(圧縮側)
- 手法: ヘッド特性に応じた予算配分
- ChampionKV

## 注目度コメント
ChampionKV: Head-Wise Adaptive Budget Allocation for KV Cache
