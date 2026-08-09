---
id: "2026-W33-033"
type: hf-model
title: "Ling-3.0-flash 量子化ウェーブ (NVFP4/MXFP4/W4A4/GGUF)"
url: "https://huggingface.co/olka-fi/Ling-3.0-flash-NVFP4"
discovered: "2026-08-10"
published: "2026-08-04"
base_model: "inclusionAI/Ling-3.0-flash"
models: []
architectures: [moe]
methods: [NVFP4, MXFP4, GGUF]
tech: [low-bit-fp4, moe-quant, weight-only, vllm-ready]
priority: high
sources: [hf-models]
status: new
related: []
---

## 日本語要約
inclusionAI系のLing-3.0-flashに対する量子化ウェーブ。NVFP4(olka-fi: 3,282 DL / AtomicChat: 1,148 DL)、MXFP4(olka-fi: 1,364 DL)、W4A4-NVFP4(sakamakismile: 157 DL)、NVFP4-GGUF、SGLang-MTP対応版など。

## 量子化仕様
- ベースモデル: Ling-3.0-flash (MoE)
- 量子化手法: NVFP4 / MXFP4 / W4A4-NVFP4 / GGUF
- ビット幅: 4bit(NVFP4/MXFP4/W4A4)
- 対象: weight、一部W4A4(activation含む)

## 精度報告(あれば)
- community報告中心。W4A4-NVFP4版はより攻めたactivation量子化

## ダウンロード/利用状況
- NVFP4版で合計4,000 DL超。新MoEモデルの即日NVFP4化

## 注目度コメント
NVFP4(focus method)の新MoEモデル適用。vLLM直接ロード可(vllm-ready)。DeepSeek-V4と並ぶ今週の量子化ウェーブ。議題候補。
