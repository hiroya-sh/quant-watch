---
id: "2026-W35-010"
type: paper
title: "Target-Aware Calibration Data Selection for Preserving Uncertainty in Quantized Language Models"
url: "https://arxiv.org/abs/2608.21019"
discovered: "2026-09-01"
published: "2026-08-21"
venue: "arXiv (cs.CL, cs.AI)"
models: []
architectures: [transformer]
methods: []
tech: [calibration, ptq]
priority: normal
sources: [arxiv]
status: new
related: []
---
## 日本語要約
量子化は広く使われるが、confidence / margin / abstention といった不確実性の挙動への影響が主目的として扱われることは稀。本論文は量子化のための校正データ選択を「ターゲット依存の不確実性保存問題」として定式化する。デプロイ先ごとに重視する入力分布領域が異なるのに、既存研究は精度指向の圧縮指標を最適化するか、量子化後にスコアを調整するかに留まっていた。

## 手法
分布保存リスクと境界保存リスクを定義し、「単一の校正レシピが全ターゲットに適合することは期待できない」ことを混合ミスマッチ論法で説明。**Doubt-Preserving Quantization (DPQ)** — full-precision 予測を使って高 doubt サンプル中心のターゲット整合な校正混合を構成する軽量な量子化前レシピ族を提案。

## 評価
- 校正データ選択のみで不確実性挙動を保存できるかを検証

## 既存手法との差分
校正データを「精度」ではなく「不確実性の保存」で選ぶ。

## 注目度コメント
auto-round v0.15.0 の "Automatically select calibration datasets for code models" (#2107) と同じ方向。校正データ選択が実装側でも論文側でも同時に動いている。
