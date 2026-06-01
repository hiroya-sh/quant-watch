---
id: "2026-W23-021"
type: hf-model
title: "NeuralNet-Hub/gemma-4-31B-it-abliterated-uncensored-NVFP4"
url: "https://huggingface.co/NeuralNet-Hub/gemma-4-31B-it-abliterated-uncensored-NVFP4"
discovered: "2026-06-01"
published: "2026-05-28"
base_model: "google/gemma-4-31B-it"
models: [google/gemma-4]
architectures: [transformer, moe]
methods: [NVFP4]
tech: [low-bit-fp4, weight-only, activation-quant, microscaling-formats, moe-quant]
priority: high
sources: [hf-models]
status: new
related: []
---

## 日本語要約
focusモデル google/gemma-4-31B-it の NVFP4 量子化版をコミュニティが公開。gemma-4（31B MoE）とNVFP4の両方がfocusアイテムであり、二重の注目点を持つ。NeuralNet-Hub による abliterated（censorship 除去）バリアント。Blackwell GPU での直接実行を想定。W23内でNVIDIA公式Qwen3.6 NVFP4 (021) に続く重要なNVFP4モデル事例。

## 量子化仕様
- ベースモデル: google/gemma-4-31B-it（31B MoE構成）
- 量子化手法: NVFP4
- ビット幅: FP4（NVFP4フォーマット）
- 量子化対象: weight + activation（線形演算子）
- ファイルフォーマット: HuggingFace safetensors

## 精度報告(あれば)
- ベンチマーク: 未記載（コミュニティモデルのため詳細なし）
- 劣化幅: 不明

## ダウンロード/利用状況
focusモデルのgemma-4がNVFP4で量子化されたことで、Blackwellユーザーがgemma-4-31Bを低メモリで実行可能に。gemma-4の31Bバリアントは26B-A4Bとは異なるサイズ（31B MoE）であり、TRT-LLM RC16との対応状況を確認価値あり。
