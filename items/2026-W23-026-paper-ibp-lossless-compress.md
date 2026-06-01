---
id: "2026-W23-026"
type: paper
title: "Reducing the GPU Memory Bottleneck with Lossless Compression for ML -- Extended"
url: "https://arxiv.org/abs/2605.30728"
discovered: "2026-06-01"
published: "2026-05-29"
authors: [Aditya K Kamath, Arvind Krishnamurthy, Marco Canini]
venue: "arXiv:2605.30728"
models: []
architectures: [transformer]
methods: []
tech: [_uncategorized]
priority: watching
sources: [arxiv]
status: new
related: []
---

## 日本語要約
GPUメモリ転送ボトルネックを無損失圧縮で緩和する新手法「Invariant Bit Packing（IBP）」を提案。ML学習・推論時のGPU↔メモリ間データ転送時間を削減する。量子化（精度削減）ではなくMLテンソルの統計的性質を利用した可逆（lossless）圧縮。

## 手法
「Invariant Bit Packing（IBP）」という無損失圧縮アルゴリズム。MLテンソルにおける不変ビットパターンを活用して転送データ量を削減。FP16/BF16テンソルで効果的とされる。

## 評価
- 対象モデル: ML一般（学習・推論）
- ビット幅: N/A（無損失）
- 精度劣化: なし（lossless）
- スループット/メモリ: GPUメモリ転送時間削減（定量値は論文参照）

## 既存手法との差分
精度削減量子化と補完的。モデルの数値精度を下げずにメモリバンド幅を改善できる。実装複雑度が量子化より低い可能性。

## 注目度コメント
量子化（精度削減）と非量子化（無損失）の組み合わせによる記憶帯域最適化として将来的に有望。現時点では実装未公開のため watching。
