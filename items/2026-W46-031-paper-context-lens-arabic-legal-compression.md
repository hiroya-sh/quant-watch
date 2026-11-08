---
id: "2026-W46-031"
type: paper
title: "Compression Through a Context Lens: Evaluating Adaptation, Quantization, and Distillation in Arabic Legal LLMs"
url: "https://arxiv.org/abs/2611.07988"
discovered: "2026-11-09"
published: "2026-11-05"
authors: ["Md. Rafiul Biswas", "George Mikros", "Wajdi Zaghouani"]
venue: "arXiv:2611.07988"
models: []
architectures: ["transformer"]
methods: []
tech: []
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約

Arabic legal 域の圧縮効果を context あり/なしで評価 (ArabLegalEval)。context 除去で base モデルの精度は -27pt まで低下。Fanar-9B/Jais-8B/Qwen2.5-7B で 4bit 量子化はメモリ -64-71%, no-context MCQ -3.2〜+1.6pt。蒸留は変動大、Qwen2.5-7B student from Fanar で 76.6% (teacher 77.2%)。「no-context 評価は compression 評価の補完として有用」。

## 手法

with-context / no-context 2 プロトコルで domain adaptation, 4bit quant, distillation を独立評価。

## 評価

- モデル: Fanar-9B, Jais-8B, Qwen2.5-7B
- ビット幅: 4bit
- 精度: no-context MCQ -3.2〜+1.6pt
- 蒸留: 76.6% (student) vs 77.2% (teacher)

## 注目度コメント

非英語 domain-specific での量子化堅牢性。context 有無で評価の見え方が変わる点は W45 "Faithfulness" 系の延長。
