---
id: "2026-W43-047"
type: hf-model
title: "hardhant/Qwen3.8-Flash-Next-FP4-Local-Strata (量子化ウェーブ)"
url: "https://huggingface.co/hardhant/Qwen3.8-Flash-Next-FP4-Local-Strata"
discovered: "2026-10-19"
published: "2026-10-17"
base_model: "Qwen3.8-Flash-Next-FP4-Local-Strata"
models: [Qwen/Qwen3.6]
architectures: [moe]
methods: [NVFP4, GGUF]
tech: [low-bit-fp4, moe-quant, mixed-precision, vllm-ready, llamacpp-ready]
priority: normal
sources: [hf-models]
status: new
related: []
---

## 日本語要約
**Qwen3.8-Flash-Next の NVFP4 第 2 波**。W36 で REAP-256-duo-GGUF が到達した Qwen3.8 系に、今週は NVFP4 の実装バリエーション(Local-Strata、QAD-GGUF)が追加。vLLM v0.32.0 で Qwen3.8-Flash-Next (Qwen4Exp) の merged QSA projections (1.45-1.68x, #59533) が入ったことで、量子化版の実運用需要が高まったと見られる。

## 量子化バリエーション(本週 window 内公開のみ)
- [`hardhant/Qwen3.8-Flash-Next-FP4-Local-Strata`](https://huggingface.co/hardhant/Qwen3.8-Flash-Next-FP4-Local-Strata) — Local-Strata (活性局所化スケーリング) NVFP4 (DL=1,292)
- [`fairfieldt/Qwen3.8-Flash-Next-NVFP4-QAD-GGUF`](https://huggingface.co/fairfieldt/Qwen3.8-Flash-Next-NVFP4-QAD-GGUF) — NVFP4-QAD-GGUF (DL=992)
- [`gsdavidp/Qwen3.8-27B-Coder390`](https://huggingface.co/gsdavidp/Qwen3.8-27B-Coder390) — FP8+NVFP4 (DL=1,148)

## 補足
- 新規 NVFP4 variant: Local-Strata(活性局所化スケーリング)、QAD-GGUF(Quant-Aware Distillation GGUF)
- Qwen3.8-27B-Coder390 は FP8+NVFP4 両対応
- Qwen3.8 系は taxonomy 未登録 (W36 で既出の新規モデル候補)
