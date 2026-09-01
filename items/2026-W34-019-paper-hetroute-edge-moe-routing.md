---
id: "2026-W34-019"
type: paper
title: "HetRoute: Heterogeneous and Cost-aware Collaborative Routing Framework for Distributed Edge MoE Inference"
url: "https://arxiv.org/abs/2608.00577"
discovered: "2026-08-17"
published: "2026-08-01"
authors: [Xin Yuan, Ning Li, Wenchao Xu, Song Guo]
venue: "arXiv"
models: []
architectures: [moe]
methods: []
tech: [_uncategorized]
priority: watching
sources: [arxiv]
status: updated
related: []
---
## 日本語要約
地理分散した異種エッジサーバでの MoE 推論に向け、cross-server 帯域・異種 GPU・GPU-CPU expert ロード遅延・キュー・**replica ごとの量子化品質損失**を一体で扱う協調ルーティング HetRoute を提案。per-assignment コストモデル(伝送・offload・計算+キュー・量子化品質ペナルティ)で expert 配置と GPU-CPU 常駐を決定。

## 手法
量子化品質損失を含む統一コストモデルでオンライン多サーバ協調ルーティング。

## 評価
- 対象: 分散エッジ MoE serving
- 観点: 量子化品質を含む総コスト最小化

## 既存手法との差分
量子化品質を routing コストの一要素として明示的に組み込む点が新規。手法自体は分散推論。

## 注目度コメント
量子化は一要素で本体は分散ルーティング。周辺文脈として watching(v 更新)。
