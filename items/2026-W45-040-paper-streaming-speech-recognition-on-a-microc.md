---
id: "2026-W45-040"
type: paper
title: "Streaming Speech Recognition on a Microcontroller: a 65.7M-Parameter Transducer in 2 and 4 Bits on the ESP32-P4"
url: "https://arxiv.org/abs/2610.38739"
discovered: "2026-11-02"
published: "2026-10-28"
updated: "2026-10-28"
version: "v1"
authors: ["Billal Boumedine"]
venue: "arXiv"
arxiv_categories: ["eess.AS", "cs.AR", "cs.LG"]
models: []
architectures: []
methods: ["GPTQ"]
tech: ["ptq", "rotation"]
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約

**Title**: Streaming Speech Recognition on a Microcontroller: a 65.7M-Parameter Transducer in 2 and 4 Bits on the ESP32-P4

We run Kroko, a 65.7M-parameter streaming Zipformer2 transducer for English, on the ESP32-P4, a microcontroller with two 400 MHz RISC-V cores, a 128-bit SIMD extension (PIE) and 32 MB of PSRAM, but no neural accelerator. Without any training, the encoder's 290 matrices are stored with 2 or 4 bits per weight in Hadamard-rotated groups: the width of each matrix comes from its measured sensitivity, a...

(本記事は arXiv の abstract を機械要約せず原文抜粋のみ掲載。詳細は原著参照。)

## 手法

(arXiv abstract より) We run Kroko, a 65.7M-parameter streaming Zipformer2 transducer for English, on the ESP32-P4, a microcontroller with two 400 MHz RISC-V cores, a 128-bit SIMD extension (PIE) and 32 MB of PSRAM, but no neural accelerator. Without any training, the encoder's 290 matrices are stored with 2 or 4 bits per weight in Hadamard-rotated groups: the width of each matrix comes from its measured sensitivity, and each matrix is first corrected toward the original model's output, then rounded with GPTQ and a search over the group norms. The released 71 MB of int8 weights become a 26.65 MB file. Activations a...

## 評価

- 対象モデル: abstract 参照
- ビット幅: abstract 参照
- 精度劣化: abstract 参照
- スループット/メモリ: abstract 参照

## 既存手法との差分

(原著参照 — 詳細な比較は本文の Related Work / Experiments を参照)

## 原著 Abstract (抜粋)

We run Kroko, a 65.7M-parameter streaming Zipformer2 transducer for English, on the ESP32-P4, a microcontroller with two 400 MHz RISC-V cores, a 128-bit SIMD extension (PIE) and 32 MB of PSRAM, but no neural accelerator. Without any training, the encoder's 290 matrices are stored with 2 or 4 bits per weight in Hadamard-rotated groups: the width of each matrix comes from its measured sensitivity, and each matrix is first corrected toward the original model's output, then rounded with GPTQ and a search over the group norms. The released 71 MB of int8 weights become a 26.65 MB file. Activations are int16 between the matrix products and int8 into them. A C engine with hand-written PIE kernels processes each 1.28 s chunk of audio in 0.90 s on both cores, beam search included, and its PC build c...

## 注目度コメント

**NORMAL** — 監視対象。
