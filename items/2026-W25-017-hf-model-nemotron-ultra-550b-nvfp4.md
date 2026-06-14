---
id: "2026-W25-017"
type: hf_model
title: "nvidia/NVIDIA-Nemotron-3-Ultra-550B-A55B-NVFP4"
url: "https://huggingface.co/nvidia/NVIDIA-Nemotron-3-Ultra-550B-A55B-NVFP4"
discovered: "2026-06-15"
published: "2026-06-10"
org: "nvidia"
base_model: "nvidia/Nemotron-3-Ultra-550B-A55B"
models: [nvidia/Nemotron]
architectures: [transformer, moe]
methods: [NVFP4]
tech: [low-bit-fp4, moe-quant, weight-only, activation-quant]
priority: high
sources: [hf_models]
status: new
related: ["2026-W25-012", "2026-W25-016"]
---

## 日本語要約
NVIDIA公式のNemotron-3 Ultra 550B（MoE, Active 55B）のNVFP4量子化モデル。Blackwell GPU必須。SGLang v0.5.13でday-0対応。NVIDIAが自社最大モデルをNVFP4化することで、Blackwellエコシステムにおけるハイパフォーマンス推論の参照実装となる。RedHatAIも同日NVFP4版を公開。

## モデル詳細
- ベースモデル: NVIDIA-Nemotron-3-Ultra-550B-A55B（550B total, 55B active, MoE）
- 量子化: NVFP4
- 要件: NVIDIA Blackwell GPU必須
- 推論: SGLang v0.5.13 day-0対応、vLLM v0.23.0+

## 注目度コメント
NVFPとmoe-quantとNemotronが全てfocus。Nemotronタグ下の最大モデル（550B）をNVIDIA自身がNVFP4化するのは量子化品質の自社保証とも言える。Blackwell専用というハードウェア要件の狭さが普及の課題。
