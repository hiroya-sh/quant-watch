---
id: "2026-W23-024"
type: hf-model
title: "sakamakismile/LFM2.5-8B-A1B-NVFP4"
url: "https://huggingface.co/sakamakismile/LFM2.5-8B-A1B-NVFP4"
discovered: "2026-06-01"
published: "2026-05-29"
base_model: "LiquidAI/LFM2.5-8B-A1B"
models: []
architectures: [hybrid, moe]
methods: [NVFP4]
tech: [low-bit-fp4, microscaling-formats, weight-only, activation-quant]
priority: normal
sources: [hf-models]
status: new
related: []
---

## 日本語要約
Liquid AIのLFM2.5（Linear Functional Model 2.5）8B A1BのNVFP4量子化版。LFM2.5はMamba/Linear Attentionベースのhybridアーキテクチャ（transformerではない）であり、non-transformer系モデルへのNVFP4適用事例として注目。Blackwell向け低メモリ推論を実現。

## 量子化仕様
- ベースモデル: LiquidAI/LFM2.5-8B-A1B（Hybrid: Linear Attention + MoE）
- 量子化手法: NVFP4
- ビット幅: FP4
- 量子化対象: weight + activation
- ファイルフォーマット: HuggingFace safetensors

## 精度報告(あれば)
- ベンチマーク: 未記載
- 劣化幅: 不明

## ダウンロード/利用状況
Non-transformer系（LFM = liquid neural network derivative）へのNVFP4適用。W22でもsahilchachra/lfm2-5-8b-a1b-mxfp4-mlxが登場しており、LFMへの量子化が継続して進行。今回はNVFP4による第2事例。
