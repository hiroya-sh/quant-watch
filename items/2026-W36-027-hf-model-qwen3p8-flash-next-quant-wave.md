---
id: "2026-W36-027"
type: hf-model
title: "Qwen3.8-Flash-Next 量子化ウェーブ(Qwen, 2026-08-24 公開)"
url: "https://huggingface.co/Qwen/Qwen3.8-Flash-Next"
discovered: "2026-09-01"
published: "2026-08-24"
base_model: "Qwen/Qwen3.8-Flash-Next"
models: []
architectures: [transformer, moe]
methods: [NVFP4, MXFP4, GGUF]
tech: [low-bit-fp4, low-bit-fp8, low-bit-2, weight-only, llamacpp-ready, moe-quant]
priority: high
sources: [hf-models]
status: new
related: []
---
## 日本語要約
**Qwen が 2026-08-24 に Qwen3.8-Flash-Next を公開**、同日に公式 FP8 も配布。GGUF は 37万 DL 超と今期最大級。**REAP でエキスパートを刈った GGUF(`REAP-256`)や MLX の Mixed-2bit** まで出ており、圧縮手法の多様さが際立つ。

## 主なリポジトリ(DL 数降順・2026-09-01 時点)
| repo | 作成 | DL | likes | 形式 |
|---|---|---|---|---|
| `unsloth/Qwen3.8-Flash-Next-GGUF` | 2026-08-26 | 373,029 | 645 | GGUF |
| `Qwen/Qwen3.8-Flash-Next` | 2026-08-24 | 158,598 | 4,556 | 公式 |
| `RadixArk/Qwen3.8-Flash-Next-NVFP4` | 2026-08-25 | 108,962 | 69 | NVFP4 |
| `Qwen/Qwen3.8-Flash-Next-FP8` | 2026-08-24 | 84,954 | 178 | 公式 FP8 |
| `AnonimousA/Qwen3.8-Flash-Next-REAP-256-duo-GGUF` | 2026-08-27 | 56,575 | 12 | **REAP expert pruning + GGUF** |
| `kingjones777/...-ROCmFP4-FAST-GGUF` | 2026-08-27 | 35,233 | 3 | ROCmFP4 |
| `Inferact/Qwen3.8-Flash-Next-NVFP4` | 2026-08-26 | 21,570 | 23 | NVFP4 |
| `Sawfwair/Qwen3.8-Flash-Next-MLX-Mixed-2bit` | 2026-08-26 | 10,993 | 9 | **MLX Mixed-2bit** |
| `primitive-ai/Qwen3.8-Flash-Next-NVFP4` | 2026-08-26 | 9,744 | 11 | NVFP4 |

## 量子化仕様
- ベースモデル: Qwen/Qwen3.8-Flash-Next
- 形式: 公式 FP8 / NVFP4 / MXFP4 / ROCmFP4 / GGUF / MLX Mixed-2bit
- **`REAP-256`**: llm-compressor 0.13.0 で追加された REAP (Router-weighted Expert Activation Pruning) 由来と思われるエキスパート刈り込み版。**リリースから約2週間でコミュニティ配布に到達**

## 精度報告
- 各カードでの精度報告は限定的。REAP 版・Mixed-2bit 版とも自己申告ベンチのみ。

## ダウンロード/利用状況
GGUF が 37万 DL、NVFP4 が 11万 DL。公式 FP8 も 8.5万 DL。

## 注目度コメント
**llm-compressor 0.13.0 の REAP が現実のコミュニティ配布に反映された初の観測**。「expert pruning + 量子化」の組み合わせは [[items/2026-W35-012-paper-moexbench-composable-moe-compression|MoEXBench]] / [[items/2026-W35-008-paper-qah-quantization-aware-healing|QAH]] が扱っているテーマそのもので、**論文・ライブラリ・配布モデルが同じ方向で揃った**。**強推し議題候補**。taxonomy に `Qwen/Qwen3.8` が未登録(既存は Qwen3.6 まで)。
