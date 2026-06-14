---
id: "2026-W25-012"
type: github
subtype: library
title: "sgl-project/sglang: v0.5.13"
url: "https://github.com/sgl-project/sglang/releases/tag/v0.5.13"
discovered: "2026-06-15"
published: "2026-06-13"
repo: "sgl-project/sglang"
release_tag: "v0.5.13"
models: [nvidia/Nemotron, moonshotai/Kimi-K2.5, deepseek-ai/DeepSeek-V4, Qwen/Qwen3.5]
architectures: [transformer, moe, hybrid]
methods: []
tech: [speculative-decoding, kv-cache-quant, moe-quant, low-bit-fp4]
priority: normal
sources: [github]
status: new
related: []
---

## 日本語要約
SGLang v0.5.13。Spec V2（EAGLE/MTPの統合ワーカー）がデフォルトのspeculative decodingパスに昇格（Spec V1は非推奨）。Qwen3.5のBlackwell向けFlashInfer GDNカーネルとCuTeDSL GDNプレフィルカーネルを追加。Nemotron 3 Ultra（day-0対応）、Step-3.7-Flash、Command A+等の新規モデル追加。HiCache（SWA/Mambaハイブリッド）をデフォルト有効化。

## 量子化/推論効率関連の変更
- FlashInfer GDN kernels: Qwen3.5のBlackwell GPU向け高速化（Gated DeltaNet=Linear Attentionの一種）
- CuTeDSL GDN prefill kernel: さらに最適化されたプレフィル
- HiCache: SWA/Mambaハイブリッドモデル向けKVキャッシュ管理をデフォルト化
- Piecewise & Breakable CUDA Graph: Kimi-K2.5/DeepSeek V4/DSAモデルへ拡張

## 注目度コメント
Spec V2デフォルト化は投機的デコーディングの本格実用化。Nemotron 3 Ultra（550B MoE）のday-0対応が示すNVIDIA-SGLangの連携強化。量子化エンジンというよりは推論効率基盤の更新として注目。
