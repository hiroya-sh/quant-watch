---
id: "2026-W43-022"
type: paper
title: "Latent Compaction with Test-Time Training"
url: "https://arxiv.org/abs/2610.20582"
discovered: "2026-10-19"
published: "2026-10-15"
authors: ["Yingfa Chen", "Xingyu Shen", "Chaojun Xiao", "Xu Han"]
venue: "arXiv:2610.20582v1"
models: []
architectures: [transformer]
methods: []
tech: [latent-compaction, kv-cache-compression-non-quant]
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約
長文書を KV に落とす際、クエリ非依存の test-time training で**ドキュメント固有の圧縮 KV** を学習する(Latent Compaction)。再構成重要度 / 教師注意 / キー空間多様性で初期化し、全キャッシュとの end-to-end 蒸留で最適化。モデル重みは凍結。

## 手法 / 評価のポイント
- 対象: ドキュメント固有 KV の圧縮
- 手法: test-time training(学習済み重み凍結)
- 初期化: 再構成重要度 / 教師注意 / キー空間多様性

## 注目度コメント
Latent Compaction with Test-Time Training (KV compaction)
