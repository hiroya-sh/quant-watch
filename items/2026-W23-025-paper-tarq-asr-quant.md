---
id: "2026-W23-025"
type: paper
title: "TARQ: Tail-Aware Reconstruction Quantization for Rare-Word Robust Automatic Speech Recognition"
url: "https://arxiv.org/abs/2605.27808"
discovered: "2026-06-01"
published: "2026-05-27"
authors: [Xinyu Wang, Ziyu Zhao, Ke Bai]
venue: "arXiv:2605.27808"
models: []
architectures: [transformer]
methods: []
tech: [ptq, calibration, weight-only, low-bit-4]
priority: watching
sources: [arxiv]
status: new
related: []
---

## 日本語要約
音声認識（ASR）モデルの後学習量子化（PTQ）手法。通常のPTQはキャリブレーションデータが一般的なトークンに偏るため、稀語（rare word）で精度劣化が大きい問題を解決する。稀語位置のPTQ再構成誤差を重点的に最小化することでASR量子化の尾部性能を改善。

## 手法
ラベルフリーPTQフレームワーク。キャリブレーションデータの選択を稀語リッチな分布に偏向させ、トークン語彙の裾野（tail）の再構成誤差を重み付けして最適化。

## 評価
- 対象モデル: ASR専用モデル（Whisper等）
- ビット幅: 4ビット（重みのみ量子化）
- 精度劣化: 稀語ロバスト性を改善、詳細数値は論文参照
- スループット/メモリ: 標準PTQ比の変化なし

## 既存手法との差分
一般LLM PTQのキャリブレーション手法をASRドメイン特有の語彙分布問題に適応。GPTQ/AWQ等の既存手法はcalibration dataの偏りを考慮しない。

## 注目度コメント
ASRドメイン特化のニッチな論文。量子化精度の語彙テール問題は汎用LLMでも類似の問題があり、方法論として参考になる可能性あり。
