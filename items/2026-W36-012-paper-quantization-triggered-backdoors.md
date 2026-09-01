---
id: "2026-W36-012"
type: paper
title: "Quantization-Triggered Backdoors in Language Models: Cross-Quantizer Transferability and the Validation--Deployment Gap"
url: "https://arxiv.org/abs/2608.27512"
discovered: "2026-09-01"
published: "2026-08-27"
venue: "arXiv (cs.LG, cs.AI, cs.CL, cs.CR)"
models: []
architectures: [transformer]
methods: []
tech: [ptq, low-bit-4]
priority: normal
sources: [arxiv]
status: new
related: []
---
## 日本語要約
PTQ はエッジ展開のための意味的に中立な最適化と見なされがち。full-precision の source チェックポイントを評価し、量子化を下流で同等の再評価なしに適用するワークフローは、構造的な **validation--deployment gap** を作る — 量子化はパラメータ空間上の多対一写像なので、source 精度での認証はデプロイ構成での挙動等価性を保証しない。

## 手法
このギャップを **Quantization Behavioral Equivalence Classes (QBEC)** で形式化し、QBEC 所属が挙動等価を含意しないことを証明。これが量子化トリガ型バックドア攻撃の理論的基礎になる。3段階の敵対的ファインチューニング枠組みで、source 精度の検査は通るが量子化後に発火する潜在的悪性ペイロードを埋め込む。

## 評価
- 量子化器をまたぐ転移性を検証

## 既存手法との差分
量子化を「安全性検証の抜け穴」として扱った。

## 注目度コメント
サプライチェーン観点の指摘。**HF から取ってきたコミュニティ量子化モデルをそのまま使う運用**(今週の GLM-5.3 / Qwen3.8 ウェーブがまさにそれ)へのリスク提示として、社内ガイドラインに関わる。
