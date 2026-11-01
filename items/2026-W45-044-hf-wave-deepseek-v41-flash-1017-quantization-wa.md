---
id: "2026-W45-044"
type: hf-wave
title: "DeepSeek-V4.1-Flash-1017 quantization wave"
url: "https://huggingface.co/nvidia/DeepSeek-V4.1-Flash-1017-NVFP4"
discovered: "2026-11-02"
published: "2026-10-30"
base_models: []
architectures: []
methods: ["NVFP4", "MXFP4", "GGUF"]
tech: ["low-bit-fp4", "low-bit-3"]
priority: high
sources: [hf-models]
status: new
related: []
---

## 日本語要約

deepseek-ai/DeepSeek-V4.1-Flash-1017 をベースとした量子化派生の **ウェーブ**。本週窓内の新規配布として 7 件、累計ダウンロード **19,824**(窓内確認時点)。DeepSeek-V4.1-Flash 10-17 リリース直後に **NVIDIA 公式 NVFP4 配布**(nvidia/DeepSeek-V4.1-Flash-1017-NVFP4)が到着し、同週にコミュニティ側で **dsx 系の 2.6bit / MXFP4 / MLX 3bpw / EXL3-like が揃った**。公式配布から配布派生までのリードタイムは **数時間-数日**。

## メンバー配布一覧

| HF Model ID | DL | Created | 備考 |
|---|---:|---|---|
| `icecubetr/DeepSeek-V4.1-Flash-1017-dsx-2.6bit` |  7946 | 2026-10-18 | 2.6bpw dsx |
| `lxe/DeepSeek-V4.1-Flash-1017-dsx-mxfp4` |  3339 | 2026-10-19 | MXFP4 dsx |
| `rapid-mlx/DeepSeek-V4.1-Flash-1017-MLX` |  2158 | 2026-10-19 | MLX |
| `ddalcu/DeepSeek-V4.1-Flash-1017-MLX-Serve-iQ-MLX-3.0bpw` |  2152 | 2026-10-18 | MLX iQ 3bpw |
| `kindlingai/deepseek-v4.1-flash-exlr8` |  1626 | 2026-10-31 | EXL3-like |
| `nvidia/DeepSeek-V4.1-Flash-1017-NVFP4` |  1473 | 2026-10-30 | official NVFP4 |
| `Solstice-AI/DeepSeek-V4.1-Flash-1017-UNCENSORED-MXFP4-ds4-Protium-1.0-UltraOptimised-GGUF` |  1130 | 2026-10-28 | community MXFP4 GGUF |

## 量子化仕様

- 量子化手法: NVFP4, MXFP4, GGUF
- 共通ベース: `deepseek-ai/DeepSeek-V4.1-Flash-1017`
- ファイルフォーマット: GGUF / safetensors(各 model card 参照)

## 注目度コメント

**HIGH** — focus method NVFP4 にマッチ。火曜定例の議題候補 — 公式 NVFP4 が初日配布された例として追い。vLLM での再現を試す候補。
