---
id: "2026-W35-008"
type: paper
title: "Quantization-Aware Healing: A Practical Recipe for Recovering Compressed, 4-Bit LLMs"
url: "https://arxiv.org/abs/2608.20953"
discovered: "2026-09-01"
published: "2026-08-21"
venue: "arXiv (cs.CL, cs.AI, cs.LG, cs.PF)"
models: []
architectures: [transformer, moe]
methods: [MXFP4]
tech: [qat, low-bit-4, lossless-quantization-recovery, mixed-precision]
priority: high
sources: [arxiv]
status: new
related: []
---
## 日本語要約
LLM を安く提供するとは、いまや「構造的に圧縮され、かつ 4bit 量子化されたモデルを出荷すること」を意味する。この2段階は推論・数学・コーディング・長文脈の挙動を十分に劣化させるため、デプロイ前に回復 (healing) 段階が必要になる。既定レシピである QAT は、圧縮量子化モデルをハードラベルに再フィットさせるが、著者のパイプラインでは収束が遅くピークを過ぎると崩壊した。

## 手法
そこで **Quantization-Aware Healing (QAH)** を採用。構造圧縮モデルは full precision で独立に学習されたことがないため、その bfloat16 チェックポイントは元モデルの「蒸留で復元された近似」に過ぎない。QAH は 4bit の student を **圧縮前のオリジナルモデルから直接蒸留**する。

## 評価
- **GPT-OSS 120B → 60B → MXFP4** のパイプラインで、QAH student は bfloat16 の source に匹敵ないし上回る

## 既存手法との差分
「圧縮後 bf16」を教師にする素朴な QAT ではなく、圧縮前の原モデルを教師に据え直す。

## 注目度コメント
prune → quantize の実運用パイプラインに直結。llm-compressor 0.13.0 の REAP expert pruning + 量子化の組み合わせ(公式に「pruning 後に FP8/NVFP4 量子化可」と明記)と同じ問題設定で、回復手順の指針になる。**議題候補**。
