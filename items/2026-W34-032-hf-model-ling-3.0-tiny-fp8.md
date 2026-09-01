---
id: "2026-W34-032"
type: hf-model
title: "Ling-3.0-tiny-fp8"
url: "https://huggingface.co/inclusionAI/Ling-3.0-tiny-fp8"
discovered: "2026-08-17"
published: "2026-08-10"
base_model: "inclusionAI/Ling-3.0-tiny"
models: []
architectures: [moe]
methods: []
tech: [low-bit-fp8, moe-quant, vllm-ready]
priority: watching
sources: [hf-models]
status: new
related: []
---
## 日本語要約
W33 で出た Ling-3.0-flash に続き、inclusionAI が小型版 **Ling-3.0-tiny の FP8** を公開。MoE の小型構成を FP8 で vLLM に載せる用途。

## 量子化仕様
- ベースモデル: Ling-3.0-tiny (MoE)
- 量子化手法: FP8
- ビット幅: FP8
- 量子化対象: weight
- ファイルフォーマット: safetensors (compressed-tensors)

## 精度報告(あれば)
- model card 依存

## ダウンロード/利用状況
- inclusionAI/Ling-3.0-tiny-fp8 ~2.3k DL / 21 likes。新規モデルタグ候補 inclusionAI/Ling-3.0。
