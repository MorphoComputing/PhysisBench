# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1VII\sequence\1VII.pdb`
- output_pdb: `general_benchmark\gap_filling\control_noe\noe\1VII\seeds\seed_3\1VII.pdb`
- residues: 34
- mode: refinement
- ca_rmsd: 3.914 A
- tm_score_ca_ordered: 0.19935398357677414
- heavy_atom_rmsd: 4.855 A
- sidechain_heavy_atom_rmsd: 5.563 A
- **all-atom quality (honest):** heavy 4.855 A, sidechain 5.563 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/29 (0.0)
- lj_severe: 0
- lj_near: 6
- distogram_pairs: 51
- bin_accuracy: 0.529

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** W23-K32 → 14 conflicts (93%)
- explained: 14/15 conflicts by 1 root cause(s)
- metrics: hubs=6 (frac 0.176), conflicts/hub=2.5, max_incompat=5.39Å, chain_span=0.529
- **fix-first:** [LOW_CONFLICT] Root cause(s): W23-K32 — explain ~14/15 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **N27** — severity 3.83, 2 conflict(s); suspect input ~`W23` (group: pull_in)
  - pull-in (wants closer): W23@4.0Å(now 7.5,conf 0.45)
  - W23↔E31: targets 4.0/4.0Å but partners are 13.4Å apart → too_far_apart by 5.4Å
  - W23↔K30: targets 4.0/4.3Å but partners are 11.8Å apart → too_far_apart by 3.5Å
- **L28** — severity 3.81, 4 conflict(s); suspect input ~`L20` (group: pull_in)
  - pull-in (wants closer): K24@4.0Å(now 6.7,conf 0.45), L20@5.2Å(now 9.2,conf 0.26)
  - E31↔L20: targets 4.3/5.2Å but partners are 13.7Å apart → too_far_apart by 4.2Å
  - K24↔E31: targets 4.0/4.3Å but partners are 10.8Å apart → too_far_apart by 2.4Å
  - K24↔K32: targets 4.0/4.0Å but partners are 10.2Å apart → too_far_apart by 2.1Å
- **Q26** — severity 3.46, 2 conflict(s); suspect input ~`L22` (group: pull_in)
  - pull-in (wants closer): K30@4.0Å(now 8.1,conf 0.45)
  - L22↔K30: targets 4.0/4.0Å but partners are 12.6Å apart → too_far_apart by 4.5Å
  - K30↔W23: targets 4.0/4.3Å but partners are 11.8Å apart → too_far_apart by 3.5Å
- **F17** — severity 3.08, 5 conflict(s); suspect input ~`K32` (group: pull_in)
  - pull-in (wants closer): K29@5.2Å(now 7.9,conf 0.26), K32@5.8Å(now 9.7,conf 0.22)
  - T13↔K29: targets 4.7/5.2Å but partners are 12.9Å apart → too_far_apart by 3.0Å
  - T13↔K32: targets 4.7/5.8Å but partners are 13.7Å apart → too_far_apart by 3.3Å
  - R14↔K32: targets 4.0/5.8Å but partners are 12.5Å apart → too_far_apart by 2.6Å
- **K24** — severity 1.45, 1 conflict(s); suspect input ~`P21` (group: pull_in)
  - pull-in (wants closer): L28@4.0Å(now 6.7,conf 0.45)
  - L28↔P21: targets 4.0/4.7Å but partners are 12.5Å apart → too_far_apart by 3.9Å
- **F10** — severity 0.42, 1 conflict(s); suspect input ~`G33` (group: pull_in)
  - pull-in (wants closer): G33@5.8Å(now 8.9,conf 0.22)
  - R14↔G33: targets 5.2/5.8Å but partners are 12.9Å apart → too_far_apart by 1.9Å

## Secondary Structure (DSSP-like)

- helix(H)=18 · strand(E)=8 · 3-10(G)=3 · coil(C)=5

```
CEHHHHHCEEGHCHHEHEGHHHHEHHHHEHCEGC
```

## Backbone H-bond Network

- total=25 · helix(i→i+4)=6 · sheet=19
  - D3 ↔ K7  (helix)
  - F17 ↔ P21  (helix)
  - P21 ↔ Q25  (helix)
  - L22 ↔ Q26  (helix)
  - W23 ↔ N27  (helix)
  - Q26 ↔ K30  (helix)
  - S2 ↔ V9  (sheet)
  - S2 ↔ F10  (sheet)
  - S2 ↔ A16  (sheet)
  - S2 ↔ A18  (sheet)
  - V9 ↔ A16  (sheet)
  - V9 ↔ A18  (sheet)
  - V9 ↔ K24  (sheet)
  - V9 ↔ K29  (sheet)
  - F10 ↔ A16  (sheet)
  - F10 ↔ A18  (sheet)
  - F10 ↔ K24  (sheet)
  - F10 ↔ K29  (sheet)
  - A16 ↔ K24  (sheet)
  - A16 ↔ K29  (sheet)
  - … +5 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=13 · exposed=9 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=196 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=91 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.3763 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=6 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 29 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
