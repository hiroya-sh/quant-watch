---
id: "2026-W34-002"
type: paper
title: "Spec Sheets Are Not Kernels: An ISA- and Source-Level Audit of INT8 Availability on NVIDIA Blackwell Ultra"
url: "https://arxiv.org/abs/2608.11693"
discovered: "2026-08-17"
published: "2026-08-12"
authors: [Teng-Ruei Chen]
venue: "arXiv"
models: []
architectures: []
methods: []
tech: [activation-quant, low-bit-fp8, low-bit-fp4]
priority: high
sources: [arxiv]
status: new
related: []
---
## 日本語要約
Blackwell Ultra (B300) は仕様上 FP8:INT8 の dense 演算比が約30:1(H200/B200 は1:1)。本監査は INT8 W8A8 サポートを仕様→PTX ISA→CUTLASS→推論エンジン(vLLM/SGLang)の4層で追跡し、**一貫した INT8 の切り捨て**を確認: (i) PTX が sm_103a で第5世代 tensor-core 整数パス(tcgen05.mma .kind::i8)を露出せず(FP4 は露出)、(ii) CUTLASS が 103a 向け INT8 UMMA 生成をスキップ、(iii) vLLM は Blackwell 向け INT8 GEMM を持たず初回 forward でハード失敗、(iv) SGLang も AOT で同様。

## 手法
公開仕様・PTX ISA・CUTLASS kernel generator・OSS 推論エンジンのソースを横断監査し、INT8 tensor-core パスの実在性を層別に検証。

## 評価
- 対象: NVIDIA B300 (Blackwell Ultra), 比較 H200/B200
- ビット幅: INT8 W8A8 (対 FP8/FP4)
- 結論: B300 では INT8 tensor-core は事実上不可、FP8/FP4 へ移行が前提

## 既存手法との差分
「spec sheet 上の対応」と「実際に動く kernel」の乖離を実測で示す監査論文。手法提案ではなく engine ground-truth の裏取り。

## 注目度コメント
Hiroya の実装エンジン監視方針に直結。Blackwell 世代では INT8 前提の量子化は vLLM/SGLang で動かない → FP8/NVFP4/MXFP4 を選ぶべき、という実運用上の重要指針。
