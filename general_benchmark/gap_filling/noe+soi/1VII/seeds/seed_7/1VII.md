# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1VII\sequence\1VII.pdb`
- output_pdb: `general_benchmark\gap_filling\noe+soi\1VII\seeds\seed_7\1VII.pdb`
- residues: 34
- mode: refinement
- ca_rmsd: 5.524 A
- tm_score_ca_ordered: 0.14440668845815322
- heavy_atom_rmsd: 6.406 A
- sidechain_heavy_atom_rmsd: 7.122 A
- **all-atom quality (honest):** heavy 6.406 A, sidechain 7.122 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/29 (0.0)
- lj_severe: 0
- lj_near: 9
- distogram_pairs: 160
- bin_accuracy: 0.537

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** Q26-K30 → 17 conflicts (53%); F6 → 9 conflicts (28%); F17 → 5 conflicts (16%)
- explained: 31/32 conflicts by 3 root cause(s)
- metrics: hubs=9 (frac 0.265), conflicts/hub=3.6, max_incompat=4.65Å, chain_span=0.824
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): Q26-K30 + F6 + F17 — explain ~31/32 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **F6** — severity 6.55, 7 conflict(s); suspect input ~`F17` (group: pull_in)
  - pull-in (wants closer): S2@3.8Å(now 7.7,conf 0.69), D3@4.0Å(now 6.9,conf 0.45)
  - S2↔G11: targets 3.8/7.4Å but partners are 14.7Å apart → too_far_apart by 3.5Å
  - S2↔F17: targets 3.8/4.9Å but partners are 13.1Å apart → too_far_apart by 4.4Å
  - S2↔M12: targets 3.8/5.5Å but partners are 13.2Å apart → too_far_apart by 3.9Å
- **Q26** — severity 6.35, 4 conflict(s); suspect input ~`K30` (group: pull_in)
  - pull-in (wants closer): K30@4.0Å(now 6.8,conf 0.45)
  - P21↔K30: targets 5.0/4.0Å but partners are 13.7Å apart → too_far_apart by 4.7Å
  - L20↔K30: targets 6.8/4.0Å but partners are 14.7Å apart → too_far_apart by 3.9Å
  - L22↔K30: targets 4.0/4.0Å but partners are 11.6Å apart → too_far_apart by 3.5Å
- **F17** — severity 5.60, 8 conflict(s); suspect input ~`K29` (group: pull_in)
  - pull-in (wants closer): L20@4.7Å(now 8.9,conf 0.38), L28@4.9Å(now 8.6,conf 0.35), K29@5.2Å(now 8.2,conf 0.26), K32@5.8Å(now 8.5,conf 0.22)
  - M12↔L28: targets 4.7/4.9Å but partners are 12.4Å apart → too_far_apart by 2.8Å
  - R14↔L20: targets 4.0/4.7Å but partners are 11.3Å apart → too_far_apart by 2.7Å
  - M12↔K29: targets 4.7/5.2Å but partners are 13.1Å apart → too_far_apart by 3.3Å
- **L28** — severity 3.12, 4 conflict(s); suspect input ~`L20` (group: pull_in)
  - pull-in (wants closer): F17@4.9Å(now 8.6,conf 0.35), L20@5.2Å(now 9.6,conf 0.26)
  - E31↔L20: targets 4.3/5.2Å but partners are 13.7Å apart → too_far_apart by 4.2Å
  - K32↔L20: targets 4.0/5.2Å but partners are 12.4Å apart → too_far_apart by 3.2Å
  - L34↔L20: targets 8.6/5.2Å but partners are 16.6Å apart → too_far_apart by 2.7Å
- **F10** — severity 2.25, 4 conflict(s); suspect input ~`L1` (group: pull_in)
  - pull-in (wants closer): K29@4.9Å(now 8.2,conf 0.35), L1@5.2Å(now 9.0,conf 0.26)
  - K29↔L1: targets 4.9/5.2Å but partners are 13.2Å apart → too_far_apart by 3.1Å
  - K7↔K29: targets 7.5/4.9Å but partners are 14.0Å apart → too_far_apart by 1.6Å
  - E4↔L1: targets 10.4/5.2Å but partners are 3.4Å apart → too_close_together by 1.8Å
- **L20** — severity 1.74, 2 conflict(s); suspect input ~`F17` (group: pull_in)
  - pull-in (wants closer): F17@4.7Å(now 8.9,conf 0.38), L28@5.2Å(now 9.6,conf 0.26)
  - S15↔F17: targets 11.6/4.7Å but partners are 4.1Å apart → too_close_together by 2.8Å
  - A16↔F17: targets 10.2/4.7Å but partners are 3.7Å apart → too_close_together by 1.9Å

## Secondary Structure (DSSP-like)

- helix(H)=12 · strand(E)=16 · 3-10(G)=3 · coil(C)=3

```
CHHHEHHEEEHEEHHHEEGEEEHEGGCHEHCEEE
```

## Backbone H-bond Network

- total=61 · helix(i→i+4)=4 · sheet=57
  - S2 ↔ F6  (helix)
  - D3 ↔ K7  (helix)
  - K7 ↔ G11  (helix)
  - G11 ↔ S15  (helix)
  - D5 ↔ F10  (sheet)
  - D5 ↔ M12  (sheet)
  - D5 ↔ T13  (sheet)
  - D5 ↔ F17  (sheet)
  - D5 ↔ A18  (sheet)
  - D5 ↔ L20  (sheet)
  - A8 ↔ T13  (sheet)
  - A8 ↔ F17  (sheet)
  - A8 ↔ A18  (sheet)
  - A8 ↔ L20  (sheet)
  - A8 ↔ K24  (sheet)
  - V9 ↔ F17  (sheet)
  - V9 ↔ A18  (sheet)
  - V9 ↔ L20  (sheet)
  - V9 ↔ P21  (sheet)
  - V9 ↔ L22  (sheet)
  - … +41 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=9 · exposed=11 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=161 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=70 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.0076 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=9 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 29 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
