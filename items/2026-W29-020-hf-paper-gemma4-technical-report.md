---
id: "2026-W29-020"
type: hf-paper
title: "Gemma 4 Technical Report"
url: "https://arxiv.org/abs/2607.02770"
discovered: "2026-07-13"
published: "2026-07-02"
authors: [Gemma Team (Google DeepMind)]
venue: "arxiv / HF Papers 2026-07-08 (59 upvotes)"
models: [google/gemma-4]
architectures: [transformer, dense, moe]
methods: []
tech: [_uncategorized]
priority: high
sources: [hf-papers, arxiv]
status: new
verified: "2026-07-13 arXiv API で ID/タイトル/著者/abstract 取得・実在確認、HF daily_papers 掲載確認"
related: []
---

## 日本語要約
Gemma 4 のテクニカルレポート。dense と MoE の両構成で 2.3B〜31B。12B ではエンコーダフリーの統一アーキテクチャ(raw audio/image patch を直接入力)、thinking mode 統合、推論速度・メモリ・計算効率と long-context の改善を明記。

## 注目ポイント
- focus モデル google/gemma-4 の一次資料(公式レポート)
- abstract に量子化の明示記述はなし。QAT リリース(gemma-4 *-qat-* 系)の詳細が本文にあるかは未読——本文の量子化セクション確認は次アクション候補
- 同週に [[items/2026-W29-038-hf-model-gemma4-community-quant-batch|gemma-4 QAT→NVFP4/oQ4 のコミュニティ再量子化]] が複数出ており、QAT チェックポイントが量子化エコシステムの起点になっている

## 注目度コメント
focus モデルの公式技術報告として high(models focus bump)。量子化・効率化の設計選択(本文)を火曜定例で確認したい。
