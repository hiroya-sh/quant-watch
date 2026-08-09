---
id: "2026-W33-037"
type: hf-model
title: "DiffusionGemma-26B-A4B W4A16"
url: "https://huggingface.co/GoedelMachines/diffusiongemma-26B-A4B-w4a16"
discovered: "2026-08-10"
published: "2026-08-04"
base_model: "google/DiffusionGemma-26B-A4B"
models: [google/gemma-4]
architectures: [moe]
methods: [GPTQ]
tech: [low-bit-4, weight-only, moe-quant, diffusion-llm-quant, vllm-ready]
priority: normal
sources: [hf-models]
status: new
related: []
---

## 日本語要約
拡散言語モデルDiffusionGemma-26B-A4B(技術報告 2608.00146, HF papers掲載)のW4A16量子化(GoedelMachines: 949 DL)。gemmaファミリの拡散LM MoEへの4bit weight量子化。

## 量子化仕様
- ベースモデル: DiffusionGemma-26B-A4B (拡散LM, MoE)
- 量子化手法: W4A16(GPTQ系)
- ビット幅: 4bit weight
- 対象: weight, MoE

## 精度報告(あれば)
- community量子化。精度報告は限定的

## ダウンロード/利用状況
- 949 DLと拡散LMとしては高め

## 注目度コメント
拡散LLMへの量子化(diffusion-llm-quant)。gemma系(focus近傍)かつ非自己回帰への4bit適用として注目。
