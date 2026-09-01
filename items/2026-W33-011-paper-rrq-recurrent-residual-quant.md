---
id: "2026-W33-011"
type: paper
title: "Recurrent Residual Quantization: A Progressive Multi-Precision Representation for LLMs"
url: "https://arxiv.org/abs/2608.04048"
discovered: "2026-08-10"
published: "2026-08-04"
authors: [Yu Luo, Bo Dong, Wenhua Cheng]
venue: "arXiv"
models: []
architectures: [transformer]
methods: [AutoRound]
tech: [weight-only, ptq, mixed-precision, low-bit-2]
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約
多様なデプロイ制約下でのLLM配信には精度/メモリ/スループットの柔軟なトレードオフが必要だが、従来量子化は目標bit幅ごとに別チェックポイントを要する。RRQは低bit基底 + 量子化残差補正の列で重みを表し、単一チェックポイントから複数の実効精度を出せる。

## 手法
PTQ/RTNで得た2bitモデルを起点に、軽量な2bit残差を漸進的に追加して精度を上げる。残差の数で実効ビットを可変にする。

## 評価
- 対象モデル: LLM
- ビット幅: 2-bit基底 + 2-bit残差(可変実効bit)
- 精度劣化: 残差数で精度/サイズを調整
- スループット/メモリ: 単一チェックポイントで多bit対応

## 既存手法との差分
bit幅ごとに別チェックポイントを要する従来PTQに対し、1つの表現で多精度を実現。

## 注目度コメント
多精度サービングの運用簡素化。監視方針(評価の手数削減)と親和。
