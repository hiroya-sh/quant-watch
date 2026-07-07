---
id: "2026-W28-004"
type: hf-model
title: "nvidia/Mistral-Medium-3.5-128B-NVFP4"
url: "https://huggingface.co/nvidia/Mistral-Medium-3.5-128B-NVFP4"
discovered: "2026-07-07"
published: "2026-06-30"
base_model: "mistralai/Mistral-Medium-3.5-128B"
models: [mistralai/Mistral-Medium-3.5]
architectures: [transformer]
methods: [NVFP4]
tech: [low-bit-fp4, mixed-precision, weight-only, vllm-ready]
priority: normal
sources: [hf-models]
status: new
verified: "2026-07-07 HF API で repo/createdAt/quant_config 確認 (createdAt 2026-06-30)"
related: []
---

## 日本語要約
NVIDIA 公式による Mistral-Medium-3.5-128B の NVFP4 量子化。TensorRT Model Optimizer 使用（quant_method "modelopt"）。config 上、attention 投影と最初/最後の MLP ブロックは 8bit、MLP の大半は 4bit の混合精度。Mistral3ForConditionalGeneration（マルチモーダル）。

## 量子化構成（quant_config より）
- NVFP4（ModelOpt mixed 8bit/4bit）
- attention + 端の MLP は 8bit、本体 MLP は 4bit

## 注目度コメント
NVFP4(focus)の Mistral 系への適用。vllm-ready。mistralai/Mistral-Medium-3.5 は taxonomy 未登録（Mistral-Medium-3.5 の親タグ検討）。
