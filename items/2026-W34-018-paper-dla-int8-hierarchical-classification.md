---
id: "2026-W34-018"
type: paper
title: "Achieving Near-Zero-Overhead Multi-Model Hierarchical Classification in Real-Time Detection Pipelines"
url: "https://arxiv.org/abs/2608.11770"
discovered: "2026-08-17"
published: "2026-08-12"
authors: [Vaishnav Raju]
venue: "arXiv"
models: []
architectures: []
methods: []
tech: [activation-quant, low-bit-fp8]
priority: watching
sources: [arxiv]
status: new
related: []
---
## 日本語要約
エッジの階層推論(検出→細粒度分類)を GPU 直列化なしで実行するため、NVIDIA Jetson DLA コアへの zero GPU fallback な INT8 展開法(5段階)を提示。TensorRT の implicit quantization を manual dynamic range で救済(75%→94.0%精度)し、explicit quantization 前の高速検証を可能に。

## 手法
DLA INT8 展開のためのアーキ適応・動的レンジ調整・QAT を含む方法論。

## 評価
- 対象: エッジ検出/分類バックボーン(Jetson DLA)
- ビット幅: INT8
- 知見: implicit 量子化の精度崩れを手動レンジで回復

## 既存手法との差分
LLM でなくエッジ vision の DLA INT8 実運用ノウハウ。

## 注目度コメント
LLM 外だが TensorRT INT8 実装の落とし穴として参考。watching。
