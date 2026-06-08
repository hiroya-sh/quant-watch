---
id: "2026-W24-021"
type: hf-paper
title: "VaSE: Value-Aware Stochastic KV Cache Eviction for Reasoning Models"
url: "https://arxiv.org/abs/2606.03928"
discovered: "2026-06-08"
published: "2026-06-02"
authors: [Ting-Yun Chang, Harvey Yiyun Fu, Deqing Fu, Chenghao Yang, Jesse Thomason, Robin Jia]
venue: "arxiv"
models: [Qwen/Qwen3]
architectures: [transformer]
methods: []
tech: [kv-cache-eviction, kv-cache-compression-non-quant, reasoning-aware-compression]
priority: watching
sources: [hf-papers]
status: new
related: []
---

## 日本語要約
推論モデルの長い思考チェーンによるメモリボトルネックを解決するKVキャッシュ退避手法VaSE。少数のValue状態が異常に大きなノルムを持つことを発見し、これらを保護しつつ残りの退避判断に確率的ランダム性を導入する。4倍の圧縮率で6つの推論タスクにわたりQwen3で精度を維持。選択ベースのスパースアテンション手法より効率-精度バランスで優位。

## 手法
- 大ノルムValue状態の保護: 退避から除外して常時保持
- 確率的退避: 残りKV状態の退避判断にランダム性を加えて精度-効率のトレードオフ改善
- 推論タスク特化: CoT（思考チェーン）の長期依存性を考慮した設計

## 評価
- 対象モデル: Qwen3
- 圧縮率: 4倍KVキャッシュ削減
- ベンチマーク: 6つの推論タスク
- 結果: 既存スパースアテンション手法より優位

## 既存手法との差分
W23のCONF-KV・NestedKV（退避手法）と同系統だが、推論モデル（長い思考チェーン）に特化した設計が新規。確率的退避の導入も差別化点。

## 注目度コメント
kv-cache-eviction（量子化ではない）での圧縮。量子化と補完的な手法として注目。推論モデル普及に伴いKV管理の重要性が増す。
