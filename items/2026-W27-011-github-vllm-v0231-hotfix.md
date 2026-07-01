---
id: "2026-W27-011"
type: github
subtype: library
title: "vllm-project/vllm: v0.23.1"
url: "https://github.com/vllm-project/vllm/releases/tag/v0.23.1"
discovered: "2026-06-29"
published: "2026-06-24"
repo: "vllm-project/vllm"
release_tag: "v0.23.1"
models: [Qwen/Qwen3.5, Qwen/Qwen3.6, google/gemma-4, deepseek-ai/DeepSeek-V4]
architectures: [transformer, moe]
methods: [NVFP4, MXFP4, AWQ, GPTQ]
tech: [moe-quant, low-bit-fp4, kv-cache-quant, weight-only, activation-quant]
priority: normal
sources: [github]
status: new
related: [2026-W25-010]
---

## 日本語要約
vLLM v0.23.1 hotfix リリース。v0.23.0 メジャー（W25）から 9 日。NVFP4 統一クラスのバグ修正、MXFP8 非ゲート MoE のメモリリーク修正、Qwen3.6 一族の初期サポート、KV オフロード機能の安定化が主要変更。compressed-tensors 0.18.0 への依存更新で Qwen3.6 公式量子化レシピ（W27-009）を即サポート。

## 量子化関連の主要変更
- **NVFP4 統一クラス安定化**: v0.23.0 で導入された NVFP4 単一クラスでの DiffusionGemma 推論クラッシュ修正（PR #15212）
- **MXFP8 MoE leak fix**: 非ゲート MoE の MXFP8 経路で activation cache が解放されない不具合修正（PR #15287）
- **Qwen3.6 公式レシピ対応**: compressed-tensors 0.18.0 経由で W27 Qwen Team 公式量子化レシピ一括対応
- **KV オフロード安定化**: v0.23.0 KV オフロード機能の長時間運用クラッシュを修正、QPS スパイクへの耐性向上
- **DeepSeek-V4-Pro NVFP4 prefill 最適化**: prefill 段階の attention カーネル選択ロジック改善

## その他変更
- Llama-3.3 INT4 GPTQ AMD ROCm 経路の修正
- gemma-4 31B 多モーダル経路の安定化
- v0.24.0 RC1 タグ準備（次週リリース予定）

## 注目度コメント
Qwen3.6 公式量子化レシピを即対応した点でエコシステム同期性が高い。v0.23.0 のメジャー変更（W25）の安定化版という位置づけで normal priority。次の v0.24.0（次週予定）が議論の主軸になる予定。
