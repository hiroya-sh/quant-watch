---
id: "2026-W45-050"
type: hf-wave
title: "Nanbeige4.3-33B NVFP4 / AutoRound wave"
url: "https://huggingface.co/primitive-ai/Nanbeige4.3-33B-NVFP4"
discovered: "2026-11-02"
published: "2026-10-27"
base_models: []
architectures: []
methods: ["NVFP4", "AutoRound", "GGUF"]
tech: ["low-bit-fp4"]
priority: normal
sources: [hf-models]
status: new
related: []
---

## 日本語要約

nanbeige/Nanbeige4.3 をベースとした量子化派生の **ウェーブ**。本週窓内の新規配布として 4 件、累計ダウンロード **4,421**(窓内確認時点)。**Nanbeige4.3-33B(dense LLM)の NVFP4 wave**。公式ではなくコミュニティ 3org 発。NVFP4 + NVFP4 GGUF + W8A16 AutoRound base が同日前後で揃った。

## メンバー配布一覧

| HF Model ID | DL | Created | 備考 |
|---|---:|---|---|
| `esatapedico/Nanbeige4.3-33B-NVFP4-GGUF` |  1418 | 2026-10-27 | NVFP4 GGUF |
| `primitive-ai/Nanbeige4.3-33B-NVFP4` |  1111 | 2026-10-25 | NVFP4 |
| `webbrain-one/Nanbeige4.3-33B-NVFP4` |   987 | 2026-10-25 | NVFP4 |
| `stuchapin/Nanbeige4.3-33B-Base-W8A16-AutoRound` |   905 | 2026-10-25 | W8A16 AutoRound base |

## 量子化仕様

- 量子化手法: NVFP4, AutoRound, GGUF
- 共通ベース: `nanbeige/Nanbeige4.3`
- ファイルフォーマット: GGUF / safetensors(各 model card 参照)

## 注目度コメント

**NORMAL** — focus method NVFP4 にマッチ。コミュニティ配布動向。
