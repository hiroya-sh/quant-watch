---
id: "2026-W29-005"
type: paper
title: "BiSCo-LLM: Lookup-Free Binary Spherical Coding for Extreme Low-Bit Large Language Model Compression"
url: "https://arxiv.org/abs/2607.08643"
discovered: "2026-07-13"
published: "2026-07-09"
authors: [Yuantian Shao, Peisong Wang, Zhilei Liu, Chuangyi Li, Yuanteng Chen, Pengcheng Xie]
venue: "arxiv (cs.LG)"
models: []
architectures: [transformer]
methods: []
tech: [weight-only, low-bit-2, low-bit-1bit]
priority: normal
sources: [arxiv]
status: new
verified: "2026-07-13 arXiv API で ID/タイトル/著者/abstract 取得・実在確認"
related: []
---

## 日本語要約
2bit 近傍の極低ビット weight 圧縮で、スカラー量子化(表現力不足)とベクトル量子化(コードブック+索引のオーバーヘッド)の間を狙う **codebook-free の binary spherical coding**。明示的コードブック・index lookup・追加ストレージなしにブロックレベルの豊かな表現を得ると主張。

## 注目ポイント
- VQ 系(AQLM 等)の弱点であるルックアップコストを消す設計
- 同週の [[items/2026-W29-035-hf-model-glm52-nvfp4-aqlm-hybrid|NVFP4+AQLM hybrid]] と対照的なアプローチ

## 注目度コメント
極低ビット圧縮の実用化ボトルネック(kernel 効率)への直球。優先度 normal。
