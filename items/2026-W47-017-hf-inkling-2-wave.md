---
id: "2026-W47-017"
type: hf-model
title: "Inkling-2-Small quantization wave (MLX OptiQ + GGUF)"
url: "https://huggingface.co/mlx-community/Inkling-2-Small-oQ4e"
discovered: "2026-11-16"
published: "2026-11-13"
base_model: "Inkling-2-Small"
models: []
architectures: [moe]
methods: [GGUF]
tech: [weight-only, llamacpp-ready, low-bit-4]
priority: normal
sources: [hf-models]
status: new
related: [2026-W47-009-github-llamacpp-v100]
---

## 日本語要約
新 vision+text MoE モデル **Inkling-2** が llama.cpp v1.0.0 の #32217 (b12406) で正式対応。per-layer NVFP4 + MXFP8 の **packed experts** を GGUF 変換時に dequantize する convert パスが同時に入った。本週 15 本の配布が立ち上がり、合計 ~3497 DL。MLX OptiQ-4bit(mlx-community/Inkling-2-Small-oQ4e, 253 DL / 5 ❤)が代表。

## 量子化仕様
- 15 モデル、合計 3497 DL
- 代表例:
  - **mlx-community/Inkling-2-Small-oQ4e**(Apple Silicon MLX, OptiQ 4bit)
  - **Baekpica/Inkling-2-Small-VQ-GGUF**(1859 DL, VQ 系 2-bit GGUF, GPTQ 風変換)
  - Hygaard, 0xSero, peasantsmith 系 GGUF
- **packed NVFP4+MXFP8 → GGUF** 変換: llama.cpp の convert が per-layer scale shapes を保持
- Vision 対応含む mmproj も同時配布

## 精度報告
- Inkling 2 本体の bench は model card 参照。
- llama.cpp 変換時 CPU prefill/decode logits が**独立 pin された vLLM と bit-for-bit 一致**、**3.1e-6 abs error**(#32217 note)。

## ダウンロード/利用状況
- MLX / GGUF 二系統が揃い、エッジ機から WS まで同週にカバー。
- Vision 対応 (mmproj) 配布が入っており、llama.cpp 側の VLM パスが使える。

## 注目度コメント
NVFP4 + MXFP8 を混ぜた **packed expert format** が GGUF に変換される最初のケース。llama.cpp 側の convert が per-tensor NVFP4 scale, declared MXFP8 [32,32] grid を正しく decode する実装が入り、**FP8/FP4 ハイブリッド配布**を llama.cpp で受け取れる例として記念碑的。
