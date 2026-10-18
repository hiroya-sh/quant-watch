---
id: "2026-W43-046"
type: hf-model
title: "Baekpica/GLM-5.3-Flash-VQ-GGUF (量子化ウェーブ)"
url: "https://huggingface.co/Baekpica/GLM-5.3-Flash-VQ-GGUF"
discovered: "2026-10-19"
published: "2026-10-17"
base_model: "GLM-5.3-Flash-VQ-GGUF"
models: [zai-org/GLM-5.1, zai-org/GLM-5.2]
architectures: [moe]
methods: [GGUF]
tech: [low-bit-fp8, mixed-precision, llamacpp-ready]
priority: normal
sources: [hf-models]
status: new
related: []
---

## 日本語要約
**GLM-5.3-Flash と Ling-3.1-flash の VQ-GGUF 派生**。Baekpica が同じ "VQ-GGUF" パターンで 2026-10-15 と 10-17 に配布。vLLM v0.32.0 で GLM-5.x の **FP8 KV cache + fp8_ds_mla** が既定化されたタイミングと重なる(ただしこの配布は weight 側の GGUF 変換で、vLLM の KV cache 設定とは独立)。

## 量子化バリエーション(本週 window 内公開のみ)
- [`Baekpica/GLM-5.3-Flash-VQ-GGUF`](https://huggingface.co/Baekpica/GLM-5.3-Flash-VQ-GGUF) — FP8/GGUF の Vector-Quantized 派生 (DL=1,909)
- [`Baekpica/Ling-3.1-flash-VQ-GGUF`](https://huggingface.co/Baekpica/Ling-3.1-flash-VQ-GGUF) — Ling-3.1-flash の同系列 VQ-GGUF (DL=1,251)

## 補足
- ベースモデル: GLM-5.3-Flash / Ling-3.1-flash
- GGUF の Vector-Quantized 系(通常 GGUF より精度振れ幅あり)
- vLLM 側で GLM-5.x の FP8 KV cache が既定化(#60140, #60281)
