---
id: "2026-W31-018"
type: paper
title: "SelectInfer: Selective Neuron Loading and Computation for On-Device LLMs"
url: "https://arxiv.org/abs/2607.18081"
discovered: "2026-07-27"
published: "2026-07-20"
authors: []
venue: "arXiv (cs.LG, cs.AI)"
models: []
architectures: [transformer]
methods: []
tech: [_uncategorized]
priority: watching
sources: [arxiv]
status: new
verified: "2026-07-27 arXiv API 直取得(ID/タイトル一致確認済み)"
related: []
---

## 日本語要約
エッジデバイス向け LLM 推論のニューロンレベル最適化フレームワーク。オフラインの LLM プロファイラでタスク特化ニューロンと汎用ニューロンを特定し、(1) 重要ニューロンのみをロードする selective loading でメモリフットプリント削減、(2) 実行時に関連ニューロンのみを計算する selective computation を行う。粗粒度プルーニングや量子化のような精度低下・再学習を避けると主張。

## 手法
オフラインプロファイリング + 実行時の動的ニューロン選択。PowerInfer 系のスパース活性活用の系譜。

## 評価
- 対象モデル: 複数データセットで評価
- ビット幅: (量子化ではなく選択的ロード/計算)
- 精度劣化: タスク性能維持と主張
- スループット/メモリ: メモリ・計算の大幅削減と主張

## 既存手法との差分
量子化・プルーニングと直交する「ニューロン選択」軸でのオンデバイス効率化。

## 注目度コメント
定量値が abstract に乏しく、ベースライン比較の詳細も不明のため watching。量子化と合成可能なら面白い。
