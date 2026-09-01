---
id: "2026-W36-007"
type: paper
title: "A Target-Centric Survey of Quantization-Aware Training"
url: "https://arxiv.org/abs/2608.29667"
discovered: "2026-09-01"
published: "2026-08-30"
venue: "arXiv (cs.LG)"
models: []
architectures: [transformer]
methods: []
tech: [qat, low-bit-4, mixed-precision]
priority: normal
sources: [arxiv]
status: new
related: []
---
## 日本語要約
LLM の急速な発展はメモリフットプリントと計算需要を押し上げている。QAT は学習中に量子化の影響を明示的にシミュレートすることで、full precision に匹敵する精度の低ビットモデルを得る有望な解として現れた。本論文は QAT の理論的基礎と発展する実装ランドスケープの双方を明確化することを目的とした **target-centric サーベイ**。

## 手法
- target-centric な分類体系で既存 QAT 手法を体系的にレビュー
- 誤差特性・数値フォーマット・戦略の転移可能性における target 間の差異を統合
- QAT の評価パラダイムを整理し、最適化とデプロイの課題を議論

## 評価
- サーベイ

## 既存手法との差分
手法別ではなく「量子化ターゲット(重み/活性/KV/勾配など)」を軸に整理。

## 注目度コメント
ModelOpt 0.46.0 が LSQ / Dual-LSQ を QAD に入れ、[[items/2026-W35-008-paper-qah-quantization-aware-healing|QAH]] が QAT の代替を提案した直後のサーベイ。QAT/QAD 周辺を一度整理するのに使える。
