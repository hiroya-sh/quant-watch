---
id: "2026-W33-002"
type: paper
title: "MXAttention: Data-Free Optimal Scaling and Pre-Normalization Quantization for MXFP4 Attention"
url: "https://arxiv.org/abs/2607.24377"
discovered: "2026-08-10"
published: "2026-07-27"
authors: [Jianlin Yu, Jing Lin, Linghui Kong]
venue: "arXiv"
models: []
architectures: [transformer]
methods: [MXFP4]
tech: [low-bit-fp4, microscaling-formats, activation-quant, calibration-free]
priority: high
sources: [arxiv]
status: new
related: []
---

## 日本語要約
拡散ベース動画生成のattentionをMXFP4化するデータフリーPTQ。直接量子化はpower-of-2スケールのclipping/underflowトレードオフとsoftmaxループでの行正規化誤差の2つで品質が劣化する。これらを解く2要素を提案。

## 手法
Universal Optimal Scaling(UOS)がmicroscalingの周期構造から分布非依存の最適スケール境界Qmax=7.25を導出。加えてpre-normalization量子化でsoftmax正規化誤差を抑える。校正データ不要。

## 評価
- 対象モデル: 拡散動画生成モデルのattention
- ビット幅: MXFP4 (attention)
- 精度劣化: データフリーで品質劣化を抑制
- スループット/メモリ: attention二次コストの削減

## 既存手法との差分
既存MXFP4がヒューリスティックなpower-of-2スケールに依存するのに対し、分布非依存の最適スケール境界を解析的に導出。

## 注目度コメント
MXFP4のスケール設計を理論から詰めた数少ない研究。data-freeで校正不要なのは実運用で有利。
