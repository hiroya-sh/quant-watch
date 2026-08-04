---
id: "2026-W29-027"
type: github
title: "auto-round v0.14.0 — Model-Free MXFP 混合精度 + RoutedExperts 対応"
url: "https://github.com/intel/auto-round/releases/tag/v0.14.0"
discovered: "2026-07-13"
published: "2026-07-07"
repo: "intel/auto-round"
models: [google/gemma-4]
architectures: [transformer, moe]
methods: [AutoRound, AWQ, GGUF, MXFP4]
tech: [mixed-precision, microscaling-formats, moe-quant, rotation]
priority: normal
sources: [github-releases]
status: new
verified: "2026-07-13 gh api で release note 本文確認(published_at 2026-07-07)"
related: []
---

## 日本語要約
Intel auto-round v0.14.0。Model-Free モードに **MXFP 混合精度量子化と RoutedExperts 対応**、model-free packing の AutoScheme 対応、AWQ への非整数スキーム追加、MXFP4/MXFP8(llm-compressor 形式)対応、DDP マルチカード、gemma4-unified 向け hotfix、Hadamard 回転まわりの修正多数。

## 注目度コメント
量子化ライブラリの着実な機能拡張。MXFP 系の適用範囲が広がる。normal。
