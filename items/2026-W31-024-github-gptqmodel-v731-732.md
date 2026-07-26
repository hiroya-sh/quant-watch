---
id: "2026-W31-024"
type: github
subtype: library
title: "GPTQModel v7.3.1 / v7.3.2 — Laguna S 2.1・Solar-Open2・Inkling 対応、ModelOpt NVFP4 dequant サポート"
url: "https://github.com/ModelCloud/GPTQModel/releases/tag/v7.3.2"
discovered: "2026-07-27"
published: "2026-07-25"
repo: "ModelCloud/GPTQModel"
release_tag: "v7.3.1 / v7.3.2"
models: []
architectures: [moe]
methods: [GPTQ, NVFP4]
tech: [weight-only, mixed-precision]
priority: normal
sources: [github-releases]
status: new
verified: "2026-07-27 gh api で両リリースの body 取得・published_at 確認 (v7.3.1: 2026-07-20, v7.3.2: 2026-07-25)"
related: ["2026-W31-027"]
---

## 日本語要約
週内に2連続のパッチリリース。新モデル対応が主軸: **Laguna S 2.1**(poolside、[[items/2026-W31-027-hf-model-unsloth-laguna-s21-gguf|今週の量子化ウェーブ]]の対象)、**solar_open / solar_open2**(Upstage)、**inkling**、intern_s2_preview、deepseek_vl/vl_v2、deepseek_ocr2、nemotron_h_puzzle。機能面では **ModelOpt NVFP4 チェックポイントの dequantization 対応** (#2948)、mixed-bitwidth モデルの per-module 動的カーネル選択修正 (#2973)、量子化コードのクランプ修正 (#2963)、量子化埋め込み推論のバックエンド選択修正 (#2971)、大型 MoE 保存の O(N²) ボトルネック解消 (#2945)。

## 量子化関連の変更点
- 新規対応手法/フォーマット: ModelOpt NVFP4 の dequant 読み込み
- 既存手法の改善: mixed-bitwidth カーネル選択、MoE 保存高速化、Windows ExLlamaV2 カーネル修正
- 対応モデル拡張: Laguna S 2.1 / Solar-Open2 / Inkling ほか7ファミリ

## 影響範囲
- ユーザ視点の変化: 今週登場の新モデル群を即 GPTQ 量子化できる。NVFP4 チェックポイントを GPTQModel 経由で扱う相互運用が向上
- API/CLI 変更の有無: なし(Transformers 5.14 API 追従)

## 注目度コメント
新モデル対応の速さ(Laguna 公開から数日)が GPTQ エコシステムの健在ぶりを示す。NVFP4 dequant は補助機能のため priority は normal のまま。
