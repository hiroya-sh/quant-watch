---
id: "2026-W23-008"
type: paper
title: "Ω-QVLA: Robust Quantization for Vision-Language-Action Models via Composite Rotation and Per-step Scaling"
url: "https://arxiv.org/abs/2605.28803"
discovered: "2026-06-01"
published: "2026-05-27"
authors: [Xinyu Wang, Mingze Li, Sicheng Lyu, Dongxiu Liu, Kaicheng Yang, Ziyu Zhao, Yufei Cui, Xiao-Wen Chang, Peng Lu]
venue: "arxiv"
models: []
architectures: [transformer]
methods: []
tech: [rotation, low-bit-4, full-quant, activation-quant, outlier-handling]
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約
ロボット制御向けVision-Language-Action（VLA）モデルをW4A4に量子化する研究。SVD-Hadamard複合回転とper-step scalingを組み合わせることで71.3%のメモリ削減を達成しながらロボット操作タスクで同等以上の性能を維持。LLM量子化手法のロボット制御への応用として新フロンティアを開拓。

## 手法
SVD分解後にHadamard回転を適用する「複合回転」で活性化の外れ値を抑制。ロボット制御の各ステップで動的なスケーリングを行い、推論時の分布変化に対応。W4A4の完全量子化で視覚・言語・行動の3モダリティを統一的に扱う。

## 評価
- 対象モデル: Vision-Language-Action models（ロボット操作タスク）
- ビット幅: W4A4
- 精度劣化: 操作タスクでFP16同等〜上回る（71.3%メモリ削減）
- スループット/メモリ: メモリ71.3%削減

## 既存手法との差分
LLM向け量子化（QuaRot/SpinQuant等）をVLA固有の課題（時系列・マルチモーダル）に適応。per-step scalingはロボット制御の動的推論に特化した新要素。

## 注目度コメント
VLAモデルへの量子化は新アプリケーション領域。ロボット制御×低ビット量子化の初期事例として将来のvlaモデル圧縮研究の先駆け。
