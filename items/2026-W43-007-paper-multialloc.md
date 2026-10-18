---
id: "2026-W43-007"
type: paper
title: "MultiAlloc: Budget-Aware Precision Allocation for KV Cache Quantization"
url: "https://arxiv.org/abs/2610.18642"
discovered: "2026-10-19"
published: "2026-10-14"
authors: ["Yangchengyu Zhou", "Zhiping Wu", "Runchang Jiang", "Dongdong Ren", "Youfang Han"]
venue: "arXiv:2610.18642v1"
models: []
architectures: [transformer]
methods: []
tech: [kv-cache-quant, mixed-precision]
priority: high
sources: [arxiv]
status: new
related: []
---

## 日本語要約
KV cache 量子化の層ごとビット予算配分を予算制約付き最適化問題として解く。既存の等配分や発見的規則より良い配分を自動発見する主張。focus:kv-cache-quant に乗る。

## 手法 / 評価のポイント
- 対象: KV cache 量子化の層配分
- 定式化: 予算制約つき最適化
- 比較: 等配分 / 発見的規則 vs 最適化解

## 注目度コメント
MultiAlloc: budget-aware precision allocation for KV cache quant — focus:kv-cache-quant bump
