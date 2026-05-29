---
id: "2026-W22-007"
type: paper
title: "ThriftAttention: Selective Mixed Precision for Long-Context FP4 Attention"
url: "https://arxiv.org/abs/2605.23081"
discovered: "2026-05-23"
published: "2026-05-23"
authors: []
venue: "arxiv"
models: []
architectures: [transformer]
methods: [NVFP4]
tech: [low-bit-fp4, mixed-precision, microscaling-formats, long-context-quant]
priority: high
sources: [arxiv, hf-papers]
status: new
hf_upvotes: 31
related: ["2026-W22-002", "2026-W22-004"]
---

## 日本語要約

Blackwell GPUのブロックスケールFP4 Attentionが長コンテキストで品質劣化する問題に対処。量子化誤差が少数の重要なQuery-Keyブロックに集中することを発見。ThriftAttentionは重要な約5%のQKブロックのみFP16で計算し、残り95%はFP4のままとする選択的混合精度手法。FP4→FP16の精度差の平均89.1%を回復しつつFP4のスループット優位を維持。

## 手法

- ブロックスケールFP4 Attentionの長コンテキスト品質劣化を定量分析
- 重要QKブロックを安価な近似スコアで特定
- 重要ブロック（約5%）をFP16で精密計算、残りはFP4
- Blackwell GPUのFP4命令セットを前提とした実装

## 評価

- 対象モデル: Blackwell対応LLM（長コンテキスト）
- ビット幅: FP4（95%）＋FP16（5%）の混合
- 精度劣化: FP4→FP16の差の89.1%を平均で回復
- スループット: FP4並みを維持（FP16全体より高速）

## 既存手法との差分

既存のFP4 Attention手法が均一にFP4を適用するのに対し、Attentionブロック単位での選択的精度適用という新視点。Blackwell固有の問題への実践的解決策。

## 注目度コメント

`NVFP4`（focus method）＋長コンテキスト課題。31 HF upvotes。Blackwell移行期の実装指針として重要。
