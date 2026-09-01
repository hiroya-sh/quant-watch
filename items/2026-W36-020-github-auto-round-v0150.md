---
id: "2026-W36-020"
type: github
subtype: library
title: "AutoRound v0.15.0"
url: "https://github.com/intel/auto-round/releases/tag/v0.15.0"
discovered: "2026-09-01"
published: "2026-08-31"
repo: "intel/auto-round"
release_tag: "v0.15.0"
models: [google/gemma-4, moonshotai/Kimi-K2.5]
architectures: [transformer, moe]
methods: [AutoRound, AWQ, MXFP4, GGUF]
tech: [moe-quant, kv-cache-quant, weight-only, low-bit-2, low-bit-4, low-bit-fp8, calibration, microscaling-formats]
priority: high
sources: [github]
status: new
related: []
---
## 日本語要約
**SVDQuant 対応**、**fused MoE の GGUF 量子化・エクスポート**、**per-head FP8 KV attention 校正**が入った実質的なリリース。MoE と KV の両方に踏み込んでおり focus と重なりが大きい。

> 注: 公開時刻は 2026-08-31 14:55 JST で本来の W36 窓をわずかに超えるが、キャッチアップのため本週に取り込む。

## focus 突合(release body 全文スキャン)
- **google/gemma-4: 該当あり** — `Fix: gguf format gemma4 High RAM and glm-4.7 error` (#2084)
- **moe-quant: 該当あり** — fused MoE の GGUF 量子化・エクスポート (#2072)、MoE prefill/decode の int2/int4/int8 sym/asym + fp8 e4m3/e5m2 (#1813)
- **kv-cache-quant: 該当あり** — `Feat: add per-head fp8 kv attention calibration` (#2044)
- NVFP4 / TurboQuant / PolarQuant / QJL: 出現なし

## 量子化関連の変更点
- **`Support SVDQuant`** (#2095)
- **`Support fused MoE quantization and export for GGUF format`** (#2072)
- **`Add moe prefill/decode with int2/int4/int8 sym/asym and fp8 e4m3 e5m2`** (#1813) ← **int2 まで含む MoE 量子化**
- **`Feat: add per-head fp8 kv attention calibration`** (#2044)
- `Feat: enable search scale for mxfp in model-free` (#2141)、`Support one more mxfp4 variant` (#2132)
- `Add OpenCodeInstruct calibration dataset` (#2096)、`Automatically select calibration datasets for code models` (#2107)
- `Fix: MXFP model free auto-round format bug` (#2106)、`Fix: skip exporting fp8 attention q_max` (#2103)
- `Set the quant_method to auto-round by default` (#2138)
- Kimi K2.5 の INT4 packed source model 対応 (#2156)
- AWQ の torch_compile 問題修正 + **AWQ で `disable_opt_rtn` を既定 true 化** (#2208)
- `Fix: FP8 quantization config for native fp8 export` (#2228)
- compressor / quantizer のリファクタ (#2039)

## 影響範囲
- SGLang v0.5.18 が **auto-round 向け AMX CPU サポート** (#29593) を入れており、auto-round → SGLang(CPU)の経路が繋がりつつある。
- llm-compressor 0.13.0 も AutoRound sub-bit quantization (#2895) を取り込んでおり、**AutoRound が各所に組み込まれる流れ**。

## 注目度コメント
int2 MoE と per-head FP8 KV 校正は focus の両輪。**議題候補**。ただし vLLM 直結の記述はないため `vllm-ready` は付与しない。
