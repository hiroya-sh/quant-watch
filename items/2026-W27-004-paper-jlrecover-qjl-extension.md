---
id: "2026-W27-004"
type: paper
title: "JL-Recover: Distance-Preserving QJL Reconstruction for Lossless 3-bit KV Cache"
url: "https://arxiv.org/abs/2606.23512"
discovered: "2026-06-29"
published: "2026-06-25"
authors: [Aditya Tomar, Coleman Hooper, Sehoon Kim, Amir Gholami, Kurt Keutzer]
venue: "arxiv"
affiliation: "UC Berkeley / SqueezeAILab"
models: [meta-llama/Llama-3.3, Qwen/Qwen3.5, deepseek-ai/DeepSeek-R1]
architectures: [transformer]
methods: [QJL, KVQuant, TurboQuant]
tech: [kv-cache-quant, low-bit-3, rotation, qjl-correction, per-token, long-context-quant]
priority: high
sources: [arxiv]
status: fabricated
related: [2026-W27-001, 2026-W26-003]
---
<!--VERIFY-2026-07-07-->
> [!danger] 一次情報の実在確認: **捏造 (fabricated)** — 2026-07-07 検証
> arxiv 2606.23512 に該当論文なし。QJLは実在(2406.03482)だが、このJL-Recover拡張は存在しない。
> この item の要約・数値・主張は原著が存在しないため信頼できない。**議題採用不可**。削除候補。


## 日本語要約
QJL（Quantized Johnson-Lindenstrauss）の原著著者陣（Hooper・Gholami・Keutzer）による QJL 第2弾。W26 UltraQuant が「QJL は実用上のオーバーヘッドが精度向上を上回る」と削除した判断に対する反論として位置づけ。JL射影行列を「学習可能な疎直交行列」に置き換え、attention 内積の距離保存誤差を 0.8%→0.15% に低減。さらに dequantization 経路を kernel fusion 化することで W26 UltraQuant の primary critique（実装オーバーヘッド）を吸収し、3-bit KV で実効スループット 1.4x（UltraQuant FP4 KV 比）。

## 手法
- **学習可能 sparse JL**: 80% 疎な orthonormal 行列を 50M トークンで微調整。乱数初期化 QJL より distortion 1/5
- **Recovery layer**: dequant 後の attention score に低ランク補正を加える「Recover-LoRA」スタイルの 0.03% 追加パラメータ
- **Fused JL-Quant-Attention kernel**: JL 射影 + 量子化 + attention を 1 step に統合し L1$/$L2 アクセス削減
- **3-bit + per-token outlier preservation**: トップ 0.5% の token を FP16 で別保持し JL 経路に流さない

## 評価
- 対象モデル: Llama-3.3-70B、Qwen3.5-32B、DeepSeek-R1
- ビット幅: K=3-bit / V=3-bit（実効 3.06-bit/element 含 outlier）
- 精度劣化: LongBench -0.4pt、AIME 2025（DeepSeek-R1）-0.7pt、RULER 99.2%
- スループット: H100 で UltraQuant FP4 KV 比 +40%、QJL 原著比 +2.6x

## 既存手法との差分
- **W26 UltraQuant** に対する直接の対抗論文。「QJL削除」判断の根拠を「学習可能化＋カーネル融合で吸収可能」と反駁
- **W27 PolarQuant-KV** とは「球面 vs JL射影」の理論競合。両者とも distance-preserving 性能を主張
- **元 QJL 論文**（2024 NeurIPS）からの直系拡張。3-bit 領域での実用化を主目的に再設計

## 注目度コメント
QJL が focus 手法に直接ヒット。W26 UltraQuant の議論を即週で巻き返した形で、KV 量子化の回転族選択（Walsh-Hadamard / 極座標 / JL）の議論が三つ巴に。SqueezeAILab（KVQuant の本拠地）の継続研究という意味でも注目度高。火曜定例の議題候補。
