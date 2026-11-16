---
id: "2026-W47-013"
type: paper
title: "Decode Token Parallelism: Memory-Efficient Distributed Attention Parallelism for Scalable LLM Decoding"
url: "https://arxiv.org/abs/2611.13293"
discovered: "2026-11-16"
published: "2026-11-10"
authors: [arxiv:2611.13293]
venue: "arXiv:2611.13293"
models: []
architectures: [dense]
methods: []
tech: [kv-cache-quant, paged-attention]
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約
高並列・長文脈 serve では **KV 容量 と attention 帯域**の両方が decode pool に応じて増える。既存のデータ並列は重みを複製(KV 容量を制限)、テンソル並列は KV ヘッド数で頭打ち、ノード間 dense collective が発生する。本稿は **"decode token parallelism"** を提案し、decode 時のトークン単位での attention/KV パーティショニングで両ネックを解消する。

## 手法
- 単一 decode step 内で token 次元にシャード
- KV ヘッドシャーディング(TP) + token シャーディングの 2 次元分散
- attention の all-reduce を token 内のみで実行(ノード間 collective を縮小)
- paged-attention との互換

## 評価
- 長文脈(128k+)の decode throughput / メモリ分布
- TP / DP / Sequence Parallelism との比較

## 既存手法との差分
Megatron-LM / vLLM の既存 TP/SP は model weight 分散主体、本稿は **decode の attention 軸**。Grouped-Query Attention と MLA の両方で効くフレームワーク。

## 注目度コメント
serving 層の engineering 論文。長文脈推論の分散と相性がよく、KV 量子化(NVFP4 / FP8 KV) と直列合成すると **capacity × bandwidth** 両軸が一緒に解ける可能性。
