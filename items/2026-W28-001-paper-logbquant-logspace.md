---
id: "2026-W28-001"
type: paper
title: "Log_b Quant: Quantizing Language Models in Logarithmic Space"
url: "https://arxiv.org/abs/2607.01127"
discovered: "2026-07-07"
published: "2026-07-01"
authors: [Jeremias Bohn, Tizian Dippold, Mahdi Koubaa, Elias R. Wahl, Georg Groh]
venue: "arxiv (cs.CL)"
affiliation: "（TU Munich / Georg Groh group と推定, 要確認）"
models: []
architectures: [transformer]
methods: [LogbQuant]
tech: [weight-only, low-bit-4, ptq]
priority: normal
sources: [arxiv]
status: new
verified: "2026-07-07 arxiv abs 実在確認・abstract読了 (Submitted 1 Jul 2026)"
related: []
---

## 日本語要約
重みを**対数空間（非一様コードブック）**で量子化する手法 LogbQuant。基数(base)を調整して、一般的なパラメータ分布に適合させる。（論文主張）「低頻度・高振幅の重み」により一様コードブックは表現が最適でない、という問題意識から出発。tensor-wise 粒度の非対称線形量子化に対し 4bit で優位、適度な速度向上と大きなメモリ削減を主張。consumer-grade GPU がターゲット。

## 手法（abstract より）
- 基数可変の対数（非一様）weight 量子化コードブック
- tensor-wise 粒度、PTQ

## 注目度コメント
非一様量子化の新提案。focus 直撃ではないが weight-only の基礎研究として記録。対象モデルは abstract に明記なし。
