---
id: "2026-W33-014"
type: paper
title: "MixFrag: Fragility-Guided Mixed-Precision Post-Training Quantization for Vision Transformers"
url: "https://arxiv.org/abs/2607.28589"
discovered: "2026-08-10"
published: "2026-07-30"
authors: [Md. Mehrab Hossain Opi, Robiul Islam Ryad, Md. Umar Faruk]
venue: "arXiv"
models: []
architectures: [transformer]
methods: [AutoRound]
tech: [mixed-precision, ptq, per-channel, calibration]
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約
ViT向けPTQは通常コンポーネント横断で一様bit幅を使い、量子化感度の異質性を無視して精度配分が非効率。MixFragはコンポーネントごとの脆弱性を指標にmixed-precisionを割り当てる。

## 手法
小校正セットでFP出力と孤立量子化出力のKLダイバージェンスからコンポーネント脆弱性を推定し、bit割当を最適化問題として定式化。

## 評価
- 対象モデル: Vision Transformer
- ビット幅: mixed-precision (PTQ)
- 精度劣化: 脆弱性誘導で精度配分を効率化
- スループット/メモリ: エッジ配備向けの圧縮

## 既存手法との差分
一様bit幅ViT PTQに対し、KL脆弱性でbit割当を最適化。

## 注目度コメント
ViT量子化。LLM主軸ではないが感度誘導mixed-precisionの手法は転用余地。
