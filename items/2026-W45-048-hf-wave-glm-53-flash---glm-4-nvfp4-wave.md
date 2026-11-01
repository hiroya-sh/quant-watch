---
id: "2026-W45-048"
type: hf-wave
title: "GLM-5.3-Flash / GLM-4 NVFP4 wave"
url: "https://huggingface.co/12fn/GLM-5.3-Flash-NVFP4-W4A16-2x-RTX-PRO-6000"
discovered: "2026-11-02"
published: "2026-10-30"
base_models: []
architectures: []
methods: ["NVFP4"]
tech: ["low-bit-fp4"]
priority: normal
sources: [hf-models]
status: new
related: []
---

## 日本語要約

zai-org/GLM-5.3 をベースとした量子化派生の **ウェーブ**。本週窓内の新規配布として 2 件、累計ダウンロード **2,010**(窓内確認時点)。GLM-5.3-Flash / GLM-4-32B の **NVFP4 (W4A16) 派生**。TRT-LLM rc1 の `#20127 Support NVFP4 GLM-5.3-Flash checkpoints` と rc2 の `#20517 Add GLM-5.2 NVFP4 low-latency decode on Rubin` に同期した市場反応。

## メンバー配布一覧

| HF Model ID | DL | Created | 備考 |
|---|---:|---|---|
| `axteam/GLM-4-32B-0414-NVFP4A16` |  1014 | 2026-10-30 | NVFP4A16 |
| `12fn/GLM-5.3-Flash-NVFP4-W4A16-2x-RTX-PRO-6000` |   996 | 2026-10-27 | NVFP4 W4A16 2x RTX PRO 6000 |

## 量子化仕様

- 量子化手法: NVFP4
- 共通ベース: `zai-org/GLM-5.3`
- ファイルフォーマット: GGUF / safetensors(各 model card 参照)

## 注目度コメント

**NORMAL** — focus method NVFP4 にマッチ。コミュニティ配布動向。
