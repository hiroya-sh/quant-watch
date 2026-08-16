---
id: "2026-W34-030"
type: hf-model
title: "Muse-Glimmer-30B 量子化 (FP8-block/NVFP4)"
url: "https://huggingface.co/RedHatAI/Muse-Glimmer-30B-FP8-block"
discovered: "2026-08-17"
published: "2026-08-10"
base_model: "Muse-Glimmer-30B"
models: []
architectures: []
methods: [NVFP4]
tech: [low-bit-fp8, low-bit-fp4, vllm-ready]
priority: normal
sources: [hf-models]
status: new
related: []
---
## 日本語要約
30B 級モデル **Muse-Glimmer-30B** が RedHatAI により **FP8-block(約32k DL)** と **NVFP4** で量子化配布。他ユーザからも NVFP4 派生。FP8/NVFP4 は vLLM 直接ロード可。ベース素性は model card 依存で taxonomy 未登録(新規モデルタグ候補)。

## 量子化仕様
- ベースモデル: Muse-Glimmer-30B
- 量子化手法: FP8 (block-scale) / NVFP4
- ビット幅: FP8 / 4bit(NVFP4)
- 量子化対象: weight(block-scale)
- ファイルフォーマット: safetensors (compressed-tensors)

## 精度報告(あれば)
- model card 依存

## ダウンロード/利用状況
- RedHatAI/Muse-Glimmer-30B-FP8-block ~32k DL、RedHatAI/Muse-Glimmer-30B-NVFP4 ~7k DL、Preyazz/cloudnathan5 の NVFP4 派生も。新規モデルタグ候補。
