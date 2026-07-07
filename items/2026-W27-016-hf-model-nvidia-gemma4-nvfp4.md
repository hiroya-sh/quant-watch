---
id: "2026-W27-016"
type: hf-model
title: "nvidia/Gemma-4-31B-IT-NVFP4"
url: "https://huggingface.co/nvidia/Gemma-4-31B-IT-NVFP4"
discovered: "2026-07-07"
published: "2026-06-26"
base_model: "google/gemma-4-31B-it"
models: [google/gemma-4]
architectures: [transformer]
methods: [NVFP4]
tech: [low-bit-fp4, weight-only, activation-quant, vllm-ready]
priority: high
sources: [hf-models]
status: verified-minimal
verified: "2026-07-07 nvidia/Gemma-4-31B-IT-NVFP4 の実在確認(旧URLは'-IT-'欠落で誤り)。12B/26B-A4B の nvidia版NVFP4は未確認のため除外。ベンチ数値・DL数は捏造だったため削除。"
related: [2026-W24-008, 2026-W25-018]
---

## 日本語要約
NVIDIA 公式の **google/gemma-4-31B-it** の NVFP4 量子化モデル。**リポジトリ実在確認済み**。旧版にあった具体的なベンチ数値表・ダウンロード数・12B/26B-A4B 併載は一次情報で裏取りできず削除（12B は W24-008 の AxionML 版=コミュニティが実在、nvidia 公式 12B/26B-A4B NVFP4 は未確認）。

## 確認できた事実
- 正しい ID は `nvidia/Gemma-4-31B-IT-NVFP4`（'-IT-' が必要）
- NVFP4 重み・活性量子化、focus の google/gemma-4 + NVFP4 に直撃、vllm-ready

## 注目度コメント
focus 二重ヒット(gemma-4 + NVFP4)かつ vllm-ready。議題候補。精度表は公式 model card を参照のこと。
