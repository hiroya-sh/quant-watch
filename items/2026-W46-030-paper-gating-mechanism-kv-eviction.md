---
id: "2026-W46-030"
type: paper
title: "The Gating Mechanism of KV Cache Eviction"
url: "https://arxiv.org/abs/2611.07605"
discovered: "2026-11-09"
published: "2026-11-05"
authors: ["Hao Gu", "Xintong Yang", "Zhiwei Li", "Lei Zhu"]
venue: "arXiv:2611.07605"
models: []
architectures: ["dense"]
methods: []
tech: ["kv-cache-eviction", "kv-cache-compression-non-quant"]
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約

KV eviction の learnable gate が「なぜ訓練に失敗するか」を理論と実験で示す。gate は softmax 内で作用し、constant gate は dense attention を復元する no-op になる。言語モデル loss で訓練すると、frozen backbone が dense attention に fit されているため目的関数は no-op を好む。(1) dense attention を gate の reach 外に置く、(2) dense model の予測を gate の target にする、の 2 条件で突破。この下では scorer を大きくしても過去への明示アクセスも backbone 学習も不要。

## 手法

gate を softmax 内に置くと no-op が最適になる反直観を指摘、dense attn を gate reach 外 + dense 予測を target にする 2 条件で "真の learnable eviction" を実現。

## 評価

- 対象: 既存 learnable KV eviction 手法
- 発見: capacity は問題でない, 目的関数と frozen backbone の相互作用が本質

## 注目度コメント

KV eviction 研究の基礎論文。既存の learnable 手法の失敗分類と再設計方向。
