---
id: "2026-W47-011"
type: hf-model
title: "Kimi-K3.1-Pro quantization wave (nvidia NVFP4 公式 + GGUF)"
url: "https://huggingface.co/nvidia/Kimi-K3.1-Pro-NVFP4"
discovered: "2026-11-16"
published: "2026-11-11"
base_model: "moonshotai/Kimi-K3.1-Pro"
models: [moonshotai/Kimi-K2.7]
architectures: [moe]
methods: [NVFP4, GGUF]
tech: [weight-only, low-bit-fp4, moe-quant, vllm-ready, llamacpp-ready, trtllm-ready]
priority: high
sources: [hf-models]
status: new
related: [2026-W47-009-github-llamacpp-v100]
---

## 日本語要約
新モデル **Kimi-K3.1-Pro** (K3 の MLA layers を DSA に置換) の量子化配布が公開初週に揃う。**nvidia/Kimi-K3.1-Pro-NVFP4**(906 DL / 23 ❤, 11-11)が NVIDIA 公式 NVFP4 として先頭、KarLexAI/Kimi-K3.1-Pro-GGUF(7576 DL, 11-09)が GGUF 代表。llama.cpp v1.0.0 の #31779 で text architecture が追加、GGUF は llama.cpp v1.0.0 以降でロード可能。

## 量子化仕様
- **nvidia/Kimi-K3.1-Pro-NVFP4**(公式, 2026-11-11): NVFP4 (E2M1, group=16) + FP8 KV cache。TRT-LLM / vLLM 想定。
- **KarLexAI/Kimi-K3.1-Pro-GGUF**(2026-11-09, 7576 DL / 8 ❤): llama.cpp v1.0.0 対応 GGUF、複数 ftype。
- その他コミュニティ 4 本(wrldsuksgo2mars, manifoldlabs, local-inference-lab 等)。
- ベースモデル: moonshotai/Kimi-K3.1-Pro(未 taxonomy、Kimi-K2.7 / K3 系統)

## 精度報告
- NVIDIA 公式配布ゆえ eval は model card 掲載予定(11-16 時点ではベンチ詳細は card 上で確認要)。
- GGUF 側はコミュニティベンチ(KarLexAI model card 参照)。

## ダウンロード/利用状況
- 合計 7 モデル、約 8562 DL(wave 全体)。
- 配布分布: GGUF 系が DL 大半、NVFP4 公式は like 比率高(23/906 = 2.5%)。

## 注目度コメント
**モデル公開→公式 NVFP4 配布が同週内**という W36 / W45 で観察された「量子化配布リードタイムほぼゼロ」パターンの継続。Kimi 系は K2.7 → K3 → K3.1-Pro と taxonomy 更新が追いつかなくなっており、`moonshotai/Kimi-K3.1-Pro` を taxonomy 候補に追加すべき。DSA を導入した **MLA → DSA 置換**は GLM-5.2/5.3 でも起きていた動きで、KV 量子化の難化(W46 の NVFP4 KV 既知バグ事件)と対応している。
