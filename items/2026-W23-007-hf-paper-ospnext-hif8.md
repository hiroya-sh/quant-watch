---
id: "2026-W23-007"
type: hf-paper
title: "OSP-Next: Efficient High-Quality Video Generation with Sparse Sequence Parallelism, HiF8 Quantization, and Reinforcement Learning"
url: "https://huggingface.co/papers/2605.28691"
arxiv_url: "https://arxiv.org/abs/2605.28691"
discovered: "2026-06-01"
published: "2026-05-27"
authors: [Yunyang Ge, Xianyi He, Zezhong Zhang, Bin Lin, Bin Zhu, Xinhua Cheng, Li Yuan]
hf_upvotes: 21
models: []
architectures: [transformer]
methods: []
tech: [low-bit-fp8, qat]
priority: normal
sources: [hf-papers, arxiv]
status: new
related: [2026-W23-010-paper-maxwindow-hif8-qat]
---

## 日本語要約
テキスト→動画生成モデルに Sparse Sequence Parallelism・HiF8量子化・強化学習を組み合わせた高効率モデル。HiF8（8ビット浮動小数点量子化）により1.69x〜2.27xの推論高速化を達成しながら品質劣化を0.4%に抑制。動画生成という大メモリ消費タスクへのFP8量子化実用化の事例として注目。

## 手法
フルアテンションをhybrid full-sparse attention構造に置換してシーケンス長に対するコストを削減。HiF8量子化（FP8 weight+activation）を8ビット疎ファインチューニングと同時に安定して実行できるよう設計。強化学習でアライメント品質を向上。

## 評価
- 対象モデル: OSP-Next (動画生成Transformerモデル)
- ビット幅: FP8 (HiF8)
- 精度劣化: 品質スコア-0.4%（速度1.69x〜2.27x）

## HF Papersでの注目度
- upvote数: 21
- コメントの傾向: 動画生成×量子化の実用デモとして話題

## 注目度コメント
HiF8という表記がMax-Window Scale論文(2605.26189)と共通。LLM以外の大型生成モデルへのFP8浸透を示す事例。LLM量子化コミュニティへの波及を観察する価値あり。
