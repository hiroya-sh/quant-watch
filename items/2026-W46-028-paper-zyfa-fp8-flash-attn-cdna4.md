---
id: "2026-W46-028"
type: paper
title: "ZYFA: Speed and Accuracy of FP8 FlashAttention on AMD CDNA4"
url: "https://arxiv.org/abs/2611.07496"
discovered: "2026-11-09"
published: "2026-11-05"
authors: ["Quentin Anthony", "Ganesh Bikshandi", "Praneeth Medepalli", "Stephen Ebert"]
venue: "arXiv:2611.07496"
models: []
architectures: []
methods: []
tech: ["low-bit-fp8"]
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約

AMD MI355X の FP8 FlashAttention で、softmax が vector unit に残るため aiter は FP8 matrix の 39% peak しか出ない (BF16 は 49%)。ZYFA は (1) FP8 probability を score から multiply-add + int conversion で直接算出 (exp を避ける), (2) ping-pong schedule で softmax と matmul を別 warp に, (3) block ごとに 2 のべき乗で scale up し round 後の sum で正規化。32k token で aiter 比 1.16-1.76x (3 model), kernel bench 1.26-1.37x (head dim 128), MLA 1.99x。

## 手法

MI355X の制約 (matrix 完了を HW 追跡しない) を踏まえ、exp 不使用の FP8 softmax、ping-pong warp schedule、power-of-2 scale normalization の 3 技術を統合。

## 評価

- GPU: AMD MI355X (CDNA4)
- 文脈: 32k token
- スループット: aiter 比 1.16-1.76x, head dim 128 で 1.26-1.37x, MLA 1.99x

## 注目度コメント

FP8 focus + ROCm CDNA4。vLLM ROCm での MLA 加速の候補。
