---
id: "2026-W46-018"
type: paper
title: "Scalar Smoothness Is One Point on a Besov Spectrum"
url: "https://arxiv.org/abs/2611.02037"
discovered: "2026-11-09"
published: "2026-11-01"
authors: ["Bum Jun Kim", "Anastasis Kratsios"]
venue: "arXiv:2611.02037"
models: []
architectures: []
methods: ["GPTQ", "AWQ"]
tech: ["mixed-precision", "ptq"]
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約

Lipschitz 定数や Hessian 曲率などの「単一スカラー smoothness」は大きさ・方向・位置に依存する摂動への反応を捉えないと指摘し、finite-difference roughness spectrum を提案。classical Besov 理論と接続する。post-training quantization では各ブロックの量子化誤差の大きさ・方向に合わせた task-loss 増分で "高精度が必要なブロック" を特定、同 budget で Hessian ベース HAWQ-v2 より低 PPL を達成。

## 手法

Besov 理論に基づく roughness spectrum を計算し、PTQ 時に「ブロックの量子化誤差と同形状の摂動」で task loss 増分を測定。測定値を mixed-precision 割当に使用。

## 評価

- モデル: (未明示)
- 手法: HAWQ-v2 (Hessian ベース)
- 比較: 同 budget で TileQuant 系と並ぶ PPL 改善

## 注目度コメント

PTQ mixed-precision の「感度」の測り方の理論的刷新。HAWQ-v2 は古典 baseline で、同 budget で superior を示したのが重要。
