---
id: "2026-W22-010"
type: hf-model
title: "canada-quant/DeepSeek-V4-Flash-NVFP4-FP8-MTP"
url: "https://huggingface.co/canada-quant/DeepSeek-V4-Flash-NVFP4-FP8-MTP"
discovered: "2026-05-21"
published: "2026-05-21"
base_model: "deepseek-ai/DeepSeek-V4-Flash"
models: [deepseek-ai/DeepSeek-V4]
architectures: [moe]
methods: [NVFP4]
tech: [low-bit-fp4, low-bit-fp8, moe-quant, microscaling-formats]
priority: high
sources: [hf-models]
status: new
related: ["2026-W22-011", "2026-W22-027"]
---

## 日本語要約

DeepSeek-V4-FlashのNVFP4+FP8+MTP（Multi-Token Prediction）対応量子化モデル。NVFP4（BlackwellネイティブFP4）とFP8の組み合わせによる高効率推論を実現。vLLM + compressed-tensors経由での利用が前提。838ダウンロードを記録。

## 量子化仕様

- ベースモデル: deepseek-ai/DeepSeek-V4-Flash（MoE LLM）
- 量子化手法: NVFP4 + FP8 (dynamic) + MTP
- ビット幅: FP4 (weights)、FP8 (activations/KV)
- 量子化対象 (weight / activation / kv): weight + activation + MTP scale tensors
- ファイルフォーマット: compressed-tensors (vLLM形式)

## 精度報告(あれば)

- ベンチマーク: 未報告
- 劣化幅: 未報告

## ダウンロード/利用状況

838 ダウンロード（2026-05-25時点）。同作者のDeepSeek-V4-Pro版 (2026-W22-011) も同週公開。
