---
id: "2026-W31-019"
type: paper
title: "MoA-Structured Decode Attention DNF Derivation, KV-Cache Accumulation, GQA/MQA, and OpenACC Kernel"
url: "https://arxiv.org/abs/2607.19456"
discovered: "2026-07-27"
published: "2026-07-21"
authors: []
venue: "arXiv (cs.LG, cs.AI)"
models: []
architectures: [transformer]
methods: []
tech: [_uncategorized]
priority: watching
sources: [arxiv]
status: new
verified: "2026-07-27 arXiv API 直取得(ID/タイトル一致確認済み)"
related: []
---

## 日本語要約
Mathematics of Arrays (MoA) の Denotational Normal Form から、decode 時 attention のメモリ最適な4つの推論アーティファクトを代数的に導出: (1) K^T バッファを代数的に消去する single-query decode DNF、(2) ストライド演算とコアレスドアクセスを持つ C/OpenACC GPU カーネル(IEEE-754 完全一致検証)、(3) O(d_k+d_v)/step の KV-cache 追記、(4) ψ-selection による GQA/MQA 導出(KV トラフィック h_q/h_kv 削減の証明)。

## 手法
配列数学による形式的導出。全プログラムを PyTorch scaled_dot_product_attention と照合検証。

## 評価
- 対象: transformer decode attention 一般
- ビット幅: (量子化ではない)
- 精度劣化: 誤差 ≤2e-7(DNF)/ 0(カーネル)
- スループット/メモリ: DRAM トラフィックの下界達成を主張

## 既存手法との差分
FlashAttention 系の手動最適化に対し、メモリ最適カーネルを形式的に「導出」するアプローチ。

## 注目度コメント
形式手法としての面白さはあるが実用性能比較がない。KV cache 実装の理論的整理として watching。
