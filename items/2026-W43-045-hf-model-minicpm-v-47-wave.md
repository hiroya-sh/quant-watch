---
id: "2026-W43-045"
type: hf-model
title: "mlx-community/MiniCPM-V-4.7-35B-A3B-mxfp4 (量子化ウェーブ)"
url: "https://huggingface.co/mlx-community/MiniCPM-V-4.7-35B-A3B-mxfp4"
discovered: "2026-10-19"
published: "2026-10-17"
base_model: "MiniCPM-V-4.7-35B-A3B-mxfp4"
models: []
architectures: [moe]
methods: [MXFP4, NVFP4, GGUF]
tech: [low-bit-fp4, moe-quant, vllm-ready, llamacpp-ready]
priority: normal
sources: [hf-models]
status: new
related: []
---

## 日本語要約
**MiniCPM-V 4.7 (35B-A3B MoE VLM) の量子化ウェーブ**。MLX コミュニティが MXFP4 / NVFP4 / 1B 版を 2026-10-13 に一斉投入、bartowski が GGUF、WhiskyAKM が NVFP4-GGUF を 10-13〜10-18 で順次公開。vLLM v0.32.0 の新規サポート(#58674)、llama.cpp v0.7.0 の新規サポート(#29416)に合わせて配布が揃った。

## 量子化バリエーション(本週 window 内公開のみ)
- [`mlx-community/MiniCPM-V-4.7-35B-A3B-mxfp4`](https://huggingface.co/mlx-community/MiniCPM-V-4.7-35B-A3B-mxfp4) — MLX MXFP4 (35B-A3B MoE VLM, DL=1,094)
- [`mlx-community/MiniCPM-V-4.7-35B-A3B-nvfp4`](https://huggingface.co/mlx-community/MiniCPM-V-4.7-35B-A3B-nvfp4) — MLX NVFP4 (DL=293)
- [`mlx-community/MiniCPM-V-4.7-1B-mxfp4`](https://huggingface.co/mlx-community/MiniCPM-V-4.7-1B-mxfp4) — MLX MXFP4 (1B, DL=89)
- [`mlx-community/MiniCPM-V-4.7-1B-nvfp4`](https://huggingface.co/mlx-community/MiniCPM-V-4.7-1B-nvfp4) — MLX NVFP4 (1B, DL=68)
- [`bartowski/MiniCPM-V-4.7-35B-A3B-GGUF`](https://huggingface.co/bartowski/MiniCPM-V-4.7-35B-A3B-GGUF) — GGUF (bartowski, 2026-10-18)
- [`WhiskyAKM/MiniCPM-V-4.7-35B-A3B-NVFP4-GGUF`](https://huggingface.co/WhiskyAKM/MiniCPM-V-4.7-35B-A3B-NVFP4-GGUF) — NVFP4-GGUF 派生 (DL=689)

## 補足
- ベースモデル: openbmb/MiniCPM-V-4.7(35B-A3B MoE multimodal VLM)
- vLLM v0.32.0 と llama.cpp v0.7.0 が同週に対応
- MLX は MXFP4 / NVFP4、GGUF は bartowski + WhiskyAKM(NVFP4-GGUF)
- 35B-A3B と 1B の両サイズで配布
