---
id: "2026-W47-014"
type: paper
title: "Semantically Aligned KV Cache Compression for Efficient Agentic Autoregressive Video Generation"
url: "https://arxiv.org/abs/2611.11452"
discovered: "2026-11-16"
published: "2026-11-09"
authors: [arxiv:2611.11452]
venue: "arXiv:2611.11452"
models: []
architectures: []
methods: []
tech: [kv-cache-quant, kv-cache-eviction]
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約
エージェント型 autoregressive video 生成は semantic planner + sequential generator + visual verifier の 3 要素で動き、visual history が伸びて KV cache が膨張する。従来の KV 圧縮は generator だけを最適化し、planner の semantic constraint を無視するため、優先度の高い frame を落としてしまう。本稿は **planner-aware な KV 圧縮**を提案。

## 手法
- planner の次 action に対する semantic affinity を KV token に付与
- affinity-weighted eviction + quantization(mixed-precision KV)
- rollout 間で KV 予算を適応配分

## 評価
- Video gen agent(複数 rollout, visual verification あり)
- KV メモリ削減率 vs. task success

## 既存手法との差分
W36 SemKV / W46 LowRAM, DepthGraft と並ぶ「構造的 KV 削減」系、**agentic video** 特化で planner 情報を使う点が差分。

## 注目度コメント
動画生成 agent の実装は 2026 Q4 で拡大中。video KV は token 数桁が大きく、compression の実装価値が高い。
