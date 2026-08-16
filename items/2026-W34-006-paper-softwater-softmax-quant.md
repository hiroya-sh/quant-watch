---
id: "2026-W34-006"
type: paper
title: "SoftWater: Class-Aware Rate Allocation for Softmax Quantization"
url: "https://arxiv.org/abs/2608.12026"
discovered: "2026-08-17"
published: "2026-08-12"
authors: [Joao V. Cavalcanti, Ashia C. Wilson]
venue: "arXiv"
models: []
architectures: [transformer]
methods: []
tech: [weight-only, ptq, low-bit-2]
priority: normal
sources: [arxiv]
status: new
related: []
---
## 日本語要約
PTQ は softmax 出力層(語彙 head)を高精度のまま残すのが通例だが、現代の大語彙では head が全パラメータの15〜30%を占め、"2-bit" モデルでも fp16 head だと実効 bpw が数倍になる。SoftWater は softmax 層量子化を、元と量子化後の出力分布間 KL の rate-distortion 問題として定式化。二次解析で「量子化誤差は特徴共分散とクラス別 softmax 曲率で重み付く」class-aware 幾何を導出し、分離近似で $Kn\times Kn$ Cholesky を1回の順伝播統計で $n\times n$ に縮約。頻出・低分散クラスに細かい格子、稀クラスに粗い格子を割り当てる。

## 手法
Zipf 分布下で class-aware rate allocation を行い、successive interference cancellation で格子を符号化。1B〜32B の5モデルで released WaterSIC を上回ると主張。

## 評価
- 対象モデル: 1B〜32B の5モデル
- ビット幅: 低ビット(softmax head 特化)
- 比較: WaterSIC quantizer を上回る

## 既存手法との差分
高精度据え置きが多かった出力 head を rate-distortion で明示的に量子化。小型 LLM で bpw を実効的に削減。

## 注目度コメント
小型 LLM の実効 bpw を下げる着眼(head が支配的)は実運用で効く。手法名 SoftWater は taxonomy 未登録。
