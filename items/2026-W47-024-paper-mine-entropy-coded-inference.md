---
id: "2026-W47-024"
type: paper
title: "MINE: Entropy-coded Memory-efficient Inference for Large Language Models"
url: "https://arxiv.org/abs/2611.09424"
discovered: "2026-11-16"
published: "2026-11-06"
updated: "2026-11-09"
authors: [arxiv:2611.09424]
venue: "arXiv:2611.09424"
models: []
architectures: []
methods: []
tech: [weight-only, lossless-compression]
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約
MINE はシングルストリーム LLM 推論を加速する **lossless entropy coding** パイプライン。既存の lossless 圧縮は BF16 など限られた型でしか speedup が得られなかったが、MINE は **quantized weight を含む幅広い型**で memory-bound な decode を加速する。lossless なので精度劣化ゼロ。

## 手法
- weight を entropy code で圧縮して GPU メモリに格納
- 行列ロード時に on-the-fly で展開(stream decode)
- 対応: FP16/BF16/INT8/INT4/FP4/FP8

## 評価
- Llama / Qwen 系で memory-bound decode の throughput
- 圧縮率 vs. 展開 overhead

## 既存手法との差分
LazyWeights (item 007) が GPTQ weight の分布 skew + Huffman、MINE は**一般 lossless entropy coding** を直接適用。両者は格納 vs. 符号側で補完的。

## 注目度コメント
lossless なので量子化 + lossless の組合せで追加の圧縮が取れる。量子化後の「配布サイズ削減」と decode の帯域削減に同時効く。
