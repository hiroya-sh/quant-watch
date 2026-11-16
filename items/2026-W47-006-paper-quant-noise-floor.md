---
id: "2026-W47-006"
type: paper
title: "The Noise Floor of a Quantization Comparison: Engine, restart, batch and kernel drift, measured against 8-bit and 4-bit effects in two decision models"
url: "https://arxiv.org/abs/2611.15671"
discovered: "2026-11-16"
published: "2026-11-12"
authors: [arxiv:2611.15671]
venue: "arXiv:2611.15671"
models: []
architectures: []
methods: []
tech: [calibration, low-bit-4, low-bit-fp8]
priority: high
sources: [arxiv]
status: new
related: []
---

## 日本語要約
量子化モデルを BF16 と比較するとき、**weight 以外のあらゆる要素(serving engine, server instance, batch 挙動, kernel 選択)**が同時に変わる。この**ノイズ床**を 8-bit/4-bit の実効精度差と**同じ scale で定量化**。KL/accuracy の "quantization gap" の 20-50% が実は engine drift に由来する場合がある。

## 手法
- 同じモデルを vLLM / TRT-LLM / SGLang 相当で serve、同一入力で 2400 件測定
- restart / batch 構成 / 「import されるパッケージによる kernel 選択」の各要因を分離
- 8-bit (INT8/FP8) と 4-bit (NVFP4/INT4) の実効 drift と重ね合わせ

## 評価
- 2 つの decision model で検証
- 「量子化 vs. BF16」の KL が、engine drift の KL と**同オーダー**になるケースを特定
- 推奨: 量子化比較は **同一 engine / 同一 batch / 同一 kernel path** で行うべき

## 既存手法との差分
これまでの量子化論文は BF16 reference との KL/accuracy を直接出していたが、**再現性のある比較プロトコル**を提唱する methodology 論文。

## 注目度コメント
手元の NVFP4 / FP8 評価実験で「本当に量子化が悪いのか、それとも engine 差か」を分離する下地になる。vLLM での量子化 regression 検出(v0.33 で DSA+NVFP4 KV の known issue が出た事件など)の背景として押さえておきたい。
