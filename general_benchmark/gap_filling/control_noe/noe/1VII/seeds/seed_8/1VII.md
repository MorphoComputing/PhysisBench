# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1VII\sequence\1VII.pdb`
- output_pdb: `general_benchmark\gap_filling\control_noe\noe\1VII\seeds\seed_8\1VII.pdb`
- residues: 34
- mode: refinement
- ca_rmsd: 4.811 A
- tm_score_ca_ordered: 0.1674928000951873
- heavy_atom_rmsd: 6.605 A
- sidechain_heavy_atom_rmsd: 8.002 A
- **all-atom quality (honest):** heavy 6.605 A, sidechain 8.002 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/29 (0.0)
- lj_severe: 0
- lj_near: 18
- distogram_pairs: 51
- bin_accuracy: 0.333

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** L28-E31 → 8 conflicts (57%); F17 → 6 conflicts (43%)
- explained: 14/14 conflicts by 2 root cause(s)
- metrics: hubs=6 (frac 0.176), conflicts/hub=2.3, max_incompat=7.15Å, chain_span=0.647
- **fix-first:** [LOW_CONFLICT] Root cause(s): L28-E31 + F17 — explain ~14/14 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **Q26** — severity 4.74, 2 conflict(s); suspect input ~`L22` (group: pull_in)
  - pull-in (wants closer): L22@4.0Å(now 7.9,conf 0.45), K30@4.0Å(now 8.1,conf 0.45)
  - L22↔K30: targets 4.0/4.0Å but partners are 15.2Å apart → too_far_apart by 7.2Å
  - K30↔W23: targets 4.0/4.3Å but partners are 12.1Å apart → too_far_apart by 3.8Å
- **L28** — severity 3.92, 4 conflict(s); suspect input ~`L20` (group: pull_in)
  - pull-in (wants closer): K32@4.0Å(now 7.0,conf 0.45), E31@4.3Å(now 8.9,conf 0.41)
  - E31↔L20: targets 4.3/5.2Å but partners are 14.6Å apart → too_far_apart by 5.1Å
  - Q25↔E31: targets 4.3/4.3Å but partners are 11.2Å apart → too_far_apart by 2.5Å
  - K24↔E31: targets 4.0/4.3Å but partners are 10.5Å apart → too_far_apart by 2.1Å
- **F17** — severity 2.83, 4 conflict(s); suspect input ~`Q25` (group: pull_in)
  - pull-in (wants closer): L20@4.7Å(now 8.1,conf 0.38), Q25@4.7Å(now 7.5,conf 0.38), F6@4.9Å(now 8.5,conf 0.35)
  - R14↔Q25: targets 4.0/4.7Å but partners are 11.2Å apart → too_far_apart by 2.5Å
  - Q25↔F6: targets 4.7/4.9Å but partners are 12.2Å apart → too_far_apart by 2.6Å
  - M12↔Q25: targets 4.7/4.7Å but partners are 10.9Å apart → too_far_apart by 1.6Å
- **N27** — severity 2.54, 2 conflict(s); suspect input ~`K30` (group: pull_in)
  - pull-in (wants closer): K30@4.3Å(now 6.9,conf 0.41)
  - W23↔K30: targets 4.0/4.3Å but partners are 12.1Å apart → too_far_apart by 3.8Å
  - K24↔K30: targets 4.0/4.3Å but partners are 10.8Å apart → too_far_apart by 2.4Å
- **F6** — severity 0.84, 1 conflict(s); suspect input ~`F17` (group: pull_in)
  - pull-in (wants closer): F17@4.9Å(now 8.5,conf 0.35)
  - D3↔F17: targets 4.0/4.9Å but partners are 11.3Å apart → too_far_apart by 2.4Å
- **Q25** — severity 0.69, 1 conflict(s); suspect input ~`F17` (group: pull_in)
  - pull-in (wants closer): F17@4.7Å(now 7.5,conf 0.38)
  - L22↔F17: targets 4.0/4.7Å but partners are 10.5Å apart → too_far_apart by 1.8Å

## Secondary Structure (DSSP-like)

- helix(H)=22 · strand(E)=6 · 3-10(G)=3 · coil(C)=3

```
CEHHEHHHHHEHGHHHHHHHHEEHHHGHEHCGHC
```

## Backbone H-bond Network

- total=21 · helix(i→i+4)=13 · sheet=8
  - D3 ↔ K7  (helix)
  - E4 ↔ A8  (helix)
  - F6 ↔ F10  (helix)
  - A8 ↔ M12  (helix)
  - F10 ↔ R14  (helix)
  - M12 ↔ A16  (helix)
  - R14 ↔ A18  (helix)
  - S15 ↔ N19  (helix)
  - A16 ↔ L20  (helix)
  - F17 ↔ P21  (helix)
  - L20 ↔ K24  (helix)
  - P21 ↔ Q25  (helix)
  - K24 ↔ L28  (helix)
  - S2 ↔ G11  (sheet)
  - D5 ↔ G11  (sheet)
  - D5 ↔ W23  (sheet)
  - G11 ↔ L22  (sheet)
  - G11 ↔ W23  (sheet)
  - G11 ↔ K29  (sheet)
  - L22 ↔ K29  (sheet)
  - … +1 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=17 · exposed=9 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=225 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=125 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.6145 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=18 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 29 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
