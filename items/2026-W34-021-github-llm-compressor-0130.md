---
id: "2026-W34-021"
type: github
subtype: library
title: "llm-compressor 0.13.0"
url: "https://github.com/vllm-project/llm-compressor/releases/tag/0.13.0"
discovered: "2026-08-17"
published: "2026-08-12"
repo: "vllm-project/llm-compressor"
release_tag: "0.13.0"
models: []
architectures: []
methods: [AutoRound, SpinQuant, AWQ, GPTQ]
tech: [vllm-ready, weight-only, activation-quant, low-bit-2, mixed-precision]
priority: high
sources: [github]
status: new
related: []
---
## 日本語要約
compressed-tensors 出力(=vLLM 直行)の量子化ツール大型更新。**任意ビット幅量子化 (Humming)**: pack_quantized が dense cross-element packing に。**AutoRound サブビット量子化** (W2A16 等)、**pre-quantized model の oneshot 対応**、W2〜W7 weight-only preset と整数 WxAy 組合せ拡張、Cohere2MoE SpinQuant、REAP(低顕著性 expert 剪定)+量子化の併用、MSE observer の torch.compile 対応。

## 量子化関連の変更点
- 新規対応手法/フォーマット: 任意ビット幅 (Humming, ct#732/#785), AutoRound sub-bit W2A16 (#2895), W2-W7 preset (ct#760)
- 既存手法の改善: AWQ/GPTQ の observer 冗長計算削減, MSE observer chunked torch.compile (#2384)
- 対応モデル拡張: Cohere2MoE SpinQuant (#2867), pre-quantized oneshot (#2909), REAP+量子化

## 影響範囲
- ユーザ視点の変化: W2〜W7 の任意ビット・サブビット量子化を compressed-tensors で作れ、そのまま vLLM に載る
- API/CLI 変更の有無: modifier ごとに requires_calibration_data() 宣言化 (#2947)

## 注目度コメント
vLLM エコシステムの量子化生成器。任意ビット幅と AutoRound サブビットは低ビット実験の幅を広げる。vllm-ready。
