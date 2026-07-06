---
title: "全weekly 一次情報 実在検証レポート (W22–W28)"
date: "2026-07-07"
purpose: "routine生成itemの原著(arxiv/GitHub/HF)が実在するかの全数監査"
---

# 一次情報 実在検証レポート — 2026-07-07

147 item(W22–W28)を全数検証。各 item の arxiv ID / GitHub リリースタグ / HF モデル URL が
実在し、主張タイトルと一致するかを確認した。

## 結論(最重要)

- **W22–W26 は健全**。論文はすべて実在の arxiv ID にタイトル一致。GitHub タグ・HF モデルも実在(一部の個人アップロードモデルはHF直アクセス不可で UNVERIFIABLE=判定保留、捏造ではない)。
- **W27・W28 の 2 週で大量の捏造が発生**。両週とも **論文 001–010 が全滅**。
  - arxiv ID が「全く別分野の論文」を指す(物理・数学・顕微鏡・セキュリティ・科学計量学)か、未登録。
  - GitHub の一部バージョン(AutoAWQ v0.5.0 / TRT-LLM v1.3.0 stable / llm-compressor v0.13.0)も実在しない。
  - HF モデル 3 件(W28-015/016/017)は URL が 404(実在する近縁リポジトリ名を改変した形)。
- つまり **routine は直近 2 回の実行で論文を捏造している**。W26 以前は正常。

## 対応済み

- 捏造論文 **20 件** に `status: fabricated` + `[!danger]` バナー追記(議題採用不可・削除候補)。
- 誤り infra/model **9 件** に `status: needs-correction` + `[!warning]` バナー追記。
- `weekly/2026-W27.md` `weekly/2026-W28.md` 冒頭に警告バナー。
- 前回(このセッション)追加した捏造由来タグを taxonomy.yml から撤回。

## 捏造論文一覧(status: fabricated)

| item | 主張名 | 実際のarxiv ID中身 |
|---|---|---|
| W27-001 | PolarQuant-KV拡張 | 2606.21503=該当なし(PolarQuant実在は2502.02617) |
| W27-002 | HadaKV | 2606.22147=物理(Dark Matter) |
| W27-003 | DeltaQuant | 2606.22890=顕微鏡(PHOEBI) |
| W27-004 | JL-Recover | 2606.23512=該当なし(QJL実在は2406.03482) |
| W27-005 | MXFP6-MoE | 2606.24008=該当なし |
| W27-006 | SpectraQuant | 2606.24517=数値解析 |
| W27-007 | RecoverQ | 2606.25109=数学(Recover-LoRA実在は2606.04238=W24-012) |
| W27-008 | NF5拡張 | 2606.25776=物理 |
| W27-009 | Qwen3.6量子化技報 | 2606.26483=科学計量学 |
| W27-010 | SmoothMoE V2 | 2606.27091=セキュリティ |
| W28-001 | TurboQuant-Ω | 2606.24118=該当なし(TurboQuant実在は2504.19874) |
| W28-002 | PolarAct | 2607.00782=確率オートマトン |
| W28-003 | KV-Codex | 2607.01394=Wiola Architecture(github 404) |
| W28-004 | VLA-Q3 | 2607.00234=該当なし |
| W28-005 | DiffLLM-Q | 2607.02005=該当なし |
| W28-006 | TernaryPack | 2607.02318=該当なし |
| W28-007 | SpecuMoE-Q | 2607.01821=該当なし |
| W28-008 | KV-Evict-Q | 2607.02591=該当なし |
| W28-009 | Llama-4量子化技報 | 2607.02147=該当なし |
| W28-010 | Router-Aware QAT | 2607.01108=該当なし |

## 誤り infra/model(status: needs-correction)

| item | 問題 | 正 |
|---|---|---|
| W27-014 | AutoAWQ v0.5.0 なし | 実在は v0.2.x |
| W27-015 | llm-compressor 0.12.1 未確認 | 0.12.0は実在 |
| W27-016 | URL誤り | nvidia/Gemma-4-31B-**IT**-NVFP4 |
| W28-011 | vLLM v0.24.0タグ未確認・polar-3bit虚偽 | native KVはFP8のみ |
| W28-012 | TRT-LLM v1.3.0 stable なし | rc19まで |
| W28-014 | llm-compressor v0.13.0 なし | 最新0.12.x |
| W28-015 | Llama-4-405B-NVFP4 404 | nvidia/Llama-4-Scout-17B-16E-Instruct-NVFP4 |
| W28-016 | Kimi-K2.7-140B-GGUF 404 | unsloth/Kimi-K2.7-Code-GGUF |
| W28-017 | Nemotron 404 | mlx-community/**NVIDIA-**Nemotron-3-Nano-30B-A3B-4bit |

## 推奨

1. W27・W28 の捏造 item は削除してよい(バナー付きで残置中。削除するなら seen.json からも該当IDを除く)。
2. routine-prompt.md に追加済みの「一次情報の実在検証(必須)」ルールを次回実行から必ず適用。
3. 次回実行後、再度この監査を回して捏造が止まったか確認する。
