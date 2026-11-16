---
id: "2026-W47-005"
type: paper
title: "MACaQ: Fast, Model Agnostic Calibrated Quantization for Low-Precision Weights and Activations"
url: "https://arxiv.org/abs/2611.10649"
discovered: "2026-11-16"
published: "2026-11-07"
authors: [arxiv:2611.10649]
venue: "arXiv:2611.10649"
models: []
architectures: []
methods: [MXFP4]
tech: [low-bit-4, low-bit-fp4, per-channel, ptq, rotation, outlier-handling]
priority: high
sources: [arxiv, hf-papers]
status: new
related: []
---

## 日本語要約
MXFP4 W4A4 の PTQ を **全線形層を独立に処理**する形で実装(layer 間の basis 伝搬が不要)。per-channel scale + block Hadamard rotation を層内だけで適用、layer-wise に完結する。既存の rotation 系(QuaRot / SpinQuant)は層間の basis 整合が必要で実装・aarch64/consumer GPU 移植のボトルネックだった点を解消。HF Daily Papers で 30 upvote。

## 手法
- MXFP4 W4A4(E2M1 weight + E2M1 activation, group=32)
- 各 linear 層独立: per-channel scale → block Hadamard → MXFP4 変換
- 校正(calibrated)だが layer 間の basis 伝搬なし → 実装が単純
- rotation は block 内のみで層全体を回さない

## 評価
- 対象モデル: Llama / Qwen 系 W4A4
- ビット幅: MXFP4 (4-bit weight + 4-bit activation)
- 精度劣化: W4A4 PTQ の baseline (QuaRot / SpinQuant / SmoothQuant) 比較で同等 or 改善
- 実装容易性: Pytorch 1ファイル規模で完結(論文主張)

## 既存手法との差分
QuaRot / SpinQuant は **層間 R1/R2/R3/R4 の整合**で精度を取っていたが、実装/移植のコストが大きかった。MACaQ は **per-layer 完結**で簡潔性と移植性を優先し、同等精度を主張。

## 注目度コメント
MXFP4 focus。llm-compressor / AutoRound で W4A4 recipe を回すときの比較対象として即使える。**per-layer 独立 = 動的量子化・runtime 移植がしやすい**ため、engine 側実装の候補になる。
