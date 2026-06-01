---
id: "2026-W23-005"
type: hf-model
title: "nvidia/Qwen3.6-35B-A3B-NVFP4"
url: "https://huggingface.co/nvidia/Qwen3.6-35B-A3B-NVFP4"
discovered: "2026-06-01"
published: "2026-05-28"
base_model: "Qwen/Qwen3.6"
models: [Qwen/Qwen3.6]
architectures: [transformer, moe]
methods: [NVFP4]
tech: [low-bit-fp4, moe-quant, weight-only, activation-quant, microscaling-formats]
priority: high
sources: [hf-models]
status: new
related: []
---

## 日本語要約
NVIDIAが公開したQwen3.6-35B-A3B の公式NVFP4量子化版。nvidia-modelopt v0.44.0を使用し、transformer内線形演算子のweights+activationsをNVFP4に量子化。FP16比でディスク・GPUメモリを約3.06x削減。Hopper/Blackwell対応で、テスト環境はNVIDIA GB300。vLLMで`--quantization modelopt`として即使用可能。

## 量子化仕様
- ベースモデル: Qwen/Qwen3.6-35B-A3B
- 量子化手法: NVFP4 (nvidia-modelopt v0.44.0)
- ビット幅: FP4
- 量子化対象: weight + activation（transformer blocks内線形層のみ）
- ファイルフォーマット: HuggingFace Transformers (safetensors)

## 精度報告(あれば)
- ベンチマーク: modelopt内部評価（詳細は要確認）
- 劣化幅: 最小限（FP8ベースラインと比較、Qwen3.5-397B NVFP4版で MMLU Pro 0.880 vs 0.883相当と類似の傾向）

## ダウンロード/利用状況
NVIDIA公式アカウントからの公開で信頼性高。Qwen3.6の最新MoEモデルにNVFP4が即日対応したことを示す重要マイルストーン。context length 262,144トークン対応。
