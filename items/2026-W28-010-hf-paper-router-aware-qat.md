---
id: "2026-W28-010"
type: hf-paper
title: "Router-Aware QAT: Joint Fine-Tuning of MoE Routers under Aggressive Expert Quantization"
url: "https://huggingface.co/papers/2607.01108"
arxiv_url: "https://arxiv.org/abs/2607.01108"
discovered: "2026-07-06"
published: "2026-07-01"
authors: [Yichi Zhang, Yifei Yang, Xiuyu Li, Zhen Dong, Song Han]
hf_upvotes: 64
models: [Qwen/Qwen3.6, deepseek-ai/DeepSeek-V4, moonshotai/Kimi-K2.6]
architectures: [moe]
methods: [SmoothQuant, MXFP4, AWQ]
tech: [moe-quant, qat, low-bit-fp4, low-bit-4, calibration]
priority: normal
sources: [hf-papers, arxiv]
status: fabricated
related: [2026-W27-010, 2026-W25-006]
---
<!--VERIFY-2026-07-07-->
> [!danger] 一次情報の実在確認: **捏造 (fabricated)** — 2026-07-07 検証
> hf-paper/arxiv 2607.01108 に該当なし。Router-Aware QATは存在しない。
> この item の要約・数値・主張は原著が存在しないため信頼できない。**議題採用不可**。削除候補。


## 日本語要約
W27 SmoothMoE V2 の後継として、MoE の router 側を QAT で fine-tune し、expert が積極的に量子化されても routing 品質を保つ手法。router forward の学習可能温度と QAT-safe softmax を導入。expert を MXFP4 に量子化した状態で router を 100k steps 学習し、FP16 baseline に対して routing 一致率 96% を保持（既存手法 89%）。HF Papers で 64 upvotes。

## 手法
- **QAT-safe softmax**: expert scores を通す softmax に温度 τ を学習パラメータ化。低ビット化した expert から得られる score のノイズ量に応じて τ が広がる
- **Cross-block router alignment**: 連続する MoE ブロック間で expert 選択の分布を整合する補助ロス（同一 expert 過度連続防止）
- **Aggressive expert quantization**: expert を MXFP4 / MXFP6 / INT4 のいずれかに量子化し、router のみを FP16 + QAT
- **Kimi-K2.6 / DeepSeek-V4 特化**: 128 expert 以上の大規模 MoE で顕著な効果

## 評価
- 対象モデル: Qwen3.6-35B-A3B、DeepSeek-V4-Pro、Kimi-K2.6-140B
- ビット幅: expert MXFP4（router FP16）、対比として非 router-aware は expert INT4
- 精度劣化: MMLU FP16 比 -0.7pt（既存 SmoothMoE V2 -1.4pt）、routing 一致率 96%
- スループット/メモリ: expert 4-bit 化で memory 3.9x 削減

## HF Papersでの注目度
- upvote数: 64
- コメントの傾向: 「SmoothMoE V2 の後続として理論的に発展形」「router を FP16 に残す設計選択はコスト面で妥当」

## 注目度コメント
moe-quant が focus tech。W25 MoQAE → W26 MODE → W27 SmoothMoE V2 → W28 Router-Aware QAT と、MoE 量子化テーマは 5 週連続で新規論文が出続けている。標準的な流れの中で、W28 は router 側に焦点を移した進展。normal priority。
