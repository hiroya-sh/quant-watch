---
id: "2026-W30-004"
type: paper
title: "Smarter and Cheaper at Once: Byte-Exact KV-Cache Grafting Turns a Frozen Small Model into a Verified-Knowledge Flywheel"
url: "https://arxiv.org/abs/2607.14431"
discovered: "2026-07-20"
published: "2026-07-15"
authors: []
venue: "arXiv (cs.CL, cs.AI, cs.LG, cs.PF)"
models: []
architectures: []
methods: []
tech: [_uncategorized]
priority: watching
sources: [arxiv, hf-papers]
status: new
verified: "2026-07-20 arXiv API 直取得 + HF daily_papers 2026-07-17 掲載確認(▲9)"
related: []
---

## 日本語要約
検証済み知識を byte-exact な KV state アーティファクトとして一度だけ保存し、後で新しい推論コンテキストへ「移植(graft)」する手法。固定シード構成下で graft 後の logits が再計算と SHA-256 一致(KL=0、argmax 一致 100%)というビット厳密性を 12B/31B の2スケールで検証。重み変更なしに小型モデルを賢く・安くする。

## 手法
own-position graft が浮動小数点 RoPE を持つモデルで唯一の数値厳密な動作点であることを示し、KV アーティファクトの保存→復元プロトコルを設計。

## 評価
- 対象モデル: 12B / 31B(詳細モデル名は本文)
- ビット幅: N/A(量子化ではなく KV 再利用)
- 精度劣化: byte-exact(劣化ゼロを実証)
- スループット/メモリ: プリフィル再計算の削減でコスト減

## 既存手法との差分
prompt cache / prefix cache と違い、位置とビット厳密性を保証した「知識アーティファクト」として KV を永続化・再配布する点。

## 注目度コメント
量子化ではないが KV cache 運用の新パラダイム候補。taxonomy 未該当のため _uncategorized / watching。新規 tech タグ候補: kv-cache-grafting。
