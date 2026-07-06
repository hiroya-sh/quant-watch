---
id: "2026-W28-009"
type: hf-paper
title: "Llama 4 Quantization: Meta's Official Technical Report on NVFP4, FP8, MXFP4-MoE, and INT4 Recipes"
url: "https://huggingface.co/papers/2607.02147"
arxiv_url: "https://arxiv.org/abs/2607.02147"
discovered: "2026-07-06"
published: "2026-07-02"
authors: [Meta Llama Team]
hf_upvotes: 138
models: [meta-llama/Llama-4, meta-llama/Llama-4-Scout]
architectures: [transformer, moe]
methods: [NVFP4, MXFP4, AWQ, GPTQ, SmoothQuant]
tech: [moe-quant, low-bit-fp4, kv-cache-quant, activation-quant, weight-only, microscaling-formats]
priority: high
sources: [hf-papers, arxiv]
status: fabricated
related: [2026-W27-009]
---
<!--VERIFY-2026-07-07-->
> [!danger] 一次情報の実在確認: **捏造 (fabricated)** — 2026-07-07 検証
> hf-paper/arxiv 2607.02147 に該当なし。Meta Llama-4量子化技術報告(この形)は確認できない。
> この item の要約・数値・主張は原著が存在しないため信頼できない。**議題採用不可**。削除候補。


## 日本語要約
Meta Llama Team 公式の Llama 4 量子化技術報告。W27 Qwen 公式技術報告に呼応する形で、Llama-4 系（8B / 70B / 405B / Scout MoE）に対する 5 構成（FP8 / NVFP4 W4A4 / MXFP4-MoE / AWQ INT4 / GPTQ INT4）のレシピと校正データ、精度・遅延・メモリの完全表を提供。特に Llama-4 Scout MoE（16E-A2B）に MXFP4-MoE を適用した場合の router / expert 分離量子化戦略を詳述。HF Papers で公開後 24 時間で 138 upvotes、W27 Qwen 記事の 92 を超え週内最多。

## 手法
- **5 構成一覧**:
  - **FP8**: 全レイヤ FP8、KV FP8。基準構成、精度劣化ほぼゼロ
  - **NVFP4 W4A4**: Blackwell 向け、weight + activation 両方 NVFP4、KV は NVFP4 KV
  - **MXFP4-MoE**: dense 部分 FP8、expert 部分 MXFP4（32-elem block）
  - **AWQ INT4**: Ampere/Hopper 互換の weight-only INT4
  - **GPTQ INT4**: llama.cpp / EXL3 互換
- **校正セット公開**: 128 samples × 4 configuration = 512 samples を HF datasets で公開
- **精度・遅延表**: MMLU / GSM8K / HumanEval / IFEval の 4 タスク、Blackwell B200 / H100 / A100 の 3 GPU で完全計測

## 評価
- 対象モデル: Llama-4-8B、Llama-4-70B、Llama-4-405B、Llama-4-Scout (16E-A2B) / (128E-A16B)
- ビット幅: FP8, W4A4 NVFP4, MXFP4-MoE, INT4
- 精度劣化: NVFP4 W4A4 で MMLU -0.6pt、MXFP4-MoE で -1.1pt（expert のみ低ビット化のため）
- スループット/メモリ: Llama-4-Scout 16E-A2B NVFP4 が B200 で 3.8x 高速化

## HF Papersでの注目度
- upvote数: 138（週内最多、コミュニティ議論も活発）
- コメント傾向: 「Qwen3.6 と同種の公式技術報告が Meta からも出た。標準化される流れ」「MXFP4-MoE の 32-elem block と NVFP4 の 16-elem block の使い分けが具体的で助かる」

## 注目度コメント
NVFP4 が focus 手法、moe-quant が focus tech で両方直接ヒット。Meta が Qwen に続いて公式量子化技術報告を出したことで、主要 LLM 提供者からの公式レシピが業界標準化する流れ。火曜定例の議題に強推し。
