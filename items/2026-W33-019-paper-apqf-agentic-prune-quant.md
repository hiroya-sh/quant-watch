---
id: "2026-W33-019"
type: paper
title: "APQF: Agentic Profiling-Guided Structured Pruning and Mixed-Precision Quantization with Adaptive Fine-Tuning"
url: "https://arxiv.org/abs/2608.05499"
discovered: "2026-08-10"
published: "2026-08-06"
authors: [Sadegh Jafari, Mohiuddin Bilwal, Fan Zhou]
venue: "arXiv"
models: []
architectures: []
methods: []
tech: [mixed-precision, qat, block-wise]
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約
剪定と量子化は手動の専門的選択やアーキ横断で使いにくいアルゴリズムに依存する。一様設定は層ごとの圧縮感度の違いを無視し精度を損なう。APQFは構造化剪定+mixed-precision QAT+精度回復を1つの自動パイプラインに統合。

## 手法
profiling agentがモデル横断でコスト分布と剪定感度を測定し、その情報でmixed-precision QATと適応ファインチューニングを駆動する自動化フレームワーク。

## 評価
- 対象モデル: DNN(エッジ向け)
- ビット幅: mixed-precision (QAT)
- 精度劣化: 層感度に応じた圧縮で精度維持
- スループット/メモリ: エッジ配備の高速化

## 既存手法との差分
手動の剪定/量子化選択を、profiling agentによる自動プロファイル駆動に置換。

## 注目度コメント
剪定×量子化の自動化。agenticプロファイリングという枠組みは面白いがLLM特化ではない。
