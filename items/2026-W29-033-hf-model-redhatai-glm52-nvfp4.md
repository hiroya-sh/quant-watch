---
id: "2026-W29-033"
type: hf-model
title: "RedHatAI/GLM-5.2-NVFP4-FP8-mtp-FP8"
url: "https://huggingface.co/RedHatAI/GLM-5.2-NVFP4-FP8-mtp-FP8"
discovered: "2026-07-13"
published: "2026-07-10"
base_model: "zai-org/GLM-5.2"
models: [zai-org/GLM-5.2]
architectures: [transformer, moe]
methods: [NVFP4]
tech: [low-bit-fp4, low-bit-fp8, moe-quant, mixed-precision, vllm-ready]
priority: high
sources: [hf-models]
status: new
verified: "2026-07-13 HF API で repo/createdAt/quant_config 確認 (createdAt 2026-07-10, compressed-tensors mixed: attn FP8 / mlp NVFP4 / layer78 FP8)"
related: []
---

## 日本語要約
RedHat AI(旧 Neural Magic 系、vLLM 公式量子化配布元)による **GLM-5.2 の NVFP4+FP8 混合精度**。compressed-tensors 形式で self_attn を FP8 (8bit)、MLP を nvfp4-pack (4bit)、最終層 (layer 78 = MTP 部) を FP8 に維持する3グループ構成。

## 注目度コメント
vLLM 本家系列の配布元による GLM-5.2 NVFP4 で、compressed-tensors によりそのまま vLLM ロード可(vllm-ready)。同週の [[items/2026-W29-025-github-sglang-v0515|SGLang v0.5.15]] の GLM-5.2 NVFP4 本番チューニングと合わせ、GLM-5.2 が NVFP4 運用のリファレンスモデル化している。high(vllm-ready bump)。
