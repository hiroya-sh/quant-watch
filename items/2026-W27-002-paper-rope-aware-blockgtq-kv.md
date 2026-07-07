---
id: "2026-W27-002"
type: paper
title: "RoPE-Aware Bit Allocation for KV-Cache Quantization"
url: "https://arxiv.org/abs/2606.24033"
discovered: "2026-07-07"
published: "2026-06-23"
authors: [Fengfeng Liang, Yuechen Zhang, Jiaya Jia]
venue: "arxiv"
affiliation: "JIA-Lab (Jiaya Jia group) — code: github.com/JIA-Lab-research/blockgtq"
models: [meta-llama/Llama-3.1, deepseek-ai/DeepSeek-R1, Qwen/Qwen2.5]
architectures: [transformer]
methods: [TurboQuant]
tech: [kv-cache-quant, rotation, mixed-precision, pre-rope-quant, long-context-quant, ptq]
priority: high
sources: [arxiv]
status: new
verified: "2026-07-07 arxiv abs 実在確認・abstract読了・code URL確認"
related: [2026-W26-003]
---

## 日本語要約
**TurboQuant-MSE (TQ-MSE) 上に構築した RoPE 対応の Key-cache ビット割当手法 Block-GTQ**。key-cache 量子化を block 単位のビット割当問題として定式化：RoPE 下では key の logit 寄与が「位置依存の 2D 周波数ブロック」に分解できるため、高エネルギーのブロックに多くのビットを割く。ラベル不要のエネルギースコアを RoPE ブロックごとに計算し、整数ビット幅を貪欲に割当てる。**focus の TurboQuant 系譜 かつ kv-cache-quant に直撃**。

## 手法（abstract より）
- TQ-MSE（TurboQuant の MSE 版）をベースに、RoPE ブロック単位でビット割当
- label-free の per-block energy score → greedy な整数ビット割当

## 評価（論文主張値・すべて abstract 記載）
- K-only 2–3 b/dim で per-layer MAE を 32–80% 削減、uniform TQ-MSE 比 367/367 層で勝利
- Llama-3.1-8B-Instruct, K2V2: 6タスク NIAH 平均 70.6→97.4、LongBench-EN 36.87→53.31
- DeepSeek-R1-Distill-Qwen-7B, K3V2: AIME 2024/2025 = 51.7/37.5（fp16 54.2/37.9、uniform TQ-MSE は 0.0/0.0 に崩壊）
- Qwen2.5-3B-Instruct, packed K3V3: KV 3.24x 圧縮、128K で fp16 FlashAttention2 比 1.34x 高速、peak mem 56.31→19.85 GB

## 既存手法との差分
- uniform ビット幅の TQ-MSE に対し、RoPE 由来の周波数構造に応じた非一様ビット割当を追加
- W26 [[items/2026-W26-003-paper-ultraquant-4bit-kv-agents|UltraQuant]] と同じ TurboQuant 系譜だが、こちらは「回転」ではなく「割当」で精度を稼ぐ

## 注目度コメント
focus の TurboQuant / kv-cache-quant の両方に直撃、公開コードあり（github.com/JIA-Lab-research/blockgtq）。火曜定例の議題候補。数値は abstract 主張のため、採用検討時は本文・コードで裏取り推奨。
