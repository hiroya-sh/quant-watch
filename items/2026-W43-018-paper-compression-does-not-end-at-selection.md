---
id: "2026-W43-018"
type: paper
title: "Compression Does Not End at Selection: Post-Selection Positional Geometry for Sparse KV Caches"
url: "https://arxiv.org/abs/2610.21126"
discovered: "2026-10-19"
published: "2026-10-15"
authors: ["Wanyang Hong", "Zhaoning Zhang"]
venue: "arXiv:2610.21126v1"
models: []
architectures: [transformer]
methods: []
tech: [rotation, kv-cache-compression-non-quant, sparse-attention, pre-rope-quant]
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約
スパース KV キャッシュで一度選別した後の RoPE 座標の割付問題を扱う。ギャップが残ると評価性能が落ちるため、保持トークンに連続的な RoPE 座標を再割り当て(RoPERelay)し、保持キーの位相を逆回転・再回転で同期させる。既存セレクタに非破壊的に乗る post-selection 修正。

## 手法 / 評価のポイント
- 対象: RoPE 使用の長文 LLM
- 入力: 任意のスパース KV セレクタの出力
- 手法: 保持トークンに連続 RoPE 座標を再割り当て + キー位相の inverse-rotate / re-rotate

## 注目度コメント
RoPERelay: RoPE positional reorganization post sparse-selection KV
