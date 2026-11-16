---
id: "2026-W47-026"
type: paper
title: "KVPath: Connecting Key-Value Representations Across Transformer Layers"
url: "https://arxiv.org/abs/2611.16072"
discovered: "2026-11-16"
published: "2026-11-12"
authors: [arxiv:2611.16072]
venue: "arXiv:2611.16072"
models: []
architectures: [transformer]
methods: []
tech: [kv-cache-quant, mixed-precision, latent-compaction]
priority: normal
sources: [arxiv]
status: new
related: [2026-W46-depthgraft]
---

## 日本語要約
Transformer は各トークンの各層ごとに独立に KV を保持するが、近接層間で **強い相関**がある。KVPath は 隣接層の KV が **low-dim delta で記述できる**と仮定し、full KV を全層保持せず **1 層の KV + 層間 delta 系列**で表現する。

## 手法
- base KV(1-2 層)+ 残り層は delta (低次元 projection)
- 量子化と直列合成: delta は精度低く(2-bit)、base は 8-bit で持つ
- 既存 attention と互換(decode 時に reconstruct)

## 評価
- Llama / Qwen 系で KV メモリ削減 vs. accuracy
- base layer 数 / delta bit を sweep

## 既存手法との差分
W46 DepthGraft (cross-layer KV 再構成) と**同じアイデア空間**で、本稿は path (sequence of deltas) 構造を陽に使う。

## 注目度コメント
長文脈推論の KV メモリが主要ネックな現状、cross-layer 冗長性を使うアプローチは**既存の per-token eviction と直交**。両方を組めば KV メモリをさらに削れる見込み。
