---
id: "2026-W24-020"
type: paper
title: "LLMCodec: Adapting Video Codecs for Efficient Weight Compression of Large Language Models"
url: "https://arxiv.org/abs/2606.05861"
discovered: "2026-06-08"
published: "2026-06-04"
authors: [Rui Wang, Yan Zhao, Li Song, Zhengxue Cheng]
venue: "arxiv"
models: [meta-llama/Llama-3.1]
architectures: [transformer]
methods: []
tech: [weight-only, low-bit-2, calibration-free, ptq]
priority: watching
sources: [arxiv]
status: new
related: []
---

## 日本語要約
動画コーデック（VVC/H.266）をLLM重み圧縮に転用する研究。LLMの重み行列はビデオフレームと同様の空間的相関を持つという観察に基づき、アフィン量子化とVVC/H.266を統合。ファインチューニングもキャリブレーションデータも不要。LLaMA-3-8Bの2ビット量子化でパープレキシティを既存手法比1.5x削減、ダウンストリーム精度を21%向上。

## 手法
- アフィン量子化（affine quantization）をVVC/H.266コーデックと統合
- LLM重み行列の空間的相関をビデオフレームとして処理
- 複数のビデオコーデック/エンコーディングプロファイルを比較評価
- ファインチューニング・キャリブレーションデータ不要

## 評価
- 対象モデル: LLaMA-3-8B（主要）、複数モデルで汎化検証
- ビット幅: 2bit
- 結果: 既存手法比パープレキシティ1.5x削減、精度21%向上

## 既存手法との差分
動画コーデックのLLM転用は新規。コーデック最適化の成熟したエコシステムを流用できる可能性があるが、推論時の展開フローとの統合は課題。

## 注目度コメント
創造的なアプローチだが実用性（推論速度・デコードオーバーヘッド）の検証が必要。watching継続。
