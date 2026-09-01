---
id: "2026-W34-029"
type: hf-model
title: "Qwen3.8-2.4T-A95B 量子化 (FP8/MXFP4)"
url: "https://huggingface.co/RedHatAI/Qwen3.8-2.4T-A95B-FP8"
discovered: "2026-08-17"
published: "2026-08-13"
base_model: "Qwen/Qwen3.8-2.4T-A95B"
models: [Qwen/Qwen3]
architectures: [moe]
methods: [MXFP4]
tech: [moe-quant, low-bit-fp8, low-bit-fp4, vllm-ready]
priority: normal
sources: [hf-models]
status: new
related: []
---
## 日本語要約
フロンティア級 MoE **Qwen3.8-2.4T-A95B**(総2.4T/活性95B)の量子化が登場。RedHatAI が **FP8**、Inferact が **MXFP4** を公開。巨大 MoE を FP8/MXFP4 で vLLM に載せる方向で、DL は控えめ(数百)だが規模的に注目。

## 量子化仕様
- ベースモデル: Qwen3.8-2.4T-A95B (MoE, 2.4T total / 95B active)
- 量子化手法: FP8 (RedHatAI) / MXFP4 (Inferact)
- ビット幅: FP8 / 4bit(MXFP4)
- 量子化対象: weight(MoE expert 中心)
- ファイルフォーマット: safetensors (compressed-tensors)

## 精度報告(あれば)
- model card 依存(明示ベンチ限定的)

## ダウンロード/利用状況
- RedHatAI/Qwen3.8-2.4T-A95B-FP8 ~871 DL、Inferact/Qwen3.8-2.4T-A95B-MXFP4 ~857 DL。新規モデルタグ候補 Qwen/Qwen3.8。
