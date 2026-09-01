---
id: "2026-W34-031"
type: hf-model
title: "NVIDIA-Nemotron-3.5-Lightning-30B-A3B 量子化 (FP8/AWQ)"
url: "https://huggingface.co/RedHatAI/NVIDIA-Nemotron-3.5-Lightning-30B-A3B-FP8"
discovered: "2026-08-17"
published: "2026-08-14"
base_model: "nvidia/NVIDIA-Nemotron-3.5-Lightning-30B-A3B"
models: [nvidia/Nemotron]
architectures: [moe]
methods: [AWQ]
tech: [moe-quant, low-bit-fp8, vllm-ready]
priority: normal
sources: [hf-models]
status: new
related: []
---
## 日本語要約
**NVIDIA-Nemotron-3.5-Lightning-30B-A3B**(MoE, 活性3B)が RedHatAI により **FP8**、Local-Axiom-AI により **AWQ** で量子化。FP8 は vLLM 直行。focus の Nemotron 系に合致(taxonomy: nvidia/Nemotron)。

## 量子化仕様
- ベースモデル: NVIDIA-Nemotron-3.5-Lightning-30B-A3B (MoE)
- 量子化手法: FP8 (RedHatAI) / AWQ (Local-Axiom-AI)
- ビット幅: FP8 / 4bit(AWQ)
- 量子化対象: weight(MoE expert 含む)
- ファイルフォーマット: safetensors (compressed-tensors)

## 精度報告(あれば)
- model card 依存

## ダウンロード/利用状況
- RedHatAI/...-30B-A3B-FP8 ~796 DL、Local-Axiom-AI/Nemotron-3.5-Lightning-awq ~772 DL。新規モデルタグ候補 nvidia/Nemotron-3.5。
