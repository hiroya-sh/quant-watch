---
id: "2026-W26-006"
type: github
subtype: library
title: "InternLM/lmdeploy: v0.14.0a2"
url: "https://github.com/InternLM/lmdeploy/releases/tag/0.14.0a2"
discovered: "2026-06-22"
published: "2026-06-16"
repo: "InternLM/lmdeploy"
release_tag: "0.14.0a2"
models: [Qwen/Qwen3, Qwen/Qwen3.5, moonshotai/Kimi-K2.5]
architectures: [transformer, moe]
methods: [AWQ]
tech: [kv-cache-quant, low-bit-fp8, moe-quant, activation-quant, weight-only]
priority: high
sources: [github]
status: new
related: []
---

## 日本語要約
lmdeploy v0.14.0a2（プレリリース）。量子化面の最大変更は**FP8 KVキャッシュ量子化のturbomindバックエンド実装**。Qwen3 Omniサポート、Qwen3.5（VIT版・MoE 397B）対応、Qwen3.5 MoE Lite AWQ対応が追加。W8A8Linearの型指定柔軟化、MixtralのTurbomind復活、gated delta rule状態レイアウト更新なども含む。

## 量子化関連の主要変更
- **FP8 KV cache quantization** (PR #4563): turbomindバックエンドでFP8 KVキャッシュ量子化を実装。kv-cache-quantのfocus項目に直接ヒット
- **Qwen3.5 MoE Lite AWQ** (PR #4561): Qwen3.5シリーズのAWQ量子化対応を追加
- **W8A8Linear dtype指定改善** (PR #4586): `Allow W8A8Linear to accept dtype during initialization instead of hard code` - 量子化型の柔軟化
- **Fix dequant_mixed** (PR #4657): 混合精度逆量子化バグ修正

## その他変更
- Qwen3 Omni対応、Qwen3.5 VIT推論、MixtralのTurbomind復活
- OpenAI Responses互換エンドポイント追加
- MTP (speculative decoding) とQwen3.5のDP対応改善

## 注目度コメント
kv-cache-quantがfocus（FP8 KV）。lmdeployのturbomindバックエンドへのFP8 KV実装は、vLLM v0.23.0のKVオフロード（W25）と並び、本番推論エンジンへのKV量子化統合を推進。Qwen3.5の397Bパラメータ巨大MoEへのAWQ対応もmoe-quantに関連。InternLM系の実装は中国AI labs内での採用実績から注目度高い。
