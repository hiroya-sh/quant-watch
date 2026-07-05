---
id: "2026-W28-007"
type: paper
title: "SpecuMoE-Q: Speculative Decoding with Fully Quantized MoE Draft Models"
url: "https://arxiv.org/abs/2607.01821"
discovered: "2026-07-06"
published: "2026-07-02"
authors: [Yao Fu, Bowen Zhang, Hao Peng, Yi Su, Danqi Chen, Yiran Chen]
venue: "arxiv"
affiliation: "University of Edinburgh / Duke / Princeton"
models: [Qwen/Qwen3.6, deepseek-ai/DeepSeek-V4]
architectures: [moe, transformer]
methods: [AWQ, NVFP4]
tech: [moe-quant, speculative-decoding, low-bit-4, low-bit-fp4, weight-only]
priority: normal
sources: [arxiv]
status: new
related: [2026-W26-007]
---

## 日本語要約
W26 EfficientRollout の後続として、speculative decoding における draft model 側を「full quantized MoE」で構成する研究。従来 dense small model が主流だった draft を NVFP4 quantized MoE (Qwen3.6-35B-A3B) にすることで、target model (DeepSeek-V4-Pro) との expert alignment が高まり acceptance rate が向上。draft メモリを 4-bit AWQ で 8x 削減しつつ 2.7x スループット達成。

## 手法
- **Quantized MoE draft**: draft を NVFP4 quantized Qwen3.6-35B-A3B に置き換え、target と同ファミリー（Qwen3.6-27B / 40B）または DeepSeek-V4-Pro の quantized 縮小版で構成
- **Expert-alignment aware calibration**: target と draft の router logits を KL 最小化で共学習
- **NVFP4 KV共有**: draft の KV cache も NVFP4 化。W28 KV-Codex のフローチャートで PolarQuant-KV レシピを採用
- **Blackwell fused kernel**: draft forward → target verify を single kernel graph に融合

## 評価
- 対象モデル: target = DeepSeek-V4-Pro / Qwen3.6-40B、draft = Qwen3.6-35B-A3B (NVFP4)
- ビット幅: draft W4A4 NVFP4、target FP8
- 精度劣化: 生成品質 FP16 baseline 比 +0.1pt (受理率調整で保存)
- スループット/メモリ: end-to-end 2.7x、acceptance rate 71%（dense draft 比 +6pt）

## 既存手法との差分
- **W26 EfficientRollout**: draft を smaller dense に量子化。SpecuMoE-Q は draft を MoE quantized にすることで expert distribution も含めて alignment
- **Medusa / EAGLE 系**: これらは head 追加、SpecuMoE-Q は完全独立 model を quantized MoE として運用

## 注目度コメント
speculative-decoding × moe-quant × NVFP4 の 3 focus 交差点。ただし W26-W28 で speculative は 2 件目、話題の中心ではない。normal priority。
