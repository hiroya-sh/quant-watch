---
id: "2026-W43-015"
type: hf-paper
title: "SoloQ: Calibration-Free Quantization for Diffusion Language Models"
url: "https://arxiv.org/abs/2610.07121"
hf_url: "https://huggingface.co/papers/2610.07121"
discovered: "2026-10-19"
published: "2026-10-05"
authors: ["Donghyun Lee", "Arkapravo Ghosh", "Varun Manjunath"]
venue: "arXiv:2610.07121v1"
models: []
architectures: []
methods: [NVFP4]
tech: [calibration, calibration-free, rotation, diffusion-llm-quant, kv-cache-quant, activation-quant, low-bit-fp4]
priority: high
sources: [hf-papers, arxiv]
status: new
related: []
---

## 日本語要約
拡散 LLM(dLLM)の重み・活性 PTQ を校正データなしで実現。構造化された K-RPBH 回転と軽量な再スケール補正により、denoising ステップごとの活性分布シフトに非依存。NVFP4 への量子化もサポート。block-diffusion モデルには commit-time KV cache 量子化を追加。HF Papers up=39。

## 手法 / 評価のポイント
- 対象: 拡散 LLM (dLLM)
- 貢献1: 校正データ不要(K-RPBH 回転 + 再スケール)
- 貢献2: ハードウェア native NVFP4 対応
- 貢献3: block-diffusion に commit-time KV 量子化

## 注目度コメント
SoloQ: Calibration-Free Quantization for Diffusion LLMs — HF daily up=39
