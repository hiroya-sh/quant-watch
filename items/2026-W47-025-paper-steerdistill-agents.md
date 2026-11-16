---
id: "2026-W47-025"
type: paper
title: "SteerDistill: Quantizing LLM Agents via Closed-Loop Teacher Steering"
url: "https://arxiv.org/abs/2611.13410"
discovered: "2026-11-16"
published: "2026-11-10"
authors: [arxiv:2611.13410]
venue: "arXiv:2611.13410"
models: []
architectures: []
methods: []
tech: [lossless-quantization-recovery]
priority: normal
sources: [arxiv, hf-papers]
status: new
related: []
---

## 日本語要約
low-bit 量子化で LLM agent を serve すると task success が落ち、原因は量子化が agent の **環境遷移を変える**ことにある。SteerDistill は teacher(full-precision)を rollout の各 step で student (quantized) に close-loop で intervene させ、環境分岐点で正解に戻す。offline データでは拾えない student 固有の failure にオンラインで対応。HF Daily Papers 39 upvote。

## 手法
- student = quantized agent, teacher = FP16 agent
- rollout 中に teacher が behavior divergence を検出
- teacher が state を観測 → student に corrective action を注入(closed-loop steering)
- 蓄積した steering trajectory で student を distillation

## 評価
- agent task(WebArena 系, tool-use)
- INT4 / INT2 agent の success rate 改善

## 既存手法との差分
通常の QAT distillation は offline teacher、SteerDistill は **closed-loop online** での介入が新規。agent 固有の分岐点に resources を集中できる。

## 注目度コメント
agent inference の量子化は 2026 Q4 の実装トレンド。vLLM / TRT-LLM の **agent serving** 対応と重ねれば現場で効く。
