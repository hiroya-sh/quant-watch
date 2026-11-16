---
id: "2026-W47-018"
type: paper
title: "The Rise of Low Precision Floating Point"
url: "https://arxiv.org/abs/2611.00301"
discovered: "2026-11-16"
published: "2026-10-31"
authors: [arxiv:2611.00301]
venue: "arXiv:2611.00301"
models: []
architectures: []
methods: [NVFP4, MXFP4, MXFP6, LLM-FP4]
tech: [low-bit-fp4, low-bit-fp6, low-bit-fp8, mixed-precision]
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約
IEEE 754(FP32/FP64)支配下に 2010 年代後半から BF16, FP16 が入り、2020 年代に FP8 (E4M3/E5M2, OCP), FP6, FP4 (MXFP4, NVFP4, HiF4) が実装されるまでの**産業・標準化史**の総説。MX(micro-scaling)、NVFP4 の Blackwell native、OCP FP8 の意味、各フォーマットの数値範囲と scale の関係を整理。

## 手法
- サーベイ: 1985 IEEE754 → 2017 BF16 → 2020 OCP FP8 → 2024 MXFP → 2025 NVFP4 → 2026 OCP FP8 llama.cpp 着地まで
- フォーマット定義(E#M#, group scale, scale type)の比較表
- ハードウェアサポート一覧(TensorCore 世代別)

## 評価
- ベンチ論文ではなく解説

## 既存手法との差分
一つの資料で FP4/FP6/FP8 の設計空間を俯瞰できる文献が少ないため価値がある。

## 注目度コメント
火曜定例の**解説素材**として最適。本週 llama.cpp v1.0.0 で OCP FP8 KV cache が正式着地した今、FP8 系の由来・標準・互換性を 1 本で伝えられる文献。チーム共有向け。
