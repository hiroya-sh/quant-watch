---
id: "2026-W27-008"
type: paper
title: "NF5: An Information-Theoretic Extension of NF4 to 5-bit Normal-Float for High-Fidelity QLoRA"
url: "https://arxiv.org/abs/2606.25776"
discovered: "2026-06-29"
published: "2026-06-26"
authors: [Tim Dettmers, Younes Belkada, Sourab Mangrulkar]
venue: "arxiv"
affiliation: "University of Washington / Hugging Face"
models: [meta-llama/Llama-3.3]
architectures: [transformer]
methods: [NF4, bitsandbytes]
tech: [low-bit-4, weight-only, ptq]
priority: watching
sources: [arxiv]
status: new
related: []
---

## 日本語要約
NF4（QLoRA で標準採用）の 5-bit 拡張 NF5 を提案する短い技術ノート（6ページ）。正規分布の累積分布関数を 5-bit に等密度分割し、Fisher 情報量で最適化。WikiText2 PPL を NF4 比 -0.18、INT5 比 -0.03 と僅差改善するが、ハードウェア native サポートがなく実用性は要検討。bitsandbytes v0.46 に試験実装が含まれる。

## 手法
- 標準正規分布 CDF の 5-bit 等密度量子化テーブル
- bitsandbytes へのテーブル組込み（カーネル変更なし、dequant 経路のみ拡張）

## 評価
- WikiText2 PPL: Llama-3.3-70B で NF4 比 -0.18 改善
- メモリ: 32-bit baseline 比 6.2x 削減（NF4 は 7.8x なので圧縮率は劣る）

## 既存手法との差分
- NF4 と INT5 の中間的存在。ハードウェア native サポートがない点で MXFP4/NVFP4 ほど実用性高くない
- QLoRA 系の精度マージン重視ユーザ向け（fine-tune 受託サービス）

## 注目度コメント
focus 直接ヒットなし、情報量も限定的なため watching。bitsandbytes 系の継続改善として記録のみ。NF4 が広く普及した中での 5-bit 拡張という意味では将来 NVFP4/MXFP6 の比較対象として参照される可能性。
