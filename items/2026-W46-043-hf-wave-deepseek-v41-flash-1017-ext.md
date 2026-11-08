---
id: "2026-W46-043"
type: hf-model
title: "deepseek-ai/DeepSeek-V4.1-Flash-1017 量子化ウェーブ (継続: ggml-org GGUF / magnitudedev MXFP4 / MLX iQ 2.25bpw / REAP 50-75)"
url: "https://huggingface.co/ggml-org/DeepSeek-V4.1-Flash-1017-GGUF"
discovered: "2026-11-09"
published: "2026-11-03"
base_model: "deepseek-ai/DeepSeek-V4.1-Flash-1017"
models: ["deepseek-ai/DeepSeek-V4"]
architectures: ["moe", "hybrid"]
methods: ["GGUF", "MXFP4", "GPTQ"]
tech: ["low-bit-fp4", "low-bit-fp8", "low-bit-2", "moe-quant", "mixed-precision"]
priority: high
sources: [hf-models]
status: new
related: []
---

## 日本語要約

W45 で初出した DeepSeek-V4.1-Flash-1017 wave が本週も継続。**ggml-org 公式 GGUF (DL 290)** と **magnitudedev MXFP4/FP8 GGUF (DL 558)** が加わり、**ddalcu MLX-Serve iQ-MLX-Pruned192-2.25bpw (DL 246)**、**jackmaxwil REAP-50 (DL 124) / REAP-75 (DL 123)**、**MasherDon SiegeLadder-GGUF GPTQ MoE (DL 435)**、**mehen0107 GSQ-agentic-strata (DL 484)** が揃う。公式 NVFP4 は W45 で既出。

## 量子化仕様

| 配布者 | 形式 | DL |
|---|---|---|
| ggml-org/DeepSeek-V4.1-Flash-1017-GGUF | GGUF (official community) | 290 |
| magnitudedev/DeepSeek-V4.1-Flash-1017-GGUF | MXFP4/FP8 GGUF | 558 |
| ddalcu/.../-MLX-Serve-iQ-MLX-Pruned192-2.25bpw | MLX iQ 2.25bpw (pruned 192 experts) | 246 |
| jackmaxwil/DeepSeek-V4.1-Flash-REAP-50 | REAP 50% expert pruning | 124 |
| jackmaxwil/DeepSeek-V4.1-Flash-REAP-75 | REAP 75% expert pruning | 123 |
| MasherDon/.../-SiegeLadder-GGUF | GPTQ MoE in GGUF | 435 |
| mehen0107/.../-GSQ-agentic-strata | GSQ GPTQModel GGUF | 484 |

- ベース: `deepseek-ai/DeepSeek-V4.1-Flash-1017`
- 手法: GGUF (K-quant), MXFP4 (ggml-org native), MLX iQ with REAP pruning, GPTQ via GPTQModel GSQ
- ビット幅: 平均 2.25-4 bpw、expert 選択で mixed
- フォーマット: GGUF / MLX / compressed-tensors

## 精度報告(あれば)

- REAP 50 / REAP 75 は W45 llm-compressor 0.15.0 の REAP expert pruning を適用した配布。model card では expert の 50% / 75% を prune としているが MMLU 等の自前ベンチなし。
- magnitudedev は MXFP4 + FP8 の混合配布で ggml MXFP4 mat-vec 高速化 (llama.cpp v0.9.0) と同時に機能。

## ダウンロード/利用状況

- ggml-org 公式 GGUF の DL が 290 と比較的控えめなのは W45 で magnitudedev 等の派生が先行していたため。
- MLX 2.25bpw は Apple Silicon での 400GB MoE 実行環境を 100GB 台に押し込む試み。
- REAP 50/75 の 2 変種が同時配布されるのは llm-compressor REAP が "aggressive=高精度トレードオフ" を選べることを示唆。

## 注目度コメント

**moe-quant focus** — W45 の継続だが、ggml-org 公式 GGUF + MLX 2.25bpw + REAP 2 変種の重ね合わせは "公式→コミュニティ→Apple Silicon→expert pruning" の 4 レイヤーが揃った初ケース。llm-compressor 0.15.0 REAP が複数者で配布される段階へ。
