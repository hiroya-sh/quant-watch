---
id: "2026-W34-003"
type: paper
title: "Tied Trit-Planes: Constraining PTQTP to a Uniform Nine-Level Quantizer, with a Persistent Folded Format for Disk-Streamed MoE Serving"
url: "https://arxiv.org/abs/2608.08910"
discovered: "2026-08-17"
published: "2026-08-10"
authors: [Matteo Grella]
venue: "arXiv"
models: [deepseek-ai/DeepSeek-V4]
architectures: [moe]
methods: [MXFP4]
tech: [moe-quant, weight-only, low-bit-2, low-bit-4]
priority: high
sources: [arxiv]
status: new
related: []
---
## 日本語要約
PTQTP は LLM 重みを2枚の三値(trit)平面+群ごと2スケールに分解する手法。本研究はスケール比を3に固定すると分解が**均一9値量子化**(balanced-ternary 恒等式)に collapse する点を PTQTP ソルバの制約として初めて導入。2枚の trit 平面は損失なく1枚の 4-bit code 平面(4.0625 bits/weight)に畳まれ、ディスク・expert キャッシュ・kernel 入力を同一バイトで扱える永続表現になる。DeepSeek-V4-Flash-0731 (284B-A13B MoE) の routed expert を公開 MXFP4 重みから one-shot 量子化し、64GB ラップトップで SSD ストリーミング serving を実演。

## 手法
ratio-3 nine-level コード + CPU-SIMD kernel + SSD expert streaming + 同一永続バイト、を一体化。4.5-bit Q4_K ベースラインと対比。

## 評価
- 対象モデル: DeepSeek-V4-Flash-0731 (284B-A13B MoE)
- ビット幅: 実効 4.0625 bits/weight (9値ternary折り畳み)
- メモリ: 64GB ノートで SSD ストリーミング serving 可能

## 既存手法との差分
PTQTP に9値恒等式を制約として課すのは初。折り畳み後の永続 4-bit フォーマットで disk/cache/kernel を統一する点も新規と主張。

## 注目度コメント
focus の DeepSeek-V4・moe-quant に合致(moe-quant bump)。公開 MXFP4 から one-shot 変換でコモディティ機に載る点が実運用的。
