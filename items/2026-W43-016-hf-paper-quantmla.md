---
id: "2026-W43-016"
type: hf-paper
title: "QuantMLA: Function-Aligned Dual-Path Quantization for Low-Bit MLA KV Caching"
url: "https://arxiv.org/abs/2609.36760"
hf_url: "https://huggingface.co/papers/2609.36760"
discovered: "2026-10-19"
published: "2026-09-29"
authors: ["Zunhai Su", "Yuxuan Sun", "Jianchao Tan"]
venue: "arXiv:2609.36760v2"
models: [deepseek-ai/DeepSeek-V4]
architectures: [transformer]
methods: []
tech: [kv-cache-quant, low-bit-4, pre-rope-quant]
priority: high
sources: [hf-papers, arxiv]
status: updated
related: []
---

## 日本語要約
MLA の content 経路と decoupled RoPE 経路の量子化誤差をそれぞれモデル化し、RoPE 経路の誤差増幅を理論的に説明。経路別に関数整合な変換を学習し、オフラインでモデルパラメータに吸収する。4 つの MLA モデルファミリで両経路の **joint INT4 caching を世界で初めて** 達成と主張。

## 手法 / 評価のポイント
- 対象: MLA の content/RoPE 二重経路量子化
- 貢献: 経路別の関数整合変換、パラメータに吸収可
- 評価: 4 ファミリで初の両経路 INT4 KV cache

## 注目度コメント
QuantMLA: Function-Aligned Dual-Path Low-Bit MLA KV — focus:kv-cache-quant bump
