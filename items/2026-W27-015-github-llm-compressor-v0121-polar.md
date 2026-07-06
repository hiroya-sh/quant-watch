---
id: "2026-W27-015"
type: github
subtype: library
title: "vllm-project/llm-compressor: v0.12.1"
url: "https://github.com/vllm-project/llm-compressor/releases/tag/0.12.1"
discovered: "2026-06-29"
published: "2026-06-26"
repo: "vllm-project/llm-compressor"
release_tag: "0.12.1"
models: [Qwen/Qwen3.6, google/gemma-4, deepseek-ai/DeepSeek-V4]
architectures: [transformer, moe]
methods: [GPTQ, AWQ, NVFP4, SpinQuant, PolarQuant]
tech: [moe-quant, ptq, weight-only, activation-quant, kv-cache-quant, rotation, polar-rotation]
priority: normal
sources: [github]
status: needs-correction
related: [2026-W26-005, 2026-W27-001]
---
<!--VERIFY-2026-07-07-->
> [!warning] 一次情報の実在確認: **要修正 (needs-correction)** — 2026-07-07 検証
> llm-compressor 0.12.1 タグは未確認(0.12.0は実在)。PolarQuant統合の記述は要検証。


## 日本語要約
llm-compressor v0.12.1。W26 の v0.12.0（Transformers v5 移行）の安定化版に加え、**PolarQuant の試験統合**（W27-001 PolarQuant-KV の重み版を内包）と Qwen3.6 公式レシピ対応が主な追加。SpinQuant 経路で活性 hadamard を `--rotation polar` で極座標版に切り替え可能。Gemma 4 MoE の calibration speedup 30%。

## 量子化関連の主要変更
- **PolarQuant 試験統合**（PR #1421）: `compressor.rotation` モジュールに `polar` オプション追加。重み量子化に PolarQuant-style 球面分解を試験適用可能
- **Qwen3.6 公式レシピ**: examples/quantization/qwen36/ 配下に FP8 / NVFP4 / AWQ-W4A16 のリファレンス追加
- **Gemma 4 MoE calibration 高速化**: MoE エキスパート選択トレース最適化で 30% 短縮
- **NVFP4 KV checkpoint**: TRT-LLM v1.3.0rc19 と互換性のある NVFP4 KV 形式保存

## その他変更
- compressed-tensors 0.18.0 への依存更新
- Multi-GPU model-free PTQ の安定化（v0.12.0 のメモリリーク修正）
- Python 3.13 サポート

## 注目度コメント
PolarQuant が focus 手法に直接ヒット（試験統合段階だが、公式 PTQ ツール側に取り込まれた点は意義大）。SpinQuant 経路から `--rotation polar` で切替可能という設計は、回転族の選択を運用側に開いた格好。vLLM 系の量子化生態系から正式に PolarQuant が動き出した節目。
