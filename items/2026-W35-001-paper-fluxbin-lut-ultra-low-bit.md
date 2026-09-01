---
id: "2026-W35-001"
type: paper
title: "FluxBin: Flexible LUT-based Ultra-low-bit LLM Inference by Algorithm-Kernel Synergy"
url: "https://arxiv.org/abs/2608.15602"
discovered: "2026-09-01"
published: "2026-08-16"
venue: "arXiv (cs.LG, cs.AI)"
models: []
architectures: [transformer]
methods: [FluxBin]
tech: [weight-only, ptq, low-bit-1bit, low-bit-2, outlier-handling]
priority: high
sources: [arxiv]
status: new
related: []
---
## 日本語要約
バイナリ量子化は理論上は極限圧縮・高速化を約束するが、既存研究は専用カーネルの必要性を軽視しており、浮動小数点演算への依存や実行時 dequantize のオーバヘッドで加速余地を使い切れていない、という問題提起。FluxBin (Flexible LUT-based Ultra-low-bit eXecution with Binary bases) は PTQ とチューニング済み CUDA カーネルのアルゴリズム・カーネル協調設計。

## 手法
- **Decoupled Row-Column Binary Decomposition**: 行方向・列方向のバイナリ基底を分離して表現力を上げつつ、ハードウェア効率を保つ。
- **Hessian-guided saliency-aware hybrid bases**: Hessian 由来の saliency で重要情報を保持する混成基底を選択。
- カーネル側は LUT (look-up table) ベースで、実行時 dequantize と FP 演算を回避。

## 評価
- 対象: LLM 重みのバイナリ/超低ビット量子化
- 比較軸: 既存のバイナリ量子化手法(FP 演算依存 / 実行時 dequantize 依存)

## 既存手法との差分
「アルゴリズムだけ」でも「カーネルだけ」でもなく、両者を同時設計した点。1bit 近傍でカーネル実効性能まで踏み込んだ数少ない報告。

## 注目度コメント
低bit化ウォッチの本丸。ただし vLLM 統合の記述は確認できず、現時点では `vllm-ready` は付与しない。手法名 FluxBin は taxonomy 未登録。
