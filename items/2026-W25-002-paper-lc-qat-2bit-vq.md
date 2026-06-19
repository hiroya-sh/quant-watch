---
id: "2026-W25-002"
type: paper
title: "LC-QAT: Data-Efficient 2-Bit QAT for LLMs via Linear-Constrained Vector Quantization"
url: "https://arxiv.org/abs/2606.10531"
discovered: "2026-06-15"
published: "2026-06-09"
authors: [Haoyu Wang, Xingyu Yu, Haiyan Zhao, Fengxiang Wang, Xu Han]
venue: "arxiv / ICML 2026"
models: [meta-llama/Llama-3.1, Qwen/Qwen2.5, google/gemma-3]
architectures: [transformer]
methods: []
tech: [low-bit-2, qat, calibration, weight-only]
priority: high
sources: [arxiv]
status: new
related: ["2026-W25-006"]
---

## 日本語要約
2-bit QATの実用化における課題（スカラー量子化の激しい精度劣化）を解決するPTQ初期化付きのベクトル量子化QAT手法。アフィン写像で整数格子からコードワードをパラメタライズすることでコードブックルックアップなしの全微分可能最適化を実現。通常のQATデータ量の0.1-10%のみで既存手法を上回る。ICML 2026採択。

## 手法
- Linear-Constrained Vector Quantization: コードワードを整数格子のアフィン変換として定式化
- PTQ初期化: 事前PTQで強力な初期値を与え、QATで微調整（少データでも収束）
- 全微分可能: Straight-Through Estimatorが不要、コードブックを明示的に使わない
- 推論時は量子化重みから整数カーネルで高速推論

## 評価
- LLaMA-3.1-8B, Qwen2.5-7B, Gemma-3-7Bで検証
- ビット幅: W2（2-bit重み量子化）
- データ効率: 通常の0.1-10%で収束
- 結果: ICML採択水準。UniSVQと同時期の2-bit論文

## 既存手法との差分
BitDistiller/AnyPrecisionQAT等の2-bit QATに対し、アフィン格子制約で整数カーネル互換性を保ちながら柔軟なコードブックを実現。データ効率の大幅改善が工業的に重要。

## 注目度コメント
ICML 2026採択、2-bit QATの最少データ達成。UniSVQ（2606.10520）と同じ著者グループ系列で2-bit量子化の二段構え。極低ビットQAT実用化の進展として定例議題候補。
