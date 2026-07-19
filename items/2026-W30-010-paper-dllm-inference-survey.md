---
id: "2026-W30-010"
type: paper
title: "Accelerating Masked Diffusion Large Language Models: A Survey of Efficient Inference Techniques"
url: "https://arxiv.org/abs/2607.12829"
discovered: "2026-07-20"
published: "2026-07-14"
authors: []
venue: "arXiv (cs.LG, cs.AI, cs.CL)"
models: []
architectures: []
methods: []
tech: [diffusion-llm-quant]
priority: normal
sources: [arxiv]
status: new
verified: "2026-07-20 arXiv API 直取得(ID/タイトル一致確認済み)"
related: []
---

## 日本語要約
拡散 LLM(dLLM)の効率推論技術のサーベイ。並列生成の理論優位が実測スピードアップに直結しない問題意識から、diffusion-aware キャッシング/再利用、アルゴリズム・アーキテクチャ・システムの3層にわたる高速化技術を整理。end-to-end レイテンシに混在する要因を分離して比較可能にする枠組みを提示する。

## 手法
サーベイ+分類学。キャッシング、並列デコード、システム最適化(量子化を含む)を横断整理。

## 評価
- 対象モデル: masked diffusion LLM 全般
- ビット幅: 手法横断
- 精度劣化: N/A(サーベイ)
- スループット/メモリ: 技術分類と比較軸の整理

## 既存手法との差分
dLLM 推論効率化の初期の体系的サーベイ。W27 の W4A4 拡散モデル量子化等、当ウォッチの diffusion-llm-quant 系アイテムの背景整理に有用。

## 注目度コメント
dLLM が実用フェーズに近づいた時の参照点。normal。
