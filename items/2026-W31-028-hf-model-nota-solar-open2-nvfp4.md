---
id: "2026-W31-028"
type: hf-model
title: "nota-ai/Solar-Open2-250B-Nota-NVFP4 — Upstage Solar-Open2 250B MoE の NVFP4 版(vLLM ロード可)"
url: "https://huggingface.co/nota-ai/Solar-Open2-250B-Nota-NVFP4"
discovered: "2026-07-27"
published: "2026-07-21"
base_model: "upstage/Solar-Open2-250B"
models: []
architectures: [moe]
methods: [NVFP4]
tech: [vllm-ready, low-bit-fp4, moe-quant, weight-only]
priority: high
sources: [hf-models]
status: new
verified: "2026-07-27 HF API で確認 (createdAt 2026-07-21, downloads 3,513, tags: vllm/nvfp4/compressed-tensors/moe/solar_open2, en/ko)"
related: ["2026-W31-024"]
---

## 日本語要約
Nota AI による Upstage **Solar-Open2 250B**(MoE、韓国発の大型オープンモデル)の NVFP4 量子化版。モデルカードに vllm タグがあり、NVFP4 + compressed-tensors 形式は vLLM の実行可能量子化パス(ground-truth リスト該当)なので直接ロード可能。250B クラス MoE の FP4 化はメモリ削減効果が大きく、公開から1週間弱で 3.5k DL。

## 量子化仕様
- ベースモデル: upstage/Solar-Open2-250B (MoE)
- 量子化手法: NVFP4 (compressed-tensors)
- ビット幅: FP4 (weight)
- 量子化対象: weight
- ファイルフォーマット: safetensors (compressed-tensors)

## 精度報告(あれば)
- ベンチマーク: モデルカード記載ベース(en/ko)
- 劣化幅: 未詳

## ダウンロード/利用状況
3,513 DL。同週に [[items/2026-W31-024-github-gptqmodel-v731-732|GPTQModel も solar_open2 対応]]を追加しており、Solar-Open2 の量子化エコシステムが立ち上がり中。

## 注目度コメント
NVFP4 (focus method) + vllm-ready(実装エンジン bump)+ 250B MoE (moe-quant) の三拍子で high。「vLLM で直接ロードできる量子化済み大型 MoE」は評価実験の実弾として最有力。
