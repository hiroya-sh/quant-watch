---
id: "2026-W45-051"
type: hf-wave
title: "Groot-19B-A3B / MiniMax-H3 / Mistral-Large-4-1T misc quant wave"
url: "https://huggingface.co/ggml-org/Mistral-Large-4-1T-A52B-NVFP4-GGUF"
discovered: "2026-11-02"
published: "2026-10-30"
base_models: []
architectures: []
methods: ["NVFP4", "MXFP4", "MXFP8", "FP8", "AutoRound", "GGUF"]
tech: ["low-bit-fp4", "low-bit-fp8"]
priority: normal
sources: [hf-models]
status: new
related: []
---

## 日本語要約

misc をベースとした量子化派生の **ウェーブ**。本週窓内の新規配布として 4 件、累計ダウンロード **4,939**(窓内確認時点)。複数ベースの雑多な新規派生: Mistral-Large-4 の **1T MoE を ggml-org 公式が NVFP4 GGUF 化**、Intel-AI が MiniMax-H3 の **DiT を MXFP8+MXFP4 TE AutoRound** 化、Groot-19B-A3B(新 MoE)の GGUF 派生 2 本。

## メンバー配布一覧

| HF Model ID | DL | Created | 備考 |
|---|---:|---|---|
| `IsValorum/Groot-19B-A3B-261023-APEX-I-MiniPlus-V2.1-GGUF` |  1429 | 2026-10-30 | Groot MoE GGUF |
| `ggml-org/Mistral-Large-4-1T-A52B-NVFP4-GGUF` |  1408 | 2026-10-28 | ggml-org NVFP4 GGUF for 1T MoE |
| `prithivMLmods/Groot-19B-A3B-261023-MTP-GGUF` |  1120 | 2026-10-27 | Groot MTP GGUF |
| `intel-ai/MiniMax-H3-MXFP8-DiT-MXFP4-TE-AutoRound` |   982 | 2026-10-19 | MXFP8/MXFP4 TE AutoRound for H3 DiT |

## 量子化仕様

- 量子化手法: NVFP4, MXFP4, MXFP8, FP8, AutoRound, GGUF
- 共通ベース: `misc`
- ファイルフォーマット: GGUF / safetensors(各 model card 参照)

## 注目度コメント

**NORMAL** — 監視対象。
