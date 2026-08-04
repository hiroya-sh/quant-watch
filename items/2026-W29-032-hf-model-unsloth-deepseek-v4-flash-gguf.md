---
id: "2026-W29-032"
type: hf-model
title: "unsloth/DeepSeek-V4-Flash-GGUF"
url: "https://huggingface.co/unsloth/DeepSeek-V4-Flash-GGUF"
discovered: "2026-07-13"
published: "2026-07-06"
base_model: "deepseek-ai/DeepSeek-V4-Flash"
models: [deepseek-ai/DeepSeek-V4]
architectures: [transformer, moe]
methods: [GGUF]
tech: [weight-only, llamacpp-ready]
priority: high
sources: [hf-models]
status: new
verified: "2026-07-13 HF API で repo/createdAt/tags 確認 (createdAt 2026-07-06, gguf + fp8 + imatrix)"
related: []
---

## 日本語要約
Unsloth による **DeepSeek-V4-Flash の GGUF 化**(imatrix 校正付き、FP8 由来)。1週間で 44.6k DL / 152 likes と今週の HF 量子化モデルで最大の注目度。DeepSeek-V4 系の軽量版 Flash をローカル(llama.cpp)で動かす需要の大きさを示す。

## 注目度コメント
主要モデル(DeepSeek-V4 系新変種)への量子化適用としてデフォルト high。llamacpp-ready(bump 対象外)。vLLM 側は ModelOpt 0.45.0 が DeepSeek-V4 expert の MXFP4→NVFP4 変換を入れており、[[items/2026-W29-026-github-modelopt-0450|ModelOpt 0.45.0]] と合わせて見ると V4 系の低ビット化が両エコシステムで並走している。
