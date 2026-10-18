---
id: "2026-W43-027"
type: paper
title: "SparPR: Runtime KV-Cache Recovery for Resource-Constrained LLM Inference on Consumer Hardware"
url: "https://arxiv.org/abs/2610.18140"
discovered: "2026-10-19"
published: "2026-10-13"
authors: ["Jieyun Deng", "Keming Hu", "Yanghe Liu", "Li Feng"]
venue: "arXiv:2610.18140v1"
models: []
architectures: [transformer]
methods: []
tech: [kv-cache-compression-non-quant, kv-cache-eviction]
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約
コンシューマ GPU 向けの runtime KV cache recovery。クエリ依存のブロック選別・動的バジェット制御・局所再計算で、オフライン学習なしに KV 圧縮と復元を回す SparPR。

## 手法 / 評価のポイント
- 対象: コンシューマ GPU 単機 LLM 推論
- 手法: クエリ依存ブロック選別 + 動的バジェット + 局所再計算
- 利点: モデル重みに触れず、オフライン学習不要

## 注目度コメント
SparPR: runtime KV-cache recovery, consumer-GPU LLM inference
