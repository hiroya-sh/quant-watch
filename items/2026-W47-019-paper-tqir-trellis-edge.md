---
id: "2026-W47-019"
type: paper
title: "TQIR: Trellis Quantization with Integer Reconstruction for Bandwidth-Efficient Edge LLM Acceleration"
url: "https://arxiv.org/abs/2611.15231"
discovered: "2026-11-16"
published: "2026-11-11"
authors: [arxiv:2611.15231]
venue: "arXiv:2611.15231"
models: []
architectures: []
methods: []
tech: [weight-only, rotation, low-bit-2, low-bit-1bit, mixed-precision]
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約
エッジ LLM の推論は外部メモリ帯域が律速。既存の **ultra-low-bit trellis quantization** は復号時に float を再構成し、Hadamard 変換と decoder のランタイム負荷が未解決。TQIR は **storage precision $S$ / decoded weight $W$ / activation $A$** を分離して、$S$ と $W, A$ を独立に選べる algorithm-hardware codesign を提案。整数の再構成経路で Hadamard を融合。

## 手法
- trellis 量子化で $S$ = 1-2 bit
- decoded weight と activation は integer で保持(float 再構成を省略)
- Hadamard rotation を decoder に融合、別 kernel を不要に
- edge ASIC / mobile NPU 向け

## 評価
- Llama 系の weight-only 2-bit 以下
- 比較: QTIP / QuaRot / Marlin Trellis
- 指標: 帯域、エネルギー、精度

## 既存手法との差分
Qtip-family が float 再構成を前提、本稿は **integer 再構成で kernel 簡素化**。エッジ ASIC/NPU で Hadamard 専用ハードがない制約下で勝ちやすい。

## 注目度コメント
Edge 量子化は本週 LazyWeights と User-Schedulable Approximations と並ぶ 3 本軸。llama.cpp の Hexagon NVFP4/IQ2_XXS 対応と重ねると、2-bit 以下の実務経路が揃う。
