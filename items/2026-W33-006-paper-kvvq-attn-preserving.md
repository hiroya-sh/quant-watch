---
id: "2026-W33-006"
type: paper
title: "Spend Bits Where Queries Look: KV Cache Vector Quantization with Attention-Preserving Transforms"
url: "https://arxiv.org/abs/2608.04074"
discovered: "2026-08-10"
published: "2026-08-04"
authors: [Samuel Fernández-Menduiña, Amir Ziashahabi, Eduardo Pavez]
venue: "arXiv"
models: []
architectures: [transformer]
methods: [QJL]
tech: [kv-cache-quant, low-bit-2, rotation, per-token]
priority: high
sources: [arxiv]
status: new
related: []
---

## 日本語要約
長文脈デコードは毎ステップKVキャッシュを読むため帯域律速。固定bit数でattention積を保ちつつ再構成を安価にすることが課題。2bit/要素では直交変換系が最有力だが、既存法はデータ非依存かquery統計を歪み基準で導出していない。

## 手法
queryが見る方向にbitを配分するattention保存変換。歪み基準からquery統計を用いて変換を導出し、ランダム/Hadamard回転の上に構築する既存手法を改善。

## 評価
- 対象モデル: 長文脈LLM
- ビット幅: 2-bit (KV cache)
- 精度劣化: attention積を保ち再構成を安価に
- スループット/メモリ: デコードスループット/収容能力向上

## 既存手法との差分
データ非依存またはquery統計を歪み最適化に使わない既存の直交変換系を、歪み基準の変換導出で上回る。

## 注目度コメント
kv-cache-quant(focus)。帯域律速のデコードを直撃する実用性の高い2bit KV量子化。
