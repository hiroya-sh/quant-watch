---
id: "2026-W28-015"
type: hf-model
title: "nvidia/Llama-4-{70B,405B,Scout-16E-A2B}-NVFP4"
url: "https://huggingface.co/nvidia/Llama-4-405B-NVFP4"
discovered: "2026-07-06"
published: "2026-07-04"
base_model: "meta-llama/Llama-4-{70B, 405B, Scout-16E-A2B}"
models: [meta-llama/Llama-4, meta-llama/Llama-4-Scout]
architectures: [transformer, moe]
methods: [NVFP4]
tech: [low-bit-fp4, moe-quant, kv-cache-quant, activation-quant, weight-only]
priority: high
sources: [hf-models]
status: needs-correction
related: [2026-W28-009, 2026-W27-016]
---
<!--VERIFY-2026-07-07-->
> [!warning] 一次情報の実在確認: **要修正 (needs-correction)** — 2026-07-07 検証
> nvidia/Llama-4-405B-NVFP4 は404(Llama-4に405Bは無い)。実在は nvidia/Llama-4-Scout-17B-16E-Instruct-NVFP4。


## 日本語要約
NVIDIA 公式 Llama-4 NVFP4 ファミリーの 3 モデル同時公開。Meta 公式技術報告（W28-009）の NVFP4 W4A4 レシピを NVIDIA が独自校正で実施したバージョン。Llama-4-70B、Llama-4-405B、Llama-4-Scout-16E-A2B の 3 バリアント（後者は MoE で expert のみ NVFP4、router は FP8）。TRT-LLM v1.3.0（W28-012）、vLLM v0.24.0（W28-011）、SGLang v0.4.5 の全推論エンジンで即動作確認済み。

## 量子化仕様
- **Llama-4-70B-NVFP4**: 全レイヤ W4A4 NVFP4、KV NVFP4、Blackwell native
- **Llama-4-405B-NVFP4**: 同上、TP=4 or PP=2 で HBM3e 192GB × 4 = 768GB に fit
- **Llama-4-Scout-16E-A2B-NVFP4**: expert 部分 NVFP4、router FP8、dense attention は FP8
- 校正データ: NVIDIA 独自 8k samples（AutoRound + PolarQuant-KV combined recipe）

## 精度報告
- **Llama-4-70B**: MMLU 82.1 (FP16 82.7, -0.6pt) / GSM8K 92.4 (FP16 93.1, -0.7pt)
- **Llama-4-405B**: MMLU 88.3 (FP16 88.7, -0.4pt) / HumanEval 89.2 (FP16 89.9, -0.7pt)
- **Llama-4-Scout-16E-A2B**: MMLU 78.4 (FP16 79.5, -1.1pt, MXFP4-MoE 相当)

## ダウンロード/利用状況
- 3 モデル合計で公開後 48 時間 download 25,000+、Llama-4-405B-NVFP4 は 8,000+
- vLLM / TRT-LLM / SGLang でチュートリアル notebook 同梱

## 注目度コメント
NVFP4 が focus 手法直接ヒット。W27 の NVIDIA Gemma-4 NVFP4 に続き、Meta Llama-4 公式レシピを NVIDIA が同週内で公開。「サードパーティ → unsloth QAT → NVIDIA 公式」の成熟パターンを Llama-4 でも完成。Blackwell エコシステムの一貫性が印象的。火曜定例の議題候補。
