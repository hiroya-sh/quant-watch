---
id: "2026-W33-016"
type: paper
title: "NANQ: Noise-Floor-Aware Mixed-Precision Non-Uniform Quantization for Analog Compute-in-Memory"
url: "https://arxiv.org/abs/2608.02700"
discovered: "2026-08-10"
published: "2026-08-03"
authors: [Yizhe Chen, Wenshuai Yao, Saiya Wang]
venue: "arXiv"
models: []
architectures: []
methods: []
tech: [mixed-precision, low-bit-4, calibration]
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約
アナログCIMは省エネ推論を可能にするがデバイスばらつきと読み出しノイズが低bit量子化モデルを大きく劣化させる。既存CIM量子化は理想量子化誤差のみ最小化しHWノイズフロアを無視するため精度配分が非効率。

## 手法
NANQはeFlash CIMアレイの実測応答から振幅依存の重みノイズをモデル化し、ノイズプロファイルを適応的量子化密度に変換。低ノイズ領域に細かい分解能を割り当てる非一様mixed-precision。

## 評価
- 対象モデル: アナログCIM上のNN
- ビット幅: mixed-precision 非一様(4bit級)
- 精度劣化: ノイズフロア考慮で精度配分改善
- スループット/メモリ: アナログCIMの省エネ推論

## 既存手法との差分
理想量子化誤差のみ最小化する既存CIM量子化に対し、実測ノイズフロアを密度設計に反映。

## 注目度コメント
アナログCIM特化のニッチだが、ノイズ対応非一様量子化の考え方は参考になる。
