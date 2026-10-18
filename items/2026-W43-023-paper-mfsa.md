---
id: "2026-W43-023"
type: paper
title: "MFSA: A Multi-Format Systolic Array with Native Micro Scaling Support"
url: "https://arxiv.org/abs/2610.19645"
discovered: "2026-10-19"
published: "2026-10-14"
authors: ["Jiayi Wang", "Kearnan Bishop", "Ang Li"]
venue: "arXiv:2610.19645v1"
models: []
architectures: []
methods: [NVFP4, MXFP4]
tech: [microscaling-formats, activation-quant, weight-only]
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約
INT4 / INT8 / FP8 / FP4 / NVFP4 を同じシストリックアレイで走らせる Multi-Format Systolic Array(MFSA)の提案。Native Micro Scaling(MXFP/NVFP4 のブロックスケール)もアレイ側で処理。純粋ハードウェア論文。

## 手法 / 評価のポイント
- フォーマット: INT4 / INT8 / FP8 / FP4 / NVFP4 を単一アレイで実行
- 貢献: Native Micro Scaling のアレイ内処理
- 用途: Blackwell クラスで異種ビット幅を混在実行

## 注目度コメント
MFSA: multi-format systolic array (INT4/8, FP8/4/NVFP4) hardware
