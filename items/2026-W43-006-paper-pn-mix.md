---
id: "2026-W43-006"
type: paper
title: "PN-Mix: Pair-Norm Guided Mixed-Precision Key Cache Quantization for Efficient Long-Output LLM Inference"
url: "https://arxiv.org/abs/2610.19605"
discovered: "2026-10-19"
published: "2026-10-14"
authors: ["Gil Jae Song", "Sungjoo Yoo"]
venue: "arXiv:2610.19605v1"
models: []
architectures: [transformer]
methods: []
tech: [mixed-precision, kv-cache-quant, long-context-quant]
priority: high
sources: [arxiv]
status: new
related: []
---

## 日本語要約
長出力(long-output)LLM の key cache 混合精度量子化。Pair-Norm という指標で key ペアの重要度を測り、重要ヘッドだけ高ビットに残す。既存の KV cache 量子化が long-output でブレることへの対処。

## 手法 / 評価のポイント
- 対象: long-output 推論の key cache
- 指標: Pair-Norm による key ペア重要度
- 配分: 重要 head を高ビット残し

## 注目度コメント
PN-Mix: Pair-Norm Guided Mixed-Precision Key Cache Quantization — focus:kv-cache-quant bump
