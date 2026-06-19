---
id: "2026-W25-020"
type: hf_model
title: "mlx-community OptiQ-4bit batch release (Qwen3.5/3.6, Gemma 4, Nemotron)"
url: "https://huggingface.co/mlx-community/Qwen3.6-35B-A3B-OptiQ-4bit"
discovered: "2026-06-15"
published: "2026-06-14"
org: "mlx-community"
base_model: "multiple"
models: [Qwen/Qwen3.5, Qwen/Qwen3.6, google/gemma-4, nvidia/Nemotron]
architectures: [transformer, moe]
methods: []
tech: [weight-only, low-bit-4, calibration, ptq]
priority: normal
sources: [hf_models]
status: new
related: []
---

## 日本語要約
mlx-communityによるOptiQ-4bitと銘打った4-bit量子化モデルの一括リリース（20モデル以上、2026-06-14）。対象はQwen3.5（全サイズ）、Qwen3.6（35B/27B）、Gemma 4（全サイズ+QAT版）、Nemotron 3 Nano（4B/30B A3B）、DiffusionGemma、その他小型モデル。OptiQはApple Silicon MLX向けの新しい量子化手法（詳細は公式リポジトリ参照）でありこれまでのlm_quantize 4-bitとは異なる実装。

## モデル詳細
- 量子化手法: OptiQ-4bit（MLXネイティブ最適化量子化手法、詳細未確認）
- 対象モデル: Qwen3.5/3.6全サイズ、Gemma 4全サイズ（QAT版含む）、Nemotron 3 Nano、DiffusionGemma等
- プラットフォーム: Apple Silicon（MLXフレームワーク）
- 特徴: 単一組織による20モデル以上の一括量子化

## 注目度コメント
「OptiQ」という新手法名でApple Silicon向け量子化の体系化を試みる動き。gemma-4とNemotronがfocus。taxonomy.yml への `OptiQ` method追加候補。mlx-communityの量子化ツールチェーンが標準化に向かう可能性あり。
