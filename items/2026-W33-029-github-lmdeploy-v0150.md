---
id: "2026-W33-029"
type: github
subtype: library
title: "InternLM/lmdeploy: v0.15.0"
url: "https://github.com/InternLM/lmdeploy/releases/tag/v0.15.0"
discovered: "2026-08-10"
published: "2026-07-31"
repo: "InternLM/lmdeploy"
release_tag: "v0.15.0"
models: [deepseek-ai/DeepSeek-V4, Qwen/Qwen3.5]
architectures: [moe, transformer, linear-attention]
methods: []
tech: [kv-cache-quant, moe-quant, low-bit-fp8, speculative-decoding]
priority: normal
sources: [github]
status: new
related: []
---

## 日本語要約
lmdeploy v0.15.0。DeepSeek-V4サポート追加、qwen3.5向けfp8 MoE対応、long-context + MTPのprefix-cacheヒット、guided decodingのspeculative decoding対応、turbomindのメモリアロケータ/オブジェクトキャッシュ/スケジューラ統合。

## 量子化関連の変更点
- 新規対応: qwen3.5のfp8 moe(#4740)、DeepSeek-V4(#4554)、memdecode(#4767)
- long-context/MTP prefix-cache(#4688)、guided decoding for spec decoding(#4559)
- Ascend向け線形attentionのblksize=128強制など

## 影響範囲
- ユーザ視点: DeepSeek-V4とqwen3.5 fp8 MoEの配備がlmdeployでも可能に
- TTFT最適化、Ascend multi-node対応の改善

## 注目度コメント
DeepSeek-V4対応が主要エンジンに広がる中の一つ。fp8 MoEはvllm_runnable_ground_truthのFP8系と整合。
