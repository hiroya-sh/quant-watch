---
id: "2026-W35-017"
type: github
subtype: engine
title: "SGLang v0.5.18"
url: "https://github.com/sgl-project/sglang/releases/tag/v0.5.18"
discovered: "2026-09-01"
published: "2026-08-22"
repo: "sgl-project/sglang"
release_tag: "v0.5.18"
models: [google/gemma-4, MiniMaxAI/MiniMax-M3, moonshotai/Kimi-K2.7, deepseek-ai/DeepSeek-V3]
architectures: [transformer, moe]
methods: [NVFP4, MXFP4, MXFP6, GPTQ, AutoRound]
tech: [low-bit-fp4, low-bit-fp8, microscaling-formats, moe-quant, kv-cache-quant, activation-quant]
priority: high
sources: [github]
status: new
related: []
---
## 日本語要約
量子化セクションが厚い。特に **AMD 上で NVFP4 チェックポイントをそのまま動かす** 経路(ロード時に NVFP4 → MXFP4 へ再量子化)が入ったのが目玉。ModelOpt / Quark の NVFP4 資産を AMD GPU に持ち込めるようになる。

## 量子化関連の変更点(release body 全文スキャン)
- **`--quantization quark_mxfp4`: NVFP4 チェックポイントが AMD で動く**。ModelOpt / Quark の NVFP4 重みをロード時に dequantize → MXFP4 へ再量子化し、full-precision コピーを一度も保持しない。**MiniMax-M2.7 / GLM-5.1 / Kimi-K2.6 / Qwen3.5-397B / DeepSeek-R1 で GSM8K を NVFP4 参照比 97.5〜100.2% 回復** (#29328)。
- ModelOpt **MXFP8** チェックポイント対応 (#32538)、ModelOpt FP4 の **online MoE weight quantization** (#33115)、**NVFP4 token embedding** の mixed-precision チェックポイント対応 (#34222)。
- FlashInfer CuTe DSL の **NVFP4 MoE quantization** 対応 (#28354)、SM120 の MXFP8 dense GEMM を FlashInfer CUTLASS へ(Triton パス削除, #33208)。
- **online NVFP4 4over6 量子化設定を pin** (#33621) — ModelOpt 0.46.0 の 4/6 と同じ概念。
- Kimi-K3 の **mixed NVFP4/FP8 ModelOpt チェックポイント**対応 (#35077)。
- W4AFP8 DeepEP の scaling 修正 (#33669) と 128-aligned hidden size 対応 (#35593)。
- per-token FP8 量子化を AOT から **JIT へ移行** (#34257)、channelwise FP8 GEMM の Triton tile config 追加 (#34331)、dense FP8 Marlin の bias 順序修正 (#35020)。
- GPTQ scheme が `LinearBase.scheme` の既定値で壊れていた問題を修正 (#34962)。
- **NPU**: mxfp4-w4a8 MoE 量子化対応 (#30318)、MiniMax-M3 w8a8 の NPU 適応 (#32941)。
- **CPU**: **Gemma4 の Xeon 対応** (#22498)、**auto-round 向け AMX CPU サポート** (#29593)。
- diffusion: quant-videogen の **prq kv-cache quantization**(causal-DiT 向けメモリ削減, #32581)、weight-only FP8 の一度だけ dequantize (#34305, Ideogram-4 で H200 -18.8% / H100 -7.8%、bit-exact)。

## focus 突合(release 本文全文検索)
- NVFP4: **該当あり**(多数)
- google/gemma-4: **該当あり**(#22498 Gemma4 on Xeon)
- kv-cache-quant: 該当あり(diffusion prq kv-cache quantization #32581)
- TurboQuant / PolarQuant / QJL: 出現なし

## 影響範囲
- AMD GPU 環境がある場合、NVFP4 資産の再利用コストが大幅に下がる。
- vLLM を主エンジンとする現方針では直接の実行対象外だが、**フォーマット互換の実証データ**として価値が高い。

## 注目度コメント
「NVFP4 を Blackwell 以外に持ち込む」動きの最初のまとまった実装報告。GSM8K 97.5-100.2% という数字は release note の主張であり一次検証は未実施。
