---
id: "2026-W34-017"
type: paper
title: "You Only Charge Once 2.0: An End-to-End Analog Computing-in-Memory Architecture with Reconfigurable Switched Capacitors"
url: "https://arxiv.org/abs/2608.11116"
discovered: "2026-08-17"
published: "2026-08-12"
authors: [Zihao Xuan, Yewen Li, Jia Chen, Wei Xuan]
venue: "arXiv"
models: []
architectures: []
methods: []
tech: [activation-quant]
priority: watching
sources: [arxiv]
status: new
related: []
---
## 日本語要約
Analog Computing-in-Memory (ACiM) の "ADC wall"(ADC の電力・面積支配)を、switched-capacitor 電荷再分配を計算と変換の統一基盤に使う Charge-CIM で緩和。同一 capacitor fabric が入力変換・analog MAC・weighted shift-add・readout quantization を担い、ADC 呼び出しを削減。differential readout で paired partial sum を ADC 量子化時に統合。

## 手法
switched-capacitor による計算/変換統一で ADC オーバーヘッドを削減する ACiM アーキ。

## 評価
- 対象: DNN suite(ACiM 加速器)
- 観点: readout quantization/ADC 削減による効率

## 既存手法との差分
低分解能 readout や時間多重の欠点を避け、電荷再分配で計算・変換を統一。

## 注目度コメント
LLM 外のハード寄り。readout 量子化文脈で watching。新タグ候補 analog-cim。
