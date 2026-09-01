---
id: "2026-W33-017"
type: paper
title: "Selective KV Cache Protection for Noise-Resilient LLM Inference on Analog Compute-In-Memory Systems"
url: "https://arxiv.org/abs/2607.29076"
discovered: "2026-08-10"
published: "2026-07-31"
authors: [Yuannuo Feng, Wenyong Zhou, Yuang Ma]
venue: "arXiv"
models: []
architectures: [transformer]
methods: []
tech: [kv-cache-quant, outlier-handling, mixed-precision]
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約
アナログCIMは線形層の重み固定計算に向くが、attentionのKVキャッシュ操作は繰り返しの重み更新を要し重み固定パラダイムとミスマッチしてHWノイズに晒される。この動的attention計算のアナログCIM上での初の系統研究。

## 手法
初期トークンと直近トークンがHWノイズに不釣り合いに脆弱と判明。脆弱なKVエントリを選択的に高精度保護する手法。

## 評価
- 対象モデル: アナログCIM上のLLM attention
- ビット幅: 選択的mixed-precision (KV)
- 精度劣化: 脆弱トークン保護でノイズ耐性向上
- スループット/メモリ: アナログCIMのattention実行

## 既存手法との差分
重み固定前提の既存アナログCIM量子化に対し、動的KV計算のノイズ脆弱性を初分析。

## 注目度コメント
アナログCIM×KVのニッチだが、初期/直近トークンの脆弱性という知見はKV量子化一般にも示唆。
