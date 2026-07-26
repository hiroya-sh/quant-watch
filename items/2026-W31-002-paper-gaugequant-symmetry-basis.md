---
id: "2026-W31-002"
type: paper
title: "GaugeQuant: Online Learning of Quantization-Optimal Bases from LLM Symmetries"
url: "https://arxiv.org/abs/2607.20757"
discovered: "2026-07-27"
published: "2026-07-22"
authors: []
venue: "arXiv (cs.LG, cs.CL)"
models: []
architectures: [transformer]
methods: []
tech: [qat, rotation, outlier-handling, calibration-free]
priority: high
sources: [arxiv]
status: new
verified: "2026-07-27 arXiv API 直取得(ID/タイトル一致確認済み)。コード https://github.com/MPedraBento/gauge-quant も 200 確認"
related: []
---

## 日本語要約
Transformer 内部の連続対称性(出力を変えずに量子化特性だけを変えるゲージ自由度)を学習中に利用し、活性外れ値を最小化する基底を選ぶ手法。損失に LogSumExp 項を追加して対称性を破り、stop-gradient で回転行列のみを更新するため言語モデリング目的関数は完全に不変。calibration データも量子化シミュレーションも不要で、学習オーバーヘッドはごく小さい。

## 手法
「学習時に量子化最適基底をオンライン学習する rotation」という位置づけ。QuaRot/SpinQuant が学習後に固定 or 校正するのに対し、学習ループ内で対称性方向のみを動かす。

## 評価
- 対象モデル: LLaMA-2 7B
- ビット幅: W4A4 (group size 128) / W4A16
- 精度劣化: W4A4 で PPL 8.22→6.73、W4A16 で 11.16→5.45 と大幅改善を主張
- スループット/メモリ: 推論時は通常の rotation 系と同等

## 既存手法との差分
frozen モデル + calibration データを要する PTQ 系 rotation と競合する精度を、校正フリー・目的関数不変の学習内基底選択で達成する点。コード公開済み。

## 注目度コメント
W4A4/W4A16 双方で大幅な PPL 改善という明確な主張 + コード公開で default high。「学習時に量子化フレンドリな基底を仕込む」系は QAT と PTQ の中間として追う価値あり。
