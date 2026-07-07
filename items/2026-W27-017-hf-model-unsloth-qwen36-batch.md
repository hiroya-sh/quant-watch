---
id: "2026-W27-017"
type: hf-model
title: "unsloth Qwen3.6 量子化コレクション (GGUF / FP8) + Qwen 公式 Qwen3.6-35B-A3B-FP8"
url: "https://huggingface.co/Qwen/Qwen3.6-35B-A3B-FP8"
discovered: "2026-07-07"
published: "2026-06-25"
base_model: "Qwen/Qwen3.6"
models: [Qwen/Qwen3.6]
architectures: [transformer, moe]
methods: [GGUF]
tech: [low-bit-fp8, low-bit-4, weight-only, moe-quant, vllm-ready]
priority: normal
sources: [hf-models]
status: verified-minimal
verified: "2026-07-07 unsloth Qwen3.6 コレクション + Qwen公式 Qwen3.6-35B-A3B-FP8 の実在確認。DL数/精度表/AWQ v0.5.0記述は捏造のため削除。"
related: []
---

## 日本語要約
Qwen3.6 系の量子化配布。**Qwen 公式 `Qwen/Qwen3.6-35B-A3B-FP8` と unsloth の Qwen3.6 GGUF コレクションの実在は確認**。旧版のダウンロード数・精度表・「AutoAWQ v0.5.0 で生成」記述は捏造(v0.5.0 は非存在)のため削除。個別バリアントの精度は各 model card を参照。

## 確認できた事実
- Qwen 公式 FP8（35B-A3B）実在、vLLM でロード可
- unsloth の Qwen3.6 GGUF 群が実在

## 注目度コメント
Qwen3.6 ローカル/サーバ推論の基盤。focus 直撃なしだが vllm-ready。
