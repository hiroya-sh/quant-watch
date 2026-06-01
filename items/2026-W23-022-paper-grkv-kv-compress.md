---
id: "2026-W23-022"
type: paper
title: "GRKV: Global Regression for Training-Free KV Cache Compression in Long-Context LLMs"
url: "https://arxiv.org/abs/2605.31105"
discovered: "2026-06-01"
published: "2026-05-29"
authors: [Junjie Peng, You Wu, Haoyi Wu, Jialong Han, Xiaohua Xie]
venue: "arXiv:2605.31105"
models: []
architectures: [transformer]
methods: []
tech: [kv-cache-compression-non-quant, long-context-quant, calibration-free]
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約
長コンテキストLLMにおけるKVキャッシュ圧縮の新手法。スパン単位の保持戦略でトークンを退避する際、ridge回帰を使って退避トークンの情報を残存トークンへ均等に分配する。過平滑化を正則化で防止し、学習不要でLongBench/RULERで既存手法を上回る精度を達成。

## 手法
スパンベース保持戦略の「不均衡な情報損失」問題を特定し、グローバルリグレッション（リッジ回帰）で退避トークンの表現を残存トークンへ再配置。quantizationではなく線形回帰ベースの無損失近似圧縮。

## 評価
- 対象モデル: 複数LLM（長コンテキスト設定）
- ビット幅: N/A（非量子化圧縮）
- 精度劣化: LongBench/RULERで既存スパンベース手法より改善
- スループット/メモリ: overhead最小と主張

## 既存手法との差分
既存スパンベースKV圧縮（StreamingLLM等）が退避トークン情報を単純に破棄するのに対し、リグレッションで情報を保持・再分配する。量子化ではなく情報再配置。

## 注目度コメント
kv-cache-compression-non-quant。量子化ではないがKVキャッシュ効率化として関連文脈。
