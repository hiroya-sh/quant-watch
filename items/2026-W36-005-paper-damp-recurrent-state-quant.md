---
id: "2026-W36-005"
type: paper
title: "DAMP: Decay-Aware Mixed-Precision Recurrent-State Quantization"
url: "https://arxiv.org/abs/2608.27513"
discovered: "2026-09-01"
published: "2026-08-27"
venue: "arXiv (cs.LG, cs.AI)"
models: [moonshotai/Kimi-K2.7]
architectures: [linear-attention, gla, hybrid]
methods: [NVFP4, DAMP]
tech: [kv-cache-quant, mixed-precision, ptq, low-bit-4, low-bit-fp8]
priority: high
sources: [arxiv]
status: new
related: []
---
## 日本語要約
softmax 注意は全先行トークンの key/value を保持するため推論メモリが系列長とともに増える。Gated DeltaNet (GDN) や Kimi Delta Attention (KDA) を組み込んだ最近の言語モデルは、大半の層で KV cache を固定サイズの再帰状態に置き換えてこのコストを下げる。**しかしその再帰状態は通常 FP32 で保持され、GPU メモリを大きく消費する。更新はメモリ帯域律速で、デコードレイテンシに大きく寄与する。**

## 手法
著者は **GDN / KDA ベースの言語モデルにおける再帰状態の PTQ を初めて研究したと主張**。知見:
- **一様量子化は精度-容量のトレードオフが悪い。INT8 と FP8 ですら複雑な推論タスクで精度を落とし、INT4 と NVFP4 はほぼゼロまで落とす。**
- 量子化誤差の大半は特定の構造に集中している(decay 構造に依存)
- そこで decay を考慮した mixed-precision 割当を行う

## 評価
- 対象: GDN / KDA を持つハイブリッドモデルの再帰状態
- 一様量子化のベースライン: INT8/FP8 で劣化、INT4/NVFP4 で崩壊

## 既存手法との差分
KV cache ではなく**再帰状態**という新しい量子化対象。既存の KV 量子化知見がそのままは効かないことを示した。

## 注目度コメント
**進行中プロジェクト(Mamba/GLA 系)に直結**。「ハイブリッド線形注意はメモリが小さいから量子化しなくてよい」という直感を否定し、かつ**素朴に量子化すると壊れる**ことを示した点が重要。同週の [[items/2026-W36-016-paper-dasc-hybrid-linear-attn|DASC]](非量子化の状態圧縮)と対。**強推し議題候補**。
