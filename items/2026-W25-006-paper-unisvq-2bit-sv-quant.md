---
id: "2026-W25-006"
type: paper
title: "UniSVQ: 2-bit Unified Scalar-Vector Quantization"
url: "https://arxiv.org/abs/2606.10520"
discovered: "2026-06-15"
published: "2026-06-09"
authors: [Haoyu Wang, Haiyan Zhao, Xingyu Yu, Zhangyang Yao, Xu Han, Zhiyuan Liu, Maosong Sun]
venue: "arxiv"
models: [meta-llama/Llama-3.1, Qwen/Qwen2.5]
architectures: [transformer]
methods: []
tech: [low-bit-2, weight-only, block-wise, ptq, calibration]
priority: normal
sources: [arxiv]
status: new
related: ["2026-W25-002"]
---

## 日本語要約
スカラー量子化とベクトル量子化を統合する2-bit量子化手法。コードワードを整数格子のアフィン変換でパラメタライズすることで、最適化されたintegerカーネルとの互換性を保ちつつベクトル量子化の柔軟性を維持。ブロック単位のデータ駆動fine-tuningで量子化誤差を最小化。LC-QAT（2606.10531）と同じ著者グループ。

## 手法
- Affine Integer Lattice: コードワード c = Ax + b（A: スケール行列、b: オフセット、x: 整数格子点）
- スカラー量子化との互換性: A が対角行列の場合にスカラー量子化に退化
- ブロック別fine-tuning: 各Transformerブロックで量子化誤差を逐次最小化
- 推論: 整数演算カーネルで高速化

## 評価
- LLaMA-3.1-8B/70B、Qwen2.5-7B/72Bで検証
- ビット幅: W2（2-bit重み量子化）
- 既存スカラー量子化を上回り、高度なVQと同等の推論速度

## 既存手法との差分
QuIP#（VQ量子化）と同等以上の精度を整数カーネル互換性で達成。PQ/VQ系の精度とスカラー系の高速性を橋渡し。

## 注目度コメント
LC-QATと同著者グループによる同日投稿。2-bit PTQの実用化へのシステマティックなアプローチ（UniSVQがPTQ、LC-QATがQAT）。2-bit領域の実用化議論のための参照論文として価値あり。
