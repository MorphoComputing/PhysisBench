# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1VII\sequence\1VII.pdb`
- output_pdb: `general_benchmark\gap_filling\control_noe\noe\1VII\seeds\seed_1\1VII.pdb`
- residues: 34
- mode: refinement
- ca_rmsd: 4.518 A
- tm_score_ca_ordered: 0.20765971485305168
- heavy_atom_rmsd: 6.375 A
- sidechain_heavy_atom_rmsd: 7.805 A
- **all-atom quality (honest):** heavy 6.375 A, sidechain 7.805 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/29 (0.0)
- lj_severe: 0
- lj_near: 7
- distogram_pairs: 51
- bin_accuracy: 0.392

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** F17 → 8 conflicts (62%)
- explained: 8/13 conflicts by 1 root cause(s)
- metrics: hubs=5 (frac 0.147), conflicts/hub=2.6, max_incompat=5.06Å, chain_span=0.618
- **fix-first:** [LOW_CONFLICT] Root cause(s): F17 — explain ~8/13 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **F17** — severity 7.49, 7 conflict(s); suspect input ~`F6` (group: pull_in)
  - pull-in (wants closer): T13@4.7Å(now 7.8,conf 0.38), F6@4.9Å(now 8.0,conf 0.35)
  - Q25↔F6: targets 4.7/4.9Å but partners are 14.6Å apart → too_far_apart by 5.1Å
  - L20↔F6: targets 4.7/4.9Å but partners are 14.1Å apart → too_far_apart by 4.6Å
  - T13↔Q25: targets 4.7/4.7Å but partners are 12.9Å apart → too_far_apart by 3.6Å
- **N27** — severity 2.58, 3 conflict(s); suspect input ~`W23` (group: pull_in)
  - pull-in (wants closer): W23@4.0Å(now 6.6,conf 0.45), K24@4.0Å(now 7.3,conf 0.45)
  - W23↔E31: targets 4.0/4.0Å but partners are 10.7Å apart → too_far_apart by 2.7Å
  - K24↔E31: targets 4.0/4.0Å but partners are 9.8Å apart → too_far_apart by 1.7Å
  - W23↔K30: targets 4.0/4.3Å but partners are 9.9Å apart → too_far_apart by 1.5Å
- **Q26** — severity 0.63, 1 conflict(s); suspect input ~`W23` (group: pull_in)
  - pull-in (wants closer): L22@4.0Å(now 7.1,conf 0.45), K30@4.0Å(now 6.6,conf 0.45)
  - K30↔W23: targets 4.0/4.3Å but partners are 9.9Å apart → too_far_apart by 1.5Å
- **F6** — severity 0.59, 1 conflict(s); suspect input ~`F17` (group: pull_in)
  - pull-in (wants closer): F17@4.9Å(now 8.0,conf 0.35), T13@5.2Å(now 8.7,conf 0.26), F10@5.5Å(now 8.7,conf 0.24)
  - D3↔F17: targets 4.0/4.9Å but partners are 10.6Å apart → too_far_apart by 1.7Å
- **F10** — severity 0.46, 1 conflict(s); suspect input ~`F6` (group: pull_in)
  - pull-in (wants closer): F6@5.5Å(now 8.7,conf 0.24)
  - K29↔F6: targets 4.9/5.5Å but partners are 12.4Å apart → too_far_apart by 1.9Å

## Secondary Structure (DSSP-like)

- helix(H)=18 · strand(E)=7 · 3-10(G)=6 · coil(C)=3

```
EEGGEHHEHHHHHHHHHHGHEHGGCGCEHHHHEC
```

## Backbone H-bond Network

- total=13 · helix(i→i+4)=5 · sheet=8
  - K7 ↔ G11  (helix)
  - G11 ↔ S15  (helix)
  - T13 ↔ F17  (helix)
  - R14 ↔ A18  (helix)
  - A18 ↔ L22  (helix)
  - L1 ↔ A8  (sheet)
  - L1 ↔ P21  (sheet)
  - S2 ↔ A8  (sheet)
  - A8 ↔ P21  (sheet)
  - A8 ↔ L28  (sheet)
  - P21 ↔ L28  (sheet)
  - P21 ↔ G33  (sheet)
  - L28 ↔ G33  (sheet)

## Solvent Accessibility (burial)

- buried=11 · exposed=9 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=205 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=96 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.3461 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=7 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 29 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
