---
id: "2026-W29-039"
type: hf-model
title: "Baekpica/K-EXAONE-152B-A23B-REAP-80E-NVFP4"
url: "https://huggingface.co/Baekpica/K-EXAONE-152B-A23B-REAP-80E-NVFP4"
discovered: "2026-07-13"
published: "2026-07-09"
base_model: "LGAI-EXAONE (K-EXAONE 152B-A23B, REAP 80-expert 剪定版)"
models: []
architectures: [transformer, moe]
methods: [NVFP4]
tech: [low-bit-fp4, moe-quant, weight-only]
priority: watching
sources: [hf-models]
status: new
verified: "2026-07-13 HF API 検索一覧で repo/createdAt 確認 (createdAt 2026-07-09, v2 2026-07-11, 145B-A23B-REAP-76E 2026-07-12)"
related: []
---

## 日本語要約
LG K-EXAONE 152B MoE を **REAP(expert 剪定)で 80 expert に削減した上で NVFP4 量子化**したコミュニティモデル。v2、145B-76E 版と連日更新。expert pruning × 低ビット量子化の複合圧縮の実例。

## 注目度コメント
「REAP剪定 + NVFP4」の組合せは W29 で複数観測(qwen3-coder-30b-a3b-reap50-nvfp4、GLM-5.2-REAP-NU176 も同様)。複合圧縮のトレンドとして watching。
