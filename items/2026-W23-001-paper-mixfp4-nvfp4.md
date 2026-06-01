---
id: "2026-W23-001"
type: paper
title: "MixFP4: Enhancing NVFP4 with Adaptive FP4/INT4 Block Representations"
url: "https://arxiv.org/abs/2605.31035"
discovered: "2026-06-01"
published: "2026-05-29"
authors: [Jiaxiang Zou, Yonghao Chen, Ruilong Wu, Xinyu Chen]
venue: "arxiv"
models: []
architectures: [transformer]
methods: [NVFP4]
tech: [low-bit-fp4, microscaling-formats, weight-only, activation-quant]
priority: high
sources: [arxiv]
status: new
related: []
---

## 日本語要約
NVFP4の精度をハードウェア小変更で向上させる研究。各16要素ブロック内で E2M1 と E1M2 の2種類のFP4サブフォーマットを適応的に選択し、選択情報をオーバーヘッドなしでエンコードする。テンソルコア面積+3.1%、電力+1.5%の追加で精度改善を実現。NVIDIA Blackwellの次世代FP4実装への提言として位置づけられる。

## 手法
ブロック単位でE2M1（指数ビット多め＝大きな値向き）とE1M2（仮数ビット多め＝小さな値向き）を動的切り替え。選択フラグを既存の量子化スケールに埋め込むことでメタデータオーバーヘッドをゼロにする。量子化誤差を最小化するためブロックごとにどちらのフォーマットが適切かをキャリブレーション時に決定。

## 評価
- 対象モデル: LLMファミリー複数（具体モデル名は要確認）
- ビット幅: FP4（NVFP4拡張）
- 精度劣化: NVFP4比で改善（論文内ベンチマーク）
- スループット/メモリ: ハードウェアコスト最小（+3.1% tensor-core面積）

## 既存手法との差分
既存NVFP4はE2M1固定。本手法はブロック単位の適応選択により同一ビット幅で精度向上。ソフトウェア手法（rotation等）とは独立し、将来のBlackwell変形アーキテクチャへの提言。

## 注目度コメント
NVFP4はfocusメソッド。ハードウェアレベルの精度改善提案として将来の実装方針の参考になる。火曜定例での「NVFP4の次の一手」議論に最適。
