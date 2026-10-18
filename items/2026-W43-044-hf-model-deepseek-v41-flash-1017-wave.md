---
id: "2026-W43-044"
type: hf-model
title: "deepseek-ai/DeepSeek-V4.1-Flash-1017 (量子化ウェーブ)"
url: "https://huggingface.co/deepseek-ai/DeepSeek-V4.1-Flash-1017"
discovered: "2026-10-19"
published: "2026-10-17"
base_model: "DeepSeek-V4.1-Flash-1017"
models: [deepseek-ai/DeepSeek-V4]
architectures: [moe]
methods: [NVFP4, GGUF, GPTQ, EXL3, MXFP4]
tech: [low-bit-fp8, low-bit-4, low-bit-fp4, moe-quant, mixed-precision, vllm-ready, llamacpp-ready]
priority: high
sources: [hf-models]
status: new
related: []
---

## 日本語要約
**DeepSeek-V4.1-Flash-1017 の量子化ウェーブ**。公式 FP8 (`deepseek-ai/DeepSeek-V4.1-Flash-1017`、2026-10-17 公開、1 日で DL=10,233) を核に、同日中に MLX コミュニティが 4-bit / 3-bit / 2.5-bit / 2-bit の MTP 対応版、EXL3 2.9bpw、GPTQ Uncensored 派生までを一斉配布。公式リリース後**同日中**に主要量子化フォーマットが揃うパターンが W36 の Qwen3.8-Flash-Next ウェーブと同じ速度に。

## 量子化バリエーション(本週 window 内公開のみ)
- [`deepseek-ai/DeepSeek-V4.1-Flash-1017`](https://huggingface.co/deepseek-ai/DeepSeek-V4.1-Flash-1017) — FP8 公式配布 (2026-10-17 公開、DL=10,233)
- [`unsloth/DeepSeek-V4.1-Flash-1017`](https://huggingface.co/unsloth/DeepSeek-V4.1-Flash-1017) — unsloth 版 FP8 ミラー
- [`mlx-community/DeepSeek-V4.1-Flash-1017-oQ4e-mtp`](https://huggingface.co/mlx-community/DeepSeek-V4.1-Flash-1017-oQ4e-mtp) — MLX 4-bit (MTP 用, DL=916)
- [`mlx-community/DeepSeek-V4.1-Flash-1017-oQ3e-mtp`](https://huggingface.co/mlx-community/DeepSeek-V4.1-Flash-1017-oQ3e-mtp) — MLX 3-bit (MTP, DL=235)
- [`mlx-community/DeepSeek-V4.1-Flash-1017-oQ2.5e-mtp`](https://huggingface.co/mlx-community/DeepSeek-V4.1-Flash-1017-oQ2.5e-mtp) — MLX 2.5-bit (MTP, DL=435)
- [`mlx-community/DeepSeek-V4.1-Flash-1017-oQ2e-mtp`](https://huggingface.co/mlx-community/DeepSeek-V4.1-Flash-1017-oQ2e-mtp) — MLX 2-bit (MTP, DL=230)
- [`IndrasMirror/DeepSeek-V4.1-Flash-Uncensored-GSQ`](https://huggingface.co/IndrasMirror/DeepSeek-V4.1-Flash-Uncensored-GSQ) — コミュニティ GPTQ Uncensored 派生 (DL=1,737, 2026-10-12)
- [`LibertAIDAI/DeepSeek-V4.1-Flash-1017-EXL3-2.9bpw`](https://huggingface.co/LibertAIDAI/DeepSeek-V4.1-Flash-1017-EXL3-2.9bpw) — EXL3 2.9bpw (DL=809)
- [`inferencerlabs/DeepSeek-V4.1-Flash-1017-MLXe`](https://huggingface.co/inferencerlabs/DeepSeek-V4.1-Flash-1017-MLXe) — MLXe 版 (DL=598)

## 補足
- ベースモデル: deepseek-ai/DeepSeek-V4.1-Flash-1017 (MoE)
- 公式配布: FP8
- コミュニティ派生: MLX 4e/3e/2.5e/2e(MTP 用の `o` プレフィクス)、EXL3 2.9bpw、GPTQ Uncensored、MLXe
- DL 上位は FP8 (10K+) → MLX 4-bit (900+)、他は数百オーダー
