---
id: "2026-W27-007"
type: hf-model
title: "nvidia/Qwen3.6-27B-NVFP4"
url: "https://huggingface.co/nvidia/Qwen3.6-27B-NVFP4"
discovered: "2026-07-07"
published: "2026-06-26"
repo: "nvidia/Qwen3.6-27B-NVFP4"
models: [Qwen/Qwen3.6]
architectures: [transformer]
methods: [NVFP4]
tech: [low-bit-fp4, weight-only, activation-quant, vllm-ready]
priority: high
sources: [hf-model]
status: new
verified: "2026-07-07 HFページ実在確認・model card読了"
related: []
---

## 日本語要約
NVIDIA 公式による Qwen3.6-27B の NVFP4 量子化モデル（nvidia-modelopt v0.45.0 で作成）。transformer ブロック内 linear の重み・活性を NVFP4 化し、bits/param を 16→4（ディスク/GPUメモリ 約2.5x 縮小）。アーキは hybrid attention（Gated DeltaNet + Gated Attention）、27B、最大 262K 文脈。**vLLM(Hopper/Blackwell) 対応**。Apache-2.0。

## 量子化構成（model card より）
- NVFP4 PTQ（nvidia-modelopt）
- model card の eval 表で NVFP4 vs FP8 が MMLU Pro / GPQA Diamond / HLE / τ²-Bench / MMMU Pro / SciCode / AIME 2025 / IFBench 等でほぼ同等（例: MMLU Pro 86.3 vs 86.1）

## 注目度コメント
focus の NVFP4 直撃、かつ **vLLM-ready**（監視方針で高評価対象＝Claude だけで評価実験を回せる）。火曜定例の議題候補（実装エコシステム側）。
