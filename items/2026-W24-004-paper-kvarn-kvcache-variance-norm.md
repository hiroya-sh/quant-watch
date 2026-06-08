---
id: "2026-W24-004"
type: paper
title: "KVarN: Variance-Normalized KV-Cache Quantization Mitigates Error Accumulation in Reasoning Tasks"
url: "https://arxiv.org/abs/2606.03458"
discovered: "2026-06-08"
published: "2026-06-02"
authors: [Lorenz K. Muller, Philippe Bich, Chiara Boretti, Hyun-Min Chang, Jiawei Zhuang, Lukas Cavigelli]
venue: "arxiv"
models: []
architectures: [transformer]
methods: []
tech: [kv-cache-quant, calibration-free, rotation, low-bit-2, per-token]
priority: high
sources: [arxiv, hf-papers]
status: new
related: []
---

## 日本語要約
推論タスクの長期デコード中にKVキャッシュ量子化誤差が累積する問題を解決。自己回帰デコード時は誤差がタイムステップ間で積算されるがプリフィルと異なる特性があることを実証。Hadamard回転に加えてK・V行列の両軸にわたる分散正規化（dual-scaling variance normalization）を適用するKVarNを提案。校正データ不要で2ビット精度においてMATH500・AIME24・HumanEvalで新SOTA。vLLM実装あり。

## 手法
- Hadamard回転で外れ値を抑制（既存手法共通）
- 加えてK行列・V行列の両軸（token軸・channel軸）での分散正規化を適用
- トークンスケールの誤りが誤差累積の主因であることを分析で特定
- キャリブレーション不要

## 評価
- ベンチマーク: MATH500、AIME24、HumanEval
- ビット幅: 2bit KVキャッシュ
- 結果: 各ベンチマークで新SOTA（reasoning特化の評価では既存手法を大幅に凌駕）
- 実装: vLLM対応コード公開済み (https://github.com/huawei-csl/KVarN)

## 既存手法との差分
RotateKV・KVLinCはプリフィル設定での評価が主体。KVarNは自己回帰デコードでの誤差累積メカニズムを分析し、reasoning taskに特化したSoTAを達成。Hadamard+分散正規化の組み合わせが新規。

## 注目度コメント
kv-cache-quantがfocus。reasoning model（Qwen3等）普及でlong-horizon decodingが重要化する中、タイムステップ間誤差累積の解消はHurwitzQuant（W23）と並んで注目の観点。HF Papersでも342いいねと高エンゲージメント。
