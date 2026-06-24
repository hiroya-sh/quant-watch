---
id: "2026-W26-009"
type: paper
title: "Tangram: Unlocking Non-Uniform KV Cache Compression for Efficient Multi-turn LLM Serving"
url: "https://arxiv.org/abs/2606.06302"
discovered: "2026-06-22"
published: "2026-06-06"
authors: [Hyungmin Kim, Minsoo Kim, Hongseok Kim, Jungwook Choi]
venue: "arxiv"
models: []
architectures: [transformer]
methods: []
tech: [kv-cache-compression-non-quant, kv-cache-quant, long-context-quant, paged-attention, per-channel]
priority: normal
sources: [hf-papers]
hf_papers_date: "2026-06-16"
hf_papers_upvotes: 10
status: new
related: []
---

## 日本語要約
マルチターンLLM推論でKVキャッシュが蓄積しモデル重みを超えるメモリボトルネック問題に対し、アテンションヘッドごとの不均一なKV圧縮を実用的に実現するシステムフレームワーク。「ヘッドごとのKV保持率は2レベル構造的規則性に従う」という観察を活かし、オフラインキャリブレーションで圧縮後フットプリントを事前確定。Ragged Pagingで類似保持率ヘッドをグループ化してフラグメンテーションを解消し、先行ロードバランシングでランタイムコストを排除。vLLMベースでスループット2.6倍向上、prefill時のページ回収時間25%削減。コードはGitHub公開（aiha-lab/TANGRAM）。HF Papers 10 upvotes（2026-06-16）。

## 手法
- **2-Level Structural Regularity**: ヘッドごとの保持率パターンが少量サンプルからオフラインキャリブレーション可能
- **Budget Reservation**: スケジューリング時に圧縮後フットプリントを固定し、ページ回収オーバーヘッドを排除
- **Ragged Paging**: 類似予算ヘッドを独立ページテーブルにグループ化→フラグメンテーションをメモリ回収可能に変換
- **Ahead-of-Time Load Balancing**: 均一GPU分割をオフライン事前計算してランタイム計画コストゼロに

## 評価
- vLLMベース実装
- スループット2.6倍向上（full-KVベース比）
- prefill時ページ回収時間最大25%削減
- decode latency膨張（最大1.7倍）を抑制

## 既存手法との差分
既存の非均一KV圧縮手法はランタイムでのヘッド間不均一性発見・対応のオーバーヘッドがあったが、Tangramはオフライン事前計算とRagged Pagingでこれを解消。既存圧縮手法のドロップイン基盤として機能。

## 注目度コメント
kv-cache-quantへの間接関連（システム基盤としてKV圧縮を実用化）。非均一KV保持率の活用はW25 ReasonAlloc（推論モデル特化KVバジェット）と方向性補完。実装がvLLM基盤というのも実用性の観点で評価高い。
