---
id: "2026-W22-026"
type: github
subtype: library
title: "TensorRT-LLM: v1.3.0rc15"
url: "https://github.com/NVIDIA/TensorRT-LLM/releases/tag/v1.3.0rc15"
discovered: "2026-05-21"
published: "2026-05-21"
repo: "NVIDIA/TensorRT-LLM"
release_tag: "v1.3.0rc15"
models: [google/gemma-4, moonshotai/Kimi-K2.5, deepseek-ai/DeepSeek-V3]
architectures: [transformer, moe]
methods: [NVFP4, MXFP4]
tech: [low-bit-fp4, low-bit-fp8, moe-quant, microscaling-formats]
priority: normal
sources: [github]
status: new
related: ["2026-W22-008", "2026-W22-012"]
---

## 日本語要約

TensorRT-LLM v1.3.0rc15は主要モデル追加と量子化インフラ強化の双方を含む大型RC。量子化面では: FP4/FP8デコードカーネルとFP4 DSAインデキシング追加、MoEのShared-Expert SwiGLU量子化、MXFP4 GPT-OSSのダミーウェイト処理修正、INT4 AWQのSM120/121GPU対応修正、FP8ブロックスケーリングオートチューナー改善。モデル追加ではGemma4（text/vision/audio）、Kimi K2.5（vision）、DeepSeek V3.2/V4が対応。

## 量子化関連の変更点

- 新規対応手法/フォーマット:
  - FP4/FP8デコードカーネル追加（FP4 DSAインデキシング）
  - MoE Shared-Expert SwiGLU量子化サポート
  - MXFP4 GPT-OSS向けswizzle修正
- 既存手法の改善:
  - INT4 AWQ: SM120/121（Blackwell）GPU対応バグ修正
  - FP8ブロックスケーリング: オートチューナーキャッシュ増大防止
  - Mixtral FP8: unfused transformers 5.x pathへの対応
- 対応モデル拡張: Gemma4 (focus model!), Kimi K2.5, DeepSeek V3.2/V4, Nemotron-H

## 影響範囲

- ユーザ視点の変化: Gemma4/Kimi K2.5/DeepSeekのTRT-LLM経由推論が可能に；Blackwell GPU向けFP4/FP8量子化パスが改善
- API/CLI 変更の有無: 新モデルのModelOptパスでの量子化ワークフロー追加

## 注目度コメント

`google/gemma-4`（focus model）のTRT-LLM正式対応。MoEモデルのFP4/FP8量子化インフラがBlackwellで着々と強化されていることを示すリリース。
