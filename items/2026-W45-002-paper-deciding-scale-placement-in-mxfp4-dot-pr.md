---
id: "2026-W45-002"
type: paper
title: "Deciding Scale Placement in MXFP4 Dot Products with Integer Arithmetic"
url: "https://arxiv.org/abs/2610.29445"
discovered: "2026-11-02"
published: "2026-10-21"
updated: "2026-10-21"
version: "v1"
authors: ["Shreyas Vinayakumar"]
venue: "arXiv"
arxiv_categories: ["cs.LO", "cs.AR", "cs.PL"]
models: []
architectures: []
methods: ["MXFP4"]
tech: ["low-bit-fp4"]
priority: high
sources: [arxiv]
status: new
related: []
---

## 日本語要約

**Title**: Deciding Scale Placement in MXFP4 Dot Products with Integer Arithmetic

The Open Compute Project's microscaling (MX) family includes MXFP4, which stores 32 four-bit elements with a shared power-of-two scale. When lowering a dot-product reduction, a compiler can apply these scales before the reduction, or defer scaling until afterwards. Although equivalent over real numbers, these formulations can produce different IEEE binary32 results through overflow or underflow, w...

(本記事は arXiv の abstract を機械要約せず原文抜粋のみ掲載。詳細は原著参照。)

## 手法

(arXiv abstract より) The Open Compute Project's microscaling (MX) family includes MXFP4, which stores 32 four-bit elements with a shared power-of-two scale. When lowering a dot-product reduction, a compiler can apply these scales before the reduction, or defer scaling until afterwards. Although equivalent over real numbers, these formulations can produce different IEEE binary32 results through overflow or underflow, with equivalence also depending on the reduction tree. We study the legality of compiler rewrites in either direction by deriving conditions under which the two formulations are bitwise equivalent.
  T...

## 評価

- 対象モデル: abstract 参照
- ビット幅: abstract 参照
- 精度劣化: abstract 参照
- スループット/メモリ: abstract 参照

## 既存手法との差分

(原著参照 — 詳細な比較は本文の Related Work / Experiments を参照)

## 原著 Abstract (抜粋)

The Open Compute Project's microscaling (MX) family includes MXFP4, which stores 32 four-bit elements with a shared power-of-two scale. When lowering a dot-product reduction, a compiler can apply these scales before the reduction, or defer scaling until afterwards. Although equivalent over real numbers, these formulations can produce different IEEE binary32 results through overflow or underflow, with equivalence also depending on the reduction tree. We study the legality of compiler rewrites in either direction by deriving conditions under which the two formulations are bitwise equivalent.
  To decide rewrite legality, we construct an integer state machine that exploits the finite element alphabet and shared power-of-two scales, modeling overflow, NaN, and subnormal rounding. We prove its ...

## 注目度コメント

**HIGH** — 定例議題候補。
