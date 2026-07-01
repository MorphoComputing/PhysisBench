# Blind Seed Selection — Reference-Free vs Oracle

**Scope:** all **332 folds** of the General Benchmark, across nine evidence conditions.

For each target the engine produces an ensemble of independent candidate folds and returns
one. The benchmark reports the engine's **best available** candidate per target — its true
ceiling, identified *with* knowledge of the experimental reference. A real user, however,
folds an **unknown** target: there is no reference to rank against, so the candidate that
actually ships is chosen by a **reference-free** selector. This analysis quantifies the gap
between the two across the entire panel — and therefore shows that the benchmark's headline
accuracy is **not an artifact of reference-informed selection**.

## The reference-free selector

Two stages, both blind to the experimental structure:

1. **Reference-free score** — each candidate is ranked by how well it satisfies the input
   distance evidence combined with its stereochemical validity (lower is better). No native
   coordinates enter.
2. **Structural consensus** (engages once the ensemble is large enough) — the correct fold
   is the *reproducible* one. Candidates are clustered by pairwise CA-RMSD and, when a
   majority cluster exists, its **medoid** — the most-agreed structure — is shipped. This
   rescues heavily under-determined inputs, where the score alone can be misled by a globally
   wrong fold that happens to satisfy sparse evidence.

## Head-to-head: blind (deployed) vs oracle (ceiling)

*exact-best* = the blind selector shipped the **same** candidate the oracle would (zero
regret); *regret* = blind-deployed CA-RMSD − oracle CA-RMSD (Å). Condition labels below map
to the keys in `head_to_head_summary.csv`.

| Evidence condition | Targets | exact-best | ≤ 0.5 Å | ≤ 1 Å | mean regret | median | max |
|---|---|---|---|---|---|---|---|
| Full evidence | 38 | 82% | 100% | 100% | 0.005 | 0.000 | 0.13 |
| Sparse (50% withheld) | 38 | 87% | 95% | 95% | 0.161 | 0.000 | 3.09 |
| Sparse (80% withheld) | 37 | 73% | 84% | 92% | 0.291 | 0.000 | 3.05 |
| Sparse + gap-filling | 38 | 53% | 89% | 89% | 0.367 | 0.000 | 5.67 |
| AlphaFold2 refinement | 33 | 61% | 91% | 91% | 0.433 | 0.000 | 5.71 |
| ESMFold refinement | 38 | 68% | 89% | 92% | 0.203 | 0.000 | 3.71 |
| Template-guided | 34 | 62% | 79% | 88% | 0.382 | 0.000 | 4.43 |
| Distance noise ±1 Å | 38 | 55% | 97% | 100% | 0.039 | 0.000 | 0.56 |
| Distance noise ±3 Å | 38 | 79% | 95% | 95% | 0.207 | 0.000 | 5.70 |
| **All conditions** | **332** | **69%** | **91%** | **94%** | **0.227** | **0.000** | 5.71 |

**Read it as:** with no reference to consult, the blind selector ships **the literal best
candidate in 69% of targets**, and lands **within 0.5 Å of the oracle in 91%** (within 1 Å in
94%). The **median regret is 0.000 Å in every single condition** — on the typical target,
nothing is lost to not knowing the answer.

## What structural consensus buys (the under-determined tail)

On the sparsest condition — 80% of the distance evidence withheld, with self-supplied
gap-filling — the reference-free score alone begins to break down, and structural consensus
roughly **halves** the residual regret:

| Selector | mean regret | median regret |
|---|---|---|
| Score only | 0.609 Å | 0.079 Å |
| **Score + consensus** | **0.367 Å** | **0.000 Å** |

Twelve targets improved, two regressed. A canonical example: on one target the lowest-scoring
candidate is a globally **wrong** fold at **7.16 Å** — the sparse evidence is, perversely,
*better* satisfied by the wrong topology — while the structural-consensus medoid, agreed by a
majority of the ensemble, ships **0.97 Å**, against an oracle ceiling of 0.77 Å. The score is
actively misleading there; reproducibility is not.

## Honest limitations

- **A residual ~6% tail** (the `max regret` column): when the engine folds the *same* wrong
  topology in a majority of the ensemble, no reference-free signal — consensus included — can
  distinguish it from a genuine basin. This is a convergence limit of the search, not a flaw
  of the selector, and it bounds what blind selection can recover.
- **Alternative reference-free discriminators were evaluated** — a physics-based single-point
  energy and topology-consistency heuristics — and did not separate these decoys reliably.
  Structural consensus is the orthogonal signal that proved robust.

## Files

```
head_to_head_summary.csv   the table above — one row per condition (+ an ALL row)
per_target_audit.csv       one row per target: score-only, deployed (score+consensus),
                           oracle ceiling, and the regret of the deployed choice
```

Every figure is reproducible from the saved per-candidate records of the benchmark; no
re-folding is required. This analysis is the panel-wide evidence behind the neutrality result
in the **General Benchmark report (§5.4)**.
