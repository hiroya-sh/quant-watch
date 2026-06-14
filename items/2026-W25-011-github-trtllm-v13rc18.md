---
id: "2026-W25-011"
type: github
subtype: library
title: "NVIDIA/TensorRT-LLM: v1.3.0rc18"
url: "https://github.com/NVIDIA/TensorRT-LLM/releases/tag/v1.3.0rc18"
discovered: "2026-06-15"
published: "2026-06-10"
repo: "NVIDIA/TensorRT-LLM"
release_tag: "v1.3.0rc18"
models: [nvidia/Nemotron, Qwen/Qwen3.5, deepseek-ai/DeepSeek-V4]
architectures: [transformer, moe, hybrid]
methods: [NVFP4]
tech: [low-bit-fp4, moe-quant, kv-cache-quant]
priority: high
sources: [github]
status: new
related: ["2026-W24-006"]
---

## 日本語要約
TRT-LLM v1.3.0シリーズのRC18。最大のトピックはNemotron-H（NVIDIAのHybrid SSM+Transformer）のNVFP4チェックポイントサポートをHopper GPUに追加したこと。NIXLをv1.0.1・UCXを1.21にアップグレード。Qwen3.5向けFlashInfer GDNデコーディングカーネルを追加。per-expert LoRAとCutlassバックエンド対応。Mamba hybrid state更新のTritonカーネル。

## 量子化関連の変更点
- Nemotron-H NVFP4チェックポイント: Hopper GPU（H100/H200）でNVFP4量子化済みNemotron-H (SSM+Transformer hybrid)を実行可能に
- DeepGEMM Fused MoEのfused masked gather最適化
- Disk cache config for KVCacheManagerV2（KVキャッシュのディスクオフロード設定追加）

## その他変更
- モデル追加: Step-3.7-Flash、Cosmos3-Nano/Super、AFMoE Trinity
- FlashInfer GDNデコーディングカーネル: Qwen3.5向け高速化
- per-expert LoRAサポート（Cutlassバックエンド）
- NIXL v1.0.1 / UCX 1.21にアップグレード

## 注目度コメント
NVFPがfocus、Nemotron-HのHopper NVFP4対応がW25の量子化ニュース。RC18はW24のRC17（NVFP4 KVキャッシュ）に続くNVFP4機能拡充。v1.3.0正式リリースまで残り少数RC。Nemotron-HはSSM+Transformer hybridアーキテクチャの量子化実用事例として希少。
