---
id: "2026-W35-019"
type: github
subtype: library
title: "GPT-QModel v7.3.4"
url: "https://github.com/ModelCloud/GPTQModel/releases/tag/v7.3.4"
discovered: "2026-09-01"
published: "2026-08-20"
repo: "ModelCloud/GPTQModel"
release_tag: "v7.3.4"
models: []
architectures: [transformer]
methods: [GPTQ, AWQ]
tech: [weight-only, low-bit-3, mixed-precision, rotation, calibration]
priority: high
sources: [github]
status: new
related: []
---
## 日本語要約
**3/5/6/7-bit を扱える planar チェックポイント形式 `gptq_p` の追加**と、Blackwell 向け **Swordfish カーネル**(GPTQ/AWQ)が目玉。低bit化ウォッチとしては、llm-compressor 0.13.0 の「任意ビット幅 dense packing」と同じ方向の動きが GPTQ 系でも起きた形。

## 量子化関連の変更点(release body 全文スキャン)
- **`gptq: add planar (gptq_p) checkpoint format with 3/5/6/7-bit support`** (#2996)
- **`feat: Swordfish kernel for Blackwell (GPTQ/AWQ)`** (by AlpinDale, #2997) + レビュー反映 (#2999)
- `fix(rotation): persist rotation config and apply online Hadamard for inference and calibration` (#2980) — **rotation 設定を永続化し、推論・校正の両方でオンライン Hadamard を適用**
- QQQ の per-device Hessian partial による多GPU校正の平準化 (#2979)、in-place Hessian 累積によるメモリ削減 (#2981)
- `fix(qlinear): size pack_original qweight/qzeros by bits/32 for 3-bit GPTQ` (#2984)、`size GPTQ buffers by bits/pack_dtype_bits` (#2985) — **3bit の buffer サイズ計算の修正**
- marlin の scale permutation テンソルをキャッシュし index_select 化 (#2988)
- `fix(runtime): support vLLM 0.26 and SGLang 0.5.16` (#2991)

## focus 突合(release 本文全文検索)
- NVFP4 / TurboQuant / PolarQuant / QJL / gemma-4: 出現なし
- 低bit(3bit): **該当あり**

## 影響範囲
- 3bit GPTQ を試す場合、v7.3.4 未満は buffer サイズ計算が誤っている。
- vLLM 0.26 対応が明記されたが、**v0.28.0 対応は未記載**(W36 の v7.3.5/7.3.6 でも未言及)。

## 注目度コメント
`gptq_p` の 3/5/6/7bit と llm-compressor の W2-W7 が同時期に出てきた。**「非2冪ビット幅の実行系」が2026年後半のテーマになりつつある**。
