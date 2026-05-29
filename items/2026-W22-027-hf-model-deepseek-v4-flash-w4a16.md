---
id: "2026-W22-027"
type: hf-model
title: "canada-quant/DeepSeek-V4-Flash-W4A16-FP8-MTP"
url: "https://huggingface.co/canada-quant/DeepSeek-V4-Flash-W4A16-FP8-MTP"
discovered: "2026-05-22"
published: "2026-05-22"
base_model: "deepseek-ai/DeepSeek-V4-Flash"
models: [deepseek-ai/DeepSeek-V4]
architectures: [moe]
methods: [GPTQ]
tech: [weight-only, low-bit-4, low-bit-fp8, moe-quant]
priority: normal
sources: [hf-models]
status: new
related: ["2026-W22-010", "2026-W22-011"]
---

## 日本語要約

DeepSeek-V4-FlashのW4A16（Weight 4ビット、Activation 16ビット）＋FP8＋MTPの組み合わせ量子化モデル。NVFP4版 (2026-W22-010) と異なりW4A16はBlackwell以外でも利用可能な従来型の軽量化アプローチ。vLLM + compressed-tensors + GPTQ経由。1742ダウンロードで同シリーズ中最多。

## 量子化仕様

- ベースモデル: deepseek-ai/DeepSeek-V4-Flash（MoE LLM）
- 量子化手法: W4A16 GPTQ + FP8 (dynamic activation) + MTP
- ビット幅: Weight=4ビット、Activation=16ビット/FP8混合
- 量子化対象 (weight / activation / kv): weight-only (W4)＋activation FP8
- ファイルフォーマット: compressed-tensors (vLLM形式)

## 精度報告(あれば)

- ベンチマーク: 未報告
- 劣化幅: 未報告

## ダウンロード/利用状況

1742 ダウンロード（2026-05-25時点）。同シリーズ（NVFP4版838、Pro NVFP4版199）の中で最多のダウンロード数。W4A16は非Blackwell環境でも動作するため需要が高い。
