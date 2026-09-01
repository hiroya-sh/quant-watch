---
id: "2026-W35-005"
type: paper
title: "Efficient INT8 Inference of Small NLP Models on Server CPUs with PyTorch Native Stack"
url: "https://arxiv.org/abs/2608.18182"
discovered: "2026-09-01"
published: "2026-08-18"
venue: "arXiv (cs.CL)"
models: []
architectures: [transformer]
methods: [SmoothQuant]
tech: [activation-quant, ptq, per-channel]
priority: normal
sources: [arxiv]
status: new
related: []
---
## 日本語要約
BERT 系エンコーダなど小型 NLP モデルは分類・ランキング・検索の産業ワークロードで依然重要。サーバ CPU では INT8 量子化がレイテンシ/スループット/コストの良いトレードオフを与えるが、ユーザは PyTorch ネイティブスタックでそれが使えることを期待するようになっている。

## 手法
SmoothQuant を **TorchAO** に統合し、TorchInductor のグラフレベル fusion と、oneDNN / AVX512_VNNI / AMX 実装の中からの効率的な INT8 GEMM カーネル選択で Intel Xeon 向けに推論パスを最適化。

## 評価
- BERT / DistilBERT / XLM-RoBERTa
- **FP32 比で最大 5.8倍のエンドツーエンド throughput**、精度劣化は無視できる水準(計測不能なケースもあり)
- roofline を用いた詳細な性能解析つき

## 既存手法との差分
独自ランタイムでなく PyTorch ネイティブ (TorchAO + Inductor) で完結させた点。

## 注目度コメント
LLM ではないが、TorchAO への SmoothQuant 統合は自社 CPU 推論の選択肢として実用的。vLLM ルートではないので priority は normal。
