---
id: "2026-W34-027"
type: hf-model
title: "Qwen3.8-27B 量子化ウェーブ (FP8/NVFP4/MXFP4/INT8/AWQ/GPTQ)"
url: "https://huggingface.co/Qwen/Qwen3.8-27B-FP8"
discovered: "2026-08-17"
published: "2026-08-13"
base_model: "Qwen/Qwen3.8-27B"
models: [Qwen/Qwen3]
architectures: [dense]
methods: [NVFP4, MXFP4, AWQ, GPTQ, SmoothQuant]
tech: [vllm-ready, low-bit-fp8, low-bit-4, mixed-precision]
priority: high
sources: [hf-models]
status: new
related: []
---
## 日本語要約
新モデル **Qwen3.8-27B**(MTP 対応)が公開週内にほぼ全フォーマットで量子化された。公式 **Qwen/Qwen3.8-27B-FP8 が約35万DL** と突出し、コミュニティが NVFP4(MTP 版多数)、MXFP4、INT8 W8A16、AWQ W4A16、GPTQ 4/8bit、SmoothQuant W8A8-INT8 を続々公開。NVFP4/W4A16/FP8 は vLLM 直接ロード可で監視方針(エンジンで評価完結)に乗る。

## 量子化仕様
- ベースモデル: Qwen3.8-27B (dense, MTP)
- 量子化手法: FP8 / NVFP4 / MXFP4 / INT8(W8A16, SmoothQuant W8A8) / AWQ(W4A16) / GPTQ(4/8bit)
- ビット幅: FP8 / 4bit / 8bit
- 量子化対象: weight 主体(W8A8/W4A4 派生あり)
- ファイルフォーマット: safetensors(compressed-tensors) / GGUF 派生

## 精度報告(あれば)
- 個別 model card 依存(公式 FP8 は Qwen 公式配布)。abliterated/uncensored 派生は品質未検証

## ダウンロード/利用状況
- 公式 FP8 ~352k DL、NVFP4-MTP-GGUF ~21k、NVFP4 ~20k、INT8-W8A16 ~15k、AWQ ~12k DL 等。代表 ID: Qwen/Qwen3.8-27B-FP8, amd/Qwen3.8-27B-Quark-AWQ-INT4-W4A16, mlx-community/Qwen3.8-27B-MTP-nvfp4。新規モデルタグ候補 Qwen/Qwen3.8。
