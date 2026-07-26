---
id: "2026-W31-022"
type: github
subtype: library
title: "TensorRT-LLM v1.3.0rc22 — FP4 KV cache + 非FP4 Mamba state の混在許可 / NVFP4 GEMM オートチューナ改善"
url: "https://github.com/NVIDIA/TensorRT-LLM/releases/tag/v1.3.0rc22"
discovered: "2026-07-27"
published: "2026-07-22"
repo: "NVIDIA/TensorRT-LLM"
release_tag: "v1.3.0rc22"
models: [deepseek-ai/DeepSeek-V3, deepseek-ai/DeepSeek-V4, moonshotai/Kimi-K2.5]
architectures: [mamba, hybrid, moe]
methods: [NVFP4]
tech: [kv-cache-quant, low-bit-fp4, low-bit-fp8, trtllm-ready, moe-quant]
priority: high
sources: [github-releases]
status: new
verified: "2026-07-27 gh api で release body 取得・published_at 確認"
related: []
---

## 日本語要約
リリース候補の週次更新。量子化まわりでは **FP4 KV cache と非 FP4 の Mamba state の組合せを許可** (#16304) が最重要 — hybrid (Attention+Mamba) モデルで KV 側だけ FP4 化する構成が可能になる。ほかに CuTe DSL NVFP4 GEMM オートチューナの nvMatmulHeuristics によるタクティクス刈り込み (#15909)、DS V3.2 / Kimi-K2.5 向け RMSNorm nvfp4 quant fusion (#14848)、GDN post-conv split + QK norm + RMSNorm + FP8 量子化の融合 (#16299)、DeepSeek V4 KV-cache warmup 修正 (#16466)、`trtllm-bench --quantization` から非対応 INT8 選択肢を削除 (#16245)、C++ KV cache manager v2 の準備。既知問題として torch_compile=True でのマルチ GPU 精度パス失敗(DeepSeek-V3-Lite bf16/FP8/NVFP4 等)。

## 量子化関連の変更点
- 新規対応手法/フォーマット: FP4 KV + 非 FP4 Mamba state の混在
- 既存手法の改善: NVFP4 GEMM オートチューン高速化、RMSNorm→NVFP4 quant fusion、FP8 fusion 拡充
- 対応モデル拡張: DS V3.2 / Kimi-K2.5 / GDN 系 hybrid

## 影響範囲
- ユーザ視点の変化: hybrid モデルの KV FP4 化が現実解に。INT8 選択肢の削除は TRT-LLM の量子化メニューが FP 系に寄る流れの傍証
- API/CLI 変更の有無: trtllm-bench の --quantization 選択肢変更

## 注目度コメント
「FP4 KV cache × Mamba hybrid」は kv-cache-quant (focus) + 監視アーキテクチャの交点で high。SGLang の FP4 KV 設計導入と同週で、KV FP4 化が主要エンジン共通のフロンティアになった。
