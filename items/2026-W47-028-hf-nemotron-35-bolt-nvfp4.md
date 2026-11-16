---
id: "2026-W47-028"
type: hf-model
title: "RedHatAI/NVIDIA-Nemotron-3.5-Bolt-E4B-NVFP4"
url: "https://huggingface.co/RedHatAI/NVIDIA-Nemotron-3.5-Bolt-E4B-NVFP4"
discovered: "2026-11-16"
published: "2026-11-13"
base_model: "nvidia/NVIDIA-Nemotron-3.5-Bolt-E4B"
models: [nvidia/Nemotron]
architectures: [transformer]
methods: [NVFP4]
tech: [weight-only, low-bit-fp4, vllm-ready, trtllm-ready]
priority: normal
sources: [hf-models]
status: new
related: []
---

## 日本語要约
Red Hat AI による **Nemotron-3.5-Bolt-E4B の NVFP4 配布**(159 DL, 11-13)。llm-compressor パイプライン(W45 で 0.15.0 で安定)で生成、`compressed-tensors` フォーマット。vLLM で直接ロード可能。RedHatAI/ 配布は `vllm-ready` ground truth として扱う運用。

## 量子化仕様
- ベースモデル: nvidia/NVIDIA-Nemotron-3.5-Bolt-E4B (E4B: small variant)
- NVFP4 (E2M1, group=16)
- llm-compressor の NVFP4 recipe、compressed-tensors フォーマット
- W4A4 or W4A16 の明示は model card 参照

## 精度報告
- RedHatAI 配布は通常 FP16 比 near-identity を主張、詳細は model card。

## ダウンロード/利用状況
- Red Hat AI の公式 NVFP4 ラインは W45 の Nemotron 3.5 Super VL + 本週 Bolt E4B で小型化が進む。

## 注目度コメント
`vllm-ready` ground truth を増やす直接的なアイテム。[[items/2026-W47-009-github-llamacpp-v100|llama.cpp v1.0.0]] 側の Nemotron 対応と重なり、**同じモデルを vLLM / llama.cpp 両方で serve**できる状態に。火曜定例で Bolt E4B の eval 実験候補。
