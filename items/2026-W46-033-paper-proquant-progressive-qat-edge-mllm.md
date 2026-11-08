---
id: "2026-W46-033"
type: paper
title: "ProQuant: Progressive Quantization-aware Training for Edge MLLMs"
url: "https://arxiv.org/abs/2611.08216"
discovered: "2026-11-09"
published: "2026-11-05"
authors: ["Yufei Xue", "Yushi Huang", "Jiawei Shao", "Pingcheng Dong"]
venue: "arXiv:2611.08216"
models: []
architectures: ["transformer"]
methods: []
tech: ["ptq", "qat"]
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約

Edge MLLM 向け W4A8 QAT フレームワーク ProQuant。(1) Self-relabel (SRL) で fine-tune データ分布を pretrain 分布に寄せる、(2) MM 理解と言語モデル能力を分離、progressive block activation (PBA) で MM 理解を優先回復、(3) vision-sensitive factor τ で MM-critical layer を特定。2B-8B の各種モデルで既存を上回り、W4A8 Qwen3-VL-2B-Instruct で +6.6pt 平均精度。

## 手法

SRL + PBA + τ 選別の 3 組み合わせ W4A8 QAT。

## 評価

- モデル: 2B-8B の MLLM (Qwen3-VL-2B-Instruct 含む)
- ビット幅: W4A8
- 精度: Qwen3-VL-2B で +6.6pt 平均
- 対象: MM 理解ベンチ

## 注目度コメント

edge MLLM の W4A8 QAT として実用的構成。ModelOpt の lora QAD と並ぶ運用パス。
