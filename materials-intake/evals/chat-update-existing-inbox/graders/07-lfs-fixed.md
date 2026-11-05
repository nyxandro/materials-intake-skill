---
type: llm
focus: trace
weight: 1
---

The catch-all inbox/** Git LFS rule is replaced with per-format rules for heavy files, and the text files under inbox/ that were stored in LFS are re-added so that git stores them as ordinary files, without rewriting history
