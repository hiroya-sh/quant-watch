---
id: "2026-W43-002"
type: paper
title: "Task-Phase-Conditioned Expert Routing Is Not a Reliable Proxy for Quantization Sensitivity in MoE FFN Tensors"
url: "https://arxiv.org/abs/2610.20826"
discovered: "2026-10-19"
published: "2026-10-15"
authors: ["Yifan Liu"]
venue: "arXiv:2610.20826v1"
models: [Qwen/Qwen3.6]
architectures: [moe]
methods: []
tech: [mixed-precision, moe-quant]
priority: high
sources: [arxiv]
status: new
related: []
---

## 日本語要約
Qwen3.6-35B-A3B の MoE FFN について、ルーティング統計(エントロピー / Jaccard / top-1 強度等)を混合精度量子化の層配分に使えるかを検証。結論は **ルーティング統計はビット感度の信頼できる proxy ではない** という negative result。約 4.0 / 2.7 bpw で比較。

## 手法 / 評価のポイント
- 対象: Qwen3.6-35B-A3B(MoE)の routed-expert FFN
- 比較: 4.0 bpw flat vs 2.7 bpw sparse
- 結論: ルーティング統計からの座標降下では十分な配分が得られない

## 注目度コメント
MoE-FFN mixed-precision allocation: negative result that routing stats fail as sensitivity proxy — focus:moe-quant bump
