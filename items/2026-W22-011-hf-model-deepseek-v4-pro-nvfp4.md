---
id: "2026-W22-011"
type: hf-model
title: "canada-quant/DeepSeek-V4-Pro-NVFP4-FP8-MTP"
url: "https://huggingface.co/canada-quant/DeepSeek-V4-Pro-NVFP4-FP8-MTP"
discovered: "2026-05-22"
published: "2026-05-22"
base_model: "deepseek-ai/DeepSeek-V4-Pro"
models: [deepseek-ai/DeepSeek-V4]
architectures: [moe]
methods: [NVFP4]
tech: [low-bit-fp4, low-bit-fp8, moe-quant, microscaling-formats]
priority: high
sources: [hf-models]
status: new
related: ["2026-W22-010", "2026-W22-027"]
---

## 日本語要約

DeepSeek-V4-Pro（Proバリアント、Flashより大型）のNVFP4+FP8+MTP量子化モデル。FlashモデルのNVFP4版 (2026-W22-010) と同一作者による同シリーズ。DeepSeek-V4系列へのNVFP4展開が本格化した週。

## 量子化仕様

- ベースモデル: deepseek-ai/DeepSeek-V4-Pro（MoE LLM、大型モデル）
- 量子化手法: NVFP4 + FP8 + MTP
- ビット幅: FP4 (weights)、FP8 (activations)
- 量子化対象 (weight / activation / kv): weight + activation + MTP scale tensors
- ファイルフォーマット: compressed-tensors (vLLM形式)

## 精度報告(あれば)

- ベンチマーク: 未報告
- 劣化幅: 未報告

## ダウンロード/利用状況

199 ダウンロード（2026-05-25時点）。ProモデルはFlash版より重いため利用数は少ないが、大規模デプロイ向けには重要。
