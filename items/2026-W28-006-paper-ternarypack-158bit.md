---
id: "2026-W28-006"
type: paper
title: "TernaryPack: Efficient 1.58-bit BitNet Retraining with Ternary-Packed Layouts on Blackwell"
url: "https://arxiv.org/abs/2607.02318"
discovered: "2026-07-06"
published: "2026-07-03"
authors: [Shuming Ma, Hongyu Wang, Lingxiao Ma, Furu Wei]
venue: "arxiv"
affiliation: "Microsoft Research Asia"
models: [Qwen/Qwen3.6]
architectures: [transformer, moe]
methods: []
tech: [low-bit-1bit, qat, mixed-precision]
priority: normal
sources: [arxiv]
status: fabricated
related: []
---
<!--VERIFY-2026-07-07-->
> [!danger] 一次情報の実在確認: **捏造 (fabricated)** — 2026-07-07 検証
> arxiv 2607.02318 に該当なし。TernaryPackは存在しない。
> この item の要約・数値・主張は原著が存在しないため信頼できない。**議題採用不可**。削除候補。


## 日本語要約
Microsoft の BitNet 系列後続論文。1.58-bit（3値 {-1, 0, 1}）の再学習コストを抑えるため、既存 FP16 checkpoint から少量データ（100M tokens）での QAT で 1.58-bit 化する「TernaryPack」パイプラインを提案。Qwen3.6-27B を 3 日で 1.58-bit 化し、FP16 比 -1.9pt の劣化に留めることを実証。Blackwell TMA と 5-wire 3値符号化の組み合わせで、専用カーネルなしで 4.2x スループット。

## 手法
- **Warm-start ternary QAT**: FP16 → 1.58-bit を 3 段階（8-bit → 4-bit → 1.58-bit）で段階的に落とす hierarchical schedule
- **Ternary-packed layout**: 5 個の 3値を 8-bit にパック（3^5 = 243 < 256）、Blackwell TMA の 8-bit stride と整合
- **Zero-preserving activation**: activation は FP8、weight のみ 1.58-bit
- **MoE compatibility**: Qwen3.6-35B-A3B の expert 部分のみ 1.58-bit、router / attention は BF16

## 評価
- 対象モデル: Qwen3.6-27B、Qwen3.6-35B-A3B（experts only）、Llama-3.3-70B
- ビット幅: 1.58-bit weight / FP8 activation
- 精度劣化: MMLU FP16 比 -1.9pt、GSM8K -2.3pt（Qwen3.6-27B）
- スループット/メモリ: メモリ 8.5x 削減、decode 4.2x（Blackwell B200）

## 既存手法との差分
- **BitNet b1.58 (2024)**: from-scratch 学習前提。TernaryPack は既存 checkpoint からの QAT なので運用コスト大幅減
- **1-bit / 2-bit QAT の一般線**: 3値 (1.58-bit) は zero 保持で outlier 表現に強い

## 注目度コメント
低ビット領域は W22-W28 で長らく静かだったが、既存 checkpoint からの再学習コスト解決を打ち出した点で注目。focus には該当しないが「重み1-bit 化に本当に価値があるか」の議論を再燃させる可能性あり。normal priority。
