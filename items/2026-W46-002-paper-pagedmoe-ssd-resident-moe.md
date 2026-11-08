---
id: "2026-W46-002"
type: paper
title: "PagedMoE: Cross-Precision Expert Caching for Token-Level Dynamic Precision in SSD-Resident MoE Inference"
url: "https://arxiv.org/abs/2611.03173"
discovered: "2026-11-09"
published: "2026-11-02"
authors: ["Yutong Lin", "Yingdi Shan", "Shaoyuan Chen", "Yuanyong Chen"]
venue: "arXiv:2611.03173"
models: []
architectures: ["moe"]
methods: ["GPTQ", "MXFP4"]
tech: ["moe-quant", "low-bit-fp4", "microscaling-formats", "low-bit-4", "ptq"]
priority: high
sources: [arxiv]
status: new
related: []
---

## 日本語要約

SSD 常駐 MoE の token-level 動的精度でビットプレーン共有木を使い、低精度表現を高精度の prefix として再利用する PagedMoE。各 expert は 1-8bit の prefix をキャッシュから直接実行でき、重複した SSD 転送を削減。平均 2.5 bit/expert で Qwen3.5-397B-A17B は GPTQ-INT4 相当、GLM5.2 は MXFP4 相当の品質、24GB cache で Qwen3.5 は 8.89 tok/s, 独立オブジェクト比 1.33x スループット。

## 手法

bitplane layout + 木構造 codebook。推論時はルーティング重みとオフライン誤差プロファイルから各 expert の必要 prefix 長を決定し、不足ビットだけ SSD から fetch。精度は 1-8bit を token ごとに動的選択。

## 評価

- モデル: Qwen3.5-397B-A17B (focus adjacent), GLM-5.2 (focus adjacent)
- ビット幅: 平均 2.5bpw expert, 1-8bit 動的
- 精度劣化: Qwen3.5 で GPTQ-INT4 相当 / GLM-5.2 で MXFP4 相当
- スループット: 24GB cache で Qwen3.5 8.89 tok/s (1.33x vs independent precision, 1.56x vs INT4)

## 注目度コメント

MoE focus — W36 の Q-Strata / W45 の MoEZip 系の系譜で、SSD 常駐 + mixed-precision + bitplane 共有木という新しい設計点。実装エンジン接続は不明だが着想は vLLM の weight streaming と相性が良い。
