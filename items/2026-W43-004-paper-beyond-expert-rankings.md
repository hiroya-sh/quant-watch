---
id: "2026-W43-004"
type: paper
title: "Beyond Expert Rankings: Contrast Calibration for Mixed-Precision MoE Quantization"
url: "https://arxiv.org/abs/2610.20353"
discovered: "2026-10-19"
published: "2026-10-15"
authors: ["Renjie Xie", "Juncheng Yang", "Aoting Hu", "Yan Liang", "Mingxi Zhang"]
venue: "arXiv:2610.20353v1"
models: []
architectures: [moe]
methods: []
tech: [mixed-precision, calibration, moe-quant]
priority: high
sources: [arxiv]
status: new
related: []
---

## 日本語要約
MoE 量子化の層配分で、エキスパートランキングではなく **専門度 vs 平均度のコントラスト** を校正シグナルに使う。混合精度割当の精度が、単純順位付けより良くなる主張。focus:moe-quant 直撃。

## 手法 / 評価のポイント
- 対象: MoE の mixed-precision 配分
- 校正シグナル: expert の専門度 vs 平均度のコントラスト
- 位置づけ: 2610.20826 の negative と対になる positive 提案

## 注目度コメント
Contrast Calibration for Mixed-Precision MoE Quant — focus:moe-quant bump
