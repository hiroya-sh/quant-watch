---
id: "2026-W26-011"
type: github
subtype: runtime
title: "ggml-org/llama.cpp: W26ビルド群 (b9642–b9754)"
url: "https://github.com/ggml-org/llama.cpp/releases/tag/b9754"
discovered: "2026-06-22"
published: "2026-06-15"
repo: "ggml-org/llama.cpp"
release_tag: "b9642-b9754"
models: [moonshotai/Kimi-K2.5]
architectures: [transformer, moe, hybrid, mamba2]
methods: [GGUF]
tech: [weight-only, low-bit-4, low-bit-fp8, speculative-decoding]
priority: normal
sources: [github]
status: new
related: []
---

## 日本語要約
llama.cpp W26期間（2026-06-15〜06-21）のビルド群（b9642〜b9754、89件）。主な量子化関連変更として: ①`llama: use LLM_KV for quantization_version & file_type`（b9732前後、量子化メタデータのKV格納統一）、②`ggml: optimize AMX`（Intel AMX最適化強化）、③`ggml-cpu: support K tails in power10 Q8/Q4 MMA matmul`（Power10プラットフォームのQ8/Q4行列積対応）、④`spec: Support Step3.5/3.7 flash mtp3`（MTPドラフト対応）、⑤`ggml: bump version to 0.15.2`（ggml内部バージョン更新）。Step3.5/3.7というStepFun社のフラッシュモデル対応が注目点。

## 主な変更サマリ
- **量子化メタデータ統一** (b9733附近): `quantization_version` & `file_type` をLLM_KVシステムで管理する内部リファクタリング。GGUFフォーマット長期的互換性強化
- **AMX最適化** (b9741): Intel AMXカーネルのパフォーマンス最適化。INT4/INT8量子化演算の高速化
- **Power10 Q8/Q4** (b9722附近): IBM Power10のQ8_0/Q4_0行列積でK-tail処理を追加サポート
- **Step3.5/3.7 MTP** (b9754): StepFun Step3.5/3.7のflash mtp3（Multi-Token Prediction）ドラフト対応

## 注目度コメント
llama.cppの週次安定リリースとして継続収集。今週は量子化メタデータの内部統一（LLM_KV化）という地道だが重要なGGUF仕様整理が実施された。Power10対応の広がりも注目点。Step3.7-Flash（stepfun-ai/Step-3.7-Flash-FP8がW25に登場）への MTP対応は量子化モデルとの連携で実用性向上。
