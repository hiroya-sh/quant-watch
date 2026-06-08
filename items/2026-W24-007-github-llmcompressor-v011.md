---
id: "2026-W24-007"
type: github
subtype: library
title: "vllm-project/llm-compressor: v0.11.0"
url: "https://github.com/vllm-project/llm-compressor/releases/tag/v0.11.0"
discovered: "2026-06-08"
published: "2026-06-02"
repo: "vllm-project/llm-compressor"
release_tag: "v0.11.0"
models: [google/gemma-4, Qwen/Qwen3.5, Qwen/Qwen3.6, moonshotai/Kimi-K2.5, deepseek-ai/DeepSeek-V4]
architectures: [transformer, moe]
methods: [AWQ, SmoothQuant]
tech: [weight-only, activation-quant, calibration, moe-quant, low-bit-4]
priority: high
sources: [github]
status: new
related: []
---

## 日本語要約
vLLMエコシステムの量子化ライブラリv0.11.0。最大の変更点はDDP（分散データ並列）でのAWQ・SmoothQuant対応で最大3.2倍のキャリブレーション高速化を実現。Compressed Tensors APIの大規模リファクタリングも実施。新規モデルサポートとしてGemma 4（6月3日リリースの新モデル）、Qwen 3.5/3.6、Kimi K2.6、実験的DeepSeek-V4を追加。

## 量子化関連の変更点
- DDP対応AWQ/SmoothQuant: 複数GPUでの分散キャリブレーション、最大3.2x高速化
- Compressed Tensors API リファクタリング: compressed-tensors v0.17.0と連動
- 新規モデル: Gemma 4（12B含む）、Qwen3.5/3.6、Kimi K2.6、DeepSeek-V4（実験的）
- INT量子化のEmbedding層対応

## 影響範囲
- 大型MoEモデルのキャリブレーションが実用的に（分散処理で時間削減）
- Gemma 4 12B（week内リリース）への即日量子化対応
- vLLM本体の量子化パイプラインが強化

## 注目度コメント
moe-quantとGemma 4（focus model google/gemma-4）がともに対象。DDP 3.2xはKimi-K2/DeepSeek-V4規模の量子化を実用化するインパクト。Gemma 4の当週リリースと同週の対応で即日統合の加速を示す。
