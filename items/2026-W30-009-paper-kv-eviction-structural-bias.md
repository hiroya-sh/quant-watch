---
id: "2026-W30-009"
type: paper
title: "Adaptive Filtering of the KV Cache: Diagnosing and Correcting Structural-Role Bias in LLM Inference"
url: "https://arxiv.org/abs/2607.13205"
discovered: "2026-07-20"
published: "2026-07-14"
authors: []
venue: "arXiv (cs.CL, cs.AI, cs.LG)"
models: []
architectures: [transformer]
methods: []
tech: [kv-cache-eviction]
priority: normal
sources: [arxiv]
status: new
verified: "2026-07-20 arXiv API 直取得(ID/タイトル一致確認済み)"
related: []
---

## 日本語要約
H2O 系の attention 蓄積量ベース KV eviction が、スキーマ密度の高い入力(ネスト JSON 等)で構造ロールバイアスを起こすことを診断した研究。sink 的な非コンテンツロール(区切り文字・空白)がコンテンツロールの一桁上のエネルギーを持ち、KEY トークンが VALUE トークンの約1.8倍過剰保持される結果、5% 予算で exact-match が 88%→0% に崩壊する現象を示し、適応フィルタリングによる補正を提案。

## 手法
attention mass を信号エネルギーと見なす信号処理的診断 + 構造ロールを考慮した適応的スコア補正。

## 評価
- 対象モデル: 長文脈 LLM
- ビット幅: N/A(eviction)
- 精度劣化: スキーマ密入力での崩壊を補正
- スループット/メモリ: 低予算 KV でも精度維持

## 既存手法との差分
H2O 系スコアの「構造トークン過剰保持」という失敗モードを初めて体系的に特定した点。

## 注目度コメント
JSON 主体のエージェント/ツール実行ワークロードで KV 圧縮を使う際の実務的な注意点。normal。
