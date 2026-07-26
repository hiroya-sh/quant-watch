---
id: "2026-W31-010"
type: paper
title: "BaseRT: Advancing Best-in-Class LLM Inference with Apple M5 Neural Accelerators"
url: "https://arxiv.org/abs/2607.19438"
discovered: "2026-07-27"
published: "2026-07-21"
authors: []
venue: "arXiv (cs.AR, cs.AI, cs.CL, cs.DC)"
models: [google/gemma-4, Qwen/Qwen3, Qwen/Qwen3.5, Qwen/Qwen3.6, meta-llama/Llama-3.2]
architectures: [transformer, moe, dense]
methods: []
tech: []
priority: normal
sources: [arxiv]
status: new
verified: "2026-07-27 arXiv API 直取得(ID/タイトル一致確認済み)。https://github.com/basecompute/baseRT も 200 確認"
related: []
---

## 日本語要約
Apple M5 世代の GPU コア内蔵 Neural Accelerator(Metal 4 tensor API 経由のオンダイ行列ユニット)を使う native Metal 推論ランタイム BaseRT の報告。手書き Metal 4 tensor-core カーネル群(dense/MoE GEMM、flash-attention prefill)で計算律速の行列積を Neural Accelerator に回し、メモリ律速の decode は既存特化カーネルに残す設計。llama.cpp と MLX を大差で上回ると主張。

## 手法
フレームワークフリーの Metal ランタイム + M5 tensor-core カーネル。prefill(計算律速)と decode(メモリ律速)で実行経路を分離。

## 評価
- 対象モデル: Qwen3 / Qwen3.5 / Qwen3.6 / Llama 3.2 / Gemma 4 ファミリの15構成(sub-1B〜35B)
- ビット幅: (ランタイム論文、量子化フォーマット詳細は本文)
- 精度劣化: —
- スループット/メモリ: M5 Pro で prompt 処理 llama.cpp 比最大 6.4x / MLX 比 3.9x、decode で 1.75x / 1.33x。MoE で最大マージン

## 既存手法との差分
Apple Silicon 推論の事実上の2強(llama.cpp / MLX)に対し、M5 Neural Accelerator を直接叩く専用ランタイムで性能上限を更新した点。コード公開。

## 注目度コメント
gemma-4(focus モデル)を含むオンデバイス推論の新しい性能天井。llama.cpp/MLX 経由の量子化モデル運用の前提が M5 世代で変わる可能性があり、ランタイム勢力図の観点で監視。
