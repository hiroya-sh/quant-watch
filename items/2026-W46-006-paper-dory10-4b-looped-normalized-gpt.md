---
id: "2026-W46-006"
type: paper
title: "Dory1.0-4B: A Looped Normalized-GPT"
url: "https://arxiv.org/abs/2611.03998"
discovered: "2026-11-09"
published: "2026-11-02"
authors: ["Maxim Fishman", "Simeng Sun", "Shantanu Acharya", "Faisal Ladhak"]
venue: "arXiv:2611.03998"
models: []
architectures: ["transformer"]
methods: ["NVFP4", "GGUF"]
tech: ["kv-cache-quant", "low-bit-fp4", "low-bit-fp8", "microscaling-formats"]
priority: high
sources: [arxiv]
status: new
related: []
---

## 日本語要約

4B パラメータ looped language model Dory1.0-4B。NGPT backbone + sliding window/full attention 交互 + 共有 recurrent block。6T tokens 事前学習 (前半 4.5T を NVFP4 で)、長文を 256k まで拡張、SFT+RLVR で難しいプロンプトを深い loop に routing。loop 回数で精度増、2+ loop で Qwen3.5-9B / Gemma 4 12B / Gemma 4 26B-A4B を 12 ベンチ平均で上回る。last loop のみ KV cache する最適化で非 loop モデルと同じ KV footprint 維持。BF16/MXFP8/NVFP4/GGUF チェックポイント公開。

## 手法

NGPT + looped (shared recurrent block) + elastic depth。推論時に loop 回数を可変化。last-loop-only KV cache で looped の線形 KV 肥大を回避。学習は NVFP4 (前半 4.5T) で安定実施。

## 評価

- モデル: Dory1.0-4B (self)
- ビット幅: 事前学習 NVFP4 / 公開 BF16, MXFP8, NVFP4, GGUF
- 精度: 2+ loop で Qwen3.5-9B, Gemma 4 12B, Gemma 4 26B-A4B 以上 (12 ベンチ平均)
- トークン効率: 4 loop で 1 loop 比 1.3-2.5x 少ないトークン生成

## 注目度コメント

**gemma-4 focus 直接超え主張** — Gemma-4 12B / 26B-A4B を 4B で越えるとの主張。NVFP4 で 4.5T token 事前学習 (W45 Megatron MXFP8 事前学習の NVFP4 版)。HF daily paper 12 upvote。公開 NVFP4 / GGUF チェックポイントは即試験可能。
