---
id: "2026-W31-004"
type: paper
title: "KroQuant: Kronecker-Structured Block Transforms for Efficient Post-Training Quantization of Diffusion Transformers"
url: "https://arxiv.org/abs/2607.21446"
discovered: "2026-07-27"
published: "2026-07-23"
authors: []
venue: "arXiv (cs.LG, cs.CV)"
models: []
architectures: [transformer]
methods: [MXFP4]
tech: [ptq, low-bit-fp4, activation-quant, rotation, block-wise, outlier-handling]
priority: normal
sources: [arxiv]
status: new
verified: "2026-07-27 arXiv API 直取得(ID/タイトル一致確認済み)"
related: []
---

## 日本語要約
Diffusion Transformer (DiT) の W4A4 PTQ 向けに、32要素ブロック単位の学習済み Kronecker 構造可逆変換を適用する手法。DiT は正規化層のせいで活性変換を毎 denoising ステップにオンライン実行する必要があり、変換の推論コストが設計上の制約になる。per-channel スケーリング(安い/精度弱)、固定 Hadamard(精度良/ブロック大でコスト高)、学習フル次元変換(最良/dense GEMM が非現実的)の三択を、ブロック局所の Kronecker 構造で打開する。

## 手法
32要素ブロックごとの学習 Kronecker 変換(パラメータは per-channel スケーリングの半分以下)+ オフライン LoRaQ 重み校正で残余誤差を吸収。小さな tensor-core GEMM として動き、MI350 GPU で SmoothQuant カーネル比 最大14%高速。

## 評価
- 対象モデル: PixArt-Σ, SANA, FLUX.1-schnell
- ビット幅: W4A4 (MXFP4e2)
- 精度劣化: MJHQ-30K / SDCI で SVDQuant・LoRaQ より FP 参照に近い出力
- スループット/メモリ: 量子化カーネルが SmoothQuant 比 +14% 高速 (MI350)

## 既存手法との差分
「オンライン変換コスト」を第一制約に置き、Hadamard と学習変換の中間にあたる Kronecker ブロック変換を持ち込んだ点。SVDQuant 系のW4A4 画像生成路線の直接の後継。

## 注目度コメント
画像生成側だが、activation 変換のオンラインコスト問題は LLM の rotation 系にも共通する論点。MXFP4e2 実運用の精度データ点としても有用。
