---
id: "2026-W33-021"
type: paper
title: "AnchorKV: Anchor-Residual KV Cache Compression"
url: "https://arxiv.org/abs/2608.02901"
discovered: "2026-08-10"
published: "2026-08-03"
authors: [Malik Khalaf, Yara Shamshoum, Nitzan Hodos]
venue: "arXiv"
models: []
architectures: [transformer]
methods: []
tech: [kv-cache-compression-non-quant, kv-cache-eviction, long-context-quant]
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約
KVキャッシュ圧縮は両極から攻められてきた: eviction系はトークンを永久破棄し重要トークンを失うと劣化、量子化系は全トークンを低精度保持するが圧縮率が限定的。AnchorKVはトークンを1つも捨てず20倍圧縮する。

## 手法
少数のanchorを厳密保持し、他の全トークンを最類似anchorで表現。出力に効く近似のトークンのみ精緻化する。

## 評価
- 対象モデル: 長文脈LLM
- ビット幅: 20x圧縮(非量子化)
- 精度劣化: トークン破棄なしで性能維持
- スループット/メモリ: KVメモリ20倍削減

## 既存手法との差分
eviction(破棄)とquantization(低精度)の中間を突くanchor-residual表現。

## 注目度コメント
eviction/量子化の弱点を回避する新しいKV圧縮パラダイム。20倍という圧縮率が目を引く。
