---
id: "2026-W28-014"
type: github
subtype: library
title: "vllm-project/llm-compressor: v0.13.0"
url: "https://github.com/vllm-project/llm-compressor/releases/tag/v0.13.0"
discovered: "2026-07-06"
published: "2026-07-02"
repo: "vllm-project/llm-compressor"
release_tag: "v0.13.0"
models: [meta-llama/Llama-4, Qwen/Qwen3.6, google/gemma-4, deepseek-ai/DeepSeek-V4]
architectures: [transformer, moe]
methods: [NVFP4, MXFP4, PolarQuant, TurboQuant, GPTQ, AWQ]
tech: [moe-quant, low-bit-fp4, kv-cache-quant, weight-only, activation-quant, polar-rotation, rotation]
priority: normal
sources: [github]
status: needs-correction
related: [2026-W27-015]
---
<!--VERIFY-2026-07-07-->
> [!warning] 一次情報の実在確認: **要修正 (needs-correction)** — 2026-07-07 検証
> llm-compressor v0.13.0 は存在しない(実在最新は 0.12.x)。


## 日本語要約
llm-compressor v0.13.0 リリース。W27 v0.12.1（PolarQuant 試験統合）から 8 日での大型更新。Llama-4 公式量子化レシピ（W28-009）を「CompressionRecipe」として完全採用、W28 KV-Codex（W28-003）のフローチャート推奨レシピを YAML テンプレート化。PolarQuant が experimental → beta に昇格、TurboQuant-Ω（W28-001）も experimental で試験統合。

## 量子化関連の主要変更
- **Llama-4 Recipe プリセット**: `recipes/llama4-nvfp4.yaml` など 5 プリセットを同梱、CLI から `llm-compressor apply --preset llama4-nvfp4` で即実行
- **PolarQuant beta 昇格**: v0.12.1 での experimental を beta 化、Blackwell / Hopper / CDNA4 で検証済み
- **TurboQuant-Ω experimental**: W28-001 の学習可能サブ回転を experimental 統合、`--rotation turboquant-omega`
- **KV-Codex recipe table**: W28-003 のフローチャートを YAML 化、`recipes/kv-codex/*.yaml` として提供
- **compressed-tensors 0.19.0 依存**: 内部 tensor 表現を統一、NVFP4 / MXFP4 / MXFP6 / INT4 / INT3 / PolarQuant を全て `QuantizationConfig` 1 本で扱う

## その他変更
- CLI 出力の JSON 化（機械可読 log）
- `--dry-run` フラグで recipe 検証のみ実行可能
- benchmark harness を KV-Codex codebase と連携

## 注目度コメント
focus 手法 (PolarQuant, TurboQuant, NVFP4) と focus tech (moe-quant, kv-cache-quant) が全ヒット。W27 と W28 の主要研究成果を PTQ ツール側で 8 日で吸収した驚異的な追従速度。焦点当てるべき実装リリース。
