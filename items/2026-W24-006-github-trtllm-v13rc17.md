---
id: "2026-W24-006"
type: github
subtype: library
title: "NVIDIA/TensorRT-LLM: v1.3.0rc17"
url: "https://github.com/NVIDIA/TensorRT-LLM/releases/tag/v1.3.0rc17"
discovered: "2026-06-08"
published: "2026-06-02"
repo: "NVIDIA/TensorRT-LLM"
release_tag: "v1.3.0rc17"
models: [nvidia/Nemotron, moonshotai/Kimi-K2.5, MiniMaxAI/MiniMax-M2.7, Qwen/Qwen3.5]
architectures: [transformer, moe]
methods: [NVFP4]
tech: [low-bit-fp4, kv-cache-quant, moe-quant, activation-quant, weight-only]
priority: high
sources: [github]
status: new
related: []
---

## 日本語要約
TRT-LLM v1.3.0シリーズ最新RC。NVFP4 KVキャッシュサポートのtrtllm-gen attentionへの統合、SM120/121向けFlashInfer NVFP4 MoEバックエンドが追加。MoE改善としてA2Aカーネルでのone-warp-per-token方針撤廃によるスループット向上、MoE DeepGEMMワークスペース最適化。新規モデルとしてMoT World Model、MiniMax-M2（multi-node TP）、Mistral Large 3を追加。Qwen3.5の推論パーサも統合。

## 量子化関連の変更点
- NVFP4 KVキャッシュ: trtllm-gen attentionに統合（KV圧縮をFP4で実現）
- FlashInfer NVFP4 MoEバックエンド: SM120/121（Blackwell）向け新設
- NVFP4エンジンサイズ推定の改善
- Mamba SSM キャッシュをfp32で安定化（NemotronV2精度劣化防止）
- MoE A2Aカーネル: one-warp-per-token廃止でスループット向上

## 影響範囲
- NVFP4 KVキャッシュが実装され、重み+KVの同時FP4化が可能に
- MiniMax-M2（1T MoE）のマルチノードTPが正式対応
- v1.3.0正式リリースまで残り数RC

## 注目度コメント
NVFPとkv-cache-quantが両方focus。NVFP4 KVキャッシュは「重みFP4+KV FP4」の完全FP4推論への重要ステップ。W23のTRT-LLM RC16(Gemma4マルチモーダル)と合わせてv1.3.0の全貌が見えてきた。
