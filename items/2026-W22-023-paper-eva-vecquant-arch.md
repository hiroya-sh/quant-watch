---
id: "2026-W22-023"
type: paper
title: "EVA: Accelerating LLM Decoding via an Efficient Vector Quantization Architecture"
url: "https://arxiv.org/abs/2605.24144"
discovered: "2026-05-22"
published: "2026-05-22"
authors: [Bowen Duan, Cong Guo, Chiyue Wei]
venue: "ISCA 2026"
models: []
architectures: [transformer]
methods: []
tech: [weight-only, low-bit-4, block-wise]
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約

Weight-only Vector量子化で、重みをコードブックから直接内積計算するEVA（Efficient Vector Quantization Architecture）を提案。従来は重みを再構成してからGEMVするところを、EVAは入力とコードブックの内積をGEMM形式で直接計算。これによりメモリ衝突を排除し最大11.17×高速化・7.17×エネルギー効率向上を達成。ISCA 2026採録。

## 手法

- コードブック直接内積: 重み再構成なしにInput×Codebook GEMM計算
- GEMV→GEMM変換: 並列性を高めてメモリ衝突を解消
- ハードウェアアーキテクチャ設計（専用ASIC/実装）

## 評価

- 対象モデル: 各種LLM
- ビット幅: 4ビット（Weight-only）
- 精度劣化: ベースラインと同等
- スループット: 最大11.17×高速化、7.17×エネルギー効率向上

## 既存手法との差分

ハードウェアアーキテクチャレベルのアプローチで、ソフトウェア実装の最適化とは異なる視点。ISCA採録で実装品質が高い。
