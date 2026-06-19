---
id: "2026-W25-003"
type: paper
title: "ReasonAlloc: Hierarchical Decoding-Time KV Cache Budget Allocation for Reasoning Models"
url: "https://arxiv.org/abs/2606.11164"
discovered: "2026-06-15"
published: "2026-06-09"
authors: [Wenhao Liu, Hao Shi, Yunhe Li, Weizhi Fei, Xiangyuan Wang, Mengzhe Ruan, Hanxu Hou, Peisong Wang, Linqi Song, Shuang Qiu]
venue: "arxiv"
models: [deepseek-ai/DeepSeek-R1, Qwen/Qwen3]
architectures: [transformer]
methods: []
tech: [kv-cache-quant, kv-cache-eviction, reasoning-aware-compression, long-context-quant, per-token]
priority: high
sources: [arxiv]
status: new
related: []
---

## 日本語要約
推論モデル（reasoning LLM）のChain-of-ThoughtでKVキャッシュが急速に肥大化する問題を解決する階層的デコード時バジェット配分フレームワーク。オフライン層別戦略（Reasoning Wave パターンの特定）とオンライン頭別戦略（デコード中の高utility headへの動的再配分）を組み合わせる。既存のトークン除去ポリシーと統合可能でオーバーヘッド最小。数学的推論タスクで実証。

## 手法
- Reasoning Wave: 推論モデル特有の「KV使用率の波形パターン」をオフラインで解析し、層別budget比率を決定
- Online Head-Specific: デコード中にattention頭ごとのKV利用率をモニタリングし高utility頭にbudgetを再配分
- 既存policy（H2O、StreamingLLM等）の上位层として実装 → 互換性高い
- 推論中に動的にbudget調整 → 固定budget割当より効率的

## 評価
- DeepSeek-R1、Qwen3-Thinkingで検証
- 数学的推論（GSM8K、MATH、AIME）で精度向上
- 既存KV eviction手法との組み合わせで追加改善

## 既存手法との差分
W24のKVarN（Hadamard+分散正規化）が量子化誤差削減にフォーカスするのに対し、ReasonAllocはbudget配分最適化。reasoning model特化の設計が差別点。

## 注目度コメント
kv-cache-quantがfocus tech、推論モデル普及でlong-horizonなKV管理が重要課題化。W24のKVarN、W23のHurwitzQuantと続く推論モデルKV量子化の流れの延長。vLLM等への実装が進めば影響大。
