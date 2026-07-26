---
id: "2026-W31-007"
type: paper
title: "VibeVoice-ASR-BitNet Technical Report"
url: "https://arxiv.org/abs/2607.21075"
discovered: "2026-07-27"
published: "2026-07-23"
authors: []
venue: "arXiv (cs.SD, cs.CL, eess.AS)"
models: []
architectures: [transformer]
methods: []
tech: [qat, weight-only, low-bit-1bit, llamacpp-ready]
priority: normal
sources: [arxiv]
status: new
verified: "2026-07-27 arXiv API 直取得(ID/タイトル一致確認済み)。HF モデル microsoft/VibeVoice-ASR-BitNet も HF API で実在確認"
related: ["2026-W31-030"]
---

## 日本語要約
Microsoft の ASR モデル VibeVoice-ASR をエッジ CPU リアルタイム推論向けに圧縮した技術報告。ステージごとに異質な量子化を適用: VAE 音響トークナイザは INT8 フルパイプライン (I8_S) + カーネル融合/SIMD、自己回帰 LM 部は BitNet 式三値重み (I2_S)。精度維持のため progressive QAT を採用。ggml フレームワーク上に ARM/x86 向けカスタム SIMD カーネルと融合オペレータを実装し、3 CPU スレッドで RTF < 1 のリアルタイム認識を達成。

## 手法
「ステージ特性に合わせた異種量子化」: 音響段 INT8、言語段三値。progressive QAT で急進的圧縮下の精度を保全。

## 評価
- 対象モデル: VibeVoice-ASR (~1.6 GB クラス)
- ビット幅: INT8 (VAE) + 三値 I2_S (LM)
- 精度劣化: FP16 ベースライン比「modest」
- スループット/メモリ: 同サイズ帯の Whisper.cpp 比 1.6-2.3x 高速、3スレッドで RTF<1

## 既存手法との差分
BitNet 三値化を音声認識のマルチステージ構成に適用し、公式モデル([[items/2026-W31-030-hf-model-microsoft-vibevoice-bitnet|HF で公開]])と ggml 実装まで揃えて出荷した点。

## 注目度コメント
W30 の microsoft/bitnet-embedding に続き、Microsoft が BitNet 系三値化を生成 LLM 以外(埋め込み→ASR)へ展開する流れの2週連続の実例。エッジ CPU 推論の実用データ点として価値あり。
