---
id: "2026-W47-004"
type: paper
title: "GC-MoE on SM120: Overlapping Expert-Parallel Token Dispatch with Warp-Level FP8xFP4 Block-Scaled MMA on Consumer Blackwell"
url: "https://arxiv.org/abs/2611.16219"
discovered: "2026-11-16"
published: "2026-11-12"
authors: [arxiv:2611.16219]
venue: "arXiv:2611.16219"
models: []
architectures: [moe]
methods: [NVFP4]
tech: [low-bit-4, low-bit-fp4, low-bit-fp8, moe-quant]
priority: high
sources: [arxiv]
status: new
related: [2026-W46-009-paper-gcmoe-cuda-green-contexts-fp8-fp4]
---

## 日本語要約
W46 の [[items/2026-W46-009-paper-gcmoe-cuda-green-contexts-fp8-fp4|GC-MoE(Hopper SM90 / datacenter Blackwell SM100)]] を**コンシューマ Blackwell(SM120、RTX PRO 系)に移植**。SM120 では CUDA Graph の Green Context partition が datacenter と違い、warp-level の FP8×FP4 block-scaled MMA を expert-parallel dispatch と**ピクセル単位で overlap** する必要がある。EP decode 低 latency の全層 serialize を解消。

## 手法
- SM120 用 persistent CUDA Graph を再構築(SM90/SM100 と異なる warp 粒度)
- warp-level FP8×FP4 block-scaled MMA(FP8 activation × NVFP4 weight)
- all-to-all dispatch, grouped GEMM, combine を 1 つの Green Context partition に融合
- 低バッチサイズ(EP decode 典型)でレイテンシ dominant になる固定コストを削減

## 評価
- 対象モデル: 論文参照の MoE(EP decode)
- プラットフォーム: SM120 Blackwell(RTX PRO 4500 / 5000 等コンシューマ)
- 対比: SM90 Hopper / SM100 datacenter Blackwell
- 改善幅: 低 batch での latency

## 既存手法との差分
GC-MoE オリジナル(W46)は datacenter 向け。SM120 への移植は **ローカル実験環境(RTX PRO Blackwell)での MoE focus 量子化評価**を可能にする。

## 注目度コメント
NVFP4 + moe-quant 二重 focus。手元 Blackwell workstation で MoE serving 最適化を検証する下地になる。W36 以降継続する「NVFP4 配布を実際に serve できるパス」の重要な実装側論文。
