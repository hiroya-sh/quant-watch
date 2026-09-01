---
id: "2026-W35-003"
type: paper
title: "DeltaLog: Deferred Materialization of Recurrent States for Linear Attention Decoding"
url: "https://arxiv.org/abs/2608.15533"
discovered: "2026-09-01"
published: "2026-08-16"
venue: "arXiv (cs.DC, cs.LG)"
models: []
architectures: [linear-attention, gla, hybrid]
methods: []
tech: [kv-cache-compression-non-quant, latent-compaction]
priority: normal
sources: [arxiv]
status: new
related: []
---
## 日本語要約
線形注意モデルは softmax 注意の二次計算と増大する KV cache を再帰状態更新に置き換えるが、既存のデコード実装は毎トークン後に再帰状態全体を materialize して書き戻すため、状態が大きくヘッド数が多いモデルでは状態維持自体がメモリトラフィックの主要因になる。

## 手法
DeltaLog は再帰状態を「密なベース状態 + 直近のコンパクト更新の有界ログ」で表現。多くのデコードステップではログにコンパクトな更新因子を追記するだけで済ませ、周期的な merge ステップでベース状態に畳み込む。モデルが観測する状態はセマンティクス的に等価。

## 評価
- 対象: 大きな再帰状態を持つ線形注意モデルのデコード
- 指標: 状態維持のメモリトラフィック削減

## 既存手法との差分
モデルセマンティクスを変えずにメモリトラフィックだけを削る実装レベルの工夫。

## 注目度コメント
量子化そのものではないが、進行中プロジェクト(Mamba/GLA 系, `flash-linear-attention`)のデコード最適化として直結。同週の [[items/2026-W35-011-paper-treewy-gated-deltanet|TreeWY]]、W36 の DAMP / DASC と併せて「再帰状態の扱い」が今期の集中テーマ。
