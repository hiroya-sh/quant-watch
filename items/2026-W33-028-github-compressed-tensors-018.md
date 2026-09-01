---
id: "2026-W33-028"
type: github
subtype: library
title: "neuralmagic/compressed-tensors: 0.18.0"
url: "https://github.com/neuralmagic/compressed-tensors/releases/tag/0.18.0"
discovered: "2026-08-10"
published: "2026-08-08"
repo: "neuralmagic/compressed-tensors"
release_tag: "0.18.0"
models: []
architectures: [moe]
methods: [NVFP4, MXFP4]
tech: [low-bit-fp4, moe-quant, vllm-ready]
priority: normal
sources: [github]
status: new
related: []
---

## 日本語要約
compressed-tensors 0.18.0。**Hummingフォーマットのサポート追加**(CT support for humming, #732)。cast_to_fp4のper-rank torch.compile再コンパイル修正(#734)、非線形MoE gate層のignore対応(#733)、meta deviceでのsafetensorsロード、XPUサポート追加。

## 量子化関連の変更点
- 新規対応: Humming量子化フォーマットのCT対応(W31でvLLM/SGLangに出たw2-7系フォーマット)
- 修正: cast_to_fp4のper-rank再コンパイル、block構造の強制、model checkpoint名mismatch
- MoE gate層(非線形)をignore対象に

## 影響範囲
- ユーザ視点: vLLM量子化バックエンド(compressed-tensors)がHummingを扱えるようになりFP4 MoE量子化の下支えが進む
- API: apply_quantization_configにtqdm、offload周りの堅牢化

## 注目度コメント
vLLM量子化経路の基盤。W31で出たHummingがライブラリ層に降りてきた。vllm-ready維持に寄与。
