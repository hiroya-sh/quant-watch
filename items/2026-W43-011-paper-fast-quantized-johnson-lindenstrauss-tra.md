---
id: "2026-W43-011"
type: paper
title: "Fast Quantized Johnson$-$Lindenstrauss Transforms"
url: "https://arxiv.org/abs/2610.16289"
discovered: "2026-10-19"
published: "2026-10-12"
authors: ["Angelos Korakitis", "Vasileios Nakos"]
venue: "arXiv:2610.16289v1"
models: []
architectures: [dense, transformer]
methods: [QJL]
tech: [kv-cache-quant, qjl-correction]
priority: high
sources: [arxiv]
status: new
related: []
---

## 日本語要約
Johnson-Lindenstrauss 変換の量子化版を高速化。QJL 系(KV cache の次元削減)で使われる射影 + 1-bit 符号化を Hadamard ベースで加速。focus:QJL 系統の計算基盤。

## 手法 / 評価のポイント
- 対象: QJL(KV cache 次元削減)の射影演算
- 貢献: Hadamard ベースの高速化
- 用途: KV cache 量子化パイプラインの前処理

## 注目度コメント
Fast Quantized Johnson-Lindenstrauss Transforms — focus:QJL bump
