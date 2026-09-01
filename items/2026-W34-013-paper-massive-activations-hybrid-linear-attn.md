---
id: "2026-W34-013"
type: paper
title: "Massive Activations in Hybrid Linear Attention Large Language Models: Pre-Attention Spikes and Inter-Spike Plateaus"
url: "https://arxiv.org/abs/2608.12149"
discovered: "2026-08-17"
published: "2026-08-13"
authors: [Zunhai Su, Bohan Sun, Xialie Zhuang, Shuibai Zhang]
venue: "arXiv"
models: []
architectures: [hybrid, linear-attention]
methods: []
tech: [outlier-handling]
priority: normal
sources: [arxiv]
status: new
related: []
---
## 日本語要約
層交互型の Hybrid Linear Attention (HLA) LLM における Massive Activations (MA) を初めて体系研究。MA は full attention 層の直前で spike し(pre-attention spikes, PAS)、間の linear attention 層を貫いて持続する(inter-spike plateaus, ISP)。full attention が密になるほど PAS が ISP で連結し、full attention LLM の安定 MA 形態を回復。5つの linear attention アーキ・6 hybrid 構成・5データ領域・1.2B〜397B の代表モデルで再現。GDN gate 除去や output gating の非対称な影響も実験。

## 手法
massive activation の形態(PAS/ISP)をアーキ横断で観測し、hybrid での outlier 発生機序を解明。

## 評価
- 対象: linear attention 5種 / hybrid 6構成 / 1.2B〜397B
- 観点: MA(outlier)発生位置と gating の影響

## 既存手法との差分
transformer の massive activation 研究を hybrid/linear-attention へ拡張。量子化の outlier handling の前提知見。

## 注目度コメント
hybrid/linear-attention の量子化で鍵になる outlier の所在を示す。KV/activation 量子化設計の基礎データ。
