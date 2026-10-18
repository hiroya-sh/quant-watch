---
id: "2026-W43-001"
type: paper
title: "Fractional Power-of-Two Quantization for Efficient and Effective Multiplier-Free LLM Inference"
url: "https://arxiv.org/abs/2610.21257"
discovered: "2026-10-19"
published: "2026-10-15"
authors: ["Sunghyun Wee", "Geunjae Choi", "Hyeonjin Kim", "Suyoung Kim", "Nojun Kwak"]
venue: "arXiv:2610.21257v1"
models: []
architectures: []
methods: []
tech: [ptq, calibration, per-channel]
priority: high
sources: [arxiv]
status: new
related: []
---

## 日本語要約
MLP 推論でよく使う一様量子化を、スケール因子を 2 の分数指数(例: 2^(k/4))に制限することで乗算器なしのシフト+加算合成に落とす PTQ。精度損失を抑えつつ、特定ハードウェア向けに乗算器を節約できる主張。

## 手法 / 評価のポイント
- 量子化スケール: 2 の分数指数(dyadic rational)
- 対象: MLP の重み量子化
- 乗算器を節約し、エッジ推論のハードウェア実装に合致

## 注目度コメント
Fractional Power-of-Two Quantization for Multiplier-Free LLM Inference — hardware-oriented LLM PTQ
