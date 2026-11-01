---
id: "2026-W45-049"
type: hf-wave
title: "Nemotron-3.5-Transcribe-30B-A4B GGUF/AWQ wave"
url: "https://huggingface.co/AtomicChat/NVIDIA-Nemotron-3.5-Transcribe-30B-A4B-GGUF"
discovered: "2026-11-02"
published: "2026-10-28"
base_models: []
architectures: []
methods: ["GGUF"]
tech: []
priority: normal
sources: [hf-models]
status: new
related: []
---

## 日本語要約

nvidia/Nemotron-3.5-Transcribe-30B-A4B をベースとした量子化派生の **ウェーブ**。本週窓内の新規配布として 2 件、累計ダウンロード **43,232**(窓内確認時点)。**Nemotron-3.5-Transcribe-30B-A4B**(NVIDIA の transcribe 特化 MoE)の **GGUF (DL=40k) + mini-64e AWQ** が同週に着地。llm-compressor [[items/2026-W45-021-github-compressor-0150|0.15.0]] の Nemotron 3.5 Super VL FP8 documented checkpoint #3291 とは別系統(Transcribe 特化版)。

## メンバー配布一覧

| HF Model ID | DL | Created | 備考 |
|---|---:|---|---|
| `AtomicChat/NVIDIA-Nemotron-3.5-Transcribe-30B-A4B-GGUF` | 40437 | 2026-10-28 | GGUF (DL=40.4k) |
| `akhaliq/nemotron-3.5-transcribe-mini-64e` |  2795 | 2026-10-28 | mini-64e AWQ |

## 量子化仕様

- 量子化手法: GGUF
- 共通ベース: `nvidia/Nemotron-3.5-Transcribe-30B-A4B`
- ファイルフォーマット: GGUF / safetensors(各 model card 参照)

## 注目度コメント

**NORMAL** — 監視対象。
