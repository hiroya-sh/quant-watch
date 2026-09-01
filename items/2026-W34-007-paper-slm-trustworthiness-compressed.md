---
id: "2026-W34-007"
type: paper
title: "Benchmarking Trustworthiness of SLMs: Pre-trained vs. Compressed"
url: "https://arxiv.org/abs/2608.11981"
discovered: "2026-08-17"
published: "2026-08-12"
authors: [Haokun Lin, Kaijie Zhu, Haobo Xu, Yichen Wu]
venue: "arXiv"
models: []
architectures: []
methods: []
tech: [ptq]
priority: normal
sources: [arxiv]
status: new
related: []
---
## 日本語要約
SLM の構築法(小型を一から学習 vs 大型を pruning/量子化/蒸留で圧縮)が信頼性(公平性・頑健性・プライバシ・倫理)に与える影響を包括評価。**量子化は pruning より信頼性を保ちやすく**、信頼できる大型モデルを量子化して作った SLM は、一から学習した SLM より信頼性・適応性で優れると示す。

## 手法
複数信頼性次元で pruning と量子化の効果を比較し、圧縮経路が SLM の信頼性に与える差を測定。

## 評価
- 対象: 各種 SLM(圧縮 vs 事前学習)
- 観点: 公平性/頑健性/プライバシ/倫理
- 知見: 量子化 > pruning、圧縮由来 SLM > from-scratch

## 既存手法との差分
精度だけでなく信頼性軸で圧縮手法を比較する評価研究。

## 注目度コメント
「大型を量子化 → 小型」戦略の信頼性上の優位を示す。監視方針(量子化済みを使う)を後押しする評価データ。
