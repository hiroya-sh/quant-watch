---
id: "2026-W23-017"
type: paper
title: "Hurwitz Quaternion Multiplicative Quantization for KV Cache Compression"
url: "https://arxiv.org/abs/2605.27646"
discovered: "2026-06-01"
published: "2026-05-26"
authors: [Kabir Swain, Sijie Han, Daniel Karl I. Weidele, Mauro Martino, David Cox, Antonio Torralba]
venue: "arXiv"
models:
  - mistralai/Mistral
  - meta-llama/Llama-3.1
  - Qwen/Qwen2.5
  - Qwen/Qwen3
architectures:
  - transformer
methods: []
tech:
  - kv-cache-quant
  - calibration-free
  - rotation
  - low-bit-4
  - low-bit-2
priority: high
sources: [arxiv]
status: new
related: []
---

## 日本語要約
4要素KV chunkをHurwitz群（24頂点の正二十四胞体）を用いた四元数で量子化するKVキャッシュ圧縮手法。単位方向をHurwitzコードブックで近似したうえでper-layer/per-headのランダム四元数補助コードブックを掛け合わせ、実質24S種の表現を獲得。アウトライヤ処理にはmedian-multiplierを使用し、キャリブレーションデータ不要で動作する。5モデル（dense MHA/GQA/MoE）での評価でfp16比0.02〜0.10 PPL差を達成。

## 手法
- 各KV head内のK/Vを4要素チャンクとして扱い、四元数の単位方向として正規化
- Hurwitz群（24要素、正二十四胞体の頂点集合）からground codeを選択
- Per-layer/per-headのランダム四元数副コードブックとの乗積で表現空間を拡張（実効24S点）
- outlier: chunk最大絶対値がmedianのC=3倍超のものをfull-precで退避（calibration不要）
- 圧縮率はコードブックサイズSで調整

## 評価
- 対象モデル: Mistral-7B, Llama-3-8B, Qwen2.5-7B, Qwen3-8B, gpt-oss-20b (MoE)
- ビット幅: 〜5 bit
- 精度劣化: fp16比 PPL差 0.02〜0.10 (Mistral-7B: +0.02, Qwen3-8B: +0.03)
- スループット/メモリ: Llama-3-70B で 43 GB → 8.5 GB (5.05×圧縮)、naive int4比で 3〜1900× の精度優位

## 既存手法との差分
キャリブレーションデータが不要な点でKIVI・KVQuant等と差別化。KIVI-4と同等精度を16%少ないビットで実現。四元数の回転不変性を利用したユニークなアプローチで、QuaRot/SpinQuantのweight quantizationへの回転適用とは方向性が異なる。

## 注目度コメント
priorities.yml の `kv-cache-quant` focus にマッチ → priority HIGH。calibration-free かつ strong results（Llama-3-70B 5×圧縮）で火曜定例の議題候補。
