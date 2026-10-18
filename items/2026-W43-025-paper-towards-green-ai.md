---
id: "2026-W43-025"
type: paper
title: "Towards Green AI: Evaluating Energy Efficiency for Quantized LLM Inference"
url: "https://arxiv.org/abs/2610.17531"
discovered: "2026-10-19"
published: "2026-10-13"
authors: ["Petar Basta"]
venue: "arXiv:2610.17531v1"
models: [meta-llama/Llama-4, microsoft/Phi-4, Qwen/Qwen2.5]
architectures: [transformer]
methods: [bitsandbytes, GPTQ, AWQ]
tech: [weight-only, ptq]
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約
Llama 2 7B / Phi 3.5 Mini / OLMo 1B / Qwen 2.5 7B / 14B で 10 種の weight-only PTQ を H100 / A6000 / A100 / L4 上で入出力長を変えつつエネルギー効率で比較。量子化手法ごとにエネルギー効率のピークが来る文脈長が異なるという新知見。

## 手法 / 評価のポイント
- 対象: Llama 2 7B / Phi 3.5 Mini / OLMo 1B / Qwen 2.5 7B & 14B
- 比較軸: 10 PTQ × 4 GPU × 入出力長
- 新知見: 手法ごとに「エネルギー効率ピークの文脈長」が異なる

## 注目度コメント
Towards Green AI: energy/accuracy profile of 10 PTQ strategies
