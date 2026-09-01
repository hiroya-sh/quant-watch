---
id: "2026-W35-024"
type: hf-model
title: "Qwen3.8-27B 量子化ウェーブ(W35 継続)"
url: "https://huggingface.co/models?other=nvfp4&sort=downloads"
discovered: "2026-09-01"
published: "2026-08-17"
base_model: "Qwen/Qwen3.8-27B"
models: []
architectures: [transformer]
methods: [NVFP4, GGUF]
tech: [low-bit-fp4, weight-only, llamacpp-ready]
priority: high
sources: [hf-models]
status: updated
related: []
---
## 日本語要約
W34 で始まった Qwen3.8-27B の量子化ウェーブが W35 も継続し、NVFP4 系のダウンロードが伸びた。とくに iMatrix 校正 + NVFP4 + MTP を組み合わせた GGUF が突出している。

## 主なリポジトリ(NVFP4 タグ、DL 数降順・W35 作成分)
| repo | 作成 | DL | likes |
|---|---|---|---|
| `cdiamond/Qwen3.8-27B-iMatrix-NVFP4-MTP-GGUF` | 2026-08-17 | 759,202 | 7 |
| `sakamakismile/Huihui-Qwen3.8-27B-abliterated-NVFP4` | 2026-08-16 | 52,780 | 51 |
| `orcarouter/Qwen3.8-27B-Uncensored-NVFP4` | 2026-08-19 | 47,090 | 123 |
| `RedHatAI/Qwen3.8-27B-NVFP4` | 2026-08-17 | 14,240 | 7 |
| `gittensor-model-hub/Qwen3.8-27B-DSpark-NVFP4` | 2026-08-18 | 9,996 | 17 |
| `esatapedico/Qwen3.8-27B-NVFP4-BUDGET-GGUF` | 2026-08-16 | 7,939 | 12 |

## 量子化仕様
- ベースモデル: Qwen3.8-27B
- 量子化手法: NVFP4 中心、iMatrix 校正併用の GGUF 変種あり
- ビット幅: FP4 (NVFP4)
- 量子化対象: weight 主体
- ファイルフォーマット: safetensors (NVFP4) / GGUF

## 精度報告
- 各カードでの体系的な精度報告は限定的。**RedHatAI 版が最も素性が明確**(vLLM での動作を想定した配布元)。

## ダウンロード/利用状況
`cdiamond` の iMatrix-NVFP4-MTP-GGUF が 75万 DL 超と突出。コミュニティ側の関心は「NVFP4 + MTP + iMatrix 校正」の組み合わせに集中している。

## 注目度コメント
`RedHatAI/Qwen3.8-27B-NVFP4` は vLLM で直接ロードできる可能性が高く、**focus method NVFP4 の実機評価に最短**。DL 数はスナップショット値(2026-09-01 時点)。
