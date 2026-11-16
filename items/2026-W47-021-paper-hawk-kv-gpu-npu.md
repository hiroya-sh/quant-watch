---
id: "2026-W47-021"
type: paper
title: "HAWK: Heterogeneity-Aware KV Cache Transfer for Efficient GPU-NPU Phase-Disaggregated LLM Inference"
url: "https://arxiv.org/abs/2610.29873"
discovered: "2026-11-16"
published: "2026-10-22"
updated: "2026-11-11"
authors: [arxiv:2610.29873]
venue: "arXiv:2610.29873 v2"
models: []
architectures: []
methods: []
tech: [kv-cache-quant]
priority: normal
sources: [arxiv]
status: updated
related: []
---

## 日本語要約
GPU と NPU を**フェーズ分離**して LLM 推論する(prefill = GPU, decode = NPU)。この構成の律速は **KV cache の GPU → NPU 転送**で、KV のフォーマット・型・layout がデバイス間で異なる。HAWK は転送時に **on-the-fly quantize + repack** を行い、GPU 側で NVFP4/FP8 KV、NPU 側で int8 KV に自動変換する。v2 (2026-11-11 update) で Qualcomm Snapdragon NPU の実機測定を追加。

## 手法
- heterogeneity-aware transfer: GPU KV format → NPU 向け quantized KV
- prefill 中にパイプライン化(decode 開始までに転送完了)
- バッチ内で per-layer 選択的に量子化

## 評価
- GPU: H100/L40S + NPU: Snapdragon / Jetson
- prefill-decode disaggregation の end-to-end latency
- KV 転送帯域削減

## 既存手法との差分
Mooncake / DistServe は prefill-decode disaggregation を提案したが、両側とも GPU。HAWK は**異種デバイス間**で量子化と転送を融合。

## 注目度コメント
エッジ-クラウド協調のユースケース(Snapdragon llama.cpp + クラウド prefill)の下地。[[items/2026-W47-009-github-llamacpp-v100|llama.cpp v1.0.0]] の Hexagon NVFP4 サポートと方向が一致。
