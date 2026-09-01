---
id: "2026-W33-023"
type: paper
title: "Does Accuracy Equal Evidence? Reasoning Faithfulness under KV Cache Compression"
url: "https://arxiv.org/abs/2608.01631"
discovered: "2026-08-10"
published: "2026-08-03"
authors: [Mengting Ai, Jingrui He, Yue Guo]
venue: "arXiv"
models: []
architectures: [transformer]
methods: [KVQuant]
tech: [kv-cache-quant, kv-cache-eviction, reasoning-aware-compression]
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約
KV圧縮は最終回答精度で評価されがちで、回答保持=推論保持を暗黙に仮定する。大規模推論モデルでこの仮定が破れうる: 圧縮下で正答と根拠(rationale)の妥当性が異なる率で保持される。

## 手法
固定トレースreplayプロトコルで推論内容を固定し、圧縮が既存トレースからの有用情報を保つか切り分け。10のtoken-eviction法と1つの量子化法を3モデル×複数タスクで評価。

## 評価
- 対象モデル: 推論LLM (3モデル)
- ビット幅: token-eviction 10種 + 量子化1種
- 精度劣化: 正答は保持されても根拠妥当性は劣化しうる
- スループット/メモリ: KV圧縮の評価軸を拡張

## 既存手法との差分
最終精度のみで評価する既存KV圧縮評価に、推論faithfulnessの軸を追加。

## 注目度コメント
KV圧縮の「精度は保つが推論が壊れる」副作用を測る評価研究。W31の安全性/信頼性トレンドの継続。
