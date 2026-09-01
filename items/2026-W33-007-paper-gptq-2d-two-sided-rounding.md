---
id: "2026-W33-007"
type: paper
title: "GPTQ-2D: Cubic-Time Two-Sided Adaptive Rounding"
url: "https://arxiv.org/abs/2607.27042"
discovered: "2026-08-10"
published: "2026-07-29"
authors: [Anonymous]
venue: "arXiv"
models: []
architectures: [transformer]
methods: [GPTQ]
tech: [weight-only, ptq, calibration]
priority: high
sources: [arxiv]
status: new
related: []
---

## 日本語要約
GPTQ(=Babaiの最近平面法)は三角フィードバック行列で誤差を伝播しながら実行列を整数に丸める。本研究は残差の左右から非特異基底行列が作用する**両側(two-sided)**版を扱う。ベクトル化するとGram行列がKronecker積になり1次元アルゴリズムがそのまま使えるが行列次元に対し4次時間かかる。

## 手法
GPTQ-2Dは同一の丸め結果を3次時間で得る。反対角(anti-diagonal)ごとに丸め、同一反対角上の要素を並列処理する再帰的分割統治で高速化。

## 評価
- 対象モデル: 重み量子化(理論/アルゴリズム)
- ビット幅: 任意bit(整数丸め)
- 精度劣化: 丸め結果は両側GPTQと同一
- スループット/メモリ: 4次→3次時間に高速化

## 既存手法との差分
一側GPTQ(入力活性由来の片側情報)に対し、出力座標間相関を捉える両側Kronecker因子Hessianを実用速度で解く。BaKron(2608.06291)と同系統。

## 注目度コメント
HF Papers掲載(21 upvote)。BoA/YAQA/BaKronと連なる両側適応丸めの高速化。GPTQ系の理論的最前線。
