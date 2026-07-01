# PhysisFold — Validation Data Room

This data room presents the validation evidence for **PhysisFold**, a constraint-guided
protein structure prediction and refinement engine: given distance evidence (experimental
restraints, a homology template, or an existing predicted model), it searches the backbone
conformational space and returns a physically valid all-atom structure.

It contains **two validation studies** — each with its own scientific report — and **two
capability demonstrations**, together with the underlying per-target records from which
every reported number is computed.

## Validation studies

| Study | Scope | Report |
|---|---|---|
| **General Benchmark** | Breadth and robustness across 38 diverse experimental proteins (12–107 aa, X-ray + NMR) | [`general_benchmark/report.md`](general_benchmark/report.md) |
| **GLP-1 / Incretin Family** | Focused validation on the incretin peptide family and its sequence-variant impurities, for analytical-development use | [`glp_1_family/report.md`](glp_1_family/report.md) |

The two reports are non-overlapping: the General report establishes breadth and robustness;
the Family report establishes the family-specific use case. The input self-consistency
capability is shown separately as a standalone demonstration (below). Each keeps its own
numbers; this index frames and points.

- **For a method-level / due-diligence view**, start with the **General Benchmark report**:
  full-evidence sub-Ångström accuracy, graceful degradation as distance evidence is withdrawn
  or corrupted, physically valid all-atom output, and net-positive refinement of independent
  de-novo models.
- **For the incretin (GLP-1 family) use case**, read the **Family report**: folding within
  the helical-peptide regime and direct consumption of real deposited NMR restraints. The
  differentiating capability — blind detection and residue-level localization of
  contradictory restraints — is demonstrated in [`conflict_demo/`](conflict_demo/).

## Capability demonstrations

Two worked, fully traceable examples of capabilities a generic single-sequence predictor
does not provide. Each is self-contained and independently verifiable from its own files,
and each underpins a result in one of the studies above.

| Demonstration | What it shows | Folder |
|---|---|---|
| **Input self-consistency auditing** | Blind detection and residue-level localization of contradictory distance restraints, with a contradiction dose-response on two named GLP-1-family drugs (PDB 3IOL = GLP-1, 1JRJ = exendin-4) | [`conflict_demo/`](conflict_demo/) |
| **Blind seed selection** | The deployed reference-free selector recovers the best available model without ever consulting the experimental structure, across the full panel | [`seed_selector_analysis/`](seed_selector_analysis/) |

These tie back to the studies: the conflict demonstration is the standalone evidence for the
input self-consistency capability referenced in the **Family report (§5.3)**; the
seed-selection analysis is the panel-wide evidence behind the neutrality
(blind-not-cherry-picked) result in the **General Benchmark report (§5.4)**.

## What is here

```
PhysisBench/
├── general_benchmark/          Study 1 — breadth & robustness (38 proteins)
│   ├── report.md                 the General Benchmark report
│   ├── aggregate_all.csv          master per-target result table
│   ├── evidence_ladder/           full / sparse (50–80% withheld) / distance noise
│   ├── model_refinement/          refinement of independent priors (AlphaFold2, ESMFold, templates)
│   ├── experimental_restraints/   folding from disulfide locks and solution-NMR NOE
│   ├── fusion/                    experimental restraints combined with structural priors
│   └── gap_filling/               self-supplied recovery of sparse evidence (+ matched control)
├── glp_1_family/               Study 2 — incretin family & sequence-variant impurities
│   ├── report.md                 the Family validation report
│   └── <condition>/<id>/          per-fold structures and value layer across the evidence ladder
├── conflict_demo/              Capability — input self-consistency auditing (GLP-1 + exendin-4)
└── seed_selector_analysis/     Capability — blind vs native seed selection (panel-wide)
```

Each per-target directory holds the predicted structure, the per-residue and aggregate
scores, the candidate ensemble, and the human-readable value layer, so every figure in the
reports is re-derivable from the records on disk.

## Provenance & integrity

- All scoring references are **real, deposited RCSB experimental structures** — no synthetic
  or decoy structure is ever used as ground truth. Degraded, noisy, and contradictory
  conditions are controlled perturbations of the evidence *input*, never of the reference.
- **Folding is blind:** the engine selects its returned model by an internal criterion; the
  experimental reference enters only the post-hoc scorer.
- Every figure in each report is computed directly from the per-target records provided
  alongside it and is independently re-scorable.

*Reports follow FDA computational-credibility / ASME V&V40 conventions, CASP metric
definitions, and the Weber et al. (2019) benchmarking guidelines.*
