---
id: "2026-W46-007"
type: paper
title: "LoopKV: Loop-Aware KV Cache Compression for Serving Looped Transformers"
url: "https://arxiv.org/abs/2611.04137"
discovered: "2026-11-09"
published: "2026-11-03"
authors: ["Tianle Zhou", "Yang Zhang", "Tianyu Wu", "Zhuohan Wang"]
venue: "arXiv:2611.04137"
models: []
architectures: ["transformer"]
methods: []
tech: ["kv-cache-quant", "low-bit-2", "low-bit-4"]
priority: high
sources: [arxiv]
status: new
related: []
---

## 日本語要約

Ouro など loop ごとに KV cache を持つ looped transformer 向け。各 (loop, layer) セルで 4bit/2bit/last-loop 再利用を選ぶ loop-aware KV 量子化 LoopKV。オフラインプロファイルで each cell が精度に与える damage を最小化するプランを決定し、decode では各 loop が high 2bit を読み、必要時のみ low bit を fetch。vLLM の fused kernel + CUDA graph で実行。Ouro-1.4B on RTX Pro 6000 で KIVI-4 比 -35% KV, 1.7-2.2x goodput @ 16k。6 ベンチ平均で BF16 未満の有意低下なし。

## 手法

(loop, layer) セルごとに 4bit/2bit/reuse を選ぶオフラインプラン。vLLM fused kernel で bitplane 的に 2bit/4bit を動的に読み分け。

## 評価

- モデル: Ouro-1.4B
- ビット幅: 2/4bit per (loop,layer) cell
- 精度: BF16 と有意差なし (6 ベンチ)
- スループット: KIVI-4 比 1.7-2.2x goodput @ 16k (memory -35%)

## 注目度コメント

kv-cache-quant focus + vLLM 接続 — Dory1.0-4B / LoopVQ と並び looped transformer × KV 量子化が今週 3 本揃った。
