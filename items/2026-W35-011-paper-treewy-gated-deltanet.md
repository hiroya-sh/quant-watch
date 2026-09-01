---
id: "2026-W35-011"
type: paper
title: "TreeWY: Speculative Verification for Gated DeltaNet Hybrids"
url: "https://arxiv.org/abs/2608.20961"
discovered: "2026-09-01"
published: "2026-08-21"
venue: "arXiv (cs.AI, cs.CL, cs.DC, cs.LG, cs.PF)"
models: []
architectures: [linear-attention, gla, hybrid]
methods: []
tech: [speculative-decoding, kv-cache-compression-non-quant]
priority: normal
sources: [arxiv]
status: new
related: []
---
## 日本語要約
現代のオープンモデルはハイブリッド構成で、大半の層が Gated DeltaNet (GDN) など線形注意層であり、増大する KV cache の代わりに固定サイズの再帰状態を持つ。通常のデコードはメモリ効率が良いが、投機デコードには不利。draft トークンのバッチを検証して棄却分をロールバックするため、現行システムは GDN 層について draft 位置ごとに再帰状態のフルスナップショットを取る必要があり、しかもそれを draft tree の枝間で共有できないので、広く acceptance の高い木はメモリ的に不可能になる。

## 手法
gated delta rule の **tree-structured WY 変換**を用い、各 draft ノードの出力を1回の三角ソルブで計算し、commit 時に採択された1つの状態だけを再構成。ノードごとの状態の代わりに小さな pseudo-value 行列を保存する。導出は gated delta rule のみに依存し、他のアーキテクチャ要素に依存しない。

## 評価
- スナップショット完全排除によるメモリ実行可能性の回復

## 既存手法との差分
状態スナップショットを保存せず、WY 変換で必要時に再構成する。

## 注目度コメント
`flash-linear-attention` / GDN 系の投機デコード実装に直結。進行中プロジェクト周辺として拾う価値あり。
