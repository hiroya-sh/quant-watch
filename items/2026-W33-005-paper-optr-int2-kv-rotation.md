---
id: "2026-W33-005"
type: paper
title: "Output-Aware Rotation for INT2 KV-Cache Quantization (OptR)"
url: "https://arxiv.org/abs/2608.02691"
discovered: "2026-08-10"
published: "2026-08-03"
authors: [Vincent-Daniel Yun, Woosang Lim, Minsoo Cheong]
venue: "arXiv"
models: []
architectures: [transformer]
methods: [QuaRot, SpinQuant]
tech: [kv-cache-quant, low-bit-2, rotation, weight-only]
priority: high
sources: [arxiv]
status: new
related: []
---

## 日本語要約
長文脈推論のKVキャッシュがメモリ/帯域のボトルネックとなり超低bit量子化が重要に。既存の回転ベースINT2手法はattention読み出し前のキャッシュ統計やプロキシ誤差を最適化しており、実際にモデルへ効く出力射影W_O通過後の誤差伝播とミスマッチがある。

## 手法
OptRはpost-W_Oのattention出力誤差を最小化する出力対応回転。誤差をkey起因項とvalue起因項に分解し、ヘッドごとの直交補正を学習する。

## 評価
- 対象モデル: 長文脈LLM
- ビット幅: INT2 (KV cache)
- 精度劣化: post-W_O誤差最小化で低bit精度改善
- スループット/メモリ: KVキャッシュのメモリ/帯域削減

## 既存手法との差分
キャッシュ統計/プロキシ誤差最適化の既存INT2回転法に対し、出力射影後の実効誤差を直接最小化。

## 注目度コメント
kv-cache-quant(focus)かつINT2という攻めたビット幅。KV量子化の理論を出力側から詰める重要研究。
