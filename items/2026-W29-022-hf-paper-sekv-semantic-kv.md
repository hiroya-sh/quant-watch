---
id: "2026-W29-022"
type: hf-paper
title: "SeKV: Resolution-Adaptive KV Cache with Hierarchical Semantic Memory for Long-Context LLM Inference"
url: "https://arxiv.org/abs/2606.31145"
discovered: "2026-07-13"
published: "2026-06-30"
authors: [Amirhossein Abaskohi, Giuseppe Carenini, Peter West, Yuhang He]
venue: "arxiv / HF Papers 2026-07-07 (11 upvotes)"
models: []
architectures: [transformer]
methods: []
tech: [kv-cache-compression-non-quant, long-context-quant]
priority: normal
sources: [hf-papers, arxiv]
status: new
verified: "2026-07-13 arXiv API で ID/タイトル/著者/abstract 取得・実在確認、HF daily_papers 掲載確認"
related: []
---

## 日本語要約
長文脈 KV cache 圧縮で、token eviction(情報破棄)と semantic grouping(prefill 時に圧縮固定)の両弱点——圧縮済みスパンから token レベルの詳細を後から復元できない——に対し、**解像度適応型の階層セマンティックメモリ**を導入する SeKV。生成中に関連性が浮上したスパンを細粒度に戻せる。

## 注目ポイント
- 「可逆的にズームできる」KV 圧縮という設計は eviction/quantization の中間解
- 掲載日ベースで W29 の HF Papers に登場(投稿は 6/30)

## 注目度コメント
非量子化系 KV 圧縮の注目作。優先度 normal。
