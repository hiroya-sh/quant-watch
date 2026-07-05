---
id: "2026-W28-016"
type: hf-model
title: "unsloth/Kimi-K2.7-{140B, 320B-A32B}-{FP8, GGUF, AWQ}"
url: "https://huggingface.co/unsloth/Kimi-K2.7-140B-GGUF"
discovered: "2026-07-06"
published: "2026-07-04"
base_model: "moonshotai/Kimi-K2.7-{140B, 320B-A32B}"
models: [moonshotai/Kimi-K2.7]
architectures: [transformer, moe]
methods: [AWQ, GGUF]
tech: [weight-only, moe-quant, low-bit-4, low-bit-fp8]
priority: normal
sources: [hf-models]
status: new
related: [2026-W27-017]
---

## 日本語要約
unsloth が Kimi K2.7 リリース（Moonshot AI が W27 末に発表した後継モデル）を受けて即座に 6 モデル一斉量子化リリース。dense 140B と MoE 320B-A32B の 2 変種に対して、それぞれ FP8 / GGUF Q4_K_M / AWQ INT4 の 3 種類を提供。Moonshot AI 公式は FP8 のみのため、AWQ / GGUF が unsloth 提供の初動となる。llama.cpp W28 builds (W28-013) の Kimi-K2 router 整合バグ修正と同期リリース。

## 量子化仕様
- **Kimi-K2.7-140B-FP8**: dense 140B、W8A8 FP8
- **Kimi-K2.7-140B-GGUF**: Q3_K_XL / Q4_K_M / Q5_K_M / Q6_K の 4 quant
- **Kimi-K2.7-140B-AWQ**: W4A16 AWQ INT4、group-size 128
- **Kimi-K2.7-320B-A32B-{FP8, GGUF, AWQ}**: 同上、MoE 版 (32 experts, top-4 active = A32B)

## 精度報告
- **Kimi-K2.7-140B-AWQ**: MMLU 80.2 (FP16 81.1, -0.9pt) / MATH 84.5 (FP16 85.3, -0.8pt)
- **Kimi-K2.7-320B-A32B-AWQ**: MMLU 84.7 (FP16 85.8, -1.1pt)、MoE 特有の劣化幅

## ダウンロード/利用状況
- 48 時間で全 6 モデル合計 downloads 32,000+
- Kimi-K2.7-140B-GGUF が M4 Ultra 単機で decode 可能な最大モデルとして話題

## 注目度コメント
moe-quant が focus tech（間接、Kimi-K2.7-320B-A32B の MoE 経由）。Moonshot AI 新規モデルへの追従速度が W22 (Kimi K2.5) → W25 (K2.6) → W28 (K2.7) と3週サイクルで安定。unsloth の対応速度と品質が weekly cadence で見ると安定した供給源となっている点で標準的な normal priority。
