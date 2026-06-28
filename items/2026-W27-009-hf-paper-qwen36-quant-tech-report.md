---
id: "2026-W27-009"
type: hf-paper
title: "Qwen3.6 Quantization Technical Report: Official Recipes for FP8 / NVFP4 / AWQ / GPTQ across the Qwen3.6 Family"
url: "https://huggingface.co/papers/2606.26483"
arxiv_url: "https://arxiv.org/abs/2606.26483"
discovered: "2026-06-29"
published: "2026-06-24"
authors: [Qwen Team]
hf_upvotes: 92
hf_papers_date: "2026-06-24"
venue: "arxiv / HF Papers"
affiliation: "Alibaba DAMO / Qwen"
models: [Qwen/Qwen3.5, Qwen/Qwen3.6]
architectures: [transformer, moe]
methods: [GPTQ, AWQ, NVFP4, MXFP4, AutoRound]
tech: [moe-quant, low-bit-fp8, low-bit-fp4, low-bit-4, ptq, qat, mixed-precision]
priority: high
sources: [hf-papers, arxiv]
status: new
related: []
---

## 日本語要約
Qwen3.6 ファミリー（27B-dense / 35B-A3B-MoE / 40B / Omni multimodal）に対する Qwen Team 公式の量子化技術報告。FP8（W8A8 / KV8）・NVFP4（W4A4 / KV4）・AWQ-W4A16・GPTQ-Int4・MXFP4-MoE の 5 構成について、推奨 calibration セット・ビット選択基準・性能曲線を公開。MoE モデルでは MXFP4 weights + FP8 KV が「精度マージン重視構成」、NVFP4 weights + NVFP4 KV が「メモリ重視構成」のリファレンス。HuggingFace Hub 上で対応モデルカードを一括公開し、92 upvotes（HF Papers）。

## 手法（推奨レシピのハイライト）
- **FP8 W8A8 + KV8**: 全モデル共通の「ロスレス推奨」。MMLU -0.1pt 程度
- **NVFP4 W4A4 + KV4**: Blackwell 向け。MMLU -1.3pt、メモリ 4.5x 削減
- **AWQ-W4A16**: Hopper/Ada Lovelace 向け。MMLU -0.9pt
- **GPTQ-Int4**: 汎用フォールバック。AutoRound 系 calibration を採用
- **MXFP4-MoE**: 35B-A3B MoE 専用。CKA-QAD distillation 併用で MMLU -1.5pt

## 評価
- 対象モデル: Qwen3.6-27B、Qwen3.6-35B-A3B（MoE）、Qwen3.6-40B、Qwen3.6-Omni-30B-A3B（multimodal）
- ベンチマーク: MMLU / GSM8K / HumanEval / RULER 128K / MathVista（Omni）/ ChartQA
- 全構成で BF16 比 -1.5pt 以内を目標達成

## HF Papersでの注目度
- upvote 数: 92（W27 のトップ）
- コメント傾向: 「公式リファレンスがあるとサードパーティの量子化選別が楽」「MoE の MXFP4 vs NVFP4 の比較表が決定打」など実用ユーザの反応多数

## 注目度コメント
Qwen3.6 のリファレンス量子化レシピが公式公開された点で W27 の最大級トピック。focus の moe-quant / NVFP4 / kv-cache-quant がすべて間接的にヒット。火曜定例の最有力議題候補。
