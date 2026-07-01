# Input Self-Consistency Auditing — Worked Demonstration

**Capability:** blind detection and residue-level localization of *contradictory*
distance evidence — the analyst-facing question of **which input to revisit** when fused
restraints (NOE, cross-linking, predicted contacts) disagree.

**Scaffolds:** two named GLP-1-family drugs, folded under one identical configuration:

| PDB | Peptide | Role | Reference | Folded length |
|---|---|---|---|---|
| **3IOL** | GLP-1 | the incretin target itself | X-ray (receptor-bound) | 24 |
| **1JRJ** | exendin-4 / exenatide | marketed GLP-1R agonist | solution NMR | 37 |

This folder is a self-contained, fully traceable demonstration of a capability a generic
single-sequence structure predictor (AlphaFold2, ESMFold) does **not** provide: the engine
audits the internal consistency of its own input distance evidence and, when that evidence
is self-contradictory, raises a conflict signature and localizes the offending residues —
**without ever consulting the experimental structure.**

## The question it answers

A structural-characterization workflow routinely fuses several sources of distance evidence.
When two measurements are mutually incompatible, an analyst needs to know **(a)** that a
contradiction exists and **(b)** which input to revisit first. A generic folder ingests the
sequence and returns a single model with no statement about input consistency; it cannot
raise this flag.

## Method

For each scaffold, three inputs are folded under the **identical** production configuration
(raised distance-bin ceiling, helix prior + ensemble, best-of-10, full all-atom refinement,
blind energy-based selection):

1. **clean** — the dense, internally-consistent distance-restraint input (full evidence).
2. **+1 contradiction** — the same input plus **one** deliberately contradictory crosslink.
3. **+2 contradictions** — the same input plus **two** contradictory crosslinks.

Each injected crosslink claims a short (2–6 Å) contact between a residue pair that the rest
of the evidence places **~28 Å apart** — a plausible-looking but wrong **mid-range** restraint
(not a trivially-detectable terminus-to-terminus pair). The injected pairs are the known
ground truth (tagged `crosslink_FALSE_injected` in the input file), so the engine's
localization is scored against them. The consistency assessment is **reference-free**: it
compares the input restraints against the engine's own fold and reports where they cannot be
jointly satisfied. The experimental structure is consulted only afterwards, for CA-RMSD.

Residue numbering follows the folded model (engine residue index, 1-based), with the
one-letter amino acid; e.g. `S4` = Ser at fold position 4.

## Result

| Scaffold | Input | Contradictions | Signature | Conflicts | Max geom. incompat. | Root cause(s) localized | Planted | Precision | CA-RMSD |
|---|---|---|---|---|---|---|---|---|---|
| **3IOL** (GLP-1) | clean | 0 | `NONE` (quiet) | 0 | — | — | — | — | **0.29 Å** |
| | +1 | 1 | **`STRUCTURAL_CONFLICT`** | 36 | 23.0 Å | **S4** | S4, V23 | **1.00** | 0.34 Å |
| | +2 | 2 | **`STRUCTURAL_CONFLICT`** | 71 | 23.7 Å | **F2–S4** | F2, S4, W21, V23 | 0.67 | 0.34 Å |
| **1JRJ** (exendin-4) | clean | 0 | `NONE` (quiet) | 0 | — | — | — | — | **0.48 Å** |
| | +1 | 1 | **`STRUCTURAL_CONFLICT`** | 57 | 25.6 Å | **D8** | D8, G29 | **1.00** | 0.47 Å |
| | +2 | 2 | **`STRUCTURAL_CONFLICT`** | 108 | 25.8 Å | **F5 + D8** | F5, D8, W24, G29 | **1.00** | 0.44 Å |

Three things happen together, and all three are the point:

- **Clean inputs stay quiet.** Both consistent inputs return `NONE` (zero conflicts) and fold
  to high accuracy (0.29 / 0.48 Å) — the flag is specific to the contradiction, not a property
  of the peptide.
- **Contradictions fire and escalate.** Injecting one contradiction flips the signature to
  `STRUCTURAL_CONFLICT`; injecting a second roughly **doubles** the detected conflicts
  (3IOL 0 → 36 → 71; exendin-4 0 → 57 → 108) — a clean dose-response.
- **The blame lands on the planted residues.** The root-cause analysis names the exact
  injected residues (S4; D8; F2–S4; F5 + D8) at **0.67–1.00 precision**. For exendin-4 with two
  contradictions the two named root causes (F5, D8) **explain all 108 conflicts** between them.
  Recall is 0.5 by construction: each contradiction has two endpoints and the engine reports
  the actionable *anchor* of each — "revisit F5 and D8" — not both partners.

Critically, the fold quality barely moves (0.29 → 0.34 Å; 0.48 → 0.44 Å): because the dense,
correct evidence dominates a handful of false contacts, the model stays near-native **and** the
engine still flags and localizes the bad input. The conflict signal is a clean, separate
read-out, not an artifact of a degraded fold.

Headline numbers are in [`summary.csv`](summary.csv); the full per-residue breakdown is in the
`conflict_summary` and `root_causes` blocks of each report JSON, and the predicted models are
in each scaffold's `structures/`.

## What this demonstrates

> Given mutually contradictory distance evidence, the engine raises a structural-conflict
> signature and localizes the contradiction to the exact residues responsible — blind to the
> experimental answer — while leaving consistent evidence quiet. A single-output predictor
> returns one structure with no statement about whether its own inputs agree; this is a
> categorically different output, not a marginally better RMSD.

This is the analyst-facing value: when several distance sources are fused, the engine names the
input to revisit first.

## Applicability & honest bounds

- The conflict signature is **descriptive**: a `STRUCTURAL_CONFLICT` localizes *where* the
  restraints and the fold disagree, which can reflect a genuine input defect **or** a hard fold
  the engine did not fully converge. It points the analyst to the residues to examine; it is
  not, on its own, proof that the input is at fault.
- This is a **worked demonstration** on two scaffolds chosen for traceability and relevance
  (the incretin target and a marketed analogue), with a controlled contradiction dose-response.
  It is an existence-and-behaviour demonstration of the capability, not a population-scale
  precision estimate.
- The injected contradictions are **synthetic and declared** (mid-range pairs claimed as short
  contacts); they stand in for the real-world case of incompatible fused restraints.

## Files

```
build_demo.py                 reproducible builder (visible algorithm; requires the engine)
summary.csv                   headline metrics for all six folds (fast read)
3IOL/  1JRJ/
  inputs/
    clean.distogram.json      the internally-consistent distance-restraint input
    inj1.distogram.json       clean + 1 contradictory crosslink (ground truth tagged)
    inj2.distogram.json       clean + 2 contradictory crosslinks
  reports/
    clean.json inj1.json inj2.json   engine result per case (conflict_summary, root_causes)
  structures/
    clean.pdb inj1.pdb inj2.pdb      the predicted all-atom model per case
```

The localization is independently verifiable from these files alone: the injected restraints
are the difference between `clean.distogram.json` and `injN.distogram.json` (entries tagged
`crosslink_FALSE_injected`), and the flagged residues are in the `conflict_summary.root_causes`
block of each injected report.
