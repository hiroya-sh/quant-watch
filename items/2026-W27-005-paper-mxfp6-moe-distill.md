---
id: "2026-W27-005"
type: paper
title: "MXFP6-MoE: Microscaling FP6 Distillation-Aware Quantization for Sparse Mixture-of-Experts"
url: "https://arxiv.org/abs/2606.24008"
discovered: "2026-06-29"
published: "2026-06-22"
authors: [Maya Iyer, Junjie Zhu, Ahmad Faraz, Sergey Edunov, Pavel Tovkach, Tianle Cai]
venue: "arxiv"
affiliation: "AMD MI Research / Princeton"
models: [Qwen/Qwen3.5, deepseek-ai/DeepSeek-V4, moonshotai/Kimi-K2.6]
architectures: [transformer, moe]
methods: [MXFP6, MXFP4, CKA-QAD]
tech: [moe-quant, microscaling-formats, low-bit-fp6, qat, calibration]
priority: normal
sources: [arxiv]
status: new
related: [2026-W26-001, 2026-W26-005]
---

## 日本語要約
MXFP6（E3M2 / E2M3 マイクロスケーリング）を MoE 重みに適用する蒸留型 QAT。Active experts のみが per-token に呼び出される MoE の特性を活用し、エキスパートの呼び出し頻度に応じた calibration token 数を動的調整。BF16 教師から MXFP6 生徒への CKA（Centered Kernel Alignment）蒸留損失で表現幾何を保全し、Qwen3.5-32B MoE / DeepSeek-V4-Pro / Kimi-K2.6 で BF16 比 -0.5pt 以内（MMLU/GSM8K）。FP4 (MXFP4) と FP8 の中間帯として精度マージン重視の用途に位置づけ。

## 手法
- **動的 calibration バジェット**: エキスパート呼び出し頻度に応じて 1K-100K token を割当（lazy expert にも最低 1K）
- **CKA 蒸留**: W24 CKA-QAD の表現幾何保全をエキスパート単位に拡張
- **MXFP6 群スケール**: 32-element ブロックの E8M0 共有スケール（OCP MX 規格準拠）
- **Active-only optimizer step**: backward は activated experts のみ更新、計算コストを 1/8 程度に削減

## 評価
- 対象モデル: Qwen3.5-32B MoE、DeepSeek-V4-Pro、Kimi-K2.6
- ビット幅: 全層 MXFP6（重み）+ BF16 activation
- 精度劣化: MMLU -0.32 / GSM8K -0.51 / HumanEval -0.8（BF16比）
- スループット/メモリ: メモリ 2.5x 削減、TRT-LLM v1.3rc19 で decode +18%
- QAT コスト: MI300X×16 で 38 時間

## 既存手法との差分
- **W26 MODE / W27 DeltaQuant** が混合精度（ビット幅をエキスパート別）なのに対し、MXFP6-MoE は全層単一ビット幅で簡素化
- **W24 CKA-QAD** の CKA 蒸留を MoE 適用化
- **MXFP4** との比較で「精度マージン+50%、メモリ削減率 -33%」のスイートスポット

## 注目度コメント
moe-quant が focus、microscaling-formats / MXFP6 が taxonomy 登録済。NVFP4 ラッシュの中で「FP6 は妥協ではなく精度マージン重視の選択肢」というポジショニングを明確化。AMD MI Research 主導という点で AMD ROCm エコシステム拡張の文脈にも接続。
