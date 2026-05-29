---
id: "2026-W22-012"
type: hf-model
title: "tgmerritt/gemma-4-26B-A4B-it-MXFP8W8A8"
url: "https://huggingface.co/tgmerritt/gemma-4-26B-A4B-it-MXFP8W8A8"
discovered: "2026-05-25"
published: "2026-05-25"
base_model: "google/gemma-4-26b-a4b-it"
models: [google/gemma-4]
architectures: [moe]
methods: []
tech: [microscaling-formats, low-bit-fp8, activation-quant, full-quant]
priority: high
sources: [hf-models]
status: new
related: []
---

## 日本語要約

google/gemma-4-26b-a4b-it（26B MoEモデル）にMXFP8 W8A8（重みとActivationの両方をMicroscaling FP8で量子化）を適用したコミュニティモデル。Microscaling FP8はNVIDIA Blackwellで高効率に動作するフォーマット。Gemma-4シリーズへのMXFP系量子化の初例であり、Hiroyaのfocusモデルへの直接適用として注目。vLLM経由での推論を想定。

## 量子化仕様

- ベースモデル: google/gemma-4-26b-a4b-it（MoEアーキテクチャ、Active 4B/Total 26B）
- 量子化手法: MXFP8 W8A8
- ビット幅: FP8（weight 8ビット、activation 8ビット）
- 量子化対象 (weight / activation / kv): weight + activation（full W8A8）
- ファイルフォーマット: vLLM compressed-tensors形式

## 精度報告(あれば)

- ベンチマーク: 未報告
- 劣化幅: 未報告

## ダウンロード/利用状況

公開直後（2026-05-25）のため0ダウンロード。Gemma-4の量子化需要は高く今後増加が見込まれる。
