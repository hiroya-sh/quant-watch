---
id: "2026-W46-044"
type: hf-model
title: "Qwen/Qwen3.5-9B NVFP4 配布ウェーブ (RedHatAI 公式 + prithivMLmods GGUF)"
url: "https://huggingface.co/RedHatAI/Qwen3.5-9B-NVFP4"
discovered: "2026-11-09"
published: "2026-11-03"
base_model: "Qwen/Qwen3.5-9B"
models: ["Qwen/Qwen3.5"]
architectures: ["transformer"]
methods: ["NVFP4", "GGUF"]
tech: ["low-bit-fp4", "weight-only", "vllm-ready"]
priority: normal
sources: [hf-models]
status: new
related: []
---

## 日本語要約

Qwen3.5-9B の NVFP4 配布が RedHatAI (vllm engine, DL 701) と prithivMLmods GGUF (DL 344) で揃う。RedHatAI は vLLM 側の compressed-tensors NVFP4 の ground truth 配布で、vLLM 0.33.0rc3 の NVFP4 サポートと直接対応。

## 量子化仕様

| 配布者 | 形式 | DL |
|---|---|---|
| RedHatAI/Qwen3.5-9B-NVFP4 | NVFP4 compressed-tensors (vllm) | 701 |
| prithivMLmods/Qwen3.5-9B-NVFP4-GGUF | NVFP4 GGUF | 344 |

- ベース: `Qwen/Qwen3.5-9B` (dense VLM)
- 手法: NVFP4 (compressed-tensors) / NVFP4 (GGUF)
- フォーマット: safetensors / GGUF
- 量子化対象: weight-only

## 精度報告(あれば)

RedHatAI 側は vLLM で直接ロード可能、prithivMLmods 側は llama.cpp 側 NVFP4 UE4M3 scale 修正 (llama.cpp v0.9.0 #31079) 以降 safely 動作。

## ダウンロード/利用状況

- RedHatAI は vllm-ready (= `vllm serve` でそのままロード) の NVFP4 ground truth。
- prithivMLmods GGUF は llama.cpp 専用で、ThinkingCap APEX 系と並び mobile/edge 向け。

## 注目度コメント

**NVFP4 focus** — vllm-ready の RedHatAI 配布は focus の `priorities.yml` implementation_focus に適合。Qwen3.5-9B は W36 の Qwen3.5-397B-A17B と並ぶ VLM 系の中核。
