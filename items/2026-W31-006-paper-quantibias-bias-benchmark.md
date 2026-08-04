---
id: "2026-W31-006"
type: paper
title: "QuantiBias: Benchmarking Quantization-Induced Bias in LLMs"
url: "https://arxiv.org/abs/2607.21063"
discovered: "2026-07-27"
published: "2026-07-23"
authors: []
venue: "arXiv (cs.CL, cs.CY, cs.HC)"
models: []
architectures: [transformer]
methods: []
tech: [ptq]
priority: normal
sources: [arxiv]
status: new
verified: "2026-07-27 arXiv API 直取得(ID/タイトル一致確認済み)"
related: []
---

## 日本語要約
量子化の主要な副作用は「標準の安全性評価が見逃すバイアス増加」だという主張のベンチマーク研究。量子化モデルは有害要求の拒否・過剰拒否回避・多肢選択の非バイアス回答はすべて維持するのに、自由記述の質問には8言語すべてでステレオタイプを混ぜる(独立ジャッジ判定で自由記述回答の約24〜27%)。標準チェックは全部通るのに、ユーザーに届く出力は測定可能にバイアスが増える「選択的ギャップ」を報告。

## 手法
多言語生成型ステレオタイププローブ + 拒否/多肢選択の対照群で自由記述生成を分離。reasoning 有無の対比と生成内容の重症度レーティングを含む。

## 評価
- 対象モデル: Qwen / Gemma 系2バックボーン、5ファミリの量子化手法、8ベンチマーク
- ビット幅: 圧縮ラダー全域
- 精度劣化: 短文形式の安全性指標は不変、自由記述バイアスのみ増加
- 補足: reasoning 付加で効果が半減するファミリと無効なファミリが混在

## 既存手法との差分
量子化評価を PPL/タスク精度でなく「open-ended 安全性」で行い、既存安全性評価の盲点を特定した点。

## 注目度コメント
量子化済みビルドの出荷前評価に「自由記述バイアス再評価」を足すべきという実務的示唆。社内での量子化モデル評価ポリシーに直結し得る。
