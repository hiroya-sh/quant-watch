---
id: "2026-W46-012"
type: paper
title: "LoopVQ: Sub 1-bit KV Cache Quantization for Looped Transformers"
url: "https://arxiv.org/abs/2611.05304"
discovered: "2026-11-09"
published: "2026-11-03"
authors: ["Minsoo Cheong", "Sungjoo Yoo"]
venue: "arXiv:2611.05304"
models: []
architectures: ["transformer"]
methods: []
tech: ["kv-cache-quant", "low-bit-1bit"]
priority: high
sources: [arxiv]
status: new
related: []
---

## 日本語要約

Looped transformer 向け sub-1bit KV cache VQ。loop 軸での高い冗長性と loop step ごとの量子化感度差を活用し、複数 loop step の channel を joint code。full precision 出力に合わせて codebook を fine-tune。0.5 bit/element で Ouro / Huginn の汎用、long CoT、長文検索すべてで既存 KV VQ 法を上回る。TASQ 併用で 0.25 bit/element でも BF16 精度の多くを保持。SGLang 実装で decode latency ほぼ半減、1.4B / 2.6B Ouro で peak serving throughput を 4.3x / 6.1x に。

## 手法

複数 loop step の channel を joint code (VQ)。codebook は full precision 出力との L2 で fine-tune。TASQ と組み合わせ可能。

## 評価

- モデル: Ouro 1.4B / 2.6B, Huginn
- ビット幅: 0.5bpv / 0.25bpv (TASQ 併用)
- 精度: 0.5bpv で BF16 近傍、0.25bpv でも多くを保持
- スループット: SGLang 実装で decode latency ほぼ半減、throughput 4.3x/6.1x

## 注目度コメント

kv-cache-quant focus + SGLang 接続 — 1-bit 以下の KV を SGLang 実装として示した意義は大きい。HF daily paper 11 upvote。Dory1.0-4B / LoopKV と looped × KV 3 本セット。
