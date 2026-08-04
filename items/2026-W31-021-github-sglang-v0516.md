---
id: "2026-W31-021"
type: github
subtype: library
title: "SGLang v0.5.16 — FP4 KV Cache 設計の導入 / QServe・FBGEMM FP8 削除 / Inkling NVFP4 MoE 対応"
url: "https://github.com/sgl-project/sglang/releases/tag/v0.5.16"
discovered: "2026-07-27"
published: "2026-07-25"
repo: "sgl-project/sglang"
release_tag: "v0.5.16"
models: [deepseek-ai/DeepSeek-V3, deepseek-ai/DeepSeek-V4, moonshotai/Kimi-K2.5, zai-org/GLM-5.2, Qwen/Qwen3]
architectures: [moe, hybrid, mamba2, linear-attention]
methods: [NVFP4, MXFP4]
tech: [kv-cache-quant, moe-quant, low-bit-fp4, low-bit-fp8, mixed-precision]
priority: high
sources: [github-releases]
status: new
verified: "2026-07-27 gh api で release body 取得・published_at 確認"
related: []
---

## 日本語要約
量子化の追加と整理が同時に走った大きめのリリース。追加側: **FP4 KV Cache の設計導入 + SM120 対応** (#21601)、DSA バックエンドへの Q8KV8 FP8 Sparse MLA Prefill 統合 (DeepSeek-V3.2, #30514)、DeepSeek-V4 の Wint4Abf16 / Wint4Afp8 対応 (#25763)、SM120 での DSv4 flashinfer_mxfp4 MoE ランナー (#30272)、Kimi K2.5 NVFP4 の decode context parallel (#31514)、Humming 量子化カーネル (#23754)、Ascend NPU での Qwen3 Dense W4A4 MXFP4 (#23795)。削除側: **実験的だった QServe (QoQ) W4A8 と FBGEMM FP8 経路を削除**、CUTLASS FP8 blockwise (SM90/SM100) 削除、`--fp4-gemm-backend cutlass` 削除で NVFP4 GEMM は FlashInfer 必須に。新モデルは Inkling(975B マルチモーダル MoE、SWA+full+Mamba2 linear attention 混在、NVFP4 MoE 搭載)。

## 量子化関連の変更点
- 新規対応手法/フォーマット: FP4 KV Cache 設計、Q8KV8 sparse MLA、Wint4Abf16/Wint4Afp8、Humming カーネル
- 既存手法の改善: NVFP4 online scale 修正 (#32246)、GLM/DeepSeek NVFP4 長文脈 NaN 崩壊修正 (#31001)
- 削除: QServe / FBGEMM FP8 / CUTLASS FP8 blockwise / in-tree NVFP4 JIT

## 影響範囲
- ユーザ視点の変化: FP4 KV cache が主要エンジンでまた一歩前進(vLLM の INT4/NVFP4 KV に続く)。QServe 利用者は移行が必要
- API/CLI 変更の有無: `--fp4-gemm-backend cutlass` 廃止(`auto` 推奨)、`--enable-flexkv` 追加

## 注目度コメント
kv-cache-quant (focus) ど真ん中の FP4 KV Cache 設計導入で high。量子化経路の「大掃除」(QServe/FBGEMM 削除)はエンジン側の実装が NVFP4 + FlashInfer に収斂しつつあるシグナルとして重要。火曜定例の議題候補。
