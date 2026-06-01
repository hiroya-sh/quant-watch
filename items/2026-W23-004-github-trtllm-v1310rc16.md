---
id: "2026-W23-004"
type: github
subtype: library
title: "NVIDIA/TensorRT-LLM: v1.3.0rc16"
url: "https://github.com/NVIDIA/TensorRT-LLM/releases/tag/v1.3.0rc16"
discovered: "2026-06-01"
published: "2026-05-26"
repo: "NVIDIA/TensorRT-LLM"
release_tag: "v1.3.0rc16"
models: [google/gemma-4, Qwen/Qwen3.5, Qwen/Qwen3.6, moonshotai/Kimi-K2.5]
architectures: [transformer, moe]
methods: [NVFP4, MXFP4]
tech: [low-bit-fp4, kv-cache-quant, moe-quant, low-bit-fp8]
priority: high
sources: [github]
status: new
related: []
---

## 日本語要約
TRT-LLM 1.3系の最新RC。量子化関連の主ハイライトはGemma4マルチモーダル正式対応（vision/audio tower込み）とQwen3.5 MTP・Qwen3.6-27B-FP8サポート。KVキャッシュブロックのexact multimodal KV block hashingを追加し、prefix reuse効率が向上。Gemma4はfocusモデルのため、本RC でのマルチモーダル量子化対応の確認が重要。

## 量子化関連の変更点
- 新規対応手法/フォーマット: legacy/1.x modelopt quant config 形式のサポート追加
- 既存手法の改善: CUDA 13 CUTLASS DSL パッケージへ更新、FMHA/FlashInfer TRTLLM-Gen パス改善
- 対応モデル拡張: Gemma4（vision+audio）、Qwen3.5 MTP、Qwen3.6-27B-FP8、EXAONE-4.5、Laguna

## 影響範囲
- ユーザ視点の変化: Gemma4マルチモーダルがTRT-LLMで量子化推論可能に（FP4/FP8対応継続）
- API/CLI 変更の有無: VisualGenArgs API リファクタ、sink_token_length削除

## 注目度コメント
google/gemma-4 はfocusモデル。マルチモーダル込みの量子化デプロイ（視覚・音声）がrc16で着地したことを確認する好機。v1.3.0正式リリースまでの残課題確認推奨。
