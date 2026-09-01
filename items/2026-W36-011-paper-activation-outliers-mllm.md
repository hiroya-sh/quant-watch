---
id: "2026-W36-011"
type: paper
title: "Activation Outliers Matter: Robust Recovery for Quantized Multimodal LLMs"
url: "https://arxiv.org/abs/2608.26581"
discovered: "2026-09-01"
published: "2026-08-27"
venue: "arXiv (cs.LG)"
models: []
architectures: [transformer]
methods: [MXFP4, MXFP6, HiF4]
tech: [activation-quant, outlier-handling, low-bit-fp4, microscaling-formats, mixed-precision]
priority: normal
sources: [arxiv]
status: new
related: []
---
## 日本語要約
低ビット量子化は MLLM の計算・メモリ要求を下げる有望な道。MXFP8 から MXFP4 / HiF4 のような超低ビットまで、低精度フォーマットへのハードウェア対応が進み、効率的な MLLM 学習・展開の研究が加速している。本論文は動画生成と推論タスクにまたがる代表的 MLLM でこれらの量子化スキームを体系的に調べた。

## 評価
- **MXFP8 はほぼ無損失**
- **積極的な 4bit 量子化は有意に劣化**
- 広範な ablation により、**劣化の主因は activation 量子化**であり、重み量子化よりはるかに大きく寄与すると同定

## 手法
この観察に基づき **Residual Fallback** を提案(activation 側の外れ値に対する残差フォールバック)。

## 既存手法との差分
MLLM で「重みか活性か」を切り分け、活性が主因であることを定量化。

## 注目度コメント
「MXFP8 は安全、MXFP4 は活性が壁」は W34 の *Spec Sheets Are Not Kernels* とも整合。HiF4 は taxonomy に既登録。
