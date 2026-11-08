---
id: "2026-W46-016"
type: paper
title: "StrataFlux: Memory-Hierarchy-Native Low-Bit LLM Inference"
url: "https://arxiv.org/abs/2611.08363"
discovered: "2026-11-09"
published: "2026-11-05"
authors: ["Jake Hyun", "Ziyu Zhao", "Jae-sun Seo", "Mohamed S. Abdelfattah"]
venue: "arXiv:2611.08363"
models: []
architectures: ["transformer"]
methods: ["AWQ"]
tech: ["kv-cache-quant", "low-bit-2", "low-bit-4"]
priority: high
sources: [arxiv]
status: new
related: []
---

## 日本語要約

Host RAM と SSD を "追加精度ソース" として使う strataflux。selective precision streaming で転送量を削減し、計算とオーバーラップ、取得した精度を decode step 間で再利用、生成を転送待ちにしない。2bit Llama-3.1-8B-Instruct で WikiText-2 PPL を 9.46→8.40、スループット 95.4% 維持 (RTX 5090)。2bit W + KV で Qwen3-8B の AIME 2024/2025 を 11.0%→47.1% (GPU メモリ不変)。128k context で Llama-3.1-8B の 3bit W + 2bit KV が vLLM の 4bit AWQ W + 8bit KV と同等 PPL/速度、約半分の GPU memory。

## 手法

GPU には低ビット weight + KV、host RAM/SSD には高精度の "refinement" を保存。selective streaming で必要なブロックだけ fetch、overlap と再利用で待ちを隠蔽。

## 評価

- モデル: Llama-3.1-8B-Instruct, Qwen3-8B
- ビット幅: 2-4bit W, 2-3bit KV
- 精度: Qwen3-8B AIME 11.0%→47.1% (2bit W+KV)
- GPU: RTX 5090 で vLLM 4bit AWQ 比約半分メモリで同等品質

## 注目度コメント

kv-cache-quant + low-bit-2 — 「GPU resident の精度が天井」ではない設計点。W45 の SSD/paged expert と似た方向で、実機 (RTX 5090) 評価が強い。
