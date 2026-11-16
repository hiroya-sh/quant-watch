---
id: "2026-W47-008"
type: paper
title: "User-Schedulable Approximations for Quantized Tensor Programs"
url: "https://arxiv.org/abs/2611.17526"
discovered: "2026-11-16"
published: "2026-11-13"
authors: [arxiv:2611.17526]
venue: "arXiv:2611.17526"
models: []
architectures: []
methods: []
tech: [weight-only, mixed-precision, low-bit-4, low-bit-2]
priority: high
sources: [arxiv]
status: new
related: []
---

## 日本語要約
GGML(llama.cpp)の tensor 量子化 kernel は手書きで、**54 ある weight フォーマット × 複数 activation × 複数 ISA / GPU**の掛け算で組合せが爆発。現状は 54 中 8 formats しか full cross-kernel が揃っていない。User-Schedulable Approximations は **ユーザが近似パスをスケジューリング宣言**できる DSL + compiler を提案し、format 増殖に対応する。

## 手法
- quantization kernel を **"storage × decoded × activation × ISA"** の直交軸に分解
- ユーザが近似ポリシ(どの軸で近似を走らせるか、decode をどこで行うか)を schedule 記述
- compiler が ISA(x86 AVX512, ARM NEON, CUDA, Metal, Vulkan, Hexagon)別の kernel を生成
- 既存 GGML tensor_type と互換

## 評価
- GGML / llama.cpp の既存 kernel カバレッジ 8/54 を拡大
- 同精度・同速度での kernel 追加が **人手より桁違いに少ないコード量**

## 既存手法との差分
Halide / TVM / Triton は**一般 tensor** のスケジューリング、本論文は**量子化 kernel 特化**(storage 多形式 × decode パス多形式)。llama.cpp の実務 pain point に直接応答。

## 注目度コメント
`llamacpp-ready` 運用タグに直結。[[items/2026-W47-009-github-llamacpp-v100|llama.cpp v1.0.0]] の Hexagon NVFP4/IQ2_XXS、OCP FP8 KV、Granite/qwen2 NVFP4 FFN scales といった kernel 追加ラッシュに対応する、kernel 供給側のスケーラビリティ改善策。
