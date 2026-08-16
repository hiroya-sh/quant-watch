---
id: "2026-W34-012"
type: paper
title: "DistillCache: KL-Guided Adaptive KV-Cache Eviction for Memory-Efficient LLM Inference"
url: "https://arxiv.org/abs/2608.08878"
discovered: "2026-08-17"
published: "2026-08-10"
authors: [Asaad Althoubi]
venue: "arXiv"
models: []
architectures: [transformer]
methods: []
tech: [kv-cache-eviction]
priority: normal
sources: [arxiv]
status: new
related: []
---
## 日本語要約
KV cache は系列長に線形増加し長文推論のメモリボトルネックになる。DistillCache は KV eviction を逐次意思決定問題として定式化する強化学習フレームワーク。attention 統計・value norm・エントロピ・位置などの内部信号で軽量方策網を学習し、per-step の KL divergence 報酬(full-cache 出力分布を保つ)で REINFORCE 学習。Mistral-7B-Instruct で 25% cache 予算でも LongBench full-cache 精度の94.2%を維持し、H2O/SnapKV を最大2.7pt 上回る。

## 手法
静的な attention/位置ヒューリスティックでなく RL 方策で将来影響を予測し eviction。

## 評価
- 対象モデル: Mistral-7B-Instruct-v0.3
- 予算: 25% cache で精度94.2%維持
- 比較: H2O/SnapKV を最大2.7pt 上回る

## 既存手法との差分
KL 報酬で full-cache 分布を保つ RL eviction。量子化でなく eviction(圧縮)系。

## 注目度コメント
KV cache 削減の eviction 系。量子化と併用可能な長文メモリ削減策として監視。
