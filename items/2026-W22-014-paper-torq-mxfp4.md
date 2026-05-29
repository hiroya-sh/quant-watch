---
id: "2026-W22-014"
type: paper
title: "TORQ: Two-Level Orthogonal Rotation for MXFP4 Quantization"
url: "https://arxiv.org/abs/2605.19561"
discovered: "2026-05-19"
published: "2026-05-19"
authors: [Zukang Xu, Xing Hu, Dawei Yang]
venue: "arxiv"
models: []
architectures: [transformer]
methods: [MXFP4]
tech: [low-bit-fp4, rotation, microscaling-formats, ptq, calibration-free]
priority: normal
sources: [arxiv]
status: new
related: ["2026-W22-015"]
---

## 日本語要約

MXFP4のActivation量子化における精度劣化（ブロック間分散の不均一性・ブロック内コードブック利用不足）を特定し、マクロ（ブロック間）・マイクロ（ブロック内）の2段階直交回転でActivation分布を整形するTORQを提案。Training-freeのPTQ手法。Qwen3-32BでMXFP4直接量子化の38.40%→73.63%に精度改善（平均精度）。

## 手法

- マクロレベル回転: ブロック間の分散不均一性を解消する大域的直交変換
- マイクロレベル回転: ブロック内でコードブック利用効率を改善する局所的直交変換
- Training-freeのPTQ（Calibration-free）

## 評価

- 対象モデル: Qwen3-32B（MXFP4直接量子化比較）
- ビット幅: MXFP4（FP4 microscaling）
- 精度劣化: 38.40%→73.63%（MXFP4直接量子化との比較、平均精度）
- スループット/メモリ: 未記載

## 既存手法との差分

既存の回転ベース手法（SpinQuant等）が単一レベルの回転を適用するのに対し、MXFPのブロック構造に特化した2レベル回転で精度改善を達成。
