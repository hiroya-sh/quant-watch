---
id: "2026-W33-001"
type: paper
title: "HiFloat4 Format for End-To-End Reinforcement Learning Post-Training of Large Language Models"
url: "https://arxiv.org/abs/2607.26515"
discovered: "2026-08-10"
published: "2026-07-29"
authors: [Hei Yi Mak, Shadan Golestan, Hoang Le]
venue: "arXiv"
models: []
architectures: [transformer]
methods: [LLM-FP4, HiF4]
tech: [low-bit-fp4, qat, activation-quant]
priority: high
sources: [arxiv]
status: new
related: []
---

## 日本語要約
初のエンドツーエンドFP4 RLポストトレーニング。ロールアウト方策と学習方策の双方(順・逆伝播とも)を4bitで動かす。劣化の主因は学習側の量子化誤差ではなく**ロールアウト活性の量子化**であり、外れ値がダイナミックレンジを引き伸ばしFP4で多数の活性が0にアンダーフローすることを系統的に示した。

## 手法
HiFloat4という新FP4フォーマットで活性のアンダーフローを緩和。学習方策のみ高精度に戻すとフルFP4より悪化する(ロールアウト/学習のミスマッチが主因)ことを実証し、両者をFP4で揃える設計を採る。

## 評価
- 対象モデル: LLM (RL post-training)
- ビット幅: FP4 (weight+activation, forward+backward)
- 精度劣化: ロールアウト活性のアンダーフローが主劣化要因と特定
- スループット/メモリ: FP4 e2e で学習を高速化

## 既存手法との差分
従来のFP4学習研究(NVFP4/MXFP4学習)がforward中心だったのに対し、RLのロールアウト-学習ミスマッチという新しい失敗モードを提示。

## 注目度コメント
FP4学習フロンティアがSFTからRLへ拡張。ロールアウト活性のアンダーフローという知見は評価環境設計に直結し議題候補。
