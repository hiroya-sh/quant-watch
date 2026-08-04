---
id: "2026-W30-019"
type: paper
title: "FastTPS: An Optimized Method for LLM Token Phase for AI accelerators"
url: "https://arxiv.org/abs/2607.11211"
discovered: "2026-07-20"
published: "2026-07-13"
authors: []
venue: "arXiv (cs.LG)"
models: []
architectures: []
methods: []
tech: [_uncategorized]
priority: watching
sources: [arxiv]
status: new
verified: "2026-07-20 arXiv API 直取得(ID/タイトル一致確認済み)"
related: []
---

## 日本語要約
decoder-only LLM のトークンフェーズ(逐次デコード)の低並列性による AI アクセラレータ利用率低下への対処。数値偏差(numeric deviation)を伴う既存高速化手法群に対し、高性能かつ精度損失の小さいトークンフェーズ高速化手法 FastTPS を提案する。長系列入力でのメモリオーバーヘッドが対象。

## 手法
詳細はアブストラクトからは限定的。低精度化を含むトークンフェーズ最適化。

## 評価
- 対象モデル: decoder-only LLM(AI アクセラレータ)
- ビット幅: low-precision loss を主張
- 精度劣化: 小さいと主張
- スループット/メモリ: デコード時利用率改善

## 既存手法との差分
アブストラクトからは新規性の評価が困難。

## 注目度コメント
情報薄。watching。
