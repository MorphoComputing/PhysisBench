# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2HIU\sequence\2HIU.pdb`
- output_pdb: `general_benchmark\gap_filling\noe+soi\2HIU\seeds\seed_7\2HIU.pdb`
- residues: 47
- mode: refinement
- ca_rmsd: 8.435 A
- tm_score_ca_ordered: 0.1233808415725134
- heavy_atom_rmsd: 9.216 A
- sidechain_heavy_atom_rmsd: 9.846 A
- **all-atom quality (honest):** heavy 9.216 A, sidechain 9.846 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/43 (0.0)
- lj_severe: 0
- lj_near: 23
- distogram_pairs: 221
- bin_accuracy: 0.335

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** V20-C25 → 50 conflicts (71%); F42-K47 → 13 conflicts (19%); S8-C10 → 4 conflicts (6%)
- explained: 67/70 conflicts by 3 root cause(s)
- metrics: hubs=20 (frac 0.426), conflicts/hub=3.5, max_incompat=8.55Å, chain_span=0.979
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): V20-C25 + F42-K47 + S8-C10 — explain ~67/70 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **C25** — severity 18.15, 12 conflict(s); suspect input ~`N21` (group: push_out)
  - pull-in (wants closer): V20@7.9Å(now 10.4,conf 0.59), E31@10.5Å(now 13.3,conf 0.58), P46@4.5Å(now 10.9,conf 0.39), N21@4.5Å(now 9.8,conf 0.39), Q22@4.5Å(now 7.8,conf 0.39)
  - push-out (wants farther): Y18@11.0Å(now 5.9,conf 0.52)
  - P46↔N21: targets 4.5/4.5Å but partners are 17.6Å apart → too_far_apart by 8.6Å
  - P46↔Q22: targets 4.5/4.5Å but partners are 16.8Å apart → too_far_apart by 7.8Å
  - Y44↔N21: targets 4.3/4.5Å but partners are 13.9Å apart → too_far_apart by 5.1Å
- **C37** — severity 12.50, 7 conflict(s); suspect input ~`V20` (group: pull_in)
  - pull-in (wants closer): Y34@4.1Å(now 7.2,conf 0.43), G41@9.1Å(now 12.9,conf 0.40), V20@4.9Å(now 12.2,conf 0.36)
  - G41↔V20: targets 9.1/4.9Å but partners are 21.4Å apart → too_far_apart by 7.5Å
  - R40↔V20: targets 9.7/4.9Å but partners are 21.4Å apart → too_far_apart by 6.9Å
  - Y34↔V20: targets 4.1/4.9Å but partners are 15.4Å apart → too_far_apart by 6.4Å
- **K47** — severity 10.73, 5 conflict(s); suspect input ~`I1` (group: push_out)
  - pull-in (wants closer): R40@11.0Å(now 13.6,conf 0.66)
  - push-out (wants farther): I1@22.9Å(now 6.5,conf 0.49)
  - Y44↔I1: targets 9.5/22.9Å but partners are 5.2Å apart → too_close_together by 8.1Å
  - I1↔F43: targets 22.9/9.8Å but partners are 6.3Å apart → too_close_together by 6.8Å
  - I1↔F42: targets 22.9/10.4Å but partners are 6.2Å apart → too_close_together by 6.2Å
- **L29** — severity 10.43, 8 conflict(s); suspect input ~`H23` (group: push_out)
  - pull-in (wants closer): Q22@7.2Å(now 10.7,conf 0.52), H23@4.8Å(now 9.0,conf 0.52)
  - push-out (wants farther): V36@8.5Å(now 3.7,conf 0.82)
  - L35↔H23: targets 7.6/4.8Å but partners are 16.0Å apart → too_far_apart by 3.6Å
  - Y34↔H23: targets 6.9/4.8Å but partners are 14.9Å apart → too_far_apart by 3.2Å
  - L35↔Q22: targets 7.6/7.2Å but partners are 17.8Å apart → too_far_apart by 3.0Å
- **I1** — severity 6.35, 3 conflict(s); suspect input ~`K47` (group: push_out)
  - push-out (wants farther): C5@10.2Å(now 5.7,conf 0.52), S8@13.6Å(now 4.5,conf 0.49), K47@22.9Å(now 6.5,conf 0.49), C6@12.2Å(now 7.7,conf 0.40), T7@14.2Å(now 7.7,conf 0.34)
  - Q4↔K47: targets 8.8/22.9Å but partners are 8.5Å apart → too_close_together by 5.6Å
  - C5↔K47: targets 10.2/22.9Å but partners are 7.4Å apart → too_close_together by 5.3Å
  - S8↔K47: targets 13.6/22.9Å but partners are 7.2Å apart → too_close_together by 2.1Å
- **Y44** — severity 6.22, 5 conflict(s); suspect input ~`S27` (group: pull_in)
  - pull-in (wants closer): S27@4.5Å(now 9.5,conf 0.39)
  - K47↔S27: targets 9.5/4.5Å but partners are 18.1Å apart → too_far_apart by 4.1Å
  - E39↔S27: targets 10.0/4.5Å but partners are 18.2Å apart → too_far_apart by 3.7Å
  - G41↔S27: targets 9.0/4.5Å but partners are 17.1Å apart → too_far_apart by 3.6Å

## Secondary Structure (DSSP-like)

- helix(H)=21 · strand(E)=16 · 3-10(G)=7 · coil(C)=3

```
EGHGEHGHHHHHGEHEHHHEEHEGHHHEHEEHGHHHHEEECCEEEGC
```

## Backbone H-bond Network

- total=43 · helix(i→i+4)=7 · sheet=36
  - S8 ↔ L12  (helix)
  - S11 ↔ L15  (helix)
  - L15 ↔ C19  (helix)
  - Y18 ↔ Q22  (helix)
  - Q22 ↔ G26  (helix)
  - C25 ↔ L29  (helix)
  - A32 ↔ V36  (helix)
  - I1 ↔ Q14  (sheet)
  - I1 ↔ E16  (sheet)
  - C5 ↔ Q14  (sheet)
  - Q14 ↔ V20  (sheet)
  - Q14 ↔ N21  (sheet)
  - Q14 ↔ H23  (sheet)
  - Q14 ↔ H28  (sheet)
  - Q14 ↔ V30  (sheet)
  - Q14 ↔ E31  (sheet)
  - E16 ↔ N21  (sheet)
  - E16 ↔ H23  (sheet)
  - E16 ↔ H28  (sheet)
  - E16 ↔ V30  (sheet)
  - … +23 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=15 · exposed=19 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=274 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=174 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=5.3898 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=23 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C10, C6–C25, C19–C37

## Side-chain Rotamers (χ1/χ2)

- 43 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
