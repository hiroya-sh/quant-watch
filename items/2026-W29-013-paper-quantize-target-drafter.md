---
id: "2026-W29-013"
type: paper
title: "Quantize the Target, Quantize the Drafter: Efficient Inference with Qwen3.5-4B"
url: "https://arxiv.org/abs/2607.04244"
discovered: "2026-07-13"
published: "2026-07-05"
authors: [Jaeyeon Kim, Jewon Lee, Bo-Kyeong Kim]
venue: "arxiv (cs.LG)"
models: [Qwen/Qwen3.5]
architectures: [transformer, dense]
methods: []
tech: [qat, speculative-decoding, low-bit-4]
priority: normal
sources: [arxiv]
status: new
verified: "2026-07-13 arXiv API で ID/タイトル/著者/abstract 取得・実在確認"
related: []
---

## 日本語要約
Efficient Qwen Competition(A10G 上の Qwen3.5-4B 低レイテンシ serving)への参加報告。**量子化ターゲット + speculative decoding の組合せ**で、ターゲットには量子化グリッドを維持したまま quantization-aware distillation を適用して精度回復。ドラフタは block-diffusion 型を2段階(高精度ターゲットから学習→低精度ターゲットへ適応)で訓練。

## 注目ポイント
- 「量子化済みターゲットに合わせてドラフタも適応させる」という実務的レシピ
- コンペ報告のため一般化可能性は要検証

## 注目度コメント
量子化×投機的デコードの組合せ最適化事例。優先度 normal。
