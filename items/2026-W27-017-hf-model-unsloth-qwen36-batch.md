---
id: "2026-W27-017"
type: hf-model
title: "unsloth/Qwen3.6 batch: FP8 + GGUF + AWQ across 27B / 35B-A3B / 40B"
url: "https://huggingface.co/unsloth/Qwen3.6-35B-A3B-FP8"
discovered: "2026-06-29"
published: "2026-06-25"
base_model: "Qwen/Qwen3.6"
models: [Qwen/Qwen3.5, Qwen/Qwen3.6]
architectures: [transformer, moe]
methods: [GGUF, AWQ]
tech: [low-bit-fp8, low-bit-4, weight-only, moe-quant]
priority: normal
sources: [hf-models]
status: new
model_ids:
  - "unsloth/Qwen3.6-27B-FP8"
  - "unsloth/Qwen3.6-27B-GGUF"
  - "unsloth/Qwen3.6-27B-AWQ"
  - "unsloth/Qwen3.6-35B-A3B-FP8"
  - "unsloth/Qwen3.6-35B-A3B-GGUF"
  - "unsloth/Qwen3.6-35B-A3B-AWQ"
  - "unsloth/Qwen3.6-40B-FP8"
  - "unsloth/Qwen3.6-40B-GGUF"
related: [2026-W27-009]
---

## 日本語要約
unsloth による Qwen3.6 ファミリーの一斉量子化リリース。W27-009 Qwen Team 公式量子化技術報告と同期し、27B（dense）/ 35B-A3B（MoE）/ 40B（dense）に対し FP8 / GGUF / AWQ-W4A16 の 3 形式を 8 種類で公開。公式レシピと一致する calibration 設定を採用し、unsloth 名義の信頼性を確保。Qwen3.6 ローカル推論用途のリファレンス。

## モデル情報
- **ベースモデル**: Qwen/Qwen3.6-27B / 35B-A3B / 40B
- **アーキテクチャ**: dense（27B / 40B）、MoE（35B-A3B）
- **多言語**: 英語・中国語・日本語含む 60+ 言語

## 量子化バリアント
- **FP8**: W8A8 + KV8、transformers / vLLM 形式
- **GGUF**: Q4_K_M / Q5_K_M / Q6_K / IQ3_KS / IQ2_XXS の 5 quant
- **AWQ-W4A16**: AutoAWQ v0.5.0 で生成
- **License**: Tongyi Qianwen License Agreement

## 精度報告
- 公式レシピと同 calibration の MMLU/GSM8K/HumanEval 結果を README に掲載
- 35B-A3B MoE で AWQ-W4A16 が MMLU -1.0pt（公式 -0.9pt と整合）

## ダウンロード/利用状況
- 35B-A3B-FP8 が 24 時間で 12K downloads（W27 最多）
- llama.cpp b9878 で公式 GGUF 直接読み込み可能

## 注目度コメント
Qwen3.6 公式レシピと unsloth リリースのタイミング同期は W27 のエコシステム成熟度を象徴。focus 直接ヒットなし、normal priority。Qwen3.6 はモデル系統として taxonomy 追加候補。
