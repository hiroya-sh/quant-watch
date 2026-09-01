---
id: "2026-W34-028"
type: hf-model
title: "DeepSeek-V4-Pro-0813 量子化ウェーブ (FP8 公式 + GGUF)"
url: "https://huggingface.co/deepseek-ai/DeepSeek-V4-Pro-0813"
discovered: "2026-08-17"
published: "2026-08-13"
base_model: "deepseek-ai/DeepSeek-V4-Pro-0813"
models: [deepseek-ai/DeepSeek-V4]
architectures: [moe]
methods: [GGUF]
tech: [vllm-ready, low-bit-fp8, moe-quant, llamacpp-ready]
priority: high
sources: [hf-models]
status: new
related: []
---
## 日本語要約
DeepSeek 系の新版 **DeepSeek-V4-Pro-0813** が公開。**公式 deepseek-ai/DeepSeek-V4-Pro-0813(FP8, 530 likes / 約22k DL)** に加え、unsloth が GGUF(約8k DL)を配布。FP8 は vLLM で直接 serving 可、GGUF は llama.cpp 経路。focus の DeepSeek-V4 系・moe-quant に合致。

## 量子化仕様
- ベースモデル: DeepSeek-V4-Pro-0813 (MoE)
- 量子化手法: FP8(公式) / GGUF(unsloth, k-quant 系)
- ビット幅: FP8 / GGUF 各種
- 量子化対象: weight(MoE expert 含む)
- ファイルフォーマット: safetensors(FP8) / GGUF

## 精度報告(あれば)
- 公式 FP8 は DeepSeek 配布。GGUF は unsloth の dynamic quant

## ダウンロード/利用状況
- deepseek-ai/DeepSeek-V4-Pro-0813 ~22k DL / 530 likes、unsloth/DeepSeek-V4-Pro-0813-GGUF ~8k DL。lecore/staccs 等の派生 FP8 も出現。
