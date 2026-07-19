---
id: "2026-W30-013"
type: paper
title: "AVQ-Attention: Adaptive Vector-Quantized Attention"
url: "https://arxiv.org/abs/2607.12789"
discovered: "2026-07-20"
published: "2026-07-14"
authors: []
venue: "arXiv (cs.LG, cs.CV)"
models: []
architectures: [transformer]
methods: []
tech: [kv-cache-compression-non-quant]
priority: watching
sources: [arxiv]
status: new
verified: "2026-07-20 arXiv API 直取得(ID/タイトル一致確認済み)"
related: []
---

## 日本語要約
key を M 個のコードワードで表現して attention を O(MN) にする VQ attention の改良。従来は attention 質量の集中と無関係に一様なコードブック容量を割り当てていたのに対し、AVQ は forward 中に重要コードを特定して容量を適応配分する。高 attention 領域の粗い近似と低 attention 領域の容量浪費を同時に解消。

## 手法
少数コードワードから開始し、重要度に応じてコードを refine する適応 VQ。

## 評価
- 対象モデル: transformer(cs.CV 寄りの評価)
- ビット幅: コードブックサイズが実効圧縮率
- 精度劣化: 一様 VQ 比で改善
- スループット/メモリ: O(N²)→O(MN)

## 既存手法との差分
VQ attention への重要度適応の導入。KV の VQ 圧縮(AQLM 系の attention 版)として量子化ウォッチの周辺領域。

## 注目度コメント
LLM 長文脈での検証が薄そうなため watching。
