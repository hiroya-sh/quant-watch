---
id: "2026-W43-012"
type: paper
title: "Preserving Updates in Low-Bit Recurrent State Quantization"
url: "https://arxiv.org/abs/2610.15709"
discovered: "2026-10-19"
published: "2026-10-12"
authors: ["Haotian Li", "Liran Dong", "Kaicheng Xiao", "Guoliang Xing"]
venue: "arXiv:2610.15709v1"
models: []
architectures: [gla, linear-attention, hybrid]
methods: []
tech: [low-bit-4, activation-quant]
priority: high
sources: [arxiv]
status: new
related: []
---

## 日本語要約
GDN / KDA 系の再帰状態(recurrent state)を低ビット量子化する際、更新(update)側の情報を保つ再量子化手法。W36 の DAMP に続き、再帰状態の破綻しやすさに注目した系統。

## 手法 / 評価のポイント
- 対象: GDN / KDA 系の再帰状態
- 新規性: 更新側の情報保存に向けた再量子化
- 関連: W36 の DAMP との比較軸

## 注目度コメント
Preserving Updates in Low-Bit Recurrent State Quantization — Mamba/GLA state quant
