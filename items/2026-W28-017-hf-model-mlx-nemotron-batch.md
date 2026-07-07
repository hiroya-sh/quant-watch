---
id: "2026-W28-017"
type: hf-model
title: "mlx-community/NVIDIA-Nemotron-3-Nano-30B-A3B-4bit"
url: "https://huggingface.co/mlx-community/NVIDIA-Nemotron-3-Nano-30B-A3B-4bit"
discovered: "2026-07-07"
published: "2026-07-05"
base_model: "nvidia/NVIDIA-Nemotron-3-Nano-30B-A3B"
models: [nvidia/Nemotron]
architectures: [transformer, moe, hybrid, mamba2]
methods: [GGUF]
tech: [weight-only, moe-quant, low-bit-4, llamacpp-ready]
priority: watching
sources: [hf-models]
status: verified-minimal
verified: "2026-07-07 mlx-community/NVIDIA-Nemotron-3-Nano-30B-A3B-4bit の実在確認。旧URL('NVIDIA-'欠落)は404。ベンチ表・DL数・Ultra-550B併載は裏取り不可のため削除。"
related: [2026-W26-014]
---

## 日本語要約
mlx-community による Nemotron-3 Nano（hybrid Mamba2 + MoE）の MLX 4bit 量子化。**リポジトリ実在確認済み**。旧版の「Ultra-550B-A55B / Nano-9B 併載」「精度表」「ダウンロード数」は裏取りできず削除。正しい ID は `mlx-community/NVIDIA-Nemotron-3-Nano-30B-A3B-4bit`（'NVIDIA-' が必要）。

## 確認できた事実
- 上記 repo 実在、Apple Silicon (MLX) 向け 4bit、hybrid Mamba2+MoE
- focus 直撃なし（Nemotron は意図的に focus 外）

## 注目度コメント
量子化 × hybrid アーキの corner。watching。
