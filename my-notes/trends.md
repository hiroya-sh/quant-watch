# 長期トレンドメモ

週次 weekly/ は粒度が細かいため、**月次〜四半期スパンの傾向**をここに書き溜める。
週次議論で「最近○○が熱い」という観察が出たら追記する。

---

## 2026-Q2

### INT2 KVキャッシュ量子化の成熟 (観察: W22)
OSCAR / OScaR / OCTOPUS が同週に3本出揃った。各手法が互いを意識してベンチマーク比較しており、
研究競争が活発化している。KV超低精度化は「実験的」から「実用候補」フェーズへ移行しつつある兆候。

### Blackwell FP4 (NVFP4/MXFP4) の多前線展開 (観察: W22)
研究論文・OSS実装・コミュニティモデル公開が連動して動いている。
- 研究: Mix-Quant, ThriftAttention, TORQ, MXFP4 RL decomp
- 実装: llama.cpp b9297 (NVFP4 GGUF)、TRT-LLM v1.3.0rc15
- モデル: DeepSeek-V4 NVFP4×2, Qwopus NVFP4
Blackwell GPU の普及期に合わせたエコシステム整備が加速中。

### 動画生成モデルへの量子化適用 (観察: W22)
LongLive-2.0 (2110 upvotes) と Q-ARVD が同週に出現。動画生成は計算コストが高いため
量子化ニーズが大きく、新フロンティアとして台頭している。
