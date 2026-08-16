---
id: "2026-W34-005"
type: paper
title: "When Local Variance Optimality Is Not Enough: RoPE-Aligned Q/K Rotations for Dynamic 4-Bit Quantisation"
url: "https://arxiv.org/abs/2608.13365"
discovered: "2026-08-17"
published: "2026-08-14"
authors: [Shuhan Wang, Yilin Luo, Nan Xu, Chi Wang Cheung]
venue: "arXiv"
models: []
architectures: [transformer]
methods: []
tech: [rotation, kv-cache-quant, activation-quant, low-bit-4]
priority: normal
sources: [arxiv]
status: new
related: []
---
## 日本語要約
回転ベース PTQ は attention head 全体に直交変換をかけ outlier 誤差を減らすが、RoPE は各 head を2次元周波数ペアに分割する。本研究は「RoPE と可換な単一 head 直交写像は(相異なる周波数では)per-pair 回転以外に存在しない」という converse を示す。head 共有パラメータ化で pooled-covariance 下の分散最小化角を導出し実装が解析最小に到達することを検証したが、**評価した head 共有 pairwise 構成は動的 W4A4KV4 で精度を改善しなかった**(full-head Hadamard 置換で PPL 悪化)。pairwise と Hadamard の合成は妥当性条件を満たす。

## 手法
RoPE 分解を尊重する回転が full-head Hadamard を上回るかを理論+実験で検証(否定的結果を含む厳密解析)。

## 評価
- 対象: 4 checkpoints
- ビット幅: 動的 W4A4KV4
- 結果: head 共有 pairwise は Hadamard に劣り PPL 増加

## 既存手法との差分
RoPE 可換回転の一意性(converse)を理論的に確定。実務的には「full-head Hadamard を pairwise で置き換えるな」という否定的知見。

## 注目度コメント
focus の kv-cache-quant に該当。KV4 回転設計で Hadamard を安易に分解しない指針として有用(否定的結果だが再現性が高い)。
