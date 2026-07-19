---
id: "2026-W30-016"
type: paper
title: "ExaGEMM: Exploration Framework for CPU-Driven ML Inference via Associative In-Register Computing for Low-Bit GEMM"
url: "https://arxiv.org/abs/2607.14622"
discovered: "2026-07-20"
published: "2026-07-16"
authors: []
venue: "arXiv (cs.AR, cs.LG, cs.OS)"
models: []
architectures: []
methods: []
tech: [low-bit-4, low-bit-2, low-bit-1bit]
priority: watching
sources: [arxiv]
status: new
verified: "2026-07-20 arXiv API 直取得(ID/タイトル一致確認済み)"
related: []
---

## 日本語要約
1/2/4bit 重み×多様な活性精度の低ビット GEMM を CPU で実行するための、レジスタ常駐 LUT 実行によるワークロード対応の共同設計・探索フレームワーク。既存 SIMD データパスがテーブル生成と積算をカバーしており、必要な新ハードはレジスタ内 select/feed 機構だけ、という洞察に基づく。

## 手法
SIMD レジスタファイル予算の下で、ビット構成ごとの実行可能性・再利用機会・サポートコストを探索する設計空間探索。

## 評価
- 対象モデル: CPU 推論の低ビット LLM/DNN
- ビット幅: 重み 1/2/4bit × 活性可変
- 精度劣化: N/A(実行効率の研究)
- スループット/メモリ: LUT 実行での低ビット GEMM 効率化

## 既存手法との差分
T-MAC 系 LUT GEMM の「どのビット構成を CPU がサポートすべきか」を第一級の設計問題として扱う点。

## 注目度コメント
CPU 低ビット推論の設計空間整理として記録。watching。
