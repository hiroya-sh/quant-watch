---
id: "2026-W31-030"
type: hf-model
title: "microsoft/VibeVoice-ASR-BitNet — Microsoft 公式の三値 BitNet ASR(ggml/GGUF 配布)"
url: "https://huggingface.co/microsoft/VibeVoice-ASR-BitNet"
discovered: "2026-07-27"
published: "2026-07-24"
base_model: "microsoft/VibeVoice-ASR"
models: []
architectures: [transformer]
methods: []
tech: [low-bit-1bit, weight-only, qat]
priority: normal
sources: [hf-models]
status: new
verified: "2026-07-27 HF API で確認 (createdAt 2026-07-24, downloads 665, tags: ggml/gguf/bitnet/quantization/cpu-inference, en/zh)"
related: ["2026-W31-007"]
---

## 日本語要約
Microsoft 公式の ASR モデル BitNet 圧縮版。VAE 音響トークナイザは INT8 (I8_S)、自己回帰 LM 部は BitNet 式三値重み (I2_S) という異種量子化構成([[items/2026-W31-007-paper-vibevoice-asr-bitnet|同週の技術報告]]参照)。ggml ベースのカスタム SIMD カーネルで 3 CPU スレッドの
リアルタイム認識 (RTF<1) を主張。GGUF 形式で配布されるが実行は専用 ggml ランタイム前提(素の llama.cpp ではない)点に注意。

## 量子化仕様
- ベースモデル: microsoft/VibeVoice-ASR
- 量子化手法: BitNet 三値 (I2_S) + INT8 (I8_S)、progressive QAT
- ビット幅: 三値(~1.58bit 相当)+ INT8
- 量子化対象: weight(ステージ別異種構成)
- ファイルフォーマット: ggml/GGUF

## 精度報告(あれば)
- ベンチマーク: Whisper.cpp 比 1.6-2.3x 高速(同サイズ帯 ~1.6 GB)
- 劣化幅: FP16 比 modest(技術報告)

## ダウンロード/利用状況
665 DL(公開後約3日)。en/zh 対応。

## 注目度コメント
W30 の bitnet-embedding に続く Microsoft BitNet 展開の第2弾(埋め込み→ASR)。生成 LLM 以外への三値化適用が「点」から「線」になってきた。BitNet は2週連続出現で methods タグ候補。
