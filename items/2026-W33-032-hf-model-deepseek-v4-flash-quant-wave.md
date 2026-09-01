---
id: "2026-W33-032"
type: hf-model
title: "DeepSeek-V4-Flash-0731 量子化ウェーブ (GGUF/MXFP4/NVFP4/W4A16/W4A8)"
url: "https://huggingface.co/AtomicChat/DeepSeek-V4-Flash-0731-GGUF"
discovered: "2026-08-10"
published: "2026-08-01"
base_model: "deepseek-ai/DeepSeek-V4-Flash-0731"
models: [deepseek-ai/DeepSeek-V4]
architectures: [moe]
methods: [GGUF, MXFP4, NVFP4, GPTQ]
tech: [low-bit-fp4, moe-quant, weight-only, vllm-ready, llamacpp-ready]
priority: high
sources: [hf-models]
status: new
related: []
---

## 日本語要約
2026-07-31公開のDeepSeek-V4-Flash-0731に対し、公開直後から広範な量子化ウェーブ。GGUF(AtomicChat: 14,470 DL)、MXFP4(apetersson DS4-Quality128: 12,864 DL)、NVFP4、W4A16(baicai1145: 469 DL)、W4A8/Int4-FP8など主要フォーマットが数日内に出揃った。abliterated/vision派生も多数。

## 量子化仕様
- ベースモデル: DeepSeek-V4-Flash-0731 (MoE)
- 量子化手法: GGUF各種 / MXFP4 / NVFP4 / GPTQ-W4A16 / W4A8
- ビット幅: 4bit中心(MXFP4/NVFP4/W4A16)、一部W4A8
- 対象: weight中心、MoE

## 精度報告(あれば)
- 各リポジトリのmodel card依存。community re-quantが主で公式報告は限定的

## ダウンロード/利用状況
- GGUF 14k DL / MXFP4 12k DL 超と高い需要。公開週内に主要フォーマットが揃う「即日量子化」の典型

## 注目度コメント
**今週最大の新モデル量子化ウェーブ**。W4A16/NVFP4はvLLM直接ロード可(vllm-ready)。DeepSeek-V4系の評価候補。議題候補。
