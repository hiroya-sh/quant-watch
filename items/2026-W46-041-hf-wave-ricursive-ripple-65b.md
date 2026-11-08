---
id: "2026-W46-041"
type: hf-model
title: "Ricursive Ripple-65B Preview 量子化ウェーブ"
url: "https://huggingface.co/ModelCloud/Ripple-65B-Preview-GPTQ-W4A16-v2"
discovered: "2026-11-09"
published: "2026-11-04"
base_model: "ricursive/Ripple-65B-Preview"
models: []
architectures: ["transformer"]
methods: ["GPTQ", "NVFP4", "GGUF"]
tech: ["low-bit-4", "low-bit-fp4", "weight-only"]
priority: normal
sources: [hf-models]
status: new
related: ["2026-W46-040-github-gptqmodel-v78-v710"]
---

## 日本語要約

本週登場した Ricursive Ripple-65B Preview の量子化配布ウェーブ。per-head Q/K norm と gated attention を持つ新アーキで、GPTQModel v7.10.0 (11-06) が正式対応。ModelCloud GPTQ-W4A16-v2 (DL 141)、prithivMLmods NVFP4-GB202-GGUF (DL 258)、dealignai UNCENSORED-NVFP4 (DL 126) が 11-04〜11-07 の短期間に揃う。

## 量子化仕様

| 配布者 | 形式 | DL (11-09 時点) |
|---|---|---|
| ModelCloud/Ripple-65B-Preview-GPTQ-W4A16-v2 | GPTQ W4A16 | 141 |
| prithivMLmods/Ripple-65B-Preview-NVFP4-GB202-GGUF | NVFP4 + GGUF | 258 |
| dealignai/Ripple-65B-Preview-UNCENSORED-NVFP4 | NVFP4 (compressed-tensors) | 126 |

- ベースモデル: ricursive/Ripple-65B-Preview (dense, GQA + gated attn)
- 量子化手法: GPTQ W4A16 (ModelCloud), NVFP4 GGUF (prithivMLmods), NVFP4 compressed-tensors (dealignai)
- ビット幅: 4-bit weight, A16 ないし FP4 activation 系
- フォーマット: safetensors (GPTQ, NVFP4 compressed-tensors) / GGUF (NVFP4-GB202)

## 精度報告(あれば)

Model card に明示ベンチなし (preview 期)。ModelCloud 側は GPTQModel v7.10 の "Ricursive Ripple decode 10x per row at batch 16" を実装側の根拠として参照。

## ダウンロード/利用状況

- vLLM / SGLang / llama.cpp 側の公式対応は未確認 (GPTQModel + modeling patches を要)。
- 配布直後で DL は 100-260 レンジ。W45 の DeepSeek-V4.1-Flash-1017 wave と同じく "公式 preview → 量子化配布まで数日" の短サイクルが成立。
