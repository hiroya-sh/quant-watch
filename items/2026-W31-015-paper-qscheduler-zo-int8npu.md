---
id: "2026-W31-015"
type: paper
title: "QScheduler: Adaptive Gradient Sampling for Zeroth-Order On-Device Training on INT8 NPUs"
url: "https://arxiv.org/abs/2607.18802"
discovered: "2026-07-27"
published: "2026-07-21"
authors: []
venue: "arXiv (cs.LG)"
models: []
architectures: []
methods: []
tech: [qat]
priority: watching
sources: [arxiv]
status: new
verified: "2026-07-27 arXiv API 直取得(ID/タイトル一致確認済み)"
related: []
---

## 日本語要約
NPU 搭載マイコンでの Zeroth-Order(前向きパスのみで勾配推定)オンデバイス学習において、勾配サンプル数 q を学習進行に応じて適応調整する QScheduler を提案。STM32N6 の Neural-ART NPU 上での INT8 量子化オンデバイス学習の初の proof-of-concept と主張。

## 手法
少なすぎる q はノイズで早期停滞、多すぎる q は計算浪費というトレードオフを、ハイパラ探索なしで動的に解消するスケジューラ。

## 評価
- 対象モデル: ResNet18, MobileNetV2(EuroSAT / STL-10)
- ビット幅: INT8(学習自体を量子化演算で実行)
- 精度劣化: よく調整された固定 q 構成と同等
- スループット/メモリ: バックプロパゲーション不要でメモリ削減

## 既存手法との差分
ZO 学習の q 選択問題を適応化し、実 NPU での INT8 学習実証まで持ち込んだ点。

## 注目度コメント
マイコン規模で LLM とは距離があるが、「量子化ハードウェア上での学習」の実証事例として watching。
