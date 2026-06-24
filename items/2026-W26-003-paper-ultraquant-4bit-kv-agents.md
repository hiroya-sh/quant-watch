---
id: "2026-W26-003"
type: paper
title: "UltraQuant: 4-bit KV Caching for Context-Heavy Agents"
url: "https://arxiv.org/abs/2606.20474"
discovered: "2026-06-22"
published: "2026-06-18"
authors: [Inesh Chakrabarti, David Limpus, Aditi Ghai Rana, Bowen Bao, Spandan Tiwari, Thiago Crepaldi, Ashish Sirasao]
venue: "arxiv"
affiliation: "Advanced Micro Devices (AMD) / UCLA / Purdue"
models: []
architectures: [transformer]
methods: [TurboQuant, QJL]
tech: [kv-cache-quant, low-bit-fp4, low-bit-4, rotation, per-token, long-context-quant]
priority: high
sources: [arxiv]
status: new
related: []
---

## 日本語要約
長文脈マルチターンエージェントシナリオ向けの4-bit KVキャッシュ量子化手法。TurboQuant-style Walsh-Hadamard回転をベースとしつつ、エージェント特化の設計選択（K/V非対称処理・QJL削除・ブロックスケール変種）を組み合わせ、AMD GPU向けにFP4 KVテンソル（UE8M0グループスケール・CDNA4のscaled-MFMAネイティブサポート）でカーネルを最適化。キャッシュ圧迫ラウンドでP50 TTFT 3.47倍削減・全ラウンド平均2.3倍削減・出力スループット1.63倍（FP8 KVベース比）を実現。

## 手法
- **Walsh-Hadamard回転**: TurboQuant系の回転変換でKVアウトライア抑制
- **QJL削除**: 実用上のオーバーヘッドが精度向上を上回ると判断し採用しない
- **K/V非対称処理**: KとVの統計的分布差を活かした個別量子化設計
- **FP4 KVテンソル**: AMD CDNA4アーキテクチャのscaled-MFMAでネイティブFP4演算
- **UE8M0グループスケール**: ブロックスケールにE8M0形式を採用

## 評価
- 長文脈マルチターンエージェントシナリオで評価
- P50 TTFT削減: キャッシュ圧迫ラウンドで3.47倍、全ラウンド平均2.3倍
- 出力スループット1.63倍（FP8 KVベースライン比）
- AMD CDNA4 GPUで実装・検証

## 既存手法との差分
TurboQuantの手法をベースとしながら「何を削除するか（QJLを外す）」「AMD FP4 HWに最適化する」という実装判断が新規。エージェント特有の非均一アクセスパターン（後半ラウンドほどキャッシュ圧迫増大）に特化した評価フレームワークを提供。

## 注目度コメント
kv-cache-quantとTurboQuant/QJLがfocus。W24-W25の流れ（KVarN→ReasonAlloc→UltraQuant）でKV量子化の実用化研究が継続。AMD GPU向け実装として、NVIDIA Blackwell対抗のROCm FP4エコシステムとも接続する。「QJLを外した」判断は設計空間の整理として議論価値あり。
