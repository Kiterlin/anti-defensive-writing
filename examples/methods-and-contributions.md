# Case Study: Methodology & Contribution Statements

A draft contribution paragraph. The architecture, measured gains, and evaluation scope are already in the paragraph. The rewrite changes framing, not results.

## Scenario

A machine learning paper introducing an efficient attention mechanism for long-sequence modeling.

## Before

> It is important to emphasize at the outset that we do not claim our architecture is superior in all computational benchmarks, nor does it completely solve the quadratic memory complexity of transformers at every sequence length. Given the cost of training multi-billion-parameter models, our evaluation is restricted to standard 32k-token baselines. Nevertheless, we attempt to introduce SparseBlock, a sparse block-diagonal attention mechanism that might provide a modest 2.4× throughput improvement and a 42% reduction in peak VRAM, with little change in perplexity (<0.08). We are not arguing that this model is preferable for models exceeding 70B parameters, where scaling remains untested.

## Classification

| Text | Function | Action |
| :--- | :--- | :--- |
| "do not claim... superior in all benchmarks"; "does not completely solve... every sequence length"; "It is important to emphasize at the outset" | unnecessary disclaimer | delete |
| "attempt to introduce"; "might provide a modest" | self-undermining contribution; excessive hedging | state the contribution and the measured gains |
| SparseBlock; block-diagonal attention; 2.4× throughput; 42% less peak VRAM; perplexity change <0.08 | contribution and evidence | lead with these |
| evaluation on standard 32k-token baselines; scaling above 70B untested | necessary scope condition | keep as positive scope, once, without apology |

## After

> This paper introduces SparseBlock, a block-diagonal attention mechanism for long-sequence inference. On standard 32k-token benchmarks, SparseBlock improves throughput by 2.4× and reduces peak VRAM by 42%, with perplexity change below 0.08. Scaling above 70B parameters is untested.

## What this rewrite does

- Leads with the contribution and the measured results.
- States the 32k-token evaluation setting as the scope of those results, not as a shortcoming.
- Keeps "above 70B is untested" as a real limit.
- Does not add sequence lengths, baselines, or metrics that were absent from the draft.
