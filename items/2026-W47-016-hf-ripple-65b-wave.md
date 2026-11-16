---
id: "2026-W47-016"
type: hf-model
title: "Ripple-65B (ricursive arch) quantization wave"
url: "https://huggingface.co/mradermacher/Ripple-65B-Heretic-light-i1-GGUF"
discovered: "2026-11-16"
published: "2026-11-14"
base_model: "Ripple-65B-Preview"
models: []
architectures: [dense]
methods: [GGUF]
tech: [weight-only, llamacpp-ready]
priority: normal
sources: [hf-models]
status: new
related: [2026-W47-009-github-llamacpp-v100]
---

## 日本語要約
llama.cpp v1.0.0 (#31692) で正式サポートされた**新 65B dense architecture "ricursive"** の Ripple-65B の配布ウェーブ。本週 7 本の変種が立ち上がる。i1-GGUF(1478 DL, 11-14)が代表。GPTQ / NVFP4 公式配布はまだなく、GGUF 中心。

## 量子化仕様
- 7 モデル(mradermacher×2, kkkamur07×2, osoleve, mchen04, HangGlidersRule)、合計 ~2213 DL
- 代表 mradermacher/Ripple-65B-Heretic-light-i1-GGUF: imatrix i1 系 GGUF
- 他: Heretic uncensor 系の GGUF 配布中心
- ベースモデル Ripple-65B-Preview: dense 65B、新 ops なしで llama.cpp にそのまま乗る

## 精度報告
- 本週時点でベンチ公開なし(model card にも詳細少)。

## ダウンロード/利用状況
- 65B dense の GGUF 配布としては控えめ(Qwen3.8-27B wave の約 1/20)。
- `ricursive` arch は新しく、accuracy baseline が未公開のためコミュニティ検証はこれから。

## 注目度コメント
`ricursive` architecture は taxonomy に未登録。**新規タグ候補 (architectures: ricursive)** に記録。dense 65B で ops を増やさないため llama.cpp 側の負荷は軽く、量子化は weight-only PTQ でそのまま効く見込み。W45 で観察された「新アーキが同週に llama.cpp に乗る」パターンの継続。
