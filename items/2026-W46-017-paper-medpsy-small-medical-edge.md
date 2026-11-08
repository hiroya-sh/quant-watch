---
id: "2026-W46-017"
type: paper
title: "MedPsy: State-of-the-Art Small Medical Language Models for Efficient Edge Deployment"
url: "https://arxiv.org/abs/2611.02011"
discovered: "2026-11-09"
published: "2026-11-01"
authors: ["Davide Vitabile", "Alexandro Buffa", "Akshay Nambiar", "Amril Nazir"]
venue: "arXiv:2611.02011"
models: []
architectures: ["transformer"]
methods: ["GGUF"]
tech: ["kv-cache-quant", "ptq"]
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約

1.7B/4B の医用 edge 向け small LM MedPsy。合成医療データ + 235B 教師 CoT, 4 段階 post-training (2 SFT + 2 RL, hard-sample mining), 複数 GGUF 変種の実機評価。MedPsy-4B は MedGemma-1.5-4B を +19.34pt, MedGemma-27B と同等 (6.75x 小さい)。HealthBench-Hard で MedGemma-27B を +15.33pt (4B), +11.66pt (1.7B)。Q4_K_M で BF16 スコアを -1pt 以内保持。

## 手法

合成医療データ + 教師 CoT で蒸留、SFT→RL の 4 段階 curriculum。公開モデルを q4_k_m, q5_k_m など複数 GGUF で配布し laptop/smartphone 実機ベンチ。

## 評価

- モデル: MedPsy-1.7B / 4B
- ベンチ: 医療 MCQ 7 本 + HealthBench-Hard
- 量子化精度: Q4_K_M で -1pt 以内
- サイズ: MedGemma-27B と同等スコア (4B)

## 注目度コメント

医療 edge の実用品質ベースライン。llamacpp-ready (GGUF で配布)。
