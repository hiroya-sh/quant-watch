---
id: "2026-W33-035"
type: hf-model
title: "MiniMax-H3 量子化ウェーブ (NVFP4/FP8/W4A8/W4A4)"
url: "https://huggingface.co/unsloth/MiniMax-H3-FP8"
discovered: "2026-08-10"
published: "2026-08-05"
base_model: "MiniMaxAI/MiniMax-H3"
models: [MiniMaxAI/MiniMax-M3]
architectures: [moe]
methods: [NVFP4]
tech: [low-bit-fp4, low-bit-fp8, moe-quant, weight-only]
priority: normal
sources: [hf-models]
status: new
related: []
---

## 日本語要約
MiniMaxの動画+同期ステレオ音声を1リクエストで生成するMiniMax-H3(SGLang-Diffusion native対応, item 027)に対する量子化群。unsloth FP8、NVFP4各種、W4A8(starsfriday/koongrizzly ConvRot-Pruned)、W4A4(felipesztutman)、deltaquant-nvfp4など。

## 量子化仕様
- ベースモデル: MiniMax-H3 (動画+音声生成, MoE)
- 量子化手法: FP8 / NVFP4 / W4A8 / W4A4 / delta量子化
- ビット幅: 8bit(FP8)〜4bit(NVFP4/W4A8/W4A4)
- 対象: weight、一部activation(W4A8/W4A4)

## 精度報告(あれば)
- community中心。ConvRot(回転)やpruning併用の派生あり

## ダウンロード/利用状況
- 多数の派生。生成系モデルとしては活発

## 注目度コメント
動画+音声生成モデルへの量子化。LLM主軸ではないが、NVFP4/W4A4のマルチモーダル適用として記録。
