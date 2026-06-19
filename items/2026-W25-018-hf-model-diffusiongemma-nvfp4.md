---
id: "2026-W25-018"
type: hf_model
title: "nvidia/diffusiongemma-26B-A4B-it-NVFP4"
url: "https://huggingface.co/nvidia/diffusiongemma-26B-A4B-it-NVFP4"
discovered: "2026-06-15"
published: "2026-06-11"
org: "nvidia"
base_model: "google/diffusiongemma-26B-A4B-it"
models: [google/gemma-4]
architectures: [transformer, moe]
methods: [NVFP4]
tech: [low-bit-fp4, moe-quant, weight-only, activation-quant]
priority: high
sources: [hf_models]
status: new
related: ["2026-W25-010", "2026-W24-008"]
---

## 日本語要約
Google DiffusionGemma 26B A4B（Gemma 4拡散型マルチモーダルモデル）のNVIDIA公式NVFP4量子化。量子化後14B相当のサイズ。Apache 2.0ライセンス。RedHatAIも同日にFP8-dynamic版とNVFP4版を公開。DiffusionGemmaはGemma 4ファミリーの新バリアント（テキスト+画像+音声+動画を統合した拡散アーキテクチャ）であり、W24に続くGemma 4量子化エコシステムの拡充。

## モデル詳細
- ベースモデル: google/diffusiongemma-26B-A4B-it（Gemma 4ファミリー、MoE 26B→4B active、拡散型）
- 量子化: NVFP4（量子化後14B相当）
- ライセンス: Apache 2.0
- 推論: vLLM v0.23.0+（Gemma 4 encoder-free対応）

## 注目度コメント
NVFPとgemma-4がfocus。DiffusionGemmaという新しいモデルバリアント（拡散型マルチモーダル）への即日NVFP4対応は、W24のGemma 4 12B翌日NVFP4と同じパターン。マルチモーダル拡散モデルへの量子化適用事例として注目。
