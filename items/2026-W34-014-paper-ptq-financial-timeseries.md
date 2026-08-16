---
id: "2026-W34-014"
type: paper
title: "Calibration Bets on the Past: Post-Training Quantization for Financial Time-Series Forecasting"
url: "https://arxiv.org/abs/2608.12259"
discovered: "2026-08-17"
published: "2026-08-13"
authors: [Junyi Ye, Ivy Gateri Wanjiku]
venue: "arXiv"
models: []
architectures: []
methods: []
tech: [ptq, activation-quant, calibration, low-bit-4]
priority: watching
sources: [arxiv]
status: new
related: []
---
## 日本語要約
金融予測モデルの低精度推論展開に向け、PTQ の activation calibration(過去データで固定レンジ推定)の重要性を S&P500 の横断ボラティリティ予測で体系検証(7アーキ×8年 walk-forward×560モデル)。calibration は 8bit ではほぼ無影響だが、**4bit では予測性能の主要決定因子**。abs-max 校正の静的 W4A4 では full-precision の平均 IC の11〜62%を失う。

## 手法
walk-forward で PTQ 校正の効果を大規模に測定。

## 評価
- 対象: 金融時系列7アーキ/560モデル
- ビット幅: 8bit / 4bit W4A4
- 知見: 4bit で校正が支配的、静的校正は大幅劣化

## 既存手法との差分
LLM でなく金融時系列における PTQ 校正の系統評価。

## 注目度コメント
LLM 外だが PTQ 校正の一般教訓(4bit で校正が効く)は参考。watching。
