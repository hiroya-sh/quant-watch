---
id: "2026-W33-010"
type: paper
title: "SSTQ: Privacy-Preserving Vector Quantization via Subsampled Stochastic TurboQuant"
url: "https://arxiv.org/abs/2608.05127"
discovered: "2026-08-10"
published: "2026-08-05"
authors: [Adel Javanmard, David P. Woodruff, Vahab Mirrokni]
venue: "arXiv"
models: []
architectures: []
methods: [TurboQuant]
tech: [calibration-free]
priority: high
sources: [arxiv]
status: new
related: []
---

## 日本語要約
分散最適化でローカル差分プライバシーを保ちつつ通信コストを抑えるベクトル量子化SSTQ(Subsampled Stochastic TurboQuant)。vqSGD等の既存法は高次元幾何構造で次元依存の分散悪化を招く。

## 手法
過完備等ノルムタイトフレーム + 座標サブサンプリング + プライバシー対応1次元量子化を組合せ。Flat Randomized ResponseとMetric-Aware Laplaceの2変種を持ち、後者は高codebook bit幅域に適す。最適MSEを達成。

## 評価
- 対象モデル: 分散最適化(勾配/ベクトル圧縮)
- ビット幅: codebook bit幅可変
- 精度劣化: 最適MSEを理論保証
- スループット/メモリ: 通信コスト削減 + LDP

## 既存手法との差分
次元依存分散のvqSGDに対し、TurboQuantベースで次元依存を改善。

## 注目度コメント
focus手法TurboQuantの拡張(+1段階bump)。ただしLLM推論ではなく分散最適化/DP文脈である点に注意。
