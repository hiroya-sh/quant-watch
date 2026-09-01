---
id: "2026-W36-004"
type: paper
title: "Transforms for LLM Quantization: The Great Inversion and Format Co-Design"
url: "https://arxiv.org/abs/2608.25188"
discovered: "2026-09-01"
published: "2026-08-25"
venue: "arXiv (cs.LG, cs.IT)"
models: []
architectures: [transformer]
methods: [QuaRot, SpinQuant, NVFP4, MXFP4]
tech: [rotation, outlier-handling, low-bit-4, block-wise, microscaling-formats]
priority: high
sources: [arxiv]
status: new
related: []
---
## 日本語要約
競争力のある 4bit LLM パイプラインはいまや例外なく同じ手順で始まる — 線形かつ関数を保存する変換(回転・スケーリング・置換・非直交アフィン)を適用して外れ値の質量をグループスケールに対して有利な位置に持っていき、**その後で**丸める。しかしこの「変換段階」に特化したサーベイは存在せず、その文献は古い理論を静かに再導出している、というのが本論文の指摘。

## 手法
著者はこの分野を組織する原理を同定・形式化し **the Great Inversion** と呼ぶ:
- **割当自由な符号化はエネルギーの集中を報いる**
- **デプロイされた行列命令が行うグループ共有スケール量子化は、グループ内の平坦化を報いる**

古典的な変換符号化(1963: 無相関化 → ビット割当 → 量子化)は固定総レートで座標ごとに異なるビットを使い、高レートのガウス源では KLT の集中が最適だった。**現代の低ビット LLM 量子化はその逆を要求する**、という反転構造の整理。

## 評価
- サーベイ + 理論的定式化(rotation / scaling / permutation / affine の統一的位置づけ)
- フォーマット(NVFP4 の group=16 等)との co-design 論

## 既存手法との差分
個別手法(QuaRot / SpinQuant / Hadamard 等)の羅列ではなく、**なぜ集中でなく平坦化が正解になるのか**を情報理論的に説明。

## 注目度コメント
低bit化の設計原理として最も汎用性が高い一本。GPTQModel v7.3.4 の「rotation config 永続化 + オンライン Hadamard」、ModelOpt 0.46.0 の `rotate.mode` 追加と同時期で、**変換段階が実装・理論の両方でホットになっている**。**強推し議題候補**。
