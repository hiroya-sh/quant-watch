---
id: "2026-W25-016"
type: hf_model
title: "nvidia/DeepSeek-V4-Pro-NVFP4"
url: "https://huggingface.co/nvidia/DeepSeek-V4-Pro-NVFP4"
discovered: "2026-06-15"
published: "2026-06-14"
org: "nvidia"
base_model: "deepseek-ai/DeepSeek-V4"
models: [deepseek-ai/DeepSeek-V4]
architectures: [transformer, moe]
methods: [NVFP4]
tech: [low-bit-fp4, moe-quant, weight-only, activation-quant]
priority: high
sources: [hf_models]
status: new
related: ["2026-W25-010", "2026-W25-011"]
---

## 日本語要約
NVIDIA公式によるDeepSeek-V4-Pro（1.6Tパラメータ、MoE）のNVFP4量子化モデル。Blackwell GPU（B200等）でvLLM・SGLangに対応。52,000+ downloadsと強い注目を集める。canada-quant版（W22に既出）と異なりNVIDIA公式のリファレンス実装。MoEエキスパート層のNVFP4化によりVRAM要件を大幅削減し、マルチノード推論なしでのDeepSeek-V4運用を現実化。

## モデル詳細
- ベースモデル: deepseek-ai/DeepSeek-V4-Pro（1.6T params、MoE）
- 量子化: NVFP4（4-bit浮動小数点、block scaling）
- 要件: NVIDIA Blackwell GPU（SM 12.x）
- 推論: vLLM v0.23.0+ / SGLang v0.5.13+

## 注目度コメント
NVFPとmoe-quantがfocus。1.6Tクラスの最大規模商用モデルをNVFP4化したNVIDIA公式実装。W22のcanada-quant版と比較した精度評価が興味深い。52K downloadsは今週のモデルリリースで最多。
