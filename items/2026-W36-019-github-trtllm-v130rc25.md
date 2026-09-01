---
id: "2026-W36-019"
type: github
subtype: engine
title: "TensorRT-LLM v1.3.0rc25"
url: "https://github.com/NVIDIA/TensorRT-LLM/releases/tag/v1.3.0rc25"
discovered: "2026-09-01"
published: "2026-08-31"
repo: "NVIDIA/TensorRT-LLM"
release_tag: "v1.3.0rc25"
models: [google/gemma-4, MiniMaxAI/MiniMax-M3, moonshotai/Kimi-K2.7, deepseek-ai/DeepSeek-V4]
architectures: [transformer, moe, hybrid]
methods: [NVFP4, MXFP4]
tech: [trtllm-ready, kv-cache-quant, low-bit-fp4, low-bit-fp8, moe-quant, sparse-attention]
priority: normal
sources: [github]
status: new
related: []
---
## 日本語要約
**KV cache manager V2 を Gemma 3 / Gemma 4 / GPT-OSS で既定化**したのが最大の変更。V2 が推奨アーキテクチャで、新モデルは全て V2 既定、既存モデルも順次移行、V1 は廃止予定と明言された。量子化そのものより **KV 管理基盤の世代交代**が主題。

> 注: 公開時刻は 2026-08-31 12:24 JST で、本来の W36 窓(-08-31 00:00 JST)をわずかに超えるが、キャッチアップのため本週に取り込む。

## focus 突合(release body 全文スキャン)
- **NVFP4: 該当あり** — Kimi K3 の SiTU MegaMoE + NVFP4 対応 (#17624, #17865, #17940)、NVFP4 batched-GEMV の grid 軸入れ替え(大出力次元対応, #17660)、GLM 4.5 NVFP4 の既知不具合、Mistral Large 3 NVFP4 EAGLE MoE の既知不具合
- **google/gemma-4: 該当あり** — KV cache manager V2 を Gemma 3 / Gemma 4 で既定化 (#16942, #17396)、SM120/SM121 で Gemma4 に FlashInfer FA2 を選択 (#17557)、Hopper での Gemma4 FA2 CUDA Graph デコード安定化 (#18002)、Gemma4 の shared-KV draft ロード復旧 (#17837, #17264)
- TurboQuant / PolarQuant / QJL: 出現なし

## 量子化関連の変更点
- **INT8 weight-only (W8A16) MoE を non-gated 活性で有効化** (#15550)
- SM90 の FP8 block-scale 量子化を fuse し routing カーネルを分割して MoE 実行を最適化 (#16849, #17893)
- Kimi K3 の KDA projection と routing quantization の融合 (#17311 ほか)
- MiniMax-M3 sparse attention の paged KV アクセス・**FP8 indexer QK**・block 選択改善 (#16857 ほか)
- dense FP8 LoRA のエンドツーエンド対応 + Blackwell FP8 対応 (#16810, #17521)
- Qwen3.5 FP8 row-wise チェックポイントマッピング修正 (#17433)、Qwen3.8 27B FP8 VLM 量子化設定の正規化 (#17786)
- KV cache manager V2 の拡張: DSA 対応・zero-copy token passing・分散プールリバランス・Helix decode context parallelism (#16060 ほか)、cold-page codec (#17512)
- 未量子化チェックポイントに対する static VisualGen 量子化レシピを拒否 (#17699)

## 既知の問題(release note 記載)
- Gemma 4 を含む複数モデルで生成が無限ハングしうる
- KV cache manager V2 のスケジューラが B200 で断続的にクラッシュ/OOM しうる
- **GLM 4.5 NVFP4 の disaggregated NIXL serving(KV cache manager V1)は精度ゼロで完了しうる**
- MiniMax-M3 MXFP8 のモデル構築は非対応

## 注目度コメント
rc かつ既知不具合が多いので priority は normal。ただし **Gemma 4 まわりの修正が集中**しており、focus model を TRT-LLM で動かす場合は本 rc 以降が前提。
