# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\5WOW\sequence\5WOW.pdb`
- output_pdb: `general_benchmark\gap_filling\control_noe\noe\5WOW\seeds\seed_9\5WOW.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 5.967 A
- tm_score_ca_ordered: 0.1249400956084678
- heavy_atom_rmsd: 6.735 A
- sidechain_heavy_atom_rmsd: 7.497 A
- **all-atom quality (honest):** heavy 6.735 A, sidechain 7.497 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/31 (0.0)
- lj_severe: 0
- lj_near: 16
- distogram_pairs: 27
- bin_accuracy: 0.519

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** —
- explained: 0/2 conflicts by 0 root cause(s)
- metrics: hubs=1 (frac 0.027), conflicts/hub=2.0, max_incompat=4.24Å, chain_span=0.0
- **fix-first:** [LOW_CONFLICT] Root cause(s): — — explain ~0/2 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **C22** — severity 1.74, 2 conflict(s); suspect input ~`R12` (group: pull_in)
  - pull-in (wants closer): G29@4.5Å(now 7.2,conf 0.39), R12@5.4Å(now 8.9,conf 0.24)
  - G29↔R12: targets 4.5/5.4Å but partners are 14.2Å apart → too_far_apart by 4.2Å
  - D13↔G29: targets 4.1/4.5Å but partners are 10.5Å apart → too_far_apart by 1.8Å

## Secondary Structure (DSSP-like)

- helix(H)=21 · strand(E)=11 · 3-10(G)=5 · coil(C)=0

```
EHHEGHEEGHHGHHEHHEGHEHEHEHHHHHHGHHEHE
```

## Backbone H-bond Network

- total=37 · helix(i→i+4)=8 · sheet=29
  - V2 ↔ I6  (helix)
  - I6 ↔ C10  (helix)
  - C10 ↔ S14  (helix)
  - D13 ↔ P17  (helix)
  - C16 ↔ C20  (helix)
  - C20 ↔ G24  (helix)
  - G24 ↔ C28  (helix)
  - G29 ↔ D33  (helix)
  - G1 ↔ L7  (sheet)
  - G1 ↔ Q8  (sheet)
  - G1 ↔ D15  (sheet)
  - G1 ↔ G18  (sheet)
  - G1 ↔ I21  (sheet)
  - P4 ↔ D15  (sheet)
  - P4 ↔ G18  (sheet)
  - P4 ↔ I21  (sheet)
  - L7 ↔ D15  (sheet)
  - L7 ↔ G18  (sheet)
  - L7 ↔ I21  (sheet)
  - Q8 ↔ D15  (sheet)
  - … +17 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=15 · exposed=11 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=257 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=146 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.6624 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=16 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C20, C10–C22, C16–C28

## Side-chain Rotamers (χ1/χ2)

- 31 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
