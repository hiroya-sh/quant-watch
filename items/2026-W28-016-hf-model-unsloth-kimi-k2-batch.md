---
id: "2026-W28-016"
type: hf-model
title: "unsloth/Kimi-K2.7-Code-GGUF"
url: "https://huggingface.co/unsloth/Kimi-K2.7-Code-GGUF"
discovered: "2026-07-07"
published: "2026-07-04"
base_model: "moonshotai/Kimi-K2.7"
models: [moonshotai/Kimi-K2.7]
architectures: [transformer, moe]
methods: [GGUF]
tech: [weight-only, moe-quant, low-bit-4, llamacpp-ready]
priority: normal
sources: [hf-models]
status: verified-minimal
verified: "2026-07-07 unsloth/Kimi-K2.7-Code-GGUF の実在確認。旧URL(Kimi-K2.7-140B-GGUF)は404。K2.7は1T級MoE(32B active)で'140B dense'は誤り。ベンチ表・DL数は捏造のため削除。"
related: [2026-W27-017]
---

## 日本語要約
unsloth による Kimi K2.7 の GGUF 量子化。**`unsloth/Kimi-K2.7-Code-GGUF` の実在確認済み**。旧版の「140B/320B-A32B の FP8/GGUF/AWQ 6モデル」「精度表」「ダウンロード数」は裏取りできず削除。Kimi K2.7 は 1T 級 MoE（約32B active）で「140B dense」という記述は誤り。

## 確認できた事実
- `unsloth/Kimi-K2.7-Code-GGUF` が実在（GGUF, ローカル推論向け）
- moe-quant(focus tech) に間接ヒット

## 注目度コメント
Kimi 系の追従。focus 直撃なし。詳細は model card 参照。
