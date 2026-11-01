---
id: "2026-W45-021"
type: github
subtype: library
title: "vllm-project/llm-compressor: 0.15.0"
url: "https://github.com/vllm-project/llm-compressor/releases/tag/0.15.0"
discovered: "2026-11-02"
published: "2026-10-29"
repo: "vllm-project/llm-compressor"
release_tag: "0.15.0"
models: []
architectures: ["transformer", "moe", "dense"]
methods: ["GPTQ", "AWQ", "SmoothQuant", "SpinQuant", "NVFP4", "MXFP4", "MXFP6", "AutoRound", "HIGGS", "REAP", "MoNe", "QAD"]
tech: ["activation-quant", "mixed-precision", "ptq", "calibration", "rotation"]
priority: high
sources: [github]
status: new
related: []
---

## 日本語要約

**HIGGS 混合精度量子化**(#3028: get_higgs_config が ILP で層ごと最適ビット幅を 10 秒以内に決定、6bit 目標で Llama-3.1-8B の WikiText PPL 11.05)、**MoNe expert pruning**(低顕著度エキスパートを novice ベクトルに畳み込む)、**ブロック単位 QAD** (`QADModifier` が teacher model 不要の blockwise distillation)、**レイヤーワイズ compression と offloading**(CPU/pinned-memory + background prefetch)、**checkpoint 直接 REAP**(ExpertPruner が safetensors を直接 prune)、**MXFP4 観測を 6x 高速化**する exponential E8M0 グリッド、**NVFP4A16 を 1.2-3.4x 高速化**する MSE/iMatrix Triton kernel 統一、**MXFP6A16/A8 サポート #3250**、**offline SpinQuant R1/R2 rotations #3262**。Documented: **GLM-5.3 MXFP4xFP8 #3380 / NVFP4 #3230**、**Nemotron 3.5 Super VL FP8 #3291**。

## 量子化関連の変更点

- **新規手法**: HIGGS 自動混合精度(ILP solver + MSE collector、paper: arxiv 2411.17525) #3028、MoNe expert pruning(novice 畳み込み、router は R+N 幅のまま)#3281、ブロック QAD(teacher-free) #3029
- **フォーマット**: MXFP6A16/A8 サポート #3250、MXFP4 観測が **~6x 高速**(exponential E8M0) #3348、NVFP4A16 が **1.2-3.4x 高速**(統一 MSE/iMatrix Triton) #3233
- **PTQ パイプライン改善**: SpinQuant R1/R2 rotation を safetensors に offline fold #3262、max_workers='auto' 既定化 #3250、layerwise 分解圧縮(subgraph 単位)+ CPU/pinned-memory staging + background prefetch #3162/#3221/#3228
- **モデル対応**: Kimi-K3 fused modules 実行デバイス側構築 #3259、GPT-OSS routing を REAP でスキップ #3223、MtpModel の MTP 層ロード対応 #3225、DeepSeek-V3 example を NVFP4 backbone + FP8 MTP one-shot に #3402
- **Documented checkpoints**: GLM-5.3 MXFP4xFP8 #3380 / GLM-5.3 NVFP4 #3230 / Nemotron 3.5 Super VL FP8 #3291
- Intel XPU 向け GPTQ Triton kernel #3339

## 影響範囲

- **新機能パス**: HIGGS と MoNe は破壊的ではないが、既存の量子化スクリプトに `get_higgs_config` / `QADModifier` を追加するだけで混合精度化と blockwise distillation に移行できる。
- **性能影響**: MXFP4 校正 ~6x 高速化、NVFP4A16 ~1.2-3.4x 高速化 — 既存キャリブレーションパイプラインを再実行して影響測定推奨。
- vLLM 側で読み込める量子化出力(GLM-5.3 MXFP4xFP8 / NVFP4、Nemotron 3.5 Super VL FP8)が **チュートリアル化**されたため、評価の再現性が上がる。

## リリースノート抜粋

```
<img width="1536" height="1024" alt="LLM Compressor v0 15 0 Banner" src="https://github.com/user-attachments/assets/a810128f-7dbe-4798-958a-24dc2ce0ce91" />

# LLM-Compressor v0.15.0

This release adds **HIGGS mixed-precision quantization, MoNe expert pruning, block-wise Quantization-Aware Distillation (QAD), layerwise compression with a rewritten offloading path, checkpoint-space REAP workflows, faster observers, and MXFP6 support**.

It also includes bug fixes, expanded model support, performance improvements, and dependency updates.

## Key Highlights ✨

- **HIGGS autoquantization (#3028):** `get_higgs_config` selects optimal quantization schemes for each layer to maximize estimated accuracy under a target average bitwidth.
- **Block-wise QAD (#3029):** `QADModifier` distills against cached, unquantized subgraph outputs without requiring a teacher model.
- **Layerwise compression and offloading (#3162, #3221, #3228):** Converts large checkpoints one subgraph at a time using CPU/pinned-memory staging and background prefetching.
- **REAP and MoNe (#3281, #3343):** Enables direct checkpoint pruning using per-expert saliency reports. MoNe collapses low-saliency experts into "novice" vectors for higher throughput.
- **Faster observers (#3348, #3233):** Exponential E8M0 grids make MXFP4 MSE observation approximately 6× faster. A shared MSE/iMatrix Triton kernel delivers 1.2–3.4× NVFP4A16 speedups.
- **Model-free PTQ and MXFP6 (#3262, #3250, #3286):** Adds offline SpinQuant R1/R2 rotations, converter chains, `max_workers="auto"`, and MXFP6A16/A8 support.
- **Expanded model and hardware coverage:** Adds a GPTQ Triton kernel for Intel XPU (#3339) and Transformers `MtpModel` loading for MTP layers (#3225).

## HIGGS Mixed-Precision Quantization

HIGGS introduces automatic mixed-precision quantization configuration.

- Uses `HiggsMSECollectorConverter` to collect per-layer MSE.
- Calculates heuristic sensitivity and solves an integer linear program (ILP) to meet the target bitwidth.
- Collection is model-free, does not write a checkpoint, and takes under 10 seconds for Llama-3.1-8B-Instruct.
- Composes with both the `oneshot` and `ModelFreePtq` entry points.
- Based on the [HIGGS paper](https://arxiv.org/abs/2411.17525).

At a **6.0-bit target**, the following WikiText perplexity results were achieved:

| Configuration | WikiText perplexity |
| --- | ---: |
| HIGGS + `QuantizationModifier` | 11.05 |
| HIGGS + GPTQ | 10.99 |

## Q...
```

## 注目度コメント

**HIGH** — focus method NVFP4 にマッチ。火曜定例の議題候補。
