---
id: "2026-W27-001"
type: paper
title: "GRINQH: Graded Input-based Quantization Hierarchy for Efficient LLM Generation"
url: "https://arxiv.org/abs/2606.23419"
discovered: "2026-07-07"
published: "2026-06-22"
authors: [Jette Oberländer, Jan Finkbeiner, Catherine M. Schöfmann, Emre Neftci]
venue: "arxiv"
affiliation: "（要確認: Neftci group）"
models: [meta-llama/Llama-3.1, Qwen/Qwen3]
architectures: [transformer]
methods: [GRINQH]
tech: [ptq, weight-only, mixed-precision, low-bit-2, low-bit-3, low-bit-4]
priority: normal
sources: [arxiv]
status: new
verified: "2026-07-07 arxiv abs 実在確認・abstract読了"
related: []
---

## 日本語要約
weight-only PTQ に量子化とスパース化を統合し、メモリ律速の decode 段を高速化するフレームワーク。activation の大きさを channel 重要度の代理指標とし、weight channel を動的に異なる精度レベルへ割り当てて decode 時の平均ビット幅を柔軟に変える。（以下は論文自身の主張）Llama3 / Qwen3 で 3–4bit の固定・混合精度ベースラインを上回り、実効 2bit 生成も可能。多精度格納向けの階層ネスト メモリ配置を用いた自作 GPU カーネルで速度向上を確認、と報告。

## 手法（abstract より）
- activation magnitude を代理指標にした graded（段階的）mixed-precision の weight-only 量子化
- 量子化とスパース化の統合
- 多精度 weight を格納する hierarchical nested memory layout + 専用カーネル

## 評価（論文主張値）
- 対象: Llama3, Qwen3
- 3/4bit で固定・混合精度ベースライン超、2bit 生成も実用と主張

## 注目度コメント
weight-only の mixed-precision + sparsity 統合。focus 直撃ではないが decode 高速化系として継続ウォッチ。数値は abstract の主張のみで、本文精査は未実施。
