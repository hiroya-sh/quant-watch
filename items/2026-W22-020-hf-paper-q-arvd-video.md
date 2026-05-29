---
id: "2026-W22-020"
type: hf-paper
title: "Q-ARVD: Quantizing Autoregressive Video Diffusion Models"
url: "https://huggingface.co/papers/2605.21072"
arxiv_url: "https://arxiv.org/abs/2605.21072"
discovered: "2026-05-22"
published: "2026-05-22"
authors: []
hf_upvotes: 21
models: []
architectures: [transformer]
methods: []
tech: [ptq, outlier-handling, mixed-precision, activation-quant]
priority: normal
sources: [hf-papers]
status: new
related: []
---

## 日本語要約

自己回帰型動画拡散モデル（ARVD）への量子化適用の初研究。フレーム累積誤差によるフレームごとの量子化感度のアンバランス（C1）と、重みの異質な外れ値パターン（C2）の2つの課題を特定。C1対策として最終品質重み付けフレーム係数、C2対策として外れ値対応適応的デュアルスケール量子化を持つQ-ARVDを提案。

## 手法

- C1: フレーム重み付き誤差（生成最終フレームの品質に重み付け）
- C2: Outlier-aware適応デュアルスケール量子化（通常チャネルと外れ値チャネルで異なるスケール）
- ARVDの時系列特性（エラー累積）を考慮したPTQ設計

## 評価

- 対象モデル: 自己回帰型動画拡散モデル（LLaDA2.0等）
- ビット幅: 低ビット（詳細は論文）
- 精度劣化: 動画品質指標での評価
- スループット/メモリ: 削減効果あり

## 既存手法との差分

ARVDという新ドメインへの量子化初適用。既存の静止画/テキストLLM向け量子化手法がそのまま適用できない理由を明確化し、ARVD特有の解決策を提示。
