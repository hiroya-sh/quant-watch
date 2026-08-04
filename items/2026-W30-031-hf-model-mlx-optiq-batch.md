---
id: "2026-W30-031"
type: hf-model
title: "mlx-community W30 バッチ — OptiQ-4bit 新着群 + Hy3-oQ2e(~2.3bpw)+ Ministral-3 系列"
url: "https://huggingface.co/mlx-community"
discovered: "2026-07-20"
published: "2026-07-14 〜 2026-07-18"
base_model: ""
models: [google/gemma-4, tencent/Hy3]
architectures: [moe, transformer]
methods: [OptiQ]
tech: [low-bit-4, low-bit-2, llamacpp-ready]
priority: normal
sources: [hf-models]
status: new
verified: "2026-07-20 HF API models?filter=quantized で一覧確認(gemma-4-12B-coder OptiQ-4bit, ThinkingCap-Qwen3.6-27B, Ornith-1.0-35B/9B, Hy3-oQ2e 2.31〜2.37bpw 3種, Ministral-3 3B/8B/14B の 4/6/8bit+bf16, Step-3.7-Flash oQ2e/oQ3e ほか計20件前後)"
related: []
---

## 日本語要約
mlx-community の週次量子化バッチ。目立つ動きは3つ:
1. **OptiQ-4bit の定着** — gemma-4-12B-coder 派生、ThinkingCap-Qwen3.6-27B、Ornith-1.0(35B/9B)、MiniCPM5 など新着モデルを即 OptiQ 化
2. **Hy3-oQ2e シリーズ(2.31/2.33/2.37bpw)** — Hy3 を実効 2.3bpw 台まで落とす超低ビット MLX 量子化の実験群
3. **Ministral-3(3B/8B/14B)Base-2512** の 4/6/8bit + bf16 のフルマトリクス配布

## 注目度コメント
gemma-4 派生を含むため models focus (google/gemma-4) の bump で normal。Apple Silicon 側の 2bit 台 MoE 量子化(oQ2e)は精度検証情報が出てきたら格上げ検討。
