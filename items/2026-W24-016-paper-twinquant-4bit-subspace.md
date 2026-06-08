---
id: "2026-W24-016"
type: paper
title: "TwinQuant: Learnable Subspace Decomposition for 4-Bit LLM Quantization"
url: "https://arxiv.org/abs/2606.01556"
discovered: "2026-06-08"
published: "2026-06-01"
authors: [Haodong Wang, Junjie Liu, Zicong Hong, Qianli Liu, Jian Lin, Song Guo, Xu Chen]
venue: "arxiv"
models: [meta-llama/Llama-3.1, Qwen/Qwen3]
architectures: [transformer]
methods: []
tech: [low-bit-4, ptq, calibration, weight-only, per-channel]
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約
4ビット量子化のための学習可能な部分空間分解手法TwinQuant。重みを低ランク成分と残差成分に分解し、各成分を量子化に有利な部分空間に変換（Stiefel多様体と一般線形多様体上の最適化）。量子化後誤差を最小化する分解を直接学習することで、従来のエネルギー最小化分解より高品質な量子化を実現。LLaMA3・Qwen3でFP16に近い精度を維持しつつ最大1.8x E2Eスループット向上。融合カーネルによるオンチップパイプライン実装。

## 手法
- 二成分分解: 低ランク成分（Stiefel多様体）+ 残差成分（一般線形多様体）
- Quantization-aware最適化: 量子化後誤差を直接最小化する分解を学習
- 分布フラット化・動的レンジ不均衡の両問題を同時解決
- 融合デュアルコンポーネントカーネルで推論を高速化

## 評価
- 対象モデル: LLaMA3、Qwen3
- 精度: FP16に近い精度
- スループット: 最大1.8x E2E向上（FP16比）

## 既存手法との差分
LoftQ/QuIP#等の既存分解ベース手法はエネルギー最小化（SVD）を使用。TwinQuantは量子化誤差を直接最小化する学習可能な分解で精度向上。

## 注目度コメント
LiftQuant（W24-014）と同週に同じ1.8xスループット向上を報告した4bit手法。アプローチは異なるが競合論文として比較価値あり。
