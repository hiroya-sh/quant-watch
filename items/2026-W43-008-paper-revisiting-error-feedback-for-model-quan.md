---
id: "2026-W43-008"
type: paper
title: "Revisiting Error Feedback for Model Quantization"
url: "https://arxiv.org/abs/2610.18139"
discovered: "2026-10-19"
published: "2026-10-13"
authors: ["Wai-Yiu Keung", "Chi Cui", "Wing-Kin Ma", "Jesús Cid-Sueiro", "Hei Victor Cheng"]
venue: "arXiv:2610.18139v1"
models: []
architectures: []
methods: [GPTQ]
tech: [ptq, qat, rotation, weight-only]
priority: high
sources: [arxiv]
status: new
related: []
---

## 日本語要約
GPTQ 系の誤差フィードバック(逐次量子化で各層の残差を次層に流し込む)を 2026 時点でもう一度理論・実験で見直す。回転(Hadamard)系と組み合わせたときの誤差蓄積挙動を定式化。

## 手法 / 評価のポイント
- 対象: 既存 GPTQ 系の誤差フィードバック
- 新規性: 回転系(Hadamard)との組み合わせ時の誤差蓄積解析
- 位置づけ: 基礎論

## 注目度コメント
Revisiting Error Feedback for Model Quantization — rotation + GPTQ foundational
