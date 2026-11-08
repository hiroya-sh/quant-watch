---
id: "2026-W46-008"
type: paper
title: "What Does 4-Bit Microscaling Cost a Wearable Activity Recognizer?"
url: "https://arxiv.org/abs/2611.04185"
discovered: "2026-11-09"
published: "2026-11-03"
authors: ["Megan Healy", "Hossein Valavi"]
venue: "arXiv:2611.04185"
models: []
architectures: []
methods: ["NVFP4", "MXFP4"]
tech: ["low-bit-fp4", "microscaling-formats", "low-bit-4"]
priority: high
sources: [arxiv]
status: new
related: []
---

## 日本語要約

ウェアラブル活動認識 (159k parameter 1D CNN) に MXFP4 と NVFP4 を適用した実測。full precision 69.26% macro-F1、INT8 TFLite -0.16pt。4bit weight では MXFP4 -1.45pt, NVFP4 -0.72pt。4bit W + A では MXFP4 -5.14pt, NVFP4 -0.75pt (選手別 5 fold すべてで NVFP4 勝ち)。MXFP4 の損失は scale 選択（round down が原因）に集中。

## 手法

MXFP4 (OCP, 2023) と NVFP4 (NVIDIA, 2025) の両方で W4A4 シミュレーション。scale 選択の切り分け (block 32/16/4, round up/down) で誤差源を分解。

## 評価

- モデル: 1D CNN (159k params, wearable HAR)
- ビット幅: INT8 / 4bit W / 4bit W+A
- 精度: MXFP4 -5.14pt, NVFP4 -0.75pt (W4A4)
- 洞察: MXFP4 の損失は scale round-down に由来、round up で +3.18pt 回復

## 注目度コメント

microscaling の "LLM 以外" でのコスト比較。NVFP4 vs MXFP4 のスケール設計の差が小 CNN でも明確に出る実験基盤。
