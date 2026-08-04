---
id: "2026-W31-003"
type: paper
title: "C^2KV: Compressed and Composable KV Cache Reuse for Efficient LLM Inference"
url: "https://arxiv.org/abs/2607.17715"
discovered: "2026-07-27"
published: "2026-07-20"
authors: []
venue: "arXiv (cs.CL)"
models: []
architectures: [transformer]
methods: []
tech: [kv-cache-compression-non-quant, long-context-quant]
priority: normal
sources: [arxiv]
status: new
verified: "2026-07-27 arXiv API 直取得(ID/タイトル一致確認済み)"
related: []
---

## 日本語要約
non-prefix KV cache 再利用と KV 圧縮を統合したフレームワーク。既存の KV 再利用は prefill 計算削減に注力し、長文脈サービングでの KV の保存・転送コストを見落としているという問題意識。学習可能な圧縮トークンを持つ軽量サイドカー Extractor で position-agnostic な「合成可能・圧縮済み KV 多様体」を学習し、凍結ベースモデルを変更せずにモジュール式 KV を再利用・連結できる。

## 手法
圧縮と連結挙動を揃える compression-concatenation co-training。抽出時の表現を下流の再利用時挙動にアラインする。

## 評価
- 対象モデル: 複数の長文脈ベンチマーク・モデルファミリ
- ビット幅: (量子化ではなく学習ベース圧縮)
- 精度劣化: 生成品質を維持と主張
- スループット/メモリ: 長文脈で最大 17x の推論高速化、KV 保存/転送コスト大幅削減

## 既存手法との差分
KV 再利用系(prefix cache / CacheBlend 系)が扱わない「圧縮した状態での非 prefix 合成」を、位置非依存の学習圧縮で実現する点。

## 注目度コメント
17x 高速化の主張は強いが学習ベースでモデルごとに Extractor が必要。RAG サービングインフラ視点で追跡価値あり。
