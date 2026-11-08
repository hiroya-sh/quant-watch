---
id: "2026-W46-003"
type: paper
title: "CISA: Retrofitting Dense Attention Models with Chunk-Indexed Sparse Attention"
url: "https://arxiv.org/abs/2611.03200"
discovered: "2026-11-09"
published: "2026-11-02"
authors: ["Mohammed Dabbah", "Izhak Golan", "Oren Tropp", "Daniel Afrimi"]
venue: "arXiv:2611.03200"
models: []
architectures: ["dense"]
methods: ["NVFP4"]
tech: ["low-bit-fp4", "sparse-attention"]
priority: high
sources: [arxiv]
status: new
related: []
---

## 日本語要約

pretrained dense attention を勾配更新なしに retrofit する chunk-indexed sparse attention (CISA)。固定サイズ KV chunk を既存キーの compact summary で選び、token-level indexing と full-length index cache を回避。NVIDIA Nemotron 3 Nano/Ultra と Inkling-Small で検証。Ultra NVFP4 + 4,096-chunk budget で MRCR/LongBench v2/GraphWalks スコアは dense attention -1.5pt 以内。1M token prompt serving で Nemotron 3 Ultra NVFP4 on 4x B300 で dense 比 2.29x end-to-end throughput。

## 手法

KV chunk を compact key summary で選ぶ。KV group ごとに 1 つの indexing query を発行し、同 group 内で選択を共有。prefill では qshare が隣接 query 間で選択を再利用。

## 評価

- モデル: Nemotron 3 Nano / Ultra, Inkling-Small
- ビット幅: BF16 / NVFP4
- 精度劣化: Ultra NVFP4 で -1.5pt 以内 (MRCR, LongBench v2, GraphWalks)
- スループット: 1M prompt, 32 concurrent, 4K output で dense 2.29x (選択削減で 2.61x まで)

## 注目度コメント

NVFP4 focus — W36 の CISA 系 sparse attention + NVFP4 の組み合わせ。prefill 11.7x, decode 13.0x のコア加速は大きい。
