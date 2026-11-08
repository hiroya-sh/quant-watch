---
id: "2026-W46-045"
type: hf-model
title: "Qwen/Qwen3.8 + Qwen3.8-Flash-Next 継続量子化ウェーブ (NVFP4+FP8 GGUF / W4A16 HGPTQ / Int4 / AWQ)"
url: "https://huggingface.co/williamliao/Qwen3.8-Mixed-NVFP4-FP8-GGUF"
discovered: "2026-11-09"
published: "2026-11-02"
base_model: "Qwen/Qwen3.8"
models: ["Qwen/Qwen3"]
architectures: ["moe", "transformer"]
methods: ["NVFP4", "GGUF", "GPTQ", "AWQ"]
tech: ["low-bit-fp4", "low-bit-fp8", "low-bit-4", "mixed-precision", "weight-only"]
priority: normal
sources: [hf-models]
status: new
related: []
---

## 日本語要約

W36 以降継続する Qwen3.8 / Qwen3.8-Flash-Next 量子化の本週分: williamliao の NVFP4+FP8 mixed GGUF (DL 770 — 本週 Top2)、Plana-Archive Uncensored GGUF (DL 265)、Launch80 Int4-baked "Qwopus3.8-27B-Coder-Flash" (DL 128)、nchapman W4A16-HGPTQ (DL 100)、TheUnderscore AWQ W4A16 (DL 103)、kaushikvira Qwen3.8-Flash-Next NVFP4 + MTP (DL 198)。TRT-LLM v1.4.0rc3 (#20937) の Qwen3.8-Flash-Next NVFP4 modeling_v2 GB300 Pareto 最適化と呼応。

## 量子化仕様

| 配布者 | 形式 | DL |
|---|---|---|
| williamliao/Qwen3.8-Mixed-NVFP4-FP8-GGUF | NVFP4 + FP8 mixed GGUF | 770 |
| Plana-Archive/Qwen3.8-27B-Uncensored-GGUF | GGUF uncensored | 265 |
| Launch80/Qwopus3.8-27B-Coder-Flash-Int4-baked | Int4 baked | 128 |
| TheUnderscore/Industry-Coder-27B-v2.0-W4A16-AWQ | AWQ W4A16 (Industry-Coder 系) | 103 |
| nchapman/Qwen3.8-Flash-Next-W4A16-HGPTQ | HGPTQ W4A16 (Flash-Next) | 100 |
| kaushikvira/Qwen3.8-Flash-Next-swift15-nvfp4-lamina-basalt | NVFP4 + MTP speculative decoding | 198 |

- ベース: Qwen3.8 系 (27B dense / Flash-Next MoE)
- 手法: NVFP4 mixed with FP8 (GGUF), Int4, AWQ W4A16, HGPTQ W4A16
- フォーマット: GGUF / safetensors
- 対象: weight-only (+ MTP speculative decoding の統合 configurations)

## 精度報告(あれば)

- williamliao Mixed-NVFP4-FP8-GGUF は "NVFP4 と FP8 の混合" を初めて GGUF 層で配布した点が技術的新規性。
- kaushikvira NVFP4 + MTP (lamina-basalt) は MTP speculative decoding を NVFP4 ベースに乗せる試み。

## ダウンロード/利用状況

- 本週 Top2 の williamliao Mixed NVFP4+FP8 GGUF (DL 770) が GGUF 側で NVFP4/FP8 混合配布の最初期ヒット。
- TRT-LLM rc3 の #20937 と合わせ、Qwen3.8-Flash-Next の GB300 向け NVFP4 serve は engine/distribute 両方が整う。

## 注目度コメント

**NVFP4 focus 継続** — Qwen3.8 系の "mixed NVFP4 + FP8 GGUF" は W36/W45 の NVFP4+FP8 混合配布戦略 (Nemotron-3.5-Super-VL) が Qwen 側に広がった形。vLLM で NVFP4 を直接ロードできるので vllm-ready。
