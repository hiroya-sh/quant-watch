---
id: "2026-W43-034"
type: paper
title: "PatchKV: Weight-Space Compensation of KV Cache"
url: "https://arxiv.org/abs/2609.39329"
discovered: "2026-10-19"
published: "2026-09-30"
authors: ["Chanryeol Lee", "Chanhyuk Lee", "Yeonwoo Choi", "Donggyun Kim", "Seunghoon Hong"]
venue: "arXiv:2609.39329v2"
models: []
architectures: [transformer]
methods: []
tech: [block-wise, kv-cache-compression-non-quant, lossless-quantization-recovery]
priority: normal
sources: [arxiv]
status: updated
related: []
---

## 日本語要約
KV cache 圧縮の情報損失を**重み側に移す**(weight-space compensation)PatchKV の v2 更新。コンテキストローディング時にリッジ回帰で算出した軽い weight patch をキャッシュと組にすることで圧縮時の精度劣化を補償。

## 手法 / 評価のポイント
- 対象: KV cache 圧縮の精度劣化補償
- 手法: ロード時にリッジ回帰で軽い weight patch を算出し重みに加算
- v2 更新

## 注目度コメント
PatchKV: weight-space compensation of compressed KV — v2 update
