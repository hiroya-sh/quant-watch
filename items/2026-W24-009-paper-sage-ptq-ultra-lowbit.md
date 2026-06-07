---
id: "2026-W24-009"
type: paper
title: "Minimizing the Hidden Cost of Scales: Graph-Guided Ultra-Low-Bit Quantization for Large Language Models"
url: "https://arxiv.org/abs/2606.05429"
discovered: "2026-06-08"
published: "2026-06-03"
authors: [Rayyan Abdalla, Amir Hussein, Min Wu, Dinesh Manocha]
venue: "arxiv"
models: [meta-llama/Llama-3.1]
architectures: [transformer]
methods: []
tech: [low-bit-1bit, mixed-precision, calibration, ptq, block-wise, outlier-handling]
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約
超低ビット量子化における「スケールファクターのオーバーヘッドコスト」問題を解決するSAGE-PTQ。顕著な重みと非顕著な重みを分布統計で分離後、非顕著な重みをスパースグラフとしてモデル化。顕著な重みは多ビット、非顕著な重みはバイナリ量子化するデュアルモード手法で1.03実効ビット重みを達成。LLaMA-3-8Bで1.5x高速デコード（LLaMA-2-70B比）。

## 手法
- 分布統計による重みの顕著度分離
- 非顕著重みのグラフ表現（近傍関係を活用した量子化）
- 顕著重み: 多ビット量子化 / 非顕著重み: バイナリ量子化
- アダプティブ閾値による顕著度判定

## 評価
- 対象モデル: LLaMA-3-8B、LLaMA-2-70B
- 達成ビット数: 1.03実効ビット（重み）
- 結果: BiLLM・PB-LLMを大幅に上回るパープレキシティ
- スループット: LLaMA-2-70Bで1.5x高速デコード

## 既存手法との差分
既存超低ビット手法（BiLLM, PB-LLM）はスケールファクターのメモリコストを考慮しない。本手法はスケールオーバーヘッドを最小化しながら精度を維持する初の系統的アプローチ。

## 注目度コメント
1.03 bits/weightという極限的な圧縮は将来のエッジ展開に向けた研究方向として注目。ただしfocus項目との直接的な関連は低い。
