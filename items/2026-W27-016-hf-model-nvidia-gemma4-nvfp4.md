---
id: "2026-W27-016"
type: hf-model
title: "nvidia/Gemma-4-31B-NVFP4 + nvidia/Gemma-4-12B-NVFP4 + nvidia/Gemma-4-26B-A4B-NVFP4"
url: "https://huggingface.co/nvidia/Gemma-4-31B-NVFP4"
discovered: "2026-06-29"
published: "2026-06-26"
base_model: "google/gemma-4-31B"
models: [google/gemma-4]
architectures: [transformer, moe]
methods: [NVFP4]
tech: [low-bit-fp4, weight-only, activation-quant, moe-quant]
priority: high
sources: [hf-models]
status: needs-correction
model_ids:
  - "nvidia/Gemma-4-31B-NVFP4"
  - "nvidia/Gemma-4-12B-NVFP4"
  - "nvidia/Gemma-4-26B-A4B-NVFP4"
related: [2026-W22-012, 2026-W25-018]
---
<!--VERIFY-2026-07-07-->
> [!warning] 一次情報の実在確認: **要修正 (needs-correction)** — 2026-07-07 検証
> モデルURLは nvidia/Gemma-4-31B-IT-NVFP4 が正(現状は '-IT-' 欠落)。モデル自体は実在。


## 日本語要約
NVIDIA 公式の Gemma 4 ファミリー NVFP4 量子化が登場。31B（dense）/ 12B（dense）/ 26B-A4B（MoE）の 3 種を同日リリース。W22-W26 で focus 該当ゼロだった Gemma 4 が NVIDIA 公式 NVFP4 として揃った形。MMLU 劣化 -1.1pt（31B）、-0.8pt（12B）、-1.6pt（26B-A4B）。Blackwell B200 で decode 2.8x（BF16比）。

## モデル情報
- **ベースモデル**: google/gemma-4-31B / gemma-4-12B / gemma-4-26B-A4B-it
- **アーキテクチャ**: transformer（dense 2 種）、transformer+MoE（26B-A4B）
- **コンテキスト長**: 128K
- **訓練データ**: Gemma 4 公式 + NVFP4 校正用 1M token

## 量子化バリアント
- **重み**: NVFP4（E2M1 + per-block FP8 scale）
- **活性化**: NVFP4 dynamic per-token
- **KV cache**: NVFP4（TRT-LLM v1.3.0rc19 の NVFP4 KV ネイティブカーネルと連携）
- **対応エンジン**: TRT-LLM v1.3rc19 以降、vLLM v0.23.1 以降
- **License**: Gemma Terms of Use（NVIDIA は推論パス追加のみ）

## 精度報告
| モデル | ベンチ | BF16 | NVFP4 | Δ |
|---|---|---|---|---|
| 31B | MMLU | 79.3 | 78.2 | -1.1 |
| 31B | GSM8K | 86.4 | 84.7 | -1.7 |
| 12B | MMLU | 72.8 | 72.0 | -0.8 |
| 26B-A4B | MMLU | 78.1 | 76.5 | -1.6 |
| 26B-A4B | ChartQA | 81.2 | 79.6 | -1.6 |

## ダウンロード/利用状況
- リリース直後 24 時間で 8.4K downloads（31B）、3.2K（12B）、5.1K（26B-A4B）
- NVIDIA TRT-LLM v1.3.0rc19 のリファレンス checkpoint として参照
- W22 tgmerritt/gemma-4-26B-A4B-it-MXFP8W8A8（サードパーティ MXFP8）→ W25 unsloth/gemma-4 QAT GGUF → W27 NVIDIA 公式 NVFP4 という段階的成熟

## 注目度コメント
google/gemma-4 が focus、NVFP4 が focus に直接ヒット。W26 で focus 該当ゼロだった Gemma 4 が NVIDIA 公式 NVFP4 で復活。W22 のサードパーティ → W25 unsloth QAT → W27 NVIDIA 公式という標準パターン。火曜定例の議題候補。
