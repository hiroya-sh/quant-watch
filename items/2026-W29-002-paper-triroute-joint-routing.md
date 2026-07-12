---
id: "2026-W29-002"
type: paper
title: "TriRoute: Unified Learned Routing for Joint Adaptive Attention, Experts, and KV-Cache Allocation"
url: "https://arxiv.org/abs/2607.06601"
discovered: "2026-07-13"
published: "2026-07-07"
authors: [Andrii Balashov, Olena Ponomarova]
venue: "arxiv (cs.LG, cs.AI)"
models: []
architectures: [transformer, moe]
methods: []
tech: [kv-cache-quant, moe-quant, mixed-precision, per-token]
priority: high
sources: [arxiv]
status: new
verified: "2026-07-13 arXiv API で ID/タイトル/著者/abstract 取得・実在確認"
related: []
---

## 日本語要約
MoE(expert 選択)・Mixture-of-Depths(ブロックスキップ)・KV cache 量子化(ビット幅)という**3軸の条件付き計算を単一の学習済みコントローラで統合的に決定**する TriRoute。トークン毎・レイヤ毎に attention 解像度 / expert 選択 / cache ビット幅を同時に出力する。「full attention が必要な稀トークンは高精度キャッシュも必要」という3軸の結合を根拠とする。

## 注目ポイント
- KV cache のビット割当をルーティング問題として expert 選択と統合する視点が新しい
- focus の kv-cache-quant / moe-quant の両方に該当

## 注目度コメント
per-token 適応 KV 量子化と MoE の交差点。W27 の Block-GTQ(RoPE対応ビット割当)とは別アプローチの動的割当。優先度 high(focus bump)。
