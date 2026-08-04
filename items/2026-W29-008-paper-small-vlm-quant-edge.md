---
id: "2026-W29-008"
type: paper
title: "Rethinking Small VLM Quantization: From Component-Wise Analysis to Hardware-Aware Edge Deployment"
url: "https://arxiv.org/abs/2607.08029"
discovered: "2026-07-13"
published: "2026-07-09"
authors: [Hyeju Shin, Chorwon Kim, Ryangsoo Kim, Hark Yoo, Jaein Kim]
venue: "arxiv (cs.LG)"
models: []
architectures: [transformer, moe, dense]
methods: []
tech: [ptq, low-bit-4, calibration]
priority: normal
sources: [arxiv]
status: new
verified: "2026-07-13 arXiv API で ID/タイトル/著者/abstract 取得・実在確認"
related: []
---

## 日本語要約
3B 未満の小型 VLM を Jetson Orin NX / AGX 上で、vision encoder・projector・LLM backbone に分離して6つの量子化構成を体系評価。主要な知見: **量子化感度はスケールではなく構造パラダイム(MoE vs dense)が支配**し、MoE backbone は INT4 ノイズを緩和するが dense は劣化しやすい(論文主張)。

## 注目ポイント
- 「MoE は INT4 に強い」という主張は moe-quant の設計判断に直接効く
- エッジ実機(Jetson)での測定ベース

## 注目度コメント
コンポーネント別感度分析はマルチモーダル量子化の実務に有用。優先度 normal。
