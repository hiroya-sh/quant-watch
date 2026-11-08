---
id: "2026-W46-022"
type: paper
title: "EpiLoRA: Fusing Many LoRA Adapters into Low-Precision GEMMs for Serving and RL"
url: "https://arxiv.org/abs/2611.03899"
discovered: "2026-11-09"
published: "2026-11-02"
authors: ["Hieu Tran", "Hong Yu"]
venue: "arXiv:2611.03899"
models: []
architectures: ["transformer"]
methods: []
tech: ["low-bit-fp8", "low-bit-4"]
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約

マルチテナント推論で base GEMM と LoRA kernel が別起動されるコストを解消する EpiLoRA (vLLM plugin)。LoRA の down-projection は GEMM の epilogue 直前にのみ必要という観察を使い、down-projection を先行起動、low-precision GEMM を dependent kernel にして weight stream 中にテナント毎 up-projection を epilogue 内で加算。Hopper で single adapter decode が vLLM 比 TPT -24%、SGLang/TRT-LLM を上回る。多テナントで adapter kernel throughput が vLLM を超える。FP8 base での LoRA RL 訓練で 27B を 1x 48GB GPU で回せる。

## 手法

LoRA down → low-precision GEMM → up の処理順を見直し、GEMM epilogue に up-projection を融合する vLLM 拡張。FP8 base で 16bit copy 不要。

## 評価

- モデル: Qwen 27B 他 (base in FP8)
- GPU: Hopper
- Latency: single adapter decode で vLLM 比 -24% TPT
- RL: 1x 48GB GPU で 27B LoRA RL 訓練可能

## 注目度コメント

FP8 focus + vLLM 接続。LoRA サーブ設計の標準パターンに影響。
