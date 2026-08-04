---
id: "2026-W29-030"
type: hf-model
title: "nvidia/Kimi-K2.7-Code-NVFP4"
url: "https://huggingface.co/nvidia/Kimi-K2.7-Code-NVFP4"
discovered: "2026-07-13"
published: "2026-07-06"
base_model: "moonshotai/Kimi-K2.7-Code"
models: [moonshotai/Kimi-K2.7]
architectures: [transformer, moe]
methods: [NVFP4]
tech: [low-bit-fp4, weight-only, moe-quant, vllm-ready]
priority: high
sources: [hf-models]
status: new
verified: "2026-07-13 HF API で repo/createdAt/quant_config 確認 (createdAt 2026-07-06, quant_method modelopt, 4bit Linear)"
related: []
---

## 日本語要約
NVIDIA 公式による Moonshot **Kimi-K2.7-Code の NVFP4 量子化**。TensorRT Model Optimizer 使用(quant_method: modelopt、Linear 4bit)。公開1週間で 39k ダウンロードと立ち上がりが速い。W27-W28 の Qwen3.5-397B / Mistral-Medium-3.5 / Llama-4-Scout に続く NVIDIA 公式 NVFP4 量産ラインの最新作で、コード特化モデルに拡大。

## 注目度コメント
NVFP4 focus 直撃 + ModelOpt NVFP4 は vLLM で直接ロード可能(vllm-ready)。コード用途での NVFP4 実効精度を測る良い題材。high。
