---
id: "2026-W36-026"
type: hf-model
title: "GLM-5.3 / GLM-5.3-Flash 量子化ウェーブ(zai-org, 2026-08-25 公開)"
url: "https://huggingface.co/zai-org/GLM-5.3-Flash"
discovered: "2026-09-01"
published: "2026-08-25"
base_model: "zai-org/GLM-5.3-Flash"
models: []
architectures: [transformer, moe]
methods: [NVFP4, MXFP4, GGUF]
tech: [low-bit-fp4, low-bit-fp8, weight-only, llamacpp-ready, vllm-ready]
priority: high
sources: [hf-models]
status: new
related: []
---
## 日本語要約
**zai-org が 2026-08-25 に GLM-5.3 / GLM-5.3-Flash を公開**し、公式 FP8 を含む形で即座に量子化ウェーブが立ち上がった。W36 の HF 側最大の動き。

## 主なリポジトリ(DL 数降順・2026-09-01 時点)
| repo | 作成 | DL | likes | 形式 |
|---|---|---|---|---|
| `zai-org/GLM-5.3-Flash` | 2026-08-25 | 379,271 | 1,832 | 公式(fp8 タグ) |
| `zai-org/GLM-5.3` | 2026-08-25 | 66,195 | 1,430 | 公式(fp8 タグ) |
| `unsloth/GLM-5.3-Flash-GGUF` | 2026-08-26 | 53,350 | 314 | GGUF |
| `unsloth/GLM-5.3-GGUF` | 2026-08-28 | 41,221 | 64 | GGUF |
| `antirez/glm-5.3-flash-gguf` | 2026-08-27 | 23,428 | 24 | GGUF |
| `LibertAIDAI/GLM-5.3-Flash-NVFP4` | 2026-08-26 | 21,232 | 56 | NVFP4 |
| `orcarouter/GLM-5.3-Flash-MLX` | 2026-08-26 | 10,873 | 31 | MLX dynamic-quant |
| `RedHatAI/GLM-5.3-Flash-NVFP4` | 2026-08-27 | 10,421 | 18 | NVFP4 |
| `zai-org/GLM-5.3-Flash-BF16` | 2026-08-25 | 8,648 | 52 | BF16 |
| `RadixArk/GLM-5.3-NVFP4` | 2026-08-28 | 7,127 | 10 | NVFP4 |
| `unsloth/GLM-5.3-Flash-FP8` | 2026-08-26 | 5,335 | 24 | FP8 |

## 量子化仕様
- ベースモデル: zai-org/GLM-5.3, zai-org/GLM-5.3-Flash
- 主な形式: 公式 FP8 / NVFP4 / MXFP4 / GGUF / MLX dynamic-quant
- **公開初日に BF16 と FP8 の両方が公式配布**され、翌日には GGUF と NVFP4 が揃った

## 精度報告
- コミュニティ版に体系的な精度報告は乏しい。**`RedHatAI/GLM-5.3-Flash-NVFP4` が vLLM 想定の配布元として最も素性が明確**。

## ダウンロード/利用状況
公開1週間で公式 Flash が 38万 DL / 1,832 likes。NVFP4 だけで LibertAI・RedHatAI・RadixArk・incoai の4系統が並立。

## 注目度コメント
**focus method NVFP4 の実機評価候補**。taxonomy に `zai-org/GLM-5.3` が未登録(既存は GLM-5.1 / GLM-5.2)なので追加候補。**議題候補**。
