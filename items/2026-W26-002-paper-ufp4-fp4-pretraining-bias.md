---
id: "2026-W26-002"
type: paper
title: "Rethinking Shrinkage Bias in LLM FP4 Pretraining: Geometric Origin, Systemic Impact, and UFP4 Recipe"
url: "https://arxiv.org/abs/2606.20381"
discovered: "2026-06-22"
published: "2026-06-18"
authors: [Qian Zhao, Kunlong Chen, Changxin Tian, Zhonghui Jiang, Haitao Zhang, Chaofan Yu, Peijie Jiang, Mingliang Gong, Jia Liu, Ziqi Liu, Zhiqiang Zhang, Jun Zhou]
venue: "arxiv"
affiliation: "inclusionAI"
models: []
architectures: [transformer, moe, dense]
methods: [NVFP4, MXFP4, MixFP4]
tech: [low-bit-fp4, rotation, qat, microscaling-formats]
priority: high
sources: [arxiv, hf-papers]
status: new
related: []
---

## 日本語要約
E2M1フォーマット（現行FP4ハードウェアの標準）がもつ「Shrinkage Bias」という系統的負方向誤差の幾何学的起源を解明し、UFP4訓練レシピを提案。E2M1の非均一格子構造が負方向への丸め誤差を偏らせ、これがRandom Hadamard Transformと組み合わさることで全層にわたって増幅・訓練不安定を招くと理論的に示す。均一格子（E1M2/INT4）はこの幾何バイアスを回避できることを証明し、UFP4としてHadamardを全3つの訓練GEMMに適用してstochastic rounding範囲をdYに限定するレシピを構築。dense 1.5B・MoE 7.9B・MoE 124Bで検証し、E2M1ベースラインを上回るBF16相対損失劣化を達成。

## 手法
- **Shrinkage Bias理論分析**: E2M1の非均一ビン幅が生む幾何的非対称性→系統的な負方向丸め誤差
- **Random Hadamard Transform相互作用**: Hadamardが各方向の信号を全要素に拡散し、Shrinkage Biasを層間で増幅するメカニズムを解析
- **UFP4レシピ**: 3つの訓練GEMM(dW/dX/W×X)にRHT適用 + stochastic roundingをdYのみに限定することで均一格子利点を活用

## 評価
- Dense 1.5B、MoE 7.9B、MoE 124Bで検証
- 全スケールでE2M1ベースラインよりBF16相対損失劣化が小さい
- Scaling-law分析とアブレーション実験で貢献を個別に検証

## 既存手法との差分
E2M1/MXFP4/NVFP4のような現行FP4フォーマットの根本的問題を理論化した点が新規。従来はFP4訓練の不安定さを経験的に観測するのみだったが、本論文はHadamardとのinteractionを含む定量的理論を提供。

## 注目度コメント
NVFP4/MixFP4のfocus手法に直接関連。Blackwellのネイティブフォーマット（E2M1 = NVFP4のweight表現）の本質的制約を指摘した点はインパクト大。UFP4レシピがvLLM/TRT-LLMエコシステムに採用されるかが今後の注目点。HF Papers 6 upvotes（2026-06-19掲載）。
