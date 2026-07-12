---
id: "2026-W29-006"
type: paper
title: "Fractal KV-Cache Archives: Lossless Symbolic Storage with In-Place Retrieval for Long-Context LLM Inference"
url: "https://arxiv.org/abs/2607.07144"
discovered: "2026-07-13"
published: "2026-07-08"
authors: [Vladimir Gusev]
venue: "arxiv (cs.LG)"
models: []
architectures: [transformer]
methods: []
tech: [kv-cache-quant, lossless-compression, long-context-quant]
priority: high
sources: [arxiv]
status: new
verified: "2026-07-13 arXiv API で ID/タイトル/著者/abstract 取得・実在確認"
related: []
---

## 日本語要約
KV cache を量子化してコードブック索引にした**後**の「シンボル列をどう保存するか」というストレージ層の問いを立てる異色作。縮小写像の反復系で記号列を低次元実ベクトル列に直列化する符号を再訪し、成長するキャッシュに必要なアクセスパターンをそのまま提供する「アーカイブフォーマット」になると示す。ロスレス・in-place 検索付き。

## 注目ポイント
- kv-cache-quant の下流(保存・検索)を扱う数少ない論文
- 単著・理論寄りで実装/評価の厚みは要確認

## 注目度コメント
デフォルト normal + kv-cache-quant focus bump で high。理論寄り単著のため、実装・評価の続報が出るかを監視。
