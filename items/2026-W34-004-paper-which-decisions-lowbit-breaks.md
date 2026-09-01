---
id: "2026-W34-004"
type: paper
title: "Which Decisions Low-Bit Quantization Breaks, and How to Predict Them"
url: "https://arxiv.org/abs/2608.06564"
discovered: "2026-08-17"
published: "2026-08-07"
authors: [Zekun Wu, Swati Dhiman, Adriano Koshiyama]
venue: "arXiv"
models: []
architectures: []
methods: [AWQ, GPTQ, GGUF]
tech: [low-bit-2, low-bit-3, ptq]
priority: high
sources: [arxiv]
status: updated
related: []
---
## 日本語要約
「4bit 未満で量子化が壊れる」は既知だが、どの判断が変わるかは予測できなかった。本研究は**margin(選択肢の1位と2位のスコア差)**を量子化前後で追跡し、16モデル・8ファミリを RTN/AWQ/GPTQ/GGUF・8→2bit で測定。損傷はノイズ一定ではなく**margin 収縮**(乗算的縮小: 中央値 4bit で0.86、3bit で0.33、2bit で0.00)。ベンチスコアはほぼ不変でも、compressed agent は3bit で tool 呼び出しをやめ、さらに1bit 下で安全拒否の約半分を失う。

## 手法
margin の縮小係数をビット幅の関数としてモデル化し、「行動を伴う判断(tool 使用・安全拒否)」が benchmark 精度より先に崩れる機序を提示。

## 評価
- 対象: 16モデル/8ファミリ (RTN=16, AWQ=7, GPTQ=2, GGUF=1)
- ビット幅: 8〜2bit
- 知見: 3bit で tool 呼び出し崩壊、2bit で margin ほぼ消失

## 既存手法との差分
「加算的固定ノイズ」仮定を否定し、乗算的 margin 収縮を実測。精度ベンチでは見えない agent/safety の劣化を予測可能にする。

## 注目度コメント
量子化の“見えない劣化”を定量化する重要な分析。agent/安全性を扱う下流にとって bit 選択の指針になる(v2 更新)。
