---
id: "2026-W23-006"
type: paper
title: "LFQ: Logit-aware Final-block Quantization for Boosting the Generation Quality of Low-Bit Quantized LLMs"
url: "https://arxiv.org/abs/2605.29756"
discovered: "2026-06-01"
published: "2026-05-28"
authors: [Jung Hyun Lee, June Yong Yang, Jungwook Choi, Eunho Yang]
venue: "arxiv"
models: []
architectures: [transformer]
methods: []
tech: [weight-only, low-bit-4, low-bit-3, calibration, ptq]
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約
低ビット重み量子化において最終Transformerブロックをロジット分布のクロスエントロピーで最適化する手法。標準PTQではFP16モデルとの確率分布の乖離を直接最小化しないが、LFQは最終ブロックの量子化をロジット整合的に行うことで生成品質を向上させる。言語理解タスクはそのままに生成ベンチマークで顕著な改善。

## 手法
FPモデルの最終ブロック出力ロジットと量子化モデルのロジットのクロスエントロピーを損失関数として最終Transformerブロックのみ再最適化。全層再訓練に比べてコストが低く、既存のPTQフレームワークへの追加コンポーネントとして機能。

## 評価
- 対象モデル: LLMファミリー（詳細は要確認）
- ビット幅: 3〜4ビット（weight-only）
- 精度劣化: 生成品質ベンチマークで改善、言語理解は同等
- スループット/メモリ: 最終ブロック再最適化のみのため追加コスト最小

## 既存手法との差分
通常のPTQ（GPTQ, AWQ等）はタスク独立の重み量子化誤差最小化。LFQは最終層出力トークン確率分布の整合性を直接最適化するアプローチ。

## 注目度コメント
生成タスク特化の改善として実用的。既存PTQパイプラインへの差し込みが容易な点も利点。
