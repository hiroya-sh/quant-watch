---
id: "2026-W27-006"
type: paper
title: "Breaking the Rounding Trap: Securing LLMs against Quantization-Conditioned Backdoors (QuantGuard)"
url: "https://arxiv.org/abs/2606.29239"
discovered: "2026-07-07"
published: "2026-06-28"
authors: [（要確認）]
venue: "arxiv (ACM CCS 2026)"
affiliation: "（要確認）"
models: [meta-llama/Llama-3.1, Qwen/Qwen2.5]
architectures: [transformer]
methods: [NF4]
tech: [ptq]
priority: watching
sources: [arxiv]
status: new
verified: "2026-07-07 arxiv abs 実在確認 (28 Jun, W27窓の境界)"
related: []
---

## 日本語要約
量子化を発火条件とするバックドア(quantization-conditioned backdoor)から LLM を守る手法 QuantGuard。INT8/FP4/NF4 の量子化過程の丸めを悪用した攻撃を対象とし、LLaMA-3 / Qwen2.5-Coder で検証。量子化手法そのものではなくセキュリティ側の研究。

## 注目度コメント
quant-adjacent（セキュリティ）。focus 外だが「量子化が攻撃面になる」観点として watching で記録。詳細未精査。
