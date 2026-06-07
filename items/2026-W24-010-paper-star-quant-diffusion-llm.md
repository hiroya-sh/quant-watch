---
id: "2026-W24-010"
type: paper
title: "STaR-Quant: State-Time Consistent Post-Training Quantization for Diffusion Large Language Models"
url: "https://arxiv.org/abs/2606.04945"
discovered: "2026-06-08"
published: "2026-06-03"
authors: [Xin Yan, Aqiang Wang, Zhenglin Wan, Xingrui Yuan, Ivor Tsang]
venue: "arxiv"
models: []
architectures: [transformer]
methods: []
tech: [ptq, activation-quant, calibration, low-bit-4, low-bit-8]
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約
拡散LLM（DLLM: Diffusion Large Language Model）の量子化に特化したPTQフレームワーク。マスクトークンと非マスクトークンで活性化分布が異なる（State不一致）こと、繰り返しノイズ除去ステップで量子化誤差が累積すること（Time不一致）の2問題を特定。State-Guided Activation Transformation（SGAT）とTemporal Attention Compensation（TAC）でそれぞれ対処。FP16比で最大1.69xスループット、3.14xメモリ削減を達成。

## 手法
- SGAT: マスク/非マスクトークンを別変換空間に誘導しつつ、重み側変換は統一
- TAC: ブロック対角アフィン写像で量子化後のアテンション誤差を補正
- 対象: Discrete Diffusion LLM (MDLM/PLAID等の系統)

## 評価
- 対象: 代表的なDLLM複数（具体モデル名は論文参照）
- 結果: 1.69xスループット向上、3.14xメモリ削減 vs FP16
- 品質: DLLMのテキスト生成品質を維持

## 既存手法との差分
拡散LLM（自己回帰LLMとは異なるアーキテクチャ）への量子化はほぼ未開拓領域。W23のJensenBiasKV（動画拡散モデルKV量子化）と並び、非自己回帰型LLM量子化への拡張という観点で注目。

## 注目度コメント
拡散LLMは自己回帰LLMとは異なる量子化課題を持つ新領域。MDLM等が普及すれば量子化の重要性が増す。watch継続。
