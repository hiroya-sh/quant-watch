---
id: "2026-W25-019"
type: hf_model
title: "unsloth/Gemma 4 QAT GGUF series (12B/26B/31B/E4B/E2B)"
url: "https://huggingface.co/unsloth/gemma-4-12B-it-qat-GGUF"
discovered: "2026-06-15"
published: "2026-06-10"
org: "unsloth"
base_model: "google/gemma-4"
models: [google/gemma-4]
architectures: [transformer, moe]
methods: [GGUF]
tech: [weight-only, low-bit-4, qat, calibration]
priority: normal
sources: [hf_models]
status: new
related: ["2026-W25-010", "2026-W24-008"]
---

## 日本語要約
unslothによるGemma 4全サイズ（12B, 26B A4B, 31B, E4B, E2B）のQAT+GGUF量子化モデル一括リリース。Googleが公開したQAT（量子化対応学習済み）チェックポイントをGGUF形式に変換し、llama.cppで実行可能。モバイル向けのmobile-GGUFも追加（E4B, E2B）。W24のGemma 4 12B NVFP4に続く、エッジ/ローカル実行向けの量子化エコシステム整備。

## モデル詳細
- 対象: gemma-4-12B-it-qat、gemma-4-26B-A4B-it-qat、gemma-4-31B-it-qat、gemma-4-E4B-it-qat、gemma-4-E2B-it-qat
- 量子化: QATチェックポイント→GGUF変換（q4_0, q4_K_M等）
- 特徴: QAT base使用による精度向上（PTQのみのGGUFより高精度の見込み）
- mobile-GGUF: スマートフォン・エッジデバイス向けの軽量版

## 注目度コメント
google/gemma-4がfocus model。QATチェックポイントのGGUF化は精度面でPTQのみよりアドバンテージあり。DiffusionGemmaのGGUF（unsloth/diffusiongemma-26B-A4B-it-GGUF）も同週に追加。llama.cppでのGemma 4完全カバーが実現。
