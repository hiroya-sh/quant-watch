---
id: "2026-W46-042"
type: hf-model
title: "google/gemma-4 量子化ウェーブ (ThinkingCap APEX / ik_llama / Nemotron-3.5-Bolt derivative)"
url: "https://huggingface.co/IsValorum/ThinkingCap-Gemma-4-26B-A4B-it-APEX-I-MiniPlus-V2.1-GGUF"
discovered: "2026-11-09"
published: "2026-11-02"
base_model: "google/gemma-4-26B-A4B-it"
models: ["google/gemma-4"]
architectures: ["transformer"]
methods: ["GGUF", "NVFP4"]
tech: ["low-bit-fp4", "llamacpp-ready"]
priority: high
sources: [hf-models]
status: new
related: ["2026-W46-039-github-modelopt-0480", "2026-W46-038-github-llamacpp-v090", "2026-W46-037-github-sglang-v0523"]
---

## 日本語要約

**本週 focus の gemma-4 周辺で初めて "公式側" のシグナルが揃った週**。ModelOpt 0.48.0 が `google/gemma-4-26B-A4B-it` の NVFP4 alias を backfill、llama.cpp v0.9.0 で Gemma 4 graph 最適化と MTP assistant 設定継承、SGLang v0.5.23 で Gemma 4 E2B の single-step frozen-KV draft で TPOT -33%。HF 側は IsValorum ThinkingCap APEX MiniPlus/NanoPlus GGUF、Austriani ik_llama.cpp GGUF 、派生アーキでは turintech の Nemotron-3.5-Bolt-E4B-Artemis-NVFP4/FP8 (gemma4 architecture) が揃う。

## 量子化仕様

| 配布者 / モデル | 形式 | DL (11-09 時点) |
|---|---|---|
| IsValorum/ThinkingCap-Gemma-4-26B-A4B-it-APEX-I-MiniPlus-V2.1-GGUF | GGUF (Q*_K_M 混在) | 388 |
| IsValorum/ThinkingCap-Gemma-4-26B-A4B-it-APEX-I-NanoPlus-V2.1-GGUF | GGUF (Q*_K_M 混在) | 140 |
| Austriani/Gemma-4-26B-A4B-it-ik_llama.cpp | ik_llama.cpp GGUF | 171 |
| turintech/Nemotron-3.5-Bolt-E4B-Artemis-NVFP4 | NVFP4 (gemma4 architecture 継承) | 205 |
| turintech/Nemotron-3.5-Bolt-E4B-Artemis-FP8 | FP8 (gemma4 architecture 継承) | 123 |

- ベース: `google/gemma-4-26B-A4B-it` (MoE 系の A4B) と `google/gemma-4-E4B` / `E2B` (dense の "effective 4B/2B")
- 手法: GGUF の K-quant mixed (APEX)、ik_llama.cpp 専用 GGUF (Austriani)、NVFP4 compressed-tensors / FP8 (turintech は gemma4 architecture を使った派生学習ベース)
- フォーマット: GGUF / safetensors
- 対象: weight-only quantization + KV は MLA/non-MLA の各デフォルト

## 精度報告(あれば)

ThinkingCap APEX 系は "uncensored + reasoning" 向け community 配布のため公式 model card にベンチなし。turintech Nemotron-3.5-Bolt-Artemis は gemma4 architecture を用いた派生モデル学習 + NVFP4 / FP8 配布で、同チーム Nemotron-3.5-Bolt ラインナップとして使用。

## ダウンロード/利用状況

- ThinkingCap MiniPlus (388 DL) + NanoPlus (140 DL) は community 向け apex 系の高速プレビュー配布。
- Austriani ik_llama.cpp 版は ik_llama.cpp カスタムビルド向け。
- turintech 派生は NVFP4 (205 DL) + FP8 (123 DL) で "gemma4 アーキ採用 derivative" の実用配布として最初期に位置づけられる。
- **W36 / W45 で継続していた「gemma-4 focus 公式 NVFP4 配布ゼロ」の状態が本週 ModelOpt alias として解消**。実体は portable recipe 参照のため、実モデルの重みはこれから生成される想定。

## 注目度コメント

**gemma-4 focus 直接ヒット** — 3 大 engine (vLLM, SGLang, llama.cpp) + ModelOpt の 4 本すべてに gemma-4 PR が入る week は 2026 で初。turintech Nemotron-3.5-Bolt は `gemma4` architecture を宣言した derivative であり、Gemma 4 アーキの "採用" が初めて他チームの base learning に波及した例。
