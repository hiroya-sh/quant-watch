---
id: "2026-W47-007"
type: paper
title: "LazyWeights: Decode-on-Demand Edge LLMs"
url: "https://arxiv.org/abs/2611.17108"
discovered: "2026-11-16"
published: "2026-11-13"
authors: [arxiv:2611.17108]
venue: "arXiv:2611.17108"
models: []
architectures: []
methods: [AWQ, GPTQ, GGUF]
tech: [ptq, weight-only, low-bit-4]
priority: high
sources: [arxiv]
status: new
related: []
---

## 日本語要約
エッジ機 (Jetson Nano 4GB / Orin Nano Super 8GB) で LLM を走らせる律速は **容量と帯域**。既存 GPTQ/AWQ/llama.cpp K/I quant は**全コードに等しいビット**を割り当てるが、実際のコード分布は非一様。LazyWeights は GPTQ を調整してコードが**圧縮しやすい分布**にし、Huffman で可逆圧縮、decode-on-demand で VRAM に展開する。

## 手法
- GPTQ ベースで re-quantize 時に code distribution を skew
- インタリーブ Huffman 符号化(lossless)
- decode は matmul の直前で行う(decode-on-demand)
- GPTQ / AWQ の既存配布を**壊さず**使える格納レイヤー

## 評価
- Jetson Nano (4 GB) / Orin Nano Super (8 GB)
- 比較: 通常 GPTQ / AWQ / llama.cpp K-quants / I-quants
- 指標: VRAM 占有削減、throughput(帯域ネック軽減)

## 既存手法との差分
`llama.cpp` の I-quants はビット割当の工夫、GPTQ/AWQ は非均一スケール。LazyWeights は**符号化層**で改善する直交軸。既存量子化と**併用**する発想。

## 注目度コメント
エッジ側の実装派に直結。llama.cpp v1.0.0(本週、item H09)の I-quants 系と `cpu AVX512-BF16` パス(W45 の GPTQModel v7.7)、User-Schedulable Approximations(item 2611.17526)と並ぶ「edge で現実に効く quant 拡張」3 本の 1 つ。
