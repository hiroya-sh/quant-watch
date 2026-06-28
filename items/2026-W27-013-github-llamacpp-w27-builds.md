---
id: "2026-W27-013"
type: github
subtype: library
title: "ggml-org/llama.cpp: W27 builds (b9756–b9878)"
url: "https://github.com/ggml-org/llama.cpp/releases/tag/b9878"
discovered: "2026-06-29"
published: "2026-06-28"
repo: "ggml-org/llama.cpp"
release_tag: "b9878"
models: [google/gemma-4, Qwen/Qwen3.6, zai-org/GLM-5.1, moonshotai/Kimi-K2.6]
architectures: [transformer, moe]
methods: [GGUF, AWQ]
tech: [low-bit-4, low-bit-3, kv-cache-quant, weight-only]
priority: normal
sources: [github]
status: new
related: [2026-W26-011]
---

## 日本語要約
llama.cpp の W27 ビルドバッチ（b9756–b9878、約 120 ビルド）。Q4_NL / Q3_K_L 新 quant タイプの導入、Gemma 4 MoE の Vulkan バックエンド完全対応、Qwen3.6 / GLM-5.2 公式 GGUF サポート、CUDA Q3_K_L の prefill 最適化が主な変更。Kimi-K2.6-Code-DEV の GGUF 対応も完了。Apple Silicon Metal 経路で IQ3_KS の高速化（+15%）。

## 量子化関連の主要変更
- **Q4_NL（Normal Float Long）**: NF4 互換でブロックサイズを拡張した新 quant タイプ
- **Q3_K_L 高速化**: CUDA prefill が IQ3_XXS 比 +18%（PR #14990）
- **IQ3_KS Metal 経路**: Apple Silicon M3 Ultra / M4 Pro で 15% 高速化
- **GLM-5.2 / Qwen3.6 公式 GGUF**: モデル変換スクリプト互換性
- **KV キャッシュ 4-bit**: K=Q4_0、V=Q4_0 デフォルトに（既存 8-bit からの自動移行）

## その他変更
- Gemma 4 MoE の Vulkan バックエンド完全対応（AMD RDNA4 で実用速度）
- Kimi-K2.6-Code-DEV (35B-A3B) の GGUF 対応
- llama-server の SSE 経路改善

## 注目度コメント
GGUF が主用途のローカル推論ユーザ向けの安定化。Apple Silicon / Vulkan / CUDA の全バックエンドで継続的に量子化カーネル最適化が進む。focus 直接ヒットなし。
