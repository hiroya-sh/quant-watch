---
id: "2026-W43-020"
type: paper
title: "ShiftQAT: Quantization-Aware Training for the Numerical Contract of a Fixed-Function Edge CNN Accelerator"
url: "https://arxiv.org/abs/2610.21695"
discovered: "2026-10-19"
published: "2026-10-15"
authors: ["Oguzhan Buyuksolak", "Osman Erman Okman", "Mehmet Gorkem Ulkar"]
venue: "arXiv:2610.21695v1"
models: []
architectures: []
methods: []
tech: [qat]
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約
エッジ CNN(固定機能アクセラレータ)の数値契約(numerical contract)を保つ QAT。LLM ではないが、QAT の精度を下げないためのスケール・ゼロ点取り扱いの参考に。

## 手法 / 評価のポイント
- 対象: 固定機能エッジ CNN アクセラレータ
- 手法: QAT で数値契約(output clipping / rounding)を厳守
- 本線量子化からは外れるが QAT 設計の参考

## 注目度コメント
ShiftQAT: QAT for fixed-function edge CNN
