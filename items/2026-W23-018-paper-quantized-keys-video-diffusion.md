---
id: "2026-W23-018"
type: paper
title: "Quantized Keys Steal Attention: Bias Correction for KV-Cache Compression in Video Diffusion"
url: "https://arxiv.org/abs/2605.26266"
discovered: "2026-06-01"
published: "2026-05-25"
authors: [Tuna Tuncer, Felix Becker, Thomas Pfeil]
venue: "arXiv"
models: []
architectures:
  - transformer
methods: []
tech:
  - kv-cache-quant
  - low-bit-2
  - low-bit-4
  - video-model-quant
priority: high
sources: [arxiv]
status: new
related: []
---

## 日本語要約
チャンク自己回帰型動画拡散モデルにおけるKVキャッシュ量子化時の品質劣化を分析し、Jensenバイアス（softmaxの指数凸性に起因する系統誤差）を特定。量子化ステップサイズとクエリノルムから計算できる解析的補正項を提案し、追加メモリなし・無視できる計算コストでINT2量子化からBF16相当品質を回復。

## 手法
- Jensenバイアス: 量子化後のキーにsoftmaxを適用すると、期待値の非線形変換により系統的な注意ウェイトの偏りが生じる
- 補正項: Taylor近似から導出、量子化step sizeとクエリノルムのみから計算（calibration data不要）
- INT2量子化を主ターゲットとし、INT4との比較でINT2補正後がINT4非補正を上回ることを示す
- 適用モデル: MAGI-1, SkyReels-V2, HY-WorldPlay（chunk-wise autoregressive video diffusion）

## 評価
- 対象モデル: MAGI-1, SkyReels-V2, HY-WorldPlay
- ビット幅: INT2（主）、INT4（比較）
- 精度劣化: 補正後 INT2 がBF16相当品質を達成、INT4非補正より高品質
- スループット/メモリ: INT2でINT4比50%メモリ削減

## 既存手法との差分
W22のKV量子化論文（OSCAR/OScaR/OCTOPUS）はLLMテキスト推論が対象だったが、本論文は動画拡散モデル固有の問題（チャンク自己回帰・長時間依存）を扱う。バイアス補正アプローチは新規で、回転・コードブック系の手法とは独立。

## 注目度コメント
priorities.yml の `kv-cache-quant` focus にマッチ → priority HIGH。video-model-quant（W22新規タグ候補）への応用事例として紹介価値あり。Jensenバイアスという理論的framing は KV量子化の新たな分析視点。
