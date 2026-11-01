---
id: "2026-W45-047"
type: hf-wave
title: "Qwen3.8-Flash-Next / Qwen3.8-27B 量子化ウェーブ"
url: "https://huggingface.co/autotrust/Qwen3.8-27B-NVFP4-DGX-SPARK-V2"
discovered: "2026-11-02"
published: "2026-10-29"
base_models: []
architectures: []
methods: ["NVFP4"]
tech: ["low-bit-fp4", "low-bit-3"]
priority: normal
sources: [hf-models]
status: new
related: []
---

## 日本語要約

Qwen/Qwen3.8 をベースとした量子化派生の **ウェーブ**。本週窓内の新規配布として 6 件、累計ダウンロード **34,763**(窓内確認時点)。Qwen3.8-Flash-Next / 27B の **NVFP4 (W4A16) 中心のウェーブ**。SGLang [[items/2026-W45-018-github-sglang-v0522|v0.5.22]] と TRT-LLM [[items/2026-W45-019-github-llm-v140rc1|v1.4.0rc1]] の両方で Qwen3.8-Flash-Next の NVFP4 対応が同時着地している流れを受けている。

## メンバー配布一覧

| HF Model ID | DL | Created | 備考 |
|---|---:|---|---|
| `autotrust/Qwen3.8-27B-NVFP4-DGX-SPARK-V2` | 15362 | 2026-10-27 | NVFP4 DGX Spark V2 |
| `autotrust/Qwen3.8-Flash-Next-E384-FP4-V2` | 15033 | 2026-10-26 | FP4 E384 V2 |
| `neroued/Qwen3.8-Flash-Next-NInfer` |  1181 | 2026-10-29 | NInfer |
| `XGeorgeCostanzaX/Qwen3.8-27B-Nyquant-preview` |  1170 | 2026-10-22 | Nyquant preview |
| `kaitchup/Qwen3.8-27B-SLQ-EAR98` |  1070 | 2026-10-21 | SLQ EAR98 |
| `Jakevin/Qwen3.8-Flash-Next-mixed-mlx-K50-min3bit-oMLX` |   947 | 2026-10-30 | MLX 3bit |

## 量子化仕様

- 量子化手法: NVFP4
- 共通ベース: `Qwen/Qwen3.8`
- ファイルフォーマット: GGUF / safetensors(各 model card 参照)

## 注目度コメント

**NORMAL** — 監視対象。
