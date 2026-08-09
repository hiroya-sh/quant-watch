---
id: "2026-W33-026"
type: github
subtype: library
title: "NVIDIA/TensorRT-LLM: v1.3.0rc23"
url: "https://github.com/NVIDIA/TensorRT-LLM/releases/tag/v1.3.0rc23"
discovered: "2026-08-10"
published: "2026-07-31"
repo: "NVIDIA/TensorRT-LLM"
release_tag: "v1.3.0rc23"
models: [deepseek-ai/DeepSeek-V4, google/gemma-4, MiniMaxAI/MiniMax-M3, zai-org/GLM-5.2]
architectures: [transformer, moe, hybrid]
methods: [NVFP4, MARLIN, AWQ]
tech: [kv-cache-quant, low-bit-fp4, moe-quant, trtllm-ready, speculative-decoding]
priority: high
sources: [github]
status: new
related: []
---

## 日本語要約
TRT-LLM v1.3.0rc23。DeepSeek-V4 mixed-precision NVFP4チェックポイントのロード対応、Gemma4のK=V層でW4A8チェックポイントロード対応、MARLIN MoE + MTP + attention DP/EP対応、KVキャッシュ圧縮のランタイム統合、MiniMax-M3のMSAスパースattentionバックエンド追加。

## 量子化関連の変更点
- 新規対応: DeepSeek-V4 mixed-precision NVFP4 checkpoint ロード(#16433)、**Gemma4 K=V層のW4A8 checkpoint ロード**(#16797)
- MARLIN MoEをMTP + attention DP/EPで対応(#16597)、rejection samplingをattention DP下で対応(#16544)
- KVキャッシュ圧縮のランタイム統合(#15697)、per-conversation KV block再利用(#16115)、起動時のKV cache stats出力(#12596)

## 影響範囲
- ユーザ視点: DeepSeek-V4のNVFP4配信とGemma4のW4A8が公式パスに載る。MiniMax-M3のsparse attention/disagg対応で長文脈MoEの配備幅拡大
- 既知不具合: DeepSeek-R1 NVFP4 multi-GPU(PP4+MTP)がGB300でクラッシュ、Gemma3-1B FP8+torch.compileがCUDA graph captureで失敗する等の注記あり

## 注目度コメント
**focus直撃**: Gemma4(focus model)のW4A8とNVFP4(focus method)が同一リリースで前進。trtllm-ready付与。DeepSeek-V4 NVFP4も評価対象候補。議題候補。
