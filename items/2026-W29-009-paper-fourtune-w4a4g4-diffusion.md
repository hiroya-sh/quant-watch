---
id: "2026-W29-009"
type: paper
title: "FourTune: Towards Fully 4-Bit Efficient Post-Training for Diffusion Models"
url: "https://arxiv.org/abs/2607.05711"
discovered: "2026-07-13"
published: "2026-07-07"
authors: [Bowen Xue, Zihan Min, Xingyang Li, Zhekai Zhang, Haocheng Xi, Lvmin Zhang]
venue: "arxiv (cs.LG, cs.CV)"
models: []
architectures: [transformer]
methods: []
tech: [qat, low-bit-4, diffusion-llm-quant]
priority: normal
sources: [arxiv]
status: new
verified: "2026-07-13 arXiv API で ID/タイトル/著者/abstract 取得・実在確認"
related: []
---

## 日本語要約
拡散モデルの post-training(下流適応)を **W4A4G4(weight/activation/gradient すべて 4bit)** で行うフレームワーク FourTune。標準 LoRA に「凍結した数値スタビライザ」を加えた triple-branch hybrid パイプラインで量子化に敏感な成分を隔離する。大規模拡散モデルのファインチューニングにおけるメモリ・速度制約が動機。

## 注目ポイント
- 推論だけでなく**学習(適応)側の 4bit 化**。W29 は Full-Stack FP4 / GIFT と合わせて「4bit training」が束で出た週
- 画像拡散が対象(LLM ではない)

## 注目度コメント
4bit 学習トレンドの一角として記録。優先度 normal。
