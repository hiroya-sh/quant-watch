---
id: "2026-W30-002"
type: paper
title: "PolyQ: Codesigning End-to-End Quantization Framework for Scalable Edge CPU LLM Inference"
url: "https://arxiv.org/abs/2607.14618"
discovered: "2026-07-20"
published: "2026-07-16"
authors: []
venue: "arXiv (cs.LG, cs.AR, cs.OS)"
models: []
architectures: []
methods: []
tech: [weight-only, ptq, mixed-precision]
priority: normal
sources: [arxiv]
status: new
verified: "2026-07-20 arXiv API 直取得(ID/タイトル一致確認済み)"
related: []
---

## 日本語要約
エッジ CPU 向けの量子化×コンパイラ共同設計フレームワーク。activation-aware なチャネル単位ビット割当({2,3,4,8,16} から選択、平均ビット予算指定)を行い、コンパイル時にチャネルを permute してビット同種ブロックにクラスタリング、SIMD/LUT 互換カーネルを生成する。レイアウト正規化をランタイムパスから排除するのが鍵。

## 手法
チャネル permutation + ビット同種ブロック化 + オペレータ間で互換 permutation をマージし、細粒度 mixed-precision を CPU で効率実行可能にする。

## 評価
- 対象モデル: エッジ CPU 上の LLM
- ビット幅: per-channel {2,3,4,8,16} mixed
- 精度劣化: ビット予算に応じ連続的に選択
- スループット/メモリ: SIMD/LUT カーネルで実効速度化

## 既存手法との差分
従来の CPU 向け量子化は「粗い動作点」か「実行困難な細粒度 mixed-precision」の二択だったのに対し、コンパイル時レイアウト変換で両立させる。

## 注目度コメント
llama.cpp 系 CPU 推論の次の一手として興味深いが、実装公開の有無は不明。normal。
