---
id: "2026-W43-009"
type: paper
title: "Mixed Precision Scaling Laws for Quantized Pretraining"
url: "https://arxiv.org/abs/2610.17637"
discovered: "2026-10-19"
published: "2026-10-13"
authors: ["Jinuk Kim", "Rajarshi Saha", "Muhammed Fatih Balin", "Youngsuk Park"]
venue: "arXiv:2610.17637v1"
models: []
architectures: [transformer]
methods: []
tech: [mixed-precision, qat, low-bit-4]
priority: high
sources: [arxiv]
status: new
related: []
---

## 日本語要約
4-bit 量子化事前学習向けの Scaling Law を、forward / backward の量子化効果を分離した形で再定式化。既存 4-bit 学習レシピを forward / backward 成分に分解して適合域を定めた上で、容量劣化と最適化効率劣化を独立に表現する公式。

## 手法 / 評価のポイント
- 対象: 4-bit 量子化事前学習
- 分解: forward / backward の量子化効果を独立にモデル化
- 検証: 既存の 4-bit レシピを forward/backward 成分に分解

## 注目度コメント
Mixed Precision Scaling Laws for Quantized Pretraining
