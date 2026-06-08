---
id: "2026-W24-003"
type: paper
title: "dMX: Differentiable Mixed-Precision Assignment for Low-Precision Floating-Point Formats"
url: "https://arxiv.org/abs/2606.04115"
discovered: "2026-06-08"
published: "2026-06-02"
authors: [Giuseppe Franco, Ian Colbert, Pablo Monteagudo-Lago, Felix Marty, Nicholas Fraser]
venue: "arxiv"
models: [meta-llama/Llama-3.1, Qwen/Qwen3]
architectures: [transformer]
methods: []
tech: [mixed-precision, microscaling-formats, low-bit-fp4, calibration, ptq]
priority: high
sources: [arxiv]
status: new
related: []
---

## 日本語要約
OCP標準のMXFP形式に対応した微分可能な層別ビット幅割当フレームワーク。連続値スカラーで各層のビット幅をパラメータ化し、温度アニーリングで徐々に離散フォーマットへ収束させる。ユーザ指定ビット幅予算を遵守する正則化を追加。LLama/Qwen3/SmolLM2でWikiText-2パープレキシティとゼロショット精度でKL-divergenceヒューリスティックよりPareto支配を達成。

## 手法
- 各層に連続スカラーパラメータを割当て、温度アニーリングで離散MXFPフォーマットに収束
- ターゲット予算制約の正則化で総ビット数をユーザ指定値に維持
- MXFPフォーマット: MXFP4/MXFP6/MXFP8など複数を選択肢として学習

## 評価
- 対象モデル: Llama系、Qwen3、SmolLM2
- 評価: WikiText-2パープレキシティ + 4ゼロショット推論ベンチマーク
- 結果: KL-divergenceベースより低コストで高精度なPareto frontier

## 既存手法との差分
従来の層感度分析ヒューリスティック（KL-divergence）を微分可能な最適化で代替。Microscaling形式に特化した最初の学習可能なビット幅割当手法。

## 注目度コメント
MXFP/microscaling-formatsはW23でvLLMとllama.cppが対応済みのフォーマット。自動ビット幅最適化への微分可能アプローチとして実用化が近い可能性あり。
