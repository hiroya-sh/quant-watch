---
id: "2026-W23-023"
type: hf-model
title: "YihongJin/Qwen3-Omni-30B-A3B-Instruct-NVFP4-W4A4-full-thinker-awqclip"
url: "https://huggingface.co/YihongJin/Qwen3-Omni-30B-A3B-Instruct-NVFP4-W4A4-full-thinker-awqclip"
discovered: "2026-06-01"
published: "2026-05-31"
base_model: "Qwen/Qwen3-Omni-30B-A3B-Instruct"
models: [Qwen/Qwen3.6]
architectures: [transformer, moe]
methods: [NVFP4, AWQ]
tech: [low-bit-fp4, low-bit-4, mixed-precision, moe-quant, activation-quant, weight-only]
priority: normal
sources: [hf-models]
status: new
related: []
---

## 日本語要約
Qwen3-Omni（マルチモーダル30B MoE）のNVFP4+W4A4混合精度量子化版。AWQ-clipベースのキャリブレーションで、NVFP4（全体）とW4A4（専門家層）の両方を適用した"full-thinker"バリアント。YihongJinがQwen3-Omniの複数量子化バリアントを実験的に公開している中の完成版（May 27 preview → May 31 final）。

## 量子化仕様
- ベースモデル: Qwen/Qwen3-Omni-30B-A3B-Instruct
- 量子化手法: NVFP4 + W4A4 混合精度（AWQ-clip calibration）
- ビット幅: FP4 (NVFP4) + W4A4
- 量子化対象: weight + activation（mixed precision）
- ファイルフォーマット: HuggingFace safetensors

## 精度報告(あれば)
- ベンチマーク: 未記載（実験的モデル）
- 劣化幅: 不明

## ダウンロード/利用状況
NVFP4とW4A4をMoEモデルで組み合わせた事例として技術的に興味深い。Omniモデル（視聴覚マルチモーダル）への量子化適用の実装例。
