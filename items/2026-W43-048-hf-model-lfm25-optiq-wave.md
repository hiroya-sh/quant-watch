---
id: "2026-W43-048"
type: hf-model
title: "mlx-community/LFM2.5-24B-A2B-OptiQ-4bit (量子化ウェーブ)"
url: "https://huggingface.co/mlx-community/LFM2.5-24B-A2B-OptiQ-4bit"
discovered: "2026-10-19"
published: "2026-10-17"
base_model: "LFM2.5-24B-A2B-OptiQ-4bit"
models: []
architectures: [lfm]
methods: [OptiQ, NVFP4, GGUF]
tech: [low-bit-4, low-bit-fp4, vllm-ready]
priority: high
sources: [hf-models]
status: new
related: []
---

## 日本語要約
**LFM2.5-24B-A2B 量子化ウェーブ**。LiquidAI の Liquid Functional Model 第 2 世代の中規模 A2B に、Apple Silicon 向け **OptiQ 4-bit** (mlx-community, W35 で登場した focus 手法) と **NVFP4-GGUF** 派生 (WhiskyAKM, DL=2,534) が揃った。OptiQ は W35 で taxonomy 追加された方式で、Apple Silicon ネイティブ 4-bit に特化。

## 量子化バリエーション(本週 window 内公開のみ)
- [`mlx-community/LFM2.5-24B-A2B-OptiQ-4bit`](https://huggingface.co/mlx-community/LFM2.5-24B-A2B-OptiQ-4bit) — LFM2.5-24B-A2B の **OptiQ 4-bit** (DL=223, 2026-10-16)
- [`WhiskyAKM/LFM2.5-24B-A2B-NVFP4-GGUF`](https://huggingface.co/WhiskyAKM/LFM2.5-24B-A2B-NVFP4-GGUF) — NVFP4-GGUF 派生 (DL=2,534, 2026-10-13)

## 補足
- ベースモデル: LiquidAI LFM2.5-24B-A2B
- 配布: mlx-community OptiQ-4bit + WhiskyAKM NVFP4-GGUF
- OptiQ は W35 で taxonomy methods に追加された Apple Silicon 向け 4-bit
