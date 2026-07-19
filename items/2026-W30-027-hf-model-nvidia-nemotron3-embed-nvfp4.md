---
id: "2026-W30-027"
type: hf-model
title: "nvidia/Nemotron-3-Embed-1B-NVFP4 — NVFP4 量産ラインが埋め込みモデルへ拡大"
url: "https://huggingface.co/nvidia/Nemotron-3-Embed-1B-NVFP4"
discovered: "2026-07-20"
published: "2026-07-14"
base_model: "nvidia/Nemotron-3-Embed-1B-BF16"
models: [nvidia/Nemotron]
architectures: [transformer, dense]
methods: [NVFP4]
tech: [low-bit-fp4, weight-only, vllm-ready]
priority: high
sources: [hf-models]
status: new
verified: "2026-07-20 HF API で確認(createdAt 2026-07-14, quant_method=modelopt 4bit Linear, arch=Ministral3Model, vllm タグあり, 6.7k DL / 51 likes)"
related: []
---

## 日本語要約
NVIDIA 公式の **埋め込みモデル NVFP4 版**。Nemotron-3-Embed-1B(内部アーキテクチャは Ministral3Model ベース、sentence-similarity)を ModelOpt で Linear 4bit 化。NVIDIA の NVFP4 量産ラインはこれまで生成 LLM 中心だったが、retrieval/RAG スタックの埋め込み側にも公式 NVFP4 が出てきた。カードに vllm タグあり。

## 注目度コメント
「量子化の対象が生成 LLM から埋め込みへ広がる」今週のトレンド(microsoft/bitnet-embedding と同週)の代表例。NVFP4 focus + vllm-ready bump で high。RAG パイプライン全体を FP4 で回す構成が現実味を帯びる。
