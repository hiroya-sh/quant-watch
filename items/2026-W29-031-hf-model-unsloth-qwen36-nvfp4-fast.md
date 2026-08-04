---
id: "2026-W29-031"
type: hf-model
title: "unsloth/Qwen3.6-35B-A3B-NVFP4-Fast"
url: "https://huggingface.co/unsloth/Qwen3.6-35B-A3B-NVFP4-Fast"
discovered: "2026-07-13"
published: "2026-07-10"
base_model: "Qwen/Qwen3.6-35B-A3B"
models: [Qwen/Qwen3.6]
architectures: [transformer, moe, hybrid, linear-attention]
methods: [NVFP4]
tech: [low-bit-fp4, moe-quant, mixed-precision, weight-only, vllm-ready]
priority: high
sources: [hf-models]
status: new
verified: "2026-07-13 HF API で repo/createdAt/quant_config 確認 (createdAt 2026-07-10, compressed-tensors: attn/linear_attn/lm_head 8bit + experts nvfp4-pack 4bit)"
related: []
---

## 日本語要約
Unsloth による Qwen3.6-35B-A3B(MoE)の NVFP4「Fast」版。compressed-tensors 形式で **self_attn / linear_attn / lm_head を 8bit、expert と shared_expert を nvfp4-pack 4bit** の混合精度。5日間で 45k DL / 51 likes と週間トップの牽引。quant_config に linear_attn ターゲットが含まれており、Qwen3.6 のハイブリッド(linear attention)構造への NVFP4 適用例として貴重。

## 注目度コメント
NVFP4 + moe-quant focus 直撃、compressed-tensors なので vLLM 直接ロード可(vllm-ready)。NVIDIA 以外の主要量子化配布元(unsloth)が NVFP4 に本格参入した意味も大きい。high。
