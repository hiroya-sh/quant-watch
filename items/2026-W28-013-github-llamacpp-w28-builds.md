---
id: "2026-W28-013"
type: github
subtype: library
title: "ggml-org/llama.cpp: W28 rolling builds (b5731 - b5748)"
url: "https://github.com/ggml-org/llama.cpp/releases"
discovered: "2026-07-06"
published: "2026-07-05"
repo: "ggml-org/llama.cpp"
release_tag: "b5731 - b5748"
models: [meta-llama/Llama-4, meta-llama/Llama-4-Scout, Qwen/Qwen3.6, google/gemma-4, moonshotai/Kimi-K2.6]
architectures: [transformer, moe]
methods: [GGUF, AWQ, MXFP4]
tech: [weight-only, moe-quant, low-bit-4, low-bit-fp4]
priority: normal
sources: [github]
status: new
related: [2026-W27-013]
---

## 日本語要約
llama.cpp W28 (2026-06-29 – 2026-07-05) のローリングビルド 18 件の集約。Llama-4 全ファミリー（8B / 70B / 405B / Scout MoE）の GGUF Q4_K / Q5_K / Q6_K 対応が第一目標として b5735 でマージ、Q3_K_XL の 128K 文脈対応が b5744 で追加。Kimi-K2.6-140B の MoE ルーター量子化整合バグ修正 (b5741) と、Metal 向け NVFP4-safe accum が b5747 で入った。

## 量子化関連の主要変更
- **Llama-4 全ファミリー GGUF**: Scout (16E-A2B / 128E-A16B) 含めて Q3_K_XL / Q4_K_M / Q5_K_M / Q6_K の 4 quant を検証（PR #12094）
- **Q3_K_XL 128K 文脈**: KV cache Q3_K_XL で 128K 文脈時のオーバーフロー修正
- **Kimi-K2.6 MoE ルーター整合**: expert 選択の量子化誤差が全 GGUF quant で 3% 出ていたバグを修正 (b5741)
- **Metal NVFP4-safe accum**: Apple Silicon 側で NVFP4 相当の block-scale を FP16 accum で扱う fallback path 追加
- **MoE experts skip**: 未活性 expert の GGUF loading を skip し、Kimi-K2.6-140B を M4 Ultra 単機で動作可能に

## その他変更
- ROCm 6.5 対応、AMD MI350 native カーネル
- Windows CUDA 13.0 対応
- convert-hf-to-gguf.py に Llama-4-Scout の router weight 変換ロジック追加

## 注目度コメント
Llama-4 の GGUF 対応が全ファミリーで揃った点が主要トピック。Kimi-K2.6-140B が M4 Ultra 単機で動く点はローカル運用者的にインパクト大。focus には該当しないが実装エッジとして重要な週。normal priority。
