---
id: "2026-W33-004"
type: paper
title: "Heterogeneity-Aware Microscaling for Efficient Low-Bit LLM Inference (AdaMX)"
url: "https://arxiv.org/abs/2608.03867"
discovered: "2026-08-10"
published: "2026-08-04"
authors: [Junyi Luo, Xinting Jiang, Tai-Hao Wen]
venue: "arXiv"
models: []
architectures: [transformer]
methods: [MXFP4, MXFP6]
tech: [low-bit-fp4, microscaling-formats, mixed-precision, weight-only, activation-quant]
priority: high
sources: [arxiv]
status: new
related: []
---

## 日本語要約
MXが低bit LLM推論の標準になりつつあるがMXFP4は精度損失が大きい。既存MX形式は要素フォーマットか精度回復手法のいずれかをブロック横断で固定するため量子化の異質性を捉えきれない。異質性は(1)ブロック横断で好適フォーマット/回復手法が異なる、(2)オペランド横断で重みと活性で必要な符号化が異なる、の2水準で現れる。

## 手法
AdaMX(Adaptive Microscaling)はブロックごとに精度回復手法を、オペランドごとに表現を選択する異質性対応フォーマット兼アクセラレータ。追加コストほぼゼロで実現。

## 評価
- 対象モデル: LLM
- ビット幅: MXFP4/MXFP6 (weight+activation)
- 精度劣化: MXFP4の精度損失を異質性適応で回復
- スループット/メモリ: 追加コストほぼ増なしのアクセラレータ設計

## 既存手法との差分
要素形式か回復手法を固定する既存MX形式に対し、ブロック/オペランド双方で適応的に選択。

## 注目度コメント
MXFP4の精度損失を埋める方向性で、監視方針(vLLM等のMX経路)と親和。ただしカスタムHW前提の部分は要確認。
