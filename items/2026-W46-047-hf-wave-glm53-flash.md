---
id: "2026-W46-047"
type: hf-model
title: "zai-org/GLM-5.3-Flash 継続ウェーブ (symb / red-snow 派生)"
url: "https://huggingface.co/GRRNMAKE/GLM5.3Flash_symb"
discovered: "2026-11-09"
published: "2026-11-02"
base_model: "zai-org/GLM-5.3-Flash"
models: ["zai-org/GLM-5.2"]
architectures: ["moe"]
methods: ["NVFP4"]
tech: ["low-bit-fp4", "weight-only", "moe-quant"]
priority: normal
sources: [hf-models]
status: new
related: []
---

## 日本語要約

GLM-5.3-Flash 派生の継続ウェーブ: GRRNMAKE/GLM5.3Flash_symb (DL 737 — 本週 Top4) の symbolic 派生に加え、Pandoks の red-snow-5.3 系統 (red-snow-5.3-flash-nvfp4-half-delta-base-mlp DL 215, -kda-gate-revert DL 122, -half-delta DL 119) で NVFP4 派生実験が進む。TRT-LLM v1.4.0rc3 の GLM-5.2 NVFP4 modeling_v2 target (GB300/SM103) と並んで GLM-5 系統の NVFP4 周辺が engine + distribute 両方で厚い。ModelOpt 0.48.0 の `glm_moe_dsa` unified HF export + DSA FP8 KV cache を支える基盤でもある。

## 量子化仕様

| 配布者 | 形式 | DL |
|---|---|---|
| GRRNMAKE/GLM5.3Flash_symb | symbolic variant (axim-os) | 737 |
| Pandoks/red-snow-5.3-flash-nvfp4-half-delta-base-mlp | NVFP4 half-delta base MLP | 215 |
| Pandoks/red-snow-5.3-flash-nvfp4-kda-gate-revert | NVFP4 KDA gate revert | 122 |
| Pandoks/red-snow-5.3-flash-nvfp4-half-delta | NVFP4 half-delta | 119 |

- ベース: zai-org/GLM-5.3-Flash
- 手法: NVFP4 safetensors (compressed-tensors)、または modality 特化配布
- フォーマット: safetensors
- 対象: weight-only + 構造改変 (half-delta, KDA gate revert) を組み合わせたアブレーション的配布

## 精度報告(あれば)

Pandoks 系統は "red-snow" 実験の各 variant が精度を比較するためのアブレーション版で、model card に明示ベンチなし。

## ダウンロード/利用状況

- GRRNMAKE 737 DL は symbolic variant として際立つ (本週 Top4)。
- Pandoks の 3 variant 計 456 DL は少数研究者による iterative tuning の集合。

## 注目度コメント

**moe-quant focus 継続** — W45 の GLM-5.3-Flash + DSA Q8KV8 FP8 sparse prefill (SGLang) + GLM-5.3 NVFP4 (TRT-LLM) に続き、本週は GLM-5.3-Flash の派生実験が広がる。Pandoks の KDA gate revert 配布は DSA の gate 構造を変えた variant の精度影響を測る動きで、研究コミュニティの GLM 系統への関与増。
