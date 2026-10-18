---
id: "2026-W43-030"
type: paper
title: "LoopQuant: Accurate and Efficient Post-Training Quantization for Looped Transformers"
url: "https://arxiv.org/abs/2610.16368"
discovered: "2026-10-19"
published: "2026-10-12"
authors: ["Zhixiong Zhao", "Zukang Xu", "Xing Hu", "Lifeng Liu", "Guangyu Sun"]
venue: "arXiv:2610.16368v1"
models: []
architectures: [transformer]
methods: []
tech: [ptq, calibration]
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約
Looped Transformer(同一層を繰り返し適用する系統)に特化した PTQ。繰り返し適用による誤差蓄積を校正データで補正。LoopQuant。

## 手法 / 評価のポイント
- 対象: Looped Transformer
- 手法: 繰返しによる誤差蓄積を校正で補正
- 位置づけ: ニッチだが looped モデルを量子化する際の第一歩

## 注目度コメント
LoopQuant: PTQ for Looped Transformers
