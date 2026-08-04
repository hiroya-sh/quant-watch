---
id: "2026-W31-027"
type: hf-model
title: "unsloth/Laguna-S-2.1-GGUF — poolside 初のオープン重み Laguna-S-2.1、公開週内に GGUF 化で 102k DL"
url: "https://huggingface.co/unsloth/Laguna-S-2.1-GGUF"
discovered: "2026-07-27"
published: "2026-07-21"
base_model: "poolside/Laguna-S-2.1"
models: []
architectures: [moe]
methods: [GGUF]
tech: [llamacpp-ready, weight-only, moe-quant]
priority: high
sources: [hf-models]
status: new
verified: "2026-07-27 HF API で確認 (createdAt 2026-07-21, downloads 102,684, tags: gguf/imatrix/vllm, base_model:quantized:poolside/Laguna-S-2.1, license: openmdw-1.1)"
related: ["2026-W31-024", "2026-W31-031"]
---

## 日本語要約
poolside の新 MoE モデル **Laguna-S-2.1**(license: openmdw-1.1)の unsloth による GGUF 量子化。公開からわずか数日で **102k ダウンロード**と、今週の HF 量子化タグ新着の中で圧倒的な首位。imatrix 校正付き。今週は同一ベースモデルに対して bartowski / lmstudio-community / mlx-community(oQ 系列)ほか多数の量子化が同時多発しており、W30 の Inkling に続く「新主要モデル公開→週内量子化ウェーブ」の典型例。

## 量子化仕様
- ベースモデル: poolside/Laguna-S-2.1 (MoE)
- 量子化手法: GGUF (imatrix)
- ビット幅: 複数バリアント
- 量子化対象: weight
- ファイルフォーマット: GGUF

## 精度報告(あれば)
- ベンチマーク: モデルカード記載ベース
- 劣化幅: 未詳

## ダウンロード/利用状況
102,684 DL(公開後約6日時点)。同週に [[items/2026-W31-024-github-gptqmodel-v731-732|GPTQModel が Laguna S 2.1 対応]]、[[items/2026-W31-031-hf-model-mlx-optiq-w31-batch|mlx-community が oQ 系列]]を投入。コミュニティ派生(APEX 版等)も多数。

## 注目度コメント
新規主要モデルへの量子化適用 + MoE (moe-quant focus) + 週内エコシステム総対応の速度感で high。poolside/Laguna-S-2.1 は taxonomy models への登録推奨。
