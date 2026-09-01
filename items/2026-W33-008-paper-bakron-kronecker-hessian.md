---
id: "2026-W33-008"
type: paper
title: "BaKron: Efficient Quantization with Kronecker-Factored Hessians"
url: "https://arxiv.org/abs/2608.06291"
discovered: "2026-08-10"
published: "2026-08-06"
authors: [Johann Birnick, Rayan Saab]
venue: "arXiv"
models: []
architectures: [transformer]
methods: [GPTQ]
tech: [weight-only, ptq, calibration]
priority: high
sources: [arxiv]
status: new
related: []
---

## 日本語要約
Kronecker因子近似Hessianに基づく量子化アルゴリズム群を高速化。GPTQ流の適応丸めは通常、入力活性由来の片側情報を使うが、両側Kronecker因子Hessianは出力座標間の相関も捉えられる。ただしベクトル化重み領域で直接GPTQを適用すると計算が高い。

## 手法
BoA/YAQAの両側適応丸め定式化を基に、反対角並列性と再帰的分割統治を組み合わせた高速ソルバBaKron。m×n重み行列に対し効率的に解く。

## 評価
- 対象モデル: 重み量子化
- ビット幅: 任意bit(weight-only)
- 精度劣化: 両側Hessianで出力相関を考慮し精度向上
- スループット/メモリ: 計算コストを大幅削減

## 既存手法との差分
YAQA/BoAの両側Hessian丸めを実用的計算量に落とす点でGPTQ-2Dと補完的。

## 注目度コメント
GPTQ-2Dと同週の両側適応丸め高速化。両側Hessianはweight-only PTQの精度上限を押し上げる。
