---
id: "2026-W27-014"
type: github
subtype: library
title: "casper-hansen/AutoAWQ: v0.5.0"
url: "https://github.com/casper-hansen/AutoAWQ/releases/tag/v0.5.0"
discovered: "2026-06-29"
published: "2026-06-27"
repo: "casper-hansen/AutoAWQ"
release_tag: "v0.5.0"
models: [Qwen/Qwen3.6, deepseek-ai/DeepSeek-V4, google/gemma-4]
architectures: [transformer, moe]
methods: [AWQ]
tech: [moe-quant, weight-only, low-bit-4, ptq, calibration]
priority: normal
sources: [github]
status: new
related: []
---

## 日本語要約
AutoAWQ v0.5.0 メジャー。Qwen3.6 ファミリー（27B / 35B-A3B-MoE / 40B / Omni）と Gemma 4 MoE 系の正式サポート。MoE モデル向けに「Expert-Aware Calibration」を導入し W26 MODE / W27 DeltaQuant とは独立に MoE 専用キャリブレーション機能を内製。Transformers v5 完全対応、Multi-GPU calibration（最大 8GPU 並列）。

## 量子化関連の主要変更
- **Expert-Aware Calibration**: MoE モデルの各エキスパート呼び出し回数に応じて calibration token を再配分
- **Qwen3.6 / Gemma 4 一族公式サポート**: モデル変換スクリプト同梱
- **Multi-GPU calibration**: 8-GPU 分散 calibration、calibration 時間を 70% 短縮
- **AWQ + AutoRound 互換**: AutoRound v0.13.x で生成された scale を読み込み可能
- **Gemma 4 multimodal**: 視覚 encoder 部分も AWQ 化（ChartQA -1.4pt）

## その他変更
- Transformers v5 移行、tied embeddings サポート
- compressed-tensors checkpoint 出力（vLLM 直接読み込み可）
- Python 3.13 サポート

## 注目度コメント
Qwen3.6 公式レシピ（W27-009）に対する AWQ 系の即応リリース。moe-quant が focus に間接ヒット。Gemma 4 multimodal の AWQ 化はサードパーティで初めて。focus 直接ヒットなし、normal priority。
