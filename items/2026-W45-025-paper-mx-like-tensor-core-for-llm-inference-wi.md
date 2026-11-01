---
id: "2026-W45-025"
type: paper
title: "MX-Like Tensor Core for LLM Inference with NPU Integration via Hardware-Software Co-Design Exploration"
url: "https://arxiv.org/abs/2610.26083"
discovered: "2026-11-02"
published: "2026-10-19"
updated: "2026-10-19"
version: "v1"
authors: ["Zijun Zhao", "Ruichu Ao", "Stef Cuyckens", "Marian Verhelst", "Chao Fang"]
venue: "arXiv"
arxiv_categories: ["cs.AR"]
models: []
architectures: []
methods: ["NVFP4"]
tech: ["low-bit-fp4"]
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約

**Title**: MX-Like Tensor Core for LLM Inference with NPU Integration via Hardware-Software Co-Design Exploration

Block-scaled quantization formats such as OCP Microscaling (MX) and NVFP4 have been widely adopted as efficient data formats for LLM inference. However, the design space of these formats spanned by shared scale, weight, and activation format combinations has not been systematically explored, and the joint accuracy-silicon tradeoff across this space remains uncharacterized, leaving the true Pareto-...

(本記事は arXiv の abstract を機械要約せず原文抜粋のみ掲載。詳細は原著参照。)

## 手法

(arXiv abstract より) Block-scaled quantization formats such as OCP Microscaling (MX) and NVFP4 have been widely adopted as efficient data formats for LLM inference. However, the design space of these formats spanned by shared scale, weight, and activation format combinations has not been systematically explored, and the joint accuracy-silicon tradeoff across this space remains uncharacterized, leaving the true Pareto-optimal configurations for NPU-based edge LLM deployment an open question. To bridge this gap, we conduct a joint hardware-software (HW-SW) co-design exploration of the above underexplored MX-like des...

## 評価

- 対象モデル: abstract 参照
- ビット幅: abstract 参照
- 精度劣化: abstract 参照
- スループット/メモリ: abstract 参照

## 既存手法との差分

(原著参照 — 詳細な比較は本文の Related Work / Experiments を参照)

## 原著 Abstract (抜粋)

Block-scaled quantization formats such as OCP Microscaling (MX) and NVFP4 have been widely adopted as efficient data formats for LLM inference. However, the design space of these formats spanned by shared scale, weight, and activation format combinations has not been systematically explored, and the joint accuracy-silicon tradeoff across this space remains uncharacterized, leaving the true Pareto-optimal configurations for NPU-based edge LLM deployment an open question. To bridge this gap, we conduct a joint hardware-software (HW-SW) co-design exploration of the above underexplored MX-like design space with three innovations. 1) We define and systematically characterize the full 8-bit scale format family within the MX-like design space, jointly with asymmetric weight-activation precision, ...

## 注目度コメント

**NORMAL** — focus method: NVFP4 にマッチ。
