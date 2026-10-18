---
id: "2026-W43-024"
type: paper
title: "Joint Subspace Sparse Attention for Efficient Long-Context Decoding"
url: "https://arxiv.org/abs/2610.19026"
discovered: "2026-10-19"
published: "2026-10-14"
authors: ["Jiwon Song", "Yoongon Kim", "Jae-Joon Kim"]
venue: "arXiv:2610.19026v1"
models: []
architectures: [hybrid, transformer]
methods: []
tech: [sparse-attention, long-context-quant]
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約
長文デコードで支配的な KV cache トラフィックを抑えるため、Joint Subspace Sparse Attention(JSSA)で学習済み共有低次元 Q-K 部分空間からトークン選別を行う。スコア保存誤差最小化で選別品質を上げ、散在トークン集約の遅延を抑制。

## 手法 / 評価のポイント
- 対象: 長文デコードの sparse attention
- 手法: 共有低次元部分空間でトークン選別、散在集約を抑制
- JSSA

## 注目度コメント
JSSA: Joint Subspace Sparse Attention — long-context decoding
