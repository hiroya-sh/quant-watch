---
id: "2026-W25-001"
type: paper
title: "TWLA: Achieving Ternary Weights and Low-Bit Activations for LLMs via Post-Training Quantization"
url: "https://arxiv.org/abs/2606.13054"
discovered: "2026-06-15"
published: "2026-06-11"
authors: [Zhixiong Zhao, Zukang Xu, Zhixuan Chen, Xing Hu, Zhe Jiang, Dawei Yang]
venue: "arxiv / ICML 2026"
models: [meta-llama/Llama-3.1, meta-llama/Llama-3.3, Qwen/Qwen2.5]
architectures: [transformer]
methods: [GPTQ]
tech: [low-bit-1bit, activation-quant, rotation, outlier-handling, mixed-precision, ptq]
priority: high
sources: [arxiv]
status: new
related: []
---

## 日本語要約
1.58-bit三値重み量子化と低ビットactivation量子化を同時達成するPTQ手法。三つのコンポーネントからなる: ①多様体への非対称三値量子化器（Euclidean-to-Manifold Asymmetric Ternary Quantizer）、②KroneckerパラメタリゼーションによるOrthogonal Tri-Modal Shapingでoutlierを回転抑制、③隣接層間のactivation分布を考慮したInter-Layer Aware Mixed Precision。LLaMA/Qwen2.5で検証。ICML 2026採択。

## 手法
- Euclidean-to-Manifold Asymmetric Ternary Quantizer: 非対称な三値（-α/0/+β）を多様体最適化で決定
- Kronecker Orthogonal Tri-Modal Shaping: outlierを回転変換で抑制。SpinQuant系の学習可能な直交変換
- Inter-Layer Aware Activation Mixed Precision: activation量子化感度を隣接層の状態も見て層別bit幅決定
- PTQのみで達成（calibrationデータ利用、追加学習不要）

## 評価
- LLaMA-3.1-8B、Llama-3.3-70B、Qwen2.5-7B/72Bで検証
- ビット幅: W1.58 A4（三値重み + 4-bit activation）
- 結果: 既存のW2A4手法を上回る精度、ICML 2026採択

## 既存手法との差分
QuIP/QuaRot等の回転ベース手法に対し、三値重みとactivation量子化を統合。1.58-bit領域での実用的PTQを実現。

## 注目度コメント
回転手法（rotation tech）とICML採択。三値重みのPTQは稀少で、1.58-bit BitNet領域をQATなしで達成する論文として希少価値高い。W24のRecover-LoRA（W2-GPTQ系）との比較も興味深い。
