---
id: "2026-W36-010"
type: paper
title: "Compression Trinity: Exploring Sparsity, Quantization, and Low-Rank Approximations for LLM Compression"
url: "https://arxiv.org/abs/2608.24070"
discovered: "2026-09-01"
published: "2026-08-25"
venue: "arXiv (cs.AI, cs.DC, cs.LG, cs.PF)"
models: []
architectures: [transformer]
methods: []
tech: [weight-only, mixed-precision, lossless-quantization-recovery]
priority: normal
sources: [arxiv]
status: new
related: []
---
## 日本語要約
LLM のスケーラブルな展開は計算・環境コストに阻まれる。従来の圧縮技術(スパース性・量子化・低ランク近似)は個別に適用されるのが通例で、それぞれが精度-効率の壁に当たる。本論文(学位論文)は3本柱を同時に適用する統一枠組み **Compression Trinity** を提案 — スパース性で計算を減らし、量子化でメモリ帯域を最小化し、低ランク近似で精度を回復する。

## 手法
事前学習の加速のため、Trinity を optimizer とモデルアーキテクチャに適用。**MKOR** はブロック対角スパース性と低ランク逆行列で曲率を近似し、量子化状態に対して数値安定性を保つ。曲率更新の計算量を $O(d^3)$ から $O(d^2)$ に削減し、KFAC 比で最大 **1.85倍**収束を加速。

## 評価
- 事前学習の収束速度 1.85x (vs KFAC)

## 既存手法との差分
3手法を「積む」のではなく役割分担させて設計する。

## 注目度コメント
[[items/2026-W35-012-paper-moexbench-composable-moe-compression|MoEXBench]] が「積んだときの評価」なのに対し、こちらは「積む前提の設計」。学位論文なので網羅性が高い。
