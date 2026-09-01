---
id: "2026-W35-007"
type: paper
title: "Llama-Mobile: Efficient 2.7-Bit Quantization of VLMs"
url: "https://arxiv.org/abs/2608.21134"
discovered: "2026-09-01"
published: "2026-08-21"
venue: "arXiv (cs.CV, cs.LG)"
models: [meta-llama/Llama-3.2]
architectures: [transformer]
methods: []
tech: [weight-only, ptq, low-bit-3, low-bit-2, activation-quant, calibration]
priority: high
sources: [arxiv]
status: new
related: []
---
## 日本語要約
VLM のモバイル展開はメモリ・計算要求が壁。本論文は資源制約ハードウェア向けの VLM 量子化フレームワークを提示する。特徴は、(1) 学習セットアップへのアクセスを必要とせず **モデル自身に学習データを生成させる** 量子化パイプライン、(2) Arm CPU 上で効率実行できる **2.7 bit/parameter フォーマット**。

## 手法
- self-generated calibration data(元の学習環境不要)
- 2.7 bpw の独自フォーマット + 8-bit activation

## 評価
- **Llama 3.2 11B Vision Instruct を 3.7 GB に圧縮**(8-bit activation 併用)
- 標準的な VQA タスク群で強い性能を維持と主張

## 既存手法との差分
「3bit 未満 × VLM × Arm CPU 実行」を同時に成立させた点。sub-3bit で実行可能フォーマットまで示す例は少ない。

## 注目度コメント
低bit化ウォッチの主眼どおり。ただし GPU/vLLM 経路ではなく Arm CPU 向けなので、当面は「フォーマット設計の参考」枠。**議題候補**。
