---
id: "2026-W43-014"
type: paper
title: "Lost in the bf16 Cast: Exporting Ternary Language Models Can Revert Most Low-Learning-Rate Code Changes"
url: "https://arxiv.org/abs/2610.07853"
discovered: "2026-10-19"
published: "2026-10-06"
authors: ["Avichal Sahai", "Nishant Raj", "Animesh Srivastava"]
venue: "arXiv:2610.07853v2"
models: []
architectures: [transformer]
methods: []
tech: [low-bit-1bit, qat, weight-only]
priority: high
sources: [arxiv]
status: updated
related: []
---

## 日本語要約
BitNet b1.58 / Falcon-E / BitCPM の **公式エクスポートパイプライン** が bf16 を経由して三値コードに変換する過程で、学習時の低学習率による重み更新の多くが bf16 丸めで消えてしまうことを発見。公開チェックポイントで 0.83-1.77% の三値コード不一致、学習エンドポイントでは学習率設定次第で修正の大半が revert される。

## 手法 / 評価のポイント
- 対象: BitNet b1.58 / Falcon-E / BitCPM
- 発見1: 公開 ckpt で fp32 量子化とデプロイコードが 0.83-1.77% 不一致
- 発見2: 学習率を bf16 ULP に合わせて設定した学習エンドポイントで、修正の大半が bf16 丸めで revert

## 注目度コメント
Lost in the bf16 Cast: BitNet b1.58 / Falcon-E / BitCPM export audit — v2 update
