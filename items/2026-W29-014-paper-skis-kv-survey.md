---
id: "2026-W29-014"
type: paper
title: "Towards Efficient Large Language Model Serving: A Survey on System-Aware KV Cache Optimization"
url: "https://arxiv.org/abs/2607.08057"
discovered: "2026-07-13"
published: "2026-07-09"
authors: [Jiantong Jiang, Peiyu Yang, Rui Zhang, Feng Liu]
venue: "arxiv (cs.LG, cs.AI, cs.CL)"
models: []
architectures: [transformer]
methods: []
tech: [kv-cache-quant, kv-cache-eviction, kv-cache-compression-non-quant, paged-attention]
priority: normal
sources: [arxiv]
status: new
verified: "2026-07-13 arXiv API で ID/タイトル/著者/abstract 取得・実在確認"
related: []
---

## 日本語要約
LLM serving における **system-aware な KV cache 最適化のサーベイ**(sKis)。既存研究をシステム挙動の観点から、実行・スケジューリング(時間)/配置・マイグレーション(空間)/表現・保持(構造)の3次元で整理。挙動間の co-design 親和性と挙動-目的のリンクを分析。

## 注目ポイント
- KV 量子化(構造次元)を serving システム全体の中に位置づける整理
- 分類地図として火曜定例の背景資料に使える

## 注目度コメント
サーベイ(実装なし)のためデフォルト watching、kv-cache-quant focus bump で normal。
