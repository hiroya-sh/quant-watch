---
id: "2026-W27-012"
type: github
subtype: library
title: "NVIDIA/TensorRT-LLM: v1.3.0rc19"
url: "https://github.com/NVIDIA/TensorRT-LLM/releases/tag/v1.3.0rc19"
discovered: "2026-06-29"
published: "2026-06-25"
repo: "NVIDIA/TensorRT-LLM"
release_tag: "v1.3.0rc19"
models: [nvidia/Nemotron, deepseek-ai/DeepSeek-V4, google/gemma-4, Qwen/Qwen3.6]
architectures: [transformer, moe, hybrid, mamba2]
methods: [NVFP4, FPTQuant]
tech: [moe-quant, kv-cache-quant, low-bit-fp4, low-bit-fp8, weight-only, activation-quant]
priority: high
sources: [github]
status: new
related: [2026-W25-011]
---

## 日本語要約
TensorRT-LLM v1.3.0rc19。Blackwell 向け **NVFP4 KV キャッシュのネイティブカーネル統合** が最大の変更で、W26 ScaleSweep / W27 PolarQuant-KV の理論を受けた実装側の追随。Nemotron-Ultra Hybrid（Mamba-Transformer）の NVFP4 KV、Gemma 4 MoE 対応、DeepSeek-V4-Pro の prefill scheduler 改善も含む。Hopper 向け FP8 KV からの実機ベンチマークで decode +28%。

## 量子化関連の主要変更
- **NVFP4 KV ネイティブカーネル**（PR #6843）: Blackwell B200/B300 で WGMMA を活用した FP4 KV 推論カーネル統合。Hopper では emulated mode
- **Nemotron-Hybrid NVFP4 KV**: Mamba2 ステートとアテンション KV を統合管理する mixed-context cache 実装
- **Gemma 4 公式 NVFP4 対応**（PR #6889）: nvidia/Gemma-4-31B-NVFP4 公式モデルカードの推論パスを追加
- **DeepSeek-V4-Pro prefill scheduler**: 1.6T MoE モデルの prefill 段階で expert 群を chunked dispatch
- **Qwen3.6 W27 公式レシピ対応**: Qwen Team 量子化レシピ統合（NVFP4 / FP8 両構成）

## その他変更
- Hybrid Mamba-Transformer の KV cache vs SSM state の統合ストレージ設計
- TRT 11.0 への依存更新（Blackwell B300 PCIe 完全サポート）
- compressed-tensors / llm-compressor との checkpoint 互換性改善

## 注目度コメント
NVFP4 が focus、kv-cache-quant も focus。NVFP4 KV のハードウェアネイティブ実装は W26 ScaleSweep / W27 PolarQuant-KV の理論成果が即時実装される稀有な好例。Blackwell エコシステムが完成段階に入ったことを示す。火曜定例の議題候補（実装エコシステム側の代表として）。
