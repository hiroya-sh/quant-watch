---
id: "2026-W26-005"
type: github
subtype: library
title: "vllm-project/llm-compressor: v0.12.0"
url: "https://github.com/vllm-project/llm-compressor/releases/tag/0.12.0"
discovered: "2026-06-22"
published: "2026-06-15"
repo: "vllm-project/llm-compressor"
release_tag: "0.12.0"
models: [nvidia/Nemotron]
architectures: [transformer, moe]
methods: [GPTQ, AWQ, SmoothQuant]
tech: [ptq, moe-quant, weight-only, activation-quant, full-quant, low-bit-fp8]
priority: high
sources: [github]
status: new
related: []
---

## 日本語要約
llm-compressor v0.12.0。Transformers v5への完全移行、MoEリニア化の刷新、Multi-GPU並列model-free PTQ、Nemotron Ultra FP8量子化サンプルの追加が主要変更。`load_context`という統一コンテキストマネージャへの集約でMoEローディングの複雑さを解消。Dataset splitのAPIをシンプル化（multi-stage legacy廃止）。vLLMプロジェクト傘下のcompressed-tensors連携基盤として機能。

## 量子化関連の主要変更
- **Transformers v5対応**: MoEリニア化を`load_context`で統一、tied embeddingsサポート改善
- **Multi-GPU Model-Free PTQ**: モデルフリーPTQを複数GPUに分散配置可能に。大規模モデルの量子化時間を大幅短縮
- **Nemotron Ultra FP8サンプル**: 550BパラメータのNemotron UltraをFP8量子化するサンプルスクリプト追加（model-free PTQ）
- **Dataset API簡略化**: `splits={"calibration": "train[:100]"}` → `split="train[:100]"` に簡素化

## その他変更
- `from_pretrained`でdtypeがautoにデフォルト変更
- 非標準モデル定義のMoEキャリブレーション拡張方法のドキュメント整備
- LM eval性能を維持したまま移行

## 注目度コメント
moe-quantがfocus。Transformers v5への移行は今後の大規模MoEモデル（DeepSeek-V4・Nemotron Ultra等）への量子化適用のインフラ整備として重要。Multi-GPU model-free PTQはキャリブレーション不要（activation観測なし）でのGPTQ/AWQ適用を複数GPUで並列化する機能。v0.11.0（W25収集）から2週間でのメジャーアップデート。
