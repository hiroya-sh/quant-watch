---
id: "2026-W47-023"
type: paper
title: "Language model capabilities fail in a shared, predictable order under compression and perturbation"
url: "https://arxiv.org/abs/2611.11695"
discovered: "2026-11-16"
published: "2026-11-09"
authors: [arxiv:2611.11695]
venue: "arXiv:2611.11695"
models: []
architectures: []
methods: []
tech: []
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約
7 種類の perturbation / compression を 8 instruction-tuned モデルに適用し、4 answer format × 16 task で事前登録された予測と突き合わせ。short-answer capability が**最初に**崩れ、次に reasoning, 最後に long-form generation という **method 非依存の順序**で性能が落ちる。量子化・pruning・distillation の method を問わない transferable な failure order が存在する。

## 手法
- 7 方法: W4/W2 量子化, pruning (unstructured / structured), distillation, input noise 他
- 8 instruction-tuned LLM
- 16 tasks × 4 answer format
- preregistered predictions

## 評価
- capability ごとの failure threshold
- method 間の順序の transfer
- quantization bit 幅 vs. capability degradation profile

## 既存手法との差分
これまで「量子化は average accuracy で評価」だったが、**capability prioritization** の順序が method 非依存だと示した点が新規。

## 注目度コメント
W36 SemKV (KV quality cliff) / W46 Faithfulness is not free の**延長線**。量子化を「どの capability を落としてよいか」で設計する枠組みに使える。チーム内議論で**何ビットまでなら許容できるか**の意思決定に直結する。
