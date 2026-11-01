---
id: "2026-W45-018"
type: github
subtype: library
title: "sgl-project/sglang: v0.5.22"
url: "https://github.com/sgl-project/sglang/releases/tag/v0.5.22"
discovered: "2026-11-02"
published: "2026-10-19"
repo: "sgl-project/sglang"
release_tag: "v0.5.22"
models: []
architectures: ["transformer", "mamba", "mamba2", "gla", "hybrid", "moe", "dense", "lfm"]
methods: ["NVFP4", "MXFP4", "MXFP8", "GGUF", "MoNe"]
tech: ["activation-quant", "paged-attention"]
priority: high
sources: [github]
status: new
related: []
---

## 日本語要約

SGLang 大規模リリース(**950 PRs / 245 contributors**)。新モデル **Clef / PPLX-Decider v1 / EmbeddingGemma 2 / HunyuanImage-3 / Kandinsky 6**。量子化側は **DeepSeek-V4.1 を H200 で 2.3x スループット**、Qwen3.8-Flash-Next **B200 で 12% 高速**、GLM-5.3-Flash **B300 で 10% 高速**。**Qwen3.8-Flash-Next の QSA indexer で FP8(e4m3) キャッシュ(#39614)**、**FP8 KV のプリフィクス valid-commit 融合カーネル(B200 で 2.99x 高速、#40785)**、**GLM-5.3-Flash の Q8KV8 FP8 Sparse Prefill(DSA 層ごとに TileLang 比 1.53-1.72x 高速、#41790)**、**DeepSeek-V4.1 の mxfp8 dispatch cache(#42156)**。SGLang が **Apple Silicon の標準 PyTorch バックエンドでも動作**するようになり、MLX と選択可能。

## 量子化関連の変更点

- 新規対応: Clef / PPLX-Decider v1 / EmbeddingGemma 2 新モデル量子化パス
- **FP8 KV**: Qwen3.8-Flash-Next QSA indexer に FP8(e4m3) 保存 #39614、JIT FP8 KV + prefix-valid commit 融合カーネル(B200で 2.99x) #40785、MLA KV/Q に native SATFINITE FP8 変換 #42659、DSA TileLang FP8 KV CUDA サポート #42957
- **NVFP4**: compressed-tensors NVFP4 Hopper 修正 #40022、ModelOpt NVFP4 auto backend ルーティング #41765、DeepSeek NVFP4 shared-expert fusion を LoRA/FP4 で guard #42203
- **MXFP8**: DeepSeek-V4.1 mxfp8 dispatch cache #42156
- **DSA Sparse Prefill**: GLM-5.3-Flash Q8KV8 FP8 Sparse Prefill(DSA 層ごと TileLang 比 1.53-1.72x) #41790
- **性能全般**: InstantTensor ロードで 10x 高速化 #40453、PD disaggregation で 27% スループット向上 / p95 TTFT 半減 #40703、Apple Silicon PyTorch バックエンド追加 #36780

## 影響範囲

- 既存ユーザ: **Python 3.11 以上必須**。Qwen3.8-Flash-Next の QSA indexer は FP8(e4m3) キャッシュをオプトインで有効化。Apple Silicon ユーザは MLX か PyTorch のどちらを使うか選択可。
- API 変更: KV cache 周辺の `--kv-cache-dtype` / DSA 設定キーに新規追加あり。
- 検証インパクト: W43 時点の DeepSeek-V4.1 ベンチ(sglang 0.5.21 以下)は再取得推奨 — H200/MI350X で 2x 以上の変動が入る。

## リリースノート抜粋

```
# Highlights

*950 PRs from 245 contributors.*

## New models

| Model | Type | Cookbook |
|---|---|---|
| Clef / Clef Flash | LLM / VLM | [link](https://docs.sglang.io/cookbook/autoregressive/Cloudflare/clef) |
| PPLX-Decider v1 / v1.1 | LLM / VLM | [link](https://docs.sglang.io/cookbook/autoregressive/Perplexity/PPLX-Decider-v1.1-27B) |
| EmbeddingGemma 2 | LLM / VLM | [link](https://docs.sglang.io/cookbook/autoregressive/Google/EmbeddingGemma2) |
| LLaDA2.2 | LLM / VLM | |
| HunyuanImage-3.0-Instruct | Diffusion | [link](https://docs.sglang.io/cookbook/diffusion/Tencent/HunyuanImage3) |
| Kandinsky 6 / Kandinsky 6 SR | Diffusion | [link](https://docs.sglang.io/cookbook/diffusion/Kandinsky/Kandinsky6) |
| Wan-Animate-2 | Diffusion | [link](https://docs.sglang.io/cookbook/diffusion/Wan/Wan-Animate-2) |
| SANA-Video 2.0 | Diffusion | [link](https://docs.sglang.io/cookbook/diffusion/SANA-Video/SANA-Video) |
| LLaDA-Image / LLaDA-Image-Turbo | Diffusion | |

## What's new

* DeepSeek-V4.1 gets up to 2.3x more throughput per GPU on H200, and now runs on AMD MI350X / MI355X with up to 1.9x throughput from DSpark ([#41251](https://github.com/sgl-project/sglang/pull/41251), [#41308](https://github.com/sgl-project/sglang/pull/41308)).
* Qwen3.8-Flash-Next decodes 12% faster on B200, and GLM-5.3-Flash with DFlash 10% faster on B300 ([#42175](https://github.com/sgl-project/sglang/pull/42175), [#42489](https://github.com/sgl-project/sglang/pull/42489)).
* MiMo-V2.6-Pro gets 1.85x decode throughput with DFlash on B300 ([#41886](https://github.com/sgl-project/sglang/pull/41886)).
* Models load 10x faster with the new InstantTensor loader ([#40453](https://github.com/sgl-project/sglang/pull/40453)).
* PD disaggregation gets up to 27% more throughput and half the p95 TTFT on long-prompt workloads ([#40703](https://github.com/sgl-project/sglang/pull/40703)).
* HiSparse now supports EAGLE and MTP for long-context serving with the KV cache in CPU memory ([#37771](https://github.com/sgl-project/sglang/pull/37771)).
* GLM-5.2 and GLM-5.3 can now combine decode context parallelism with MTP, with up to 2.1x faster decoding on GLM-5.3 ([#43735](https://github.com/sgl-project/sglang/pull/43735)).
* SGLang now runs on Apple Silicon Macs with the standard PyTorch backend, alongside MLX ([#36780](https://github.com/sgl-project/sglang/pull/36780)).
* MiniMax-H3 and Qwen-Image 2.1 now run in ComfyUI with SGLang Diffusion, which also loads community GGUF ch...
```

## 注目度コメント

**HIGH** — focus method NVFP4 にマッチ。火曜定例の議題候補。
