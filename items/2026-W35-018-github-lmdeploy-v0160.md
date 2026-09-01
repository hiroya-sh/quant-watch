---
id: "2026-W35-018"
type: github
subtype: engine
title: "LMDeploy v0.16.0"
url: "https://github.com/InternLM/lmdeploy/releases/tag/v0.16.0"
discovered: "2026-09-01"
published: "2026-08-19"
repo: "InternLM/lmdeploy"
release_tag: "v0.16.0"
models: []
architectures: [transformer]
methods: []
tech: [kv-cache-quant, low-bit-4, low-bit-fp8, activation-quant]
priority: normal
sources: [github]
status: new
related: []
---
## 日本語要約
量子化に関わる変更は限定的だが、**int4 KV cache の量子化レンジのバグ修正**が入っている。packed head width が2の冪でないときにレンジ計算が誤っていた。

## 量子化関連の変更点(release body 全文スキャン)
- **Fix int4 KV cache quantization range when the packed head width is not a power of two** (#4850)
- SM90 native BF16/FP8 GEMM カーネル + **fused-SiLU quantization** + linear テストハーネス (#4795)
- Hopper 向け最適化 Gluon blocked FP8 GEMM (#4830)
- Hy3 対応 + MTP + FP8 最適化 (#4815)

## focus 突合(release 本文全文検索)
- kv-cache-quant: **該当あり**(#4850)
- NVFP4 / TurboQuant / PolarQuant / QJL / gemma-4: 出現なし

## 影響範囲
- LMDeploy で int4 KV cache を使っている場合のみ。head 幅が2の冪でないモデルで結果が変わる可能性。

## 注目度コメント
「2の冪でない head 幅で KV 量子化レンジがずれる」は他エンジンでも起こりうる類のバグ。自前で KV 量子化を評価するときのチェック観点として記録。
