---
id: "2026-W30-003"
type: paper
title: "A JoLT for the KV Cache: Near-Lossless KV Cache Compression via Joint Tucker and JL-Residual Allocation for LLMs"
url: "https://arxiv.org/abs/2607.12550"
discovered: "2026-07-20"
published: "2026-07-14"
authors: []
venue: "arXiv (cs.LG, cs.CL, math.OC)"
models: []
architectures: []
methods: []
tech: [kv-cache-compression-non-quant, long-context-quant]
priority: normal
sources: [arxiv]
status: new
verified: "2026-07-20 arXiv API 直取得(ID/タイトル一致確認済み)"
related: []
---

## 日本語要約
KV cache を「ヘッド×トークン×特徴」の3階テンソルとして直接扱い、部分 Tucker 分解と JL(Johnson-Lindenstrauss)残差への予算配分を共同最適化する near-lossless KV 圧縮。低ランク法(2次元スライス分解)とビット幅削減(量子化)のどちらとも異なる第三の軸として、3軸の冗長性の違いを明示的に利用する。

## 手法
層ごとの KV テンソルに partial Tucker を適用し、残差を JL 射影で圧縮。Tucker ランクと JL 次元の配分を最適化問題として解く。

## 評価
- 対象モデル: transformer LLM(長文脈)
- ビット幅: 量子化ではなく低ランク+射影圧縮
- 精度劣化: near-lossless を主張
- スループット/メモリ: KV メモリ天井の引き上げが目的

## 既存手法との差分
per-head 行列や cross-layer ブロックの2次元分解と違い、3階テンソル構造をそのまま使う。JL 残差は QJL(focus 手法)と同系の Johnson-Lindenstrauss 系テクニックで、量子化と直交するため併用余地あり。

## 注目度コメント
focus の QJL と同じ JL 系統の KV 圧縮。狭義の kv-cache-quant ではないため bump は適用せず normal だが、QJL ウォッチの文脈で追う価値あり。
