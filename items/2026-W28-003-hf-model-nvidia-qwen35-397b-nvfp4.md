---
id: "2026-W28-003"
type: hf-model
title: "nvidia/Qwen3.5-397B-A17B-NVFP4-V2"
url: "https://huggingface.co/nvidia/Qwen3.5-397B-A17B-NVFP4-V2"
discovered: "2026-07-07"
published: "2026-06-29"
base_model: "Qwen/Qwen3.5-397B-A17B"
models: [Qwen/Qwen3.5]
architectures: [transformer, moe]
methods: [NVFP4]
tech: [low-bit-fp4, moe-quant, mixed-precision, weight-only, vllm-ready]
priority: high
sources: [hf-models]
status: new
verified: "2026-07-07 HF API で repo/createdAt/quant_config 確認 (createdAt 2026-06-29)"
related: []
---

## 日本語要約
NVIDIA 公式による Qwen3.5-397B-A17B（MoE）の NVFP4 量子化（V2）。TensorRT Model Optimizer 使用、quant_method は "modelopt_mixed"。config 上、attention/shared-expert linear は 8bit、MoE expert 重みは 4bit の**混合精度**。focus の NVFP4 直撃、大規模 MoE への適用例。

## 量子化構成（quant_config より）
- NVFP4（ModelOpt mixed 8bit/4bit）
- expert 部 4bit / attention・shared expert 8bit
- text-generation, Apache-2.0

## 注目度コメント
NVFP4 focus + moe-quant focus に直撃、vllm-ready。397B 級 MoE の低ビット化の実例として議題候補。
