---
id: "2026-W43-010"
type: paper
title: "MLAfication: Efficiently Enabling High-Fidelity MLA for Modern LLMs"
url: "https://arxiv.org/abs/2610.17202"
discovered: "2026-10-19"
published: "2026-10-13"
authors: ["Zile Wang", "Zhide Xie", "Tao Ji"]
venue: "arXiv:2610.17202v1"
models: [Qwen/Qwen3]
architectures: [moe, transformer]
methods: [QuIP]
tech: [kv-cache-quant, mixed-precision, pre-rope-quant]
priority: high
sources: [arxiv]
status: new
related: []
---

## 日本語要約
MHA/GQA を MLA に変換する既存法(MHA2MLA / TransMLA)は QKNorm 非対応で、現代 LLM(特に MoE)で再学習コストが高い問題を解く。QKNorm 対応・パラメータ効率的・Partial-RoPE 対応で、Qwen3-30B-A3B で最大 5.35x の KV 圧縮を達成しつつ性能維持。

## 手法 / 評価のポイント
- 対象: MHA / GQA → MLA 変換 (特に MoE)
- 貢献: QKNorm 対応、Partial-RoPE 対応、活性認識 joint KV init
- 評価: Qwen3-30B-A3B で最大 5.35x KV 圧縮

## 注目度コメント
MLAfication: QKNorm-compatible MHA2MLA with up to 5.35x KV compression on Qwen3-30B-A3B
