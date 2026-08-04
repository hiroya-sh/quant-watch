---
id: "2026-W30-025"
type: github
title: "intel/auto-round v0.14.1 / v0.14.2 — GGUF の weight/scale 不一致修正ほか"
url: "https://github.com/intel/auto-round/releases/tag/v0.14.2"
discovered: "2026-07-20"
published: "2026-07-13"
repo: "intel/auto-round"
models: []
architectures: []
methods: [AutoRound, GGUF]
tech: [ptq]
priority: watching
sources: [github-releases]
status: new
verified: "2026-07-20 gh api で release body 取得・published_at 確認(v0.14.1 / v0.14.2 とも 2026-07-13)"
related: []
---

## 日本語要約
同日に出たパッチ2連。v0.14.2 は **GGUF フォーマットでの weight と scale の不一致修正**(#2014)、CLI が bits/act_bits 未指定時に --scheme を無視する問題の修正(#2019)ほか。v0.14.1 は SAGE attention カーネルの smooth_k パラメータ公開と transformers バージョン制限解除。

## 注目度コメント
バグフィックス中心。AutoRound で GGUF 出力していた場合は v0.14.2 未満に精度バグの可能性がある点だけ注意。watching。
