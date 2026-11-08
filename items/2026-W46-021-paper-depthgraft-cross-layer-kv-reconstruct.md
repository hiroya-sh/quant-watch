---
id: "2026-W46-021"
type: paper
title: "DepthGraft: Structural Regularization through Hierarchical Cross-Layer KV Reconstruction"
url: "https://arxiv.org/abs/2611.03142"
discovered: "2026-11-09"
published: "2026-11-02"
authors: ["Xiaohan Qin", "Xiangdong Zhang", "Yu Wang", "Huaijin Wu"]
venue: "arXiv:2611.03142"
models: []
architectures: ["moe", "dense"]
methods: []
tech: ["kv-cache-compression-non-quant"]
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約

Pre-LN 深層での depth-wise 情報希釈を緩和する cross-layer KV sharing の構造規則化効果に注目。各 KV 再利用 edge が深層→源 KV 投影への直接勾配経路を作り、KV 共有が implicit regularizer として働く。既存の隣接共有や global-anchor では十分に活用されていないと示す。DepthGraft は stride 整列された shallow-middle 源ペアから深層 KV を再構成する階層共有。0.5B-16B の dense/MoE で改善、GQA/MLA 両対応。16B MoE で MMLU-Pro +7.0pt, CMMLU +6.6pt, C3 +6.4pt。KV cache 約 1/3 削減。

## 手法

stride 整列された shallow-middle 層ペアから深層 KV を再構成する階層トポロジー。non-local 勾配を複数源層に分散。

## 評価

- モデル: dense + MoE 0.5B-16B
- 精度: MMLU-Pro +7.0pt (16B MoE), CMMLU +6.6pt, C3 +6.4pt
- KV 削減: 約 33%

## 注目度コメント

kv-cache-quant focus (補集合 kv-cache-compression-non-quant) — W45 cross-layer KV と並ぶ構造的 KV 削減。compound で kv 量子化と直交する。
