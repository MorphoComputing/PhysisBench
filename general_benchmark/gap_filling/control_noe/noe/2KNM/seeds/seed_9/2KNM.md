# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2KNM\sequence\2KNM.pdb`
- output_pdb: `general_benchmark\gap_filling\control_noe\noe\2KNM\seeds\seed_9\2KNM.pdb`
- residues: 28
- mode: refinement
- ca_rmsd: 5.459 A
- tm_score_ca_ordered: 0.14699104219847145
- heavy_atom_rmsd: 6.367 A
- sidechain_heavy_atom_rmsd: 7.296 A
- **all-atom quality (honest):** heavy 6.367 A, sidechain 7.296 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 24
- distogram_pairs: 29
- bin_accuracy: 0.379

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** —
- explained: 0/1 conflicts by 0 root cause(s)
- metrics: hubs=1 (frac 0.036), conflicts/hub=1.0, max_incompat=2.0Å, chain_span=0.0
- **fix-first:** [LOW_CONFLICT] Root cause(s): — — explain ~0/1 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **C19** — severity 0.74, 1 conflict(s); suspect input ~`R28` (group: pull_in)
  - pull-in (wants closer): R28@4.7Å(now 7.6,conf 0.37)
  - S15↔R28: targets 4.0/4.7Å but partners are 10.8Å apart → too_far_apart by 2.0Å

## Secondary Structure (DSSP-like)

- helix(H)=14 · strand(E)=12 · 3-10(G)=0 · coil(C)=2

```
CEHHEEHHHEHHEHHEHHEHEHEHECEE
```

## Backbone H-bond Network

- total=49 · helix(i→i+4)=8 · sheet=41
  - C3 ↔ C7  (helix)
  - G4 ↔ V8  (helix)
  - C7 ↔ P11  (helix)
  - V8 ↔ C12  (helix)
  - P11 ↔ S15  (helix)
  - S14 ↔ G18  (helix)
  - G18 ↔ K22  (helix)
  - S20 ↔ K24  (helix)
  - P2 ↔ I10  (sheet)
  - P2 ↔ I13  (sheet)
  - P2 ↔ A16  (sheet)
  - P2 ↔ C19  (sheet)
  - P2 ↔ C21  (sheet)
  - E5 ↔ I10  (sheet)
  - E5 ↔ I13  (sheet)
  - E5 ↔ A16  (sheet)
  - E5 ↔ C19  (sheet)
  - E5 ↔ C21  (sheet)
  - E5 ↔ S23  (sheet)
  - E5 ↔ V25  (sheet)
  - … +29 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=9 · exposed=11 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=204 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=132 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.3345 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=24 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C19, C7–C21, C12–C26

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
