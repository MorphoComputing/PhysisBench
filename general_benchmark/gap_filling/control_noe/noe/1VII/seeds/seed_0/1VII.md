# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1VII\sequence\1VII.pdb`
- output_pdb: `general_benchmark\gap_filling\control_noe\noe\1VII\seeds\seed_0\1VII.pdb`
- residues: 34
- mode: refinement
- ca_rmsd: 5.511 A
- tm_score_ca_ordered: 0.12711830085345968
- heavy_atom_rmsd: 7.057 A
- sidechain_heavy_atom_rmsd: 8.134 A
- **all-atom quality (honest):** heavy 7.057 A, sidechain 8.134 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/29 (0.0)
- lj_severe: 0
- lj_near: 15
- distogram_pairs: 51
- bin_accuracy: 0.529

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** —
- explained: 0/2 conflicts by 0 root cause(s)
- metrics: hubs=2 (frac 0.059), conflicts/hub=1.0, max_incompat=1.87Å, chain_span=0.529
- **fix-first:** [LOW_CONFLICT] Root cause(s): — — explain ~0/2 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **F10** — severity 0.48, 1 conflict(s); suspect input ~`R14` (group: pull_in)
  - pull-in (wants closer): K29@4.9Å(now 9.6,conf 0.35), L28@5.5Å(now 8.1,conf 0.24)
  - K29↔R14: targets 4.9/5.2Å but partners are 12.0Å apart → too_far_apart by 1.9Å
- **L28** — severity 0.42, 1 conflict(s); suspect input ~`F10` (group: pull_in)
  - pull-in (wants closer): F10@5.5Å(now 8.1,conf 0.24)
  - K24↔F10: targets 4.0/5.5Å but partners are 11.3Å apart → too_far_apart by 1.8Å

## Secondary Structure (DSSP-like)

- helix(H)=26 · strand(E)=4 · 3-10(G)=2 · coil(C)=2

```
CHHHEHHHHGHHHHHHHHHHEGHHHEHHEHHHHC
```

## Backbone H-bond Network

- total=20 · helix(i→i+4)=17 · sheet=3
  - S2 ↔ F6  (helix)
  - D3 ↔ K7  (helix)
  - E4 ↔ A8  (helix)
  - K7 ↔ G11  (helix)
  - A8 ↔ M12  (helix)
  - V9 ↔ T13  (helix)
  - G11 ↔ S15  (helix)
  - M12 ↔ A16  (helix)
  - T13 ↔ F17  (helix)
  - R14 ↔ A18  (helix)
  - S15 ↔ N19  (helix)
  - A16 ↔ L20  (helix)
  - N19 ↔ W23  (helix)
  - L20 ↔ K24  (helix)
  - W23 ↔ N27  (helix)
  - K24 ↔ L28  (helix)
  - L28 ↔ K32  (helix)
  - D5 ↔ P21  (sheet)
  - P21 ↔ Q26  (sheet)
  - P21 ↔ K29  (sheet)

## Solvent Accessibility (burial)

- buried=10 · exposed=11 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=243 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=126 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.1235 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=15 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 29 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
