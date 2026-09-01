---
id: "2026-W36-003"
type: paper
title: "Q-Strata: Hierarchical Bit Allocation for Mixed-Precision Quantization of Mixture-of-Experts LLMs"
url: "https://arxiv.org/abs/2608.30564"
discovered: "2026-09-01"
published: "2026-08-31"
venue: "arXiv (cs.LG, cs.AI)"
models: []
architectures: [moe]
methods: [Q-Strata]
tech: [moe-quant, mixed-precision, weight-only, ptq]
priority: high
sources: [arxiv]
status: new
related: []
---
## 日本語要約
Mixed-precision quantization (MPQ) は各線形層に異なるビット幅を割り当てて固定予算下の品質劣化を最小化するが、**MoE モデルでは全 MoE ブロックの全エキスパートにその層が存在する**ため、割当空間が dense モデルよりはるかに巨大になる。既存手法は (a) ブロックごとに一様な予算の下でブロック内割当を行うか、(b) 加法的なプロキシでブロック間割当を行うかのどちらかで、**ブロック間を結合する選択に対してモデルレベルの目的関数を直接最適化していない**。

## 手法
**Q-Strata** — 二層(bi-level)アロケータ。
- **内側**: 安価なプロキシでブロック内割当をランク付けし、ブロックごとに Pareto フロンティアの候補をキャッシュ
- **外側**: 組み上げた量子化モデル上で評価するモデルレベル目的関数でブロック間に割り当てる

## 評価
- 対象: MoE LLM の mixed-precision weight 量子化

## 既存手法との差分
ブロック内はプロキシ、ブロック間は実測、という役割分担で探索コストとモデルレベル最適性を両立。

## 注目度コメント
focus tech **moe-quant に直撃**。ModelOpt 0.46.0 の AutoQuantize レシピ(`effective_bits` 目標、`active_moe` cost model、module_search_spaces)がまさに同じ問題を扱っており、**実装側の対応物がすでに手元にある**。MoEXBench([[items/2026-W35-012-paper-moexbench-composable-moe-compression|W35-012]])と合わせて MoE 圧縮の評価設計が揃った。**強推し議題候補**。
