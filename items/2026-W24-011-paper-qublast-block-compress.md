---
id: "2026-W24-011"
type: paper
title: "QuBLAST: A Framework for Quantizing LLMs with Block-Level Compression and Activation Scaling"
url: "https://arxiv.org/abs/2606.04620"
discovered: "2026-06-08"
published: "2026-06-03"
authors: [Pasindu Wickramasinghe, Achyuta Muthuvelan, Rachmad Vidya Wicaksana Putra, Minghao Shao, Muhammad Shafique]
venue: "arxiv"
models: [Qwen/Qwen3, meta-llama/Llama-3.1, mistralai/Mistral]
architectures: [transformer, hybrid]
methods: []
tech: [block-wise, mixed-precision, ptq, activation-quant, outlier-handling, calibration]
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約
ネットワークブロック単位での混合精度量子化とActivation Scalingを組み合わせたPTQフレームワーク。感度分析（クロスエントロピー損失）で各ブロックが低精度に耐えられるかを評価し、混合精度を適用。Activation Scaling Mapsで活性化外れ値を軽量に制御。Qwen3-8B/Llama3-8B/Mistral-8B/Falcon H1R-7Bで40-45.2%のモデルサイズ削減（パープレキシティ劣化5%以内）を達成。SSM系アーキテクチャにも対応。

## 手法
- ブロック別感度分析（クロスエントロピー損失を代理指標として使用）
- 各ブロックに対して最低許容精度を割当てる混合精度PTQ
- Activation Scaling Maps: 外れ値範囲を制御するスケーリング係数を学習
- SSM系（Falcon H1R）を含む多様なアーキテクチャへの適用検証

## 評価
- 対象モデル: Qwen3-8B、Llama3-8B、Mistral v0.1-8B、Falcon H1R-7B
- 削減率: 40%-45.2%モデルサイズ削減
- 精度劣化: WikiText-2/103でパープレキシティ5%以内

## 既存手法との差分
ブロック単位の感度分析は既存（GPTQ系等）にも存在するが、SSM系アーキテクチャへの対応と軽量Activation Scalingの組み合わせは新規。

## 注目度コメント
SSM/hybrid系アーキテクチャへの適用検証が有用。taxonomy的にも`hybrid`アーキへの量子化事例として記録価値あり。
