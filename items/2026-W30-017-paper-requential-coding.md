---
id: "2026-W30-017"
type: paper
title: "Requential Coding: Pushing the Limits of Model Compression with Self-Generated Training Data"
url: "https://arxiv.org/abs/2607.11883"
discovered: "2026-07-20"
published: "2026-07-13"
authors: []
venue: "arXiv (cs.LG)"
models: []
architectures: []
methods: []
tech: [_uncategorized]
priority: watching
sources: [arxiv]
status: new
verified: "2026-07-20 arXiv API 直取得(ID/タイトル一致確認済み)"
related: []
---

## 日本語要約
モデル圧縮の理論限界を情報理論から攻める研究。パラメータベース圧縮(量子化等)はコード長がモデルサイズに比例しパラメータの実情報量に鈍感、prequential coding は学習量と無関係にデータ列全体を符号化してしまう ── その両方の問題を、自己生成データで学習軌跡を符号化する「requential coding」で回避する。

## 手法
モデル自身が生成したデータによる学習軌跡の符号化で、モデルが学んだ規則性のみを短いコードに落とす。

## 評価
- 対象モデル: ニューラルネット一般
- ビット幅: N/A(符号長理論)
- 精度劣化: N/A
- スループット/メモリ: 理論的コード長の改善

## 既存手法との差分
量子化・蒸留と直交する「情報量ベースの圧縮限界」の枠組み。

## 注目度コメント
実用量子化への直接の影響なし。理論的背景として watching。
