---
id: "2026-W34-008"
type: paper
title: "ReRound: Reconstructive Rounding to Resolve Midpoint Ambiguity in Calibration-Free LLM Quantization"
url: "https://arxiv.org/abs/2608.11045"
discovered: "2026-08-17"
published: "2026-08-12"
authors: [He-Yen Hsieh, H. T. Kung]
venue: "arXiv"
models: []
architectures: [transformer]
methods: []
tech: [calibration-free, ptq, weight-only, low-bit-4, low-bit-3]
priority: normal
sources: [arxiv]
status: new
related: []
---
## 日本語要約
ReRound は RTN の中点曖昧性(量子化区間の中心近傍の重み)を解消する PTQ。条件付き拡散モデルで低ビット重みの連続再構成を生成し、それを丸め方向のガイド信号に使う。中点からの距離を測る tolerance 指標を導入し、中点近傍は拡散再構成で、境界近傍は通常 RTN で量子化。tolerance を掃引して複数候補を作り、脱量子化後の主特異値が最良の候補を選ぶ。calibration-free。

## 手法
拡散再構成 × RTN のハイブリッド丸め。校正データ不要で中点付近の丸め誤差を低減。

## 評価
- 対象モデル: LLM(事前学習済み)
- ビット幅: 4bit / 3bit weight-only
- 特徴: calibration-free

## 既存手法との差分
校正不要かつ拡散生成をガイドに使う丸め改善は新規。RTN の弱点(中点曖昧性)にピンポイント。

## 注目度コメント
calibration-free で低ビット精度を上げる方向。手法名 ReRound は taxonomy 未登録。
