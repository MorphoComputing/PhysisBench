# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2KNM\sequence\2KNM.pdb`
- output_pdb: `general_benchmark\fusion\disulfides+noe\2KNM\seeds\seed_1\2KNM.pdb`
- residues: 28
- mode: refinement
- ca_rmsd: 4.086 A
- tm_score_ca_ordered: 0.19740270766963738
- heavy_atom_rmsd: 5.821 A
- sidechain_heavy_atom_rmsd: 7.324 A
- **all-atom quality (honest):** heavy 5.821 A, sidechain 7.324 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 11
- distogram_pairs: 32
- bin_accuracy: 0.438

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** —
- explained: 0/2 conflicts by 0 root cause(s)
- metrics: hubs=1 (frac 0.036), conflicts/hub=2.0, max_incompat=2.5Å, chain_span=0.0
- **fix-first:** [LOW_CONFLICT] Root cause(s): — — explain ~0/2 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **C19** — severity 1.58, 2 conflict(s); suspect input ~`R28` (group: pull_in)
  - pull-in (wants closer): S14@3.8Å(now 6.6,conf 0.58), R28@4.7Å(now 7.4,conf 0.37)
  - S14↔R28: targets 3.8/4.7Å but partners are 11.0Å apart → too_far_apart by 2.5Å
  - S14↔Y27: targets 3.8/4.6Å but partners are 10.1Å apart → too_far_apart by 1.7Å

## Secondary Structure (DSSP-like)

- helix(H)=18 · strand(E)=5 · 3-10(G)=2 · coil(C)=3

```
CECECGHHHHEHHHHHHHHEHHHGHHHE
```

## Backbone H-bond Network

- total=15 · helix(i→i+4)=8 · sheet=7
  - W9 ↔ I13  (helix)
  - I10 ↔ S14  (helix)
  - I13 ↔ I17  (helix)
  - S14 ↔ G18  (helix)
  - S15 ↔ C19  (helix)
  - I17 ↔ C21  (helix)
  - G18 ↔ K22  (helix)
  - K22 ↔ C26  (helix)
  - P2 ↔ P11  (sheet)
  - P2 ↔ S20  (sheet)
  - G4 ↔ P11  (sheet)
  - G4 ↔ S20  (sheet)
  - P11 ↔ S20  (sheet)
  - P11 ↔ R28  (sheet)
  - S20 ↔ R28  (sheet)

## Solvent Accessibility (burial)

- buried=8 · exposed=15 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=190 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=110 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.0924 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=11 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C19, C7–C21, C12–C26

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`2KNM.ensemble.pdb`)
- RMSF mean=2.454Å max=5.238Å (per-residue in .per_residue.csv)
- most flexible residues: 28, 13, 14, 27, 12

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `2KNM.pae.csv`
- mean=0.836Å · max=3.198Å · AlphaFold-PAE analog (low block = rigid unit/domain)
