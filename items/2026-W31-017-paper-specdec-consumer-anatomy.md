---
id: "2026-W31-017"
type: paper
title: "Lossless but Not Free: An Empirical Anatomy of Speculative Decoding on Consumer Hardware"
url: "https://arxiv.org/abs/2607.17283"
discovered: "2026-07-27"
published: "2026-07-19"
authors: []
venue: "arXiv (cs.AI, cs.LG)"
models: []
architectures: [transformer]
methods: []
tech: [speculative-decoding]
priority: watching
sources: [arxiv]
status: new
verified: "2026-07-27 arXiv API 直取得(ID/タイトル一致確認済み)"
related: []
---

## 日本語要約
コンシューマ Apple Silicon ラップトップ上での speculative decoding の from-scratch・デバイス非依存(CUDA/MPS/CPU)実装と実証研究。5つの draft/target バックエンド構成のうち高速化できたのは2つのみで、最良構成は K=6 で実測 1.61x。3構成は逆に減速し、原因は「draft が小さな target より速くない」か「量子化 Metal バックエンドが並列 verify を直列実行する」ことにあると分離・定量化。

## 手法
分布等価性を3レベルで検証(約9,200トークンの二標本検定 χ²=162.5, p=0.976、greedy 系列の完全一致)。

## 評価
- 対象環境: Apple Silicon(コンシューマ)
- ビット幅: 量子化バックエンド含む5構成
- 精度劣化: なし(分布保存を実測検証)
- スループット/メモリ: 最大 1.61x、ただし5構成中3構成は減速

## 既存手法との差分
speculative decoding の成功例でなく「失敗する条件」(バッチ並列 verify の欠如、draft/target レイテンシ差の不足)を明示した点。

## 注目度コメント
「量子化 Metal バックエンドでは verify が直列化して spec dec が逆効果」という知見はローカル推論の実務に直結。watching。
