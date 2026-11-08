---
id: "2026-W46-046"
type: hf-model
title: "LiquidAI/LFM3-1.7B NVFP4 配布ウェーブ (llama.cpp v0.9.0 対応と連動)"
url: "https://huggingface.co/BennyDaBall/LFM3-1.7B-NVFP4"
discovered: "2026-11-09"
published: "2026-11-05"
base_model: "LiquidAI/LFM3-1.7B"
models: []
architectures: ["lfm"]
methods: ["NVFP4", "GGUF"]
tech: ["low-bit-fp4", "weight-only", "llamacpp-ready"]
priority: normal
sources: [hf-models]
status: new
related: ["2026-W46-038-github-llamacpp-v090", "2026-W46-040-github-gptqmodel-v78-v710"]
---

## 日本語要約

**BennyDaBall LFM3-1.7B NVFP4 (DL 349) + NVFP4 GGUF (DL 375)** が、llama.cpp v0.9.0 の **NVFP4 LFM3 GGUFs 有効化 (#31608)** と GPTQModel v7.9.0 の **LFM3 / LFM3-VL / LFM3-Omni 量子化対応** と同時公開。LFM3 (Liquid Functional Model) の NVFP4 配布と推論基盤が 1 週間で揃う珍しいケース。

## 量子化仕様

| 配布者 | 形式 | DL |
|---|---|---|
| BennyDaBall/LFM3-1.7B-NVFP4 | NVFP4 safetensors (transformers) | 349 |
| BennyDaBall/LFM3-1.7B-NVFP4-GGUF | NVFP4 GGUF | 375 |

- ベース: LiquidAI/LFM3-1.7B
- 手法: NVFP4 compressed-tensors, NVFP4 ggml ftype
- フォーマット: safetensors / GGUF
- 対象: weight-only quantization

## 精度報告(あれば)

- llama.cpp 側は Vulkan NVFP4 UE4M3 scale lookup OOB 修正 (#31079) と audio codec decoder の量子化許可 (#31386) で LFM3-Omni もサポート。

## ダウンロード/利用状況

- GPTQModel v7.9.0 で LFM3/VL/Omni text-decoder 量子化が有効になったことで、LFM アーキ (架構) 全体が量子化配布サイクルに乗った。
- llama.cpp の LFM3 tensor split 有効化 (#31431) で multi-GPU inference も可能。

## 注目度コメント

**architecture=lfm の初の本格 NVFP4 配布 + engine サポート**。W36/W45 では LFM 系の low-bit 配布は散発的だったが、本週で "NVFP4 配布 + llama.cpp サポート + GPTQModel 対応" が同週に揃った。
