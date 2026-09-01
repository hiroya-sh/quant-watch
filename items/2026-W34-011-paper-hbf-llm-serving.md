---
id: "2026-W34-011"
type: paper
title: "Potential Applications of HBF in LLM Serving Systems"
url: "https://arxiv.org/abs/2608.13127"
discovered: "2026-08-17"
published: "2026-08-13"
authors: [Yihan Yin, Yinlun Zhao, Zhixin Yun, Guanying Wu]
venue: "arXiv"
models: []
architectures: [moe]
methods: []
tech: [kv-cache-compression-non-quant]
priority: normal
sources: [arxiv]
status: new
related: []
---
## 日本語要約
LLM serving はモデル重み・KV cache・serving 変種数の増大で容量制約が強まる。本レポートは **High-Bandwidth Flash (HBF)** を HBM ベース serving への容量拡張として検討。HBF を GPU メモリ階層に統合しつつ compute die が期待する帯域を損なわない方法を論じ、read-mostly なモデル状態の常駐拡大として容量価値をモデル化。HBF は expert 複製増で MoE serving を、モデル常駐拡大で multi-model serving を改善し得るが、HBM 常駐実行パス維持が前提。

## 手法
GPU メモリ階層への HBF 統合をシステムレベルで解析・シミュレーション。

## 評価
- 対象: MoE / multi-model serving
- 観点: 容量拡張と帯域維持のトレードオフ
- 知見: HBM 実行パス維持下で常駐集合を拡大する使い方が有効

## 既存手法との差分
量子化ではなくメモリ階層(HBF)による容量緩和。量子化と補完的な serving インフラ視点。

## 注目度コメント
KV cache/重みの容量圧を扱う serving システム論。量子化と直交だが MoE serving の周辺文脈として監視。
