---
id: "2026-W46-026"
type: paper
title: "Recursive Sparse Attention: Million-Token Length Extrapolation at Logarithmic Cost"
url: "https://arxiv.org/abs/2611.07232"
discovered: "2026-11-09"
published: "2026-11-04"
authors: ["Ruitian Wang", "Xinyu Yang", "Minshen Zhang", "Hao Zhang"]
venue: "arXiv:2611.07232"
models: []
architectures: ["dense"]
methods: []
tech: ["sparse-attention"]
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約

KV cache 上に木を作り、各ノードが subtree を 1 key + 1 mean-pooled value で要約する RecSA。各 level で k 候補を選択し、unselected summaries は exact token と同じ softmax に乗る。rope position は level 内の候補 index にし、長さをまたいで相対距離が訓練時範囲内に収まる。Qwen3-4B から 32k で 0.62B token を使って初期化・訓練。RULER で 131k-2M まで全長で最強、1M で 60.5 (vs dense+DCA 40.0)。最適化カーネルで prefill/decoding とも dense を超え、524k H200 で prefill 3.2x, decode 3.8x。

## 手法

KV cache の階層木を構築、per-level k 選択 + dense attention からの蒸留。level 内 index で RoPE を設定して相対距離を訓練長内にクランプ。

## 評価

- モデル: Qwen3-4B 初期化
- 長さ: 131k-2M (訓練は 32k のみ)
- 精度: 1M で 60.5 vs dense+DCA 40.0
- スループット: 524k, H200 で prefill 3.2x, decode 3.8x vs dense

## 注目度コメント

sparse attention focus — "hierarchical selection で O(logL)" の trainable 版が訓練長外にも汎化する初の報告。2M 外挿は注目。
