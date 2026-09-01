---
id: "2026-W33-013"
type: paper
title: "LightRot: A Light-Weighted Rotation Scheme and Architecture for Accurate Low-Bit LLM Inference"
url: "https://arxiv.org/abs/2607.27704"
discovered: "2026-08-10"
published: "2026-07-30"
authors: [Sangjin Kim, Yuseon Choi, Jungjun Oh]
venue: "arXiv"
models: []
architectures: [transformer]
methods: [QuaRot]
tech: [rotation, low-bit-4, outlier-handling]
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約
低bit LLM推論の省エネ・高精度化のため、軽量回転スキームと専用HWアクセラレータLightRotを提案。回転演算のエネルギーオーバーヘッドが低bit量子化の課題。

## 手法
Grouped Local Rotation(GLR)とOutlier Direction Aligning(ODA)を階層的Fast Hadamard Transform(FHT)回転ユニットと統合。28nm CMOSで実装しピーク性能を報告。

## 評価
- 対象モデル: LLM
- ビット幅: low-bit(4bit級)
- 精度劣化: 外れ値方向整列で精度確保
- スループット/メモリ: 28nm実装で回転の省エネ化

## 既存手法との差分
汎用回転(QuaRot等)の演算コストを階層FHTで削減。GyRotと同著者グループの姉妹研究。

## 注目度コメント
回転の省エネHW化。GyRotと合わせ回転量子化のHW実装が一つの研究潮流に。
