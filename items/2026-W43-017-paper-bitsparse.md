---
id: "2026-W43-017"
type: paper
title: "BitSparse: Compact Activation Storage for ReLU Feed-Forward Networks"
url: "https://arxiv.org/abs/2610.22256"
discovered: "2026-10-19"
published: "2026-10-16"
authors: ["Max Zhu", "Bohang Sun", "Pietro Lio", "Jialin Yu"]
venue: "arXiv:2610.22256v1"
models: [nvidia/Nemotron]
architectures: [hybrid]
methods: []
tech: [per-token, lossless-compression, activation-quant]
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約
ReLU/ReLU^2 の sparse 活性を**可逆**圧縮する GPU 常駐フォーマット BitSparse。Triton カーネルで autograd 関数に融合され、BF16 / FP8 活性に対応。Modded-NanoGPT と Nemotron-H で per-token VRAM を 31% / 30% 削減、オーバヘッド 1% 以下。活性チェックポイント(量子化による損失なし)の対抗馬。

## 手法 / 評価のポイント
- 対象: sparse ReLU 活性(ReLU^2 含む)
- 性質: 可逆(lossless)、BF16 / FP8 対応
- 結果: Modded-NanoGPT / Nemotron-H で per-token VRAM 31% / 30% 減、オーバヘッド 1% 未満

## 注目度コメント
BitSparse: GPU-resident lossless activation cache compression (ReLU/ReLU^2)
