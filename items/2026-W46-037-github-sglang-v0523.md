---
id: "2026-W46-037"
type: github
subtype: library
title: "sgl-project/sglang: v0.5.23"
url: "https://github.com/sgl-project/sglang/releases/tag/v0.5.23"
discovered: "2026-11-09"
published: "2026-11-02"
repo: "sgl-project/sglang"
release_tag: "v0.5.23"
models: ["deepseek-ai/DeepSeek-V4", "zai-org/GLM-5.2", "google/gemma-4", "Qwen/Qwen3"]
architectures: ["moe", "transformer"]
methods: ["NVFP4"]
tech: ["low-bit-fp8", "low-bit-fp4", "moe-quant", "kv-cache-quant", "paged-attention", "weight-only"]
priority: high
sources: [github]
status: new
related: []
---

## 日本語要約

SGLang v0.5.23 は **1007 PR / 257 contributors** の massive release。SGLang low-latency mode の **NVIDIA megakernel (sgl-nvidia-mega)** と **AMD monokernel (sgl-amd-mono)** が DeepSeek-V4.1-Flash decode を GB300 で +44%、MI350X で +75% 高速化。**Paged Experts (opt-in)** で GPU メモリ超過の MoE を CPU offload 比 30x 高速に実行、**Google TPU7x 対応 (SGLang-TorchTPU)**、**quantized MoE (FP8 + NVFP4) に LoRA を乗せる opt-in LoRA engine (#45892)**、Gemma 4 E2B の frozen-KV draft キャプチャで concurrency 1 H200 中央 TPOT -33% (#45771)。

## 量子化関連の変更点

- **Quantized MoE + LoRA engine (FP8 / NVFP4) — opt-in (#45892)**: focus の NVFP4 moe-quant に LoRA が公式に乗る。
- **Gemma 4 single-step frozen-KV drafts (Gemma 4 E2B median TPOT -33% @ concurrency 1 H200, #45771)**: gemma-4 focus に接続する初の serve 側高速化。
- **DeepSeek-V4.1 on GB300 で prefill throughput +50% / 32K-64K 先頭トークン遅延 -28% (#44403, #45059, #45107)**。
- **DeepSeek-V4.1-Flash, GLM-5.3-Flash, gpt-oss の 8K prompt first-token を 30-58% 高速化 (#43363)**。
- **Paged Experts (opt-in)**: MoE を GPU メモリ超過で serving、CPU offload の 30x (#42557, #45787)。
- Megakernel / monokernel: GB300 で +44%, MI350X で +75% の fused persistent kernel decode。
- Apple Silicon の PyTorch backend 対応 (TPU7x と並列選択可能)。

## 影響範囲

- 多数の新 docker image: CUDA 13, ROCm 10 (MI35x / MI30x), Intel GPU XPU, Intel CPU Xeon, TPU7x。
- Speculative Decoding, Attention, MoE, KV Cache, LoRA の各モジュールに広範な改修。950+ PR で監視対象の方法の多くに差分あり。
- `uv pip install --prerelease=allow sglang==0.5.23` で導入。

## 注目度コメント

**moe-quant + NVFP4 focus** — focus の 2 軸を serve 層で重ねる "quantized MoE + LoRA" は W45 の llm-compressor 0.15.0 を serving 側で受ける形。**gemma-4 focus 側の最初の serve 改善 (frozen-KV draft) が登場**、v0.5.22 Apple Silicon と同じく PyTorch backend 線での広がりが見える。TurboQuant / PolarQuant / QJL は本文言及ゼロ。
