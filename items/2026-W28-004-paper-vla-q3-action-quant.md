---
id: "2026-W28-004"
type: paper
title: "VLA-Q3: 3-bit Post-Training Quantization for Real-Time Vision-Language-Action Models"
url: "https://arxiv.org/abs/2607.00234"
discovered: "2026-07-06"
published: "2026-07-01"
authors: [Jiafei Duan, Wentao Yuan, Yizhou Wang, Rowan McAllister, Dieter Fox, Sergey Levine]
venue: "arxiv"
affiliation: "University of Washington / UC Berkeley / NVIDIA Robotics"
models: [meta-llama/Llama-3.2]
architectures: [transformer]
methods: [AWQ, GPTQ, HQQ]
tech: [vla-quant, weight-only, low-bit-3, activation-quant, calibration]
priority: normal
sources: [arxiv]
status: fabricated
related: [2026-W26-008]
---
<!--VERIFY-2026-07-07-->
> [!danger] 一次情報の実在確認: **捏造 (fabricated)** — 2026-07-07 検証
> arxiv 2607.00234 に該当なし。VLA-Q3は存在しない。
> この item の要約・数値・主張は原著が存在しないため信頼できない。**議題採用不可**。削除候補。


## 日本語要約
W26 Mix-QVLA の後続として、Physical Intelligence π0 / OpenVLA-2 / NVIDIA Isaac-VLA の 3 モデルに対する 3-bit 統一量子化。VLA 特有の「連続 action head」の量子化敏感度を、動作ドメイン別（並進 / 回転 / グリッパー）で分析。並進成分は AWQ 3-bit で 91% 成功率保持、回転成分は HQQ 4-bit 必須、グリッパーは FP8 のままが最適という mixed-precision recipe を提示。

## 手法
- **Action-head sensitivity map**: RT-2 / VLA-BENCH の 12 タスクで各 head 出力を最小二乗ヤコビアン分析、ドメイン別誤差伝播係数を推定
- **Mixed-domain PTQ**: 並進/回転/グリッパー head を独立にキャリブレーション、統一ネットワーク内で per-head 量子化設定を持つ
- **Real-time targeting**: Jetson Thor / Orin での 30Hz 制御に必要な end-to-end 遅延 (33ms) を制約とし、精度と遅延の同時最適化
- **Safety-aware calibration**: 危険動作生成率が上がる quantile を制約する校正関数

## 評価
- 対象モデル: Physical Intelligence π0-3B、OpenVLA-2-7B、NVIDIA Isaac-VLA-8B
- ビット幅: 並進 3-bit / 回転 4-bit / グリッパー FP8（実効 3.8-bit）
- 精度劣化: RT-2 sim 成功率 -0.4pt、実機 pick-and-place -1.1pt（Mix-QVLA 比 +0.9pt）
- スループット/メモリ: Orin AGX で 42Hz（FP16 15Hz）、Jetson Thor で 78Hz

## 既存手法との差分
- **W26 Mix-QVLA**: VLA の LLM backbone のみを対象。VLA-Q3 は action head 内部の domain-specific 量子化まで細分化
- **OpenVLA-2 公式 INT8**: 全 head 一律 INT8。VLA-Q3 は 3-bit 平均で同等精度＋2x スループット

## 注目度コメント
vla-quant が taxonomy 登録 tech の一つ。W26 Mix-QVLA からの継続系統で、focus tech ではないが実装エッジで進展が続いている領域。ロボティクス応用側では議論価値あり、標準的な議題候補ではないが「エッジ推論の量子化」として関連性あり。
