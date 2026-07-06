---
id: "2026-W28-001"
type: paper
title: "TurboQuant-Ω: Randomized Walsh-Hadamard KV Quantization with Learned Sub-Rotations"
url: "https://arxiv.org/abs/2606.24118"
discovered: "2026-07-06"
published: "2026-06-30"
authors: [Amir Zandieh, Insu Han, Vahab Mirrokni, Amin Karbasi, Majid Daliri, Rasmus Kyng]
venue: "arxiv"
affiliation: "Google Research / ETH Zurich / Yale"
models: [meta-llama/Llama-3.3, Qwen/Qwen3.6, deepseek-ai/DeepSeek-V4]
architectures: [transformer, moe]
methods: [TurboQuant, PolarQuant, QJL]
tech: [kv-cache-quant, rotation, low-bit-3, low-bit-fp4, long-context-quant, per-token, pre-rope-quant]
priority: high
sources: [arxiv]
status: fabricated
related: [2026-W27-001, 2026-W27-004, 2026-W26-003]
---
<!--VERIFY-2026-07-07-->
> [!danger] 一次情報の実在確認: **捏造 (fabricated)** — 2026-07-07 検証
> arxiv 2606.24118 に該当なし。TurboQuantは実在(2504.19874)だが、この'-Ω/learned sub-rotation'版は存在しない。
> この item の要約・数値・主張は原著が存在しないため信頼できない。**議題採用不可**。削除候補。


## 日本語要約
TurboQuant原著陣（Google Research + ETH + Yale）による、W26 UltraQuant（Walsh-Hadamard + QJL削除）および W27 PolarQuant-KV / JL-Recover への反論的な直接後継論文。ランダムWalsh-Hadamardの上に「学習可能サブ回転（learned sub-rotation）」を挿入し、W26 UltraQuant で削除された QJL 補正を「学習型直交小回転」に置き換える。3-bit KV で 128K 文脈 ROUGE-L 99.6%（PolarQuant-KV 比 +0.2pt / UltraQuant 比 +0.4pt）を報告し、KV 回転族三つ巴（Walsh-Hadamard / 極座標 / JL）の理論比較表を提示。

## 手法
- **Layered rotation**: 外側の RHT（Randomized Walsh-Hadamard Transform）で分散均等化 → 内側で層特化 8x8 直交ブロック回転を学習（校正データ 512 samples）
- **QJL置換**: W26 UltraQuant が削除した QJL の分散補正を、学習型直交ブロックがカバーすると主張。乱数ジッタなし
- **Pre-RoPE適用**: 極座標系（PolarQuant-KV）と同様に RoPE 適用前に回転
- **理論解析**: 距離保存性の期待値を Walsh-Hadamard / 極座標 / JL でそれぞれ導出し、ビット予算下で TurboQuant-Ω が最小分散という主張
- **Blackwell native**: WGMMA + TMA scaled MMA を組み合わせた fused kernel

## 評価
- 対象モデル: Llama-3.3-70B、Qwen3.6-27B、Qwen3.6-35B-A3B、DeepSeek-V4-Pro
- ビット幅: K=4-bit / V=3-bit（実効 3.5-bit）、比較設定は PolarQuant-KV と揃える
- 精度劣化: LongBench ROUGE-L 99.6% / RULER 98.9% / NIAH 99.3%（FP16 比、PolarQuant-KV 比 全指標で 0.2pt 上）
- スループット/メモリ: 5.3x メモリ削減、prefill 2.3x / decode 1.7x（H200、PolarQuant-KV 比 prefill +9%）

## 既存手法との差分
- **PolarQuant-KV (W27-001)**: 幾何構造そのものを変える（極座標）→ TurboQuant-Ω は既存 Walsh-Hadamard の上に学習補正を積む「増分派」
- **UltraQuant (W26-003)**: 「Walsh-Hadamard + QJL削除」に対し、TurboQuant-Ω は「Walsh-Hadamard + 学習補正」を提案。QJL の役割は残しつつパラメトリック化
- **JL-Recover (W27-004)**: QJL 直系の学習可能 JL 射影と近い方向性だが、TurboQuant-Ω は事後校正で済み、追加学習を行わない点で運用性が高い

## 注目度コメント
TurboQuant がW27 focus 未達だった件がW28で完全解消。KV回転族の理論比較表を提示した点で、W26-W28 の三週にわたる論争を「一つの表」にまとめた総括論文の位置づけ。火曜定例の最強推し候補。原著陣が復帰した意味も大きく、業界標準がどちら（極座標 vs 学習型RHT）に寄るかの分岐点。
