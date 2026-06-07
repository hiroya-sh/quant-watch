---
id: "2026-W24-014"
type: paper
title: "LiftQuant: Continuous Bit-Width LLM via Dimensional Lifting and Projection"
url: "https://arxiv.org/abs/2606.04050"
discovered: "2026-06-08"
published: "2026-06-02"
authors: [Liulu He, XuanAng Liu, Juntao Liu, Taolue Feng, Ting Lu, Chunsheng Gan, Zhiyv Peng, Yuan Du, Huanrui Yang, Yijiang Liu, Li Du]
venue: "arxiv"
models: [meta-llama/Llama-3.1, Qwen/Qwen3]
architectures: [transformer]
methods: []
tech: [low-bit-4, mixed-precision, ptq, weight-only, calibration]
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約
単一モデルで連続的なビット幅を実現する「LiftQuant」。次元持ち上げ（Lift）と射影（Project）機構でビット幅を整数ではなく連続値で制御し、Pareto最適なデプロイを可能にする。4bit中心に設計されFP16に近い精度を維持しつつ最大1.8x End-to-Endスループット向上。融合デュアルコンポーネントカーネルでオンチップ計算をパイプライン化。

## 手法
- 次元持ち上げ: 重みを高次元空間に持ち上げてQuantization-Friendlyに変換
- 射影: 各ビット幅設定に対応した部分空間へ射影
- 連続ビット幅: ビット幅を離散整数ではなく連続パラメータで制御
- 融合カーネル: オンチップパイプラインで1.8x高速化

## 評価
- 対象モデル: LLaMA3、Qwen3
- 精度: FP16に近い精度を維持
- スループット: FP16比1.8x向上
- 汎用性: Pareto frontierで多様なビット幅/精度トレードオフを単一モデルで対応

## 既存手法との差分
Any-precision LLMの先行研究（matryoshka等）と異なり、Lift-Project機構でQuantization-Friendlyな部分空間を学習する点が新規。

## 注目度コメント
単一モデルで複数ビット幅に対応するアプローチはデプロイの柔軟性向上に寄与。実用化には学習コストと部分空間品質の検証が必要。
