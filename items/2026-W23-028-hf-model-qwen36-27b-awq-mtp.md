---
id: "2026-W23-028"
type: hf-model
title: "shawnw3i/Qwen3.6-27B-AWQ-MTP"
url: "https://huggingface.co/shawnw3i/Qwen3.6-27B-AWQ-MTP"
discovered: "2026-06-01"
published: "2026-05-28"
base_model: "Qwen/Qwen3.6-27B"
models: [Qwen/Qwen3.6]
architectures: [transformer]
methods: [AWQ]
tech: [low-bit-4, weight-only, calibration]
priority: normal
sources: [hf-models]
status: new
related: []
---

## 日本語要約
Qwen3.6-27BのAWQ 4ビット量子化版（MTP対応）。W23期間中のAWQモデルで最多ダウンロード数（402）を記録。MTP（Multi-Token Prediction）サポートを含み、Qwen3.6系の効率的なローカル実行向け。

## 量子化仕様
- ベースモデル: Qwen/Qwen3.6-27B
- 量子化手法: AWQ（Activation-aware Weight Quantization）
- ビット幅: W4（重みのみ4ビット）
- 量子化対象: weight-only（activation はfp16）
- ファイルフォーマット: HuggingFace safetensors

## 精度報告(あれば)
- ベンチマーク: 未記載
- 劣化幅: AWQ標準的な劣化（1% PPL以内が典型）

## ダウンロード/利用状況
402 ダウンロード（W23 AWQモデル中最多）。MTP対応でspeculative decoding連携が可能。Qwen3.6の普及期においてAWQが依然として広く使われることを示す。
