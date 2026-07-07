---
id: "2026-W28-005"
type: hf-model
title: "mlx-community 週内 4bit 量子化バッチ (Agents-A1 他)"
url: "https://huggingface.co/mlx-community/Agents-A1-4bit"
discovered: "2026-07-07"
published: "2026-07-01"
models: [Qwen/Qwen3.5, google/gemma-4]
architectures: [transformer, moe]
methods: [GGUF]
tech: [low-bit-4, moe-quant, weight-only, llamacpp-ready]
priority: watching
sources: [hf-models]
status: new
verified: "2026-07-07 HF API で複数 repo/createdAt 確認 (2026-07-01〜07-05)"
model_ids:
  - "mlx-community/Agents-A1-4bit"
  - "mlx-community/Laguna-XS-2.1-4bit"
  - "mlx-community/Qwopus3.6-27B-Coder-4bit"
  - "mlx-community/gemma-4-26B-A4B-it-qat-q4_0-mlx-aligned"
related: []
---

## 日本語要約
Apple Silicon (MLX) 向けの週内 4bit 量子化アップロード群。HF API で実在確認。代表は InternScience/Agents-A1（Qwen3.5-MoE 系 VLM）の MLX 4bit で、同日に 3/4/5/6/8bit + bf16 のファミリー。他に Laguna-XS-2.1、Qwopus3.6-27B-Coder、gemma-4-26B-A4B QAT-aligned（07-05）等。

## 注目度コメント
エッジ/ローカル(MLX)量子化の裾野。focus 直撃なし、watching。個別モデルの詳細は各 model card 参照。
