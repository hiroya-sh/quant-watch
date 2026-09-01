---
id: "2026-W35-002"
type: paper
title: "SchurQuant: Groupwise Discrete Optimization for Layer-Wise LLM Quantization"
url: "https://arxiv.org/abs/2608.15567"
discovered: "2026-09-01"
published: "2026-08-16"
venue: "arXiv (cs.LG)"
models: [Qwen/Qwen3]
architectures: [transformer]
methods: [GPTQ, SchurQuant]
tech: [weight-only, ptq, low-bit-2, low-bit-3, block-wise]
priority: normal
sources: [arxiv]
status: new
related: []
---
## 日本語要約
weight-only PTQ は 2-3bit で精度が崩壊する。既存の逆伝播フリー PTQ 最適化には2つの限界がある — (1) グループ単位の決定が「残りの連続部分が吸収できる補正」を無視する、(2) 離散的な refinement がアフィン量子化グリッドを固定したままにする。SCHUROPT は残余の最適連続応答を解析的に消去し、Schur 補行列の曲率をもつ厳密な groupwise 二次形式を導く。

## 手法
閉形式の行単位 scale / zero-point 再フィットと、整数コード上の coordinate descent を交互に回す。GPTQ の目的関数は固定したまま置き換え可能。

## 評価
- **2-bit Qwen3-4B で平均 zero-shot 精度 +11.88 ポイント**(GPTQ 目的関数固定時)
- ただし高精度側では「再構成誤差を詰めても end-model 指標が一貫して改善するとは限らない」と自ら注記

## 既存手法との差分
グリッド固定を外し、suffix の連続応答を Schur 補で解析的に畳み込む点。

## 注目度コメント
2bit 域の +11.88pt は大きい。llm-compressor 0.13.0 の W2-W7 任意ビット幅プリセットと組み合わせて評価できる可能性。手法名 SchurQuant / SCHUROPT は taxonomy 未登録。
