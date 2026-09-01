---
id: "2026-W35-022"
type: github
subtype: library
title: "causal-conv1d v1.7.0"
url: "https://github.com/Dao-AILab/causal-conv1d/releases/tag/v1.7.0"
discovered: "2026-09-01"
published: "2026-08-20"
repo: "Dao-AILab/causal-conv1d"
release_tag: "v1.7.0"
models: []
architectures: [mamba, state-space-model]
methods: []
tech: []
priority: watching
sources: [github]
status: new
related: []
---
## 日本語要約
進行中プロジェクト周辺の依存ライブラリ。小規模リリースで量子化要素はない。

## 量子化関連の変更点(release body 全文スキャン)
- 量子化関連: **なし**
- `Support initial states with packed sequences` (#118)
- version bump to 1.7.0 (#120)

## focus 突合(release 本文全文検索)
- focus method / model いずれも出現なし

## 影響範囲
- packed sequence で initial state を渡せるようになるため、可変長バッチの SSM 前処理が簡潔になる。

## 注目度コメント
watching。Mamba/GLA 系の依存更新として記録のみ。
