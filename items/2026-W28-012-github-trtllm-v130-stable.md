---
id: "2026-W28-012"
type: github
subtype: library
title: "NVIDIA/TensorRT-LLM: v1.3.0"
url: "https://github.com/NVIDIA/TensorRT-LLM/releases/tag/v1.3.0"
discovered: "2026-07-06"
published: "2026-07-02"
repo: "NVIDIA/TensorRT-LLM"
release_tag: "v1.3.0"
models: [meta-llama/Llama-4, Qwen/Qwen3.6, deepseek-ai/DeepSeek-V4, google/gemma-4, nvidia/Nemotron, zai-org/GLM-5.1]
architectures: [transformer, moe, hybrid, mamba2]
methods: [NVFP4, MXFP4, PolarQuant]
tech: [moe-quant, low-bit-fp4, kv-cache-quant, activation-quant, polar-rotation]
priority: normal
sources: [github]
status: new
related: [2026-W27-012]
---

## 日本語要約
TensorRT-LLM v1.3.0 の正式リリース（W27 v1.3.0rc19 の promote 版）。W27 で導入された Blackwell B200/B300 向け WGMMA NVFP4 KV native カーネルが GA 化、NVFP4 statistics APIs が確定。Llama-4 全構成（W28-009）と Qwen3.6（W27-009）の公式量子化レシピを両方サポート。PolarQuant-KV の Blackwell native 実装が experimental フラグ付きで参入。

## 量子化関連の主要変更
- **v1.3.0rc19 の RC → 正式 GA**: 19 個の RC を経ての stable、production 品質保証 (SLA 明記)
- **PolarQuant-KV native**: `--kv-quant polar` を experimental フラグとして追加、Blackwell B200/B300 のみ動作
- **Llama-4 5 レシピ**: NVFP4 W4A4 / MXFP4-MoE / FP8 / AWQ INT4 / GPTQ INT4 の 5 レシピ全対応、engine build tool の CLI 統一
- **Nemotron-3-Ultra 550B**: FP8 で TP=8 単一 node 実行可能、NVFP4 で TP=4 に半減（HBM3e 192GB × 4 = 768GB）
- **GLM-5.2 対応**: W26 タグ候補の GLM-5.2 が W27 NVIDIA 公式リリースに続き、TRT-LLM でも公式サポート

## その他変更
- Windows Blackwell 対応（RTX 6000 Ada Gen2 / RTX Pro Blackwell）
- KV offload manager が dynamic warmup 対応
- rc シリーズの LazyDelegate → static path の完全移行

## 注目度コメント
Llama-4 と Qwen3.6 の公式レシピ両対応 + PolarQuant-KV の native 実装で focus 手法・tech ともに直接ヒット。W27-012 の rc19 段階で報告した内容が stable 化した意味で normal priority、ただし production 導入の実運用可能性が広がった点で W28 内では影響大。
