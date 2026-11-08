---
id: "2026-W46-004"
type: paper
title: "FLAMIA: FLAsh MIcroscaling Attention for Fast and Causally Safe Training on Blackwell"
url: "https://arxiv.org/abs/2611.03344"
discovered: "2026-11-09"
published: "2026-11-02"
authors: ["Fedor Velikonivtsev", "Mikhail Koltakov", "Denis Kuznedelev"]
venue: "arXiv:2611.03344"
models: []
architectures: ["transformer"]
methods: ["NVFP4"]
tech: ["low-bit-fp4", "low-bit-fp8", "microscaling-formats"]
priority: high
sources: [arxiv]
status: new
related: []
---

## 日本語要約

Blackwell (B200/B300) 向け MXFP8 + mixed NVFP4/FP8 の flash attention カーネル FLAMIA。token-block scaling, scale-induced leakage safeguard, forward/backward の一貫数値、document-local scaling を統合。MXFP8 pass で B200 1.10-1.40x, B300 1.06-1.42x の高速化（quant 含む）。Llama-style pretraining で安定性と品質を確認。

## 手法

MXFP8 と mixed NVFP4/FP8 で attention の forward+backward を実行。token-block scaling でマトリクス方向の再量子化を回避、document-local scaling で packed variable-length にも対応。causal leakage を防ぐ scale 設計。

## 評価

- モデル: Llama-style pretraining
- ビット幅: MXFP8 / NVFP4 + FP8 mixed
- スループット: B200 1.10-1.40x / B300 1.06-1.42x (vs fastest baseline, quant 込み)
- 精度: pretraining でダウンストリーム品質保持

## 注目度コメント

NVFP4 focus + microscaling — HF daily paper 19 upvote。B300 native 対応と forward/backward 一致の causal safe 設計は MXFP8 を "推論" から "学習" へ押し広げる W45 Megatron NCCL EP MXFP8 の系譜。
