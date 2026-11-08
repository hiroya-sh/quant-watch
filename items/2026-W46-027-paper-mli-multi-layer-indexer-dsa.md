---
id: "2026-W46-027"
type: paper
title: "Multi-layer Indexer: Overlapping Selection and Attention in DeepSeek Sparse Attention"
url: "https://arxiv.org/abs/2611.03768"
discovered: "2026-11-09"
published: "2026-11-05"
authors: []
venue: "arXiv:2611.03768"
models: []
architectures: ["transformer"]
methods: []
tech: ["sparse-attention"]
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約

DeepSeek Sparse Attention (DSA) の lightning indexer は長文で decode の律速となるが、隣接層の選択は近いので「前の indexer の選択を attend」できる。これにより indexer scan を次層 attention と同時実行可能に。Multi-layer Indexer (MLI) は retrain/新重み不要の SGLang 実装で、IndexCache (GLM-5.2 の IndexShare) と合成可能。retention 1/2 (全層のうち indexer 保持率) で DeepSeek-V3.2 で 14.5%, GLM-5 で 9.8% の decode 高速化、1/4 で 7.9% / 5.1%。

## 手法

隣接層の indexer 選択が似ることを使い、前層の選択を次層 attention に使う。SGLang の production decode graph 内で動作、別途 fused decode kernel で DeepSeek-V3.2 を更に加速。

## 評価

- モデル: DeepSeek-V3.2, GLM-5.* 全系統
- 文脈長: 10K-195K
- 加速: retention 1/2 で +14.5% (DSV3.2) / +9.8% (GLM-5)
- 実装: SGLang native + optional fused kernel

## 注目度コメント

sparse-attention + DSA — W45 Multi-layer DSA 系、HF daily paper 5 upvote。SGLang 側で production 実装済み。
