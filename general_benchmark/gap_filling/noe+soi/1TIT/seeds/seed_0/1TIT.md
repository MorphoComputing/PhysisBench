# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1TIT\sequence\1TIT.pdb`
- output_pdb: `general_benchmark\gap_filling\noe+soi\1TIT\seeds\seed_0\1TIT.pdb`
- residues: 87
- mode: refinement
- ca_rmsd: 12.708 A
- tm_score_ca_ordered: 0.1566984679319321
- heavy_atom_rmsd: 13.892 A
- sidechain_heavy_atom_rmsd: 15.061 A
- **all-atom quality (honest):** heavy 13.892 A, sidechain 15.061 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/73 (0.0)
- lj_severe: 0
- lj_near: 38
- distogram_pairs: 513
- bin_accuracy: 0.326

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** F20-L24 → 228 conflicts (33%); V70-F72 → 74 conflicts (11%); H55-L57 → 59 conflicts (9%)
- explained: 361/687 conflicts by 3 root cause(s)
- metrics: hubs=71 (frac 0.816), conflicts/hub=9.7, max_incompat=13.84Å, chain_span=0.966
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): F20-L24 + V70-F72 + H55-L57 — explain ~361/687 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **W33** — severity 63.23, 51 conflict(s); suspect input ~`I48` (group: push_out)
  - pull-in (wants closer): Q73@4.7Å(now 8.7,conf 0.38), E21@4.9Å(now 9.1,conf 0.35), L7@5.2Å(now 13.5,conf 0.26), I22@5.2Å(now 9.4,conf 0.26), I48@5.2Å(now 16.2,conf 0.26), I56@5.2Å(now 12.5,conf 0.26), L57@5.2Å(now 13.8,conf 0.26)
  - push-out (wants farther): L40@17.0Å(now 9.1,conf 0.67), E26@18.9Å(now 13.6,conf 0.49)
  - L7↔I48: targets 5.2/5.2Å but partners are 20.2Å apart → too_far_apart by 9.8Å
  - Q73↔I48: targets 4.7/5.2Å but partners are 19.3Å apart → too_far_apart by 9.4Å
  - E26↔E21: targets 18.9/4.9Å but partners are 7.2Å apart → too_close_together by 6.8Å
- **F20** — severity 57.91, 41 conflict(s); suspect input ~`A81` (group: pull_in)
  - pull-in (wants closer): L57@4.3Å(now 13.2,conf 0.41), I58@4.5Å(now 14.6,conf 0.39), L7@4.7Å(now 10.6,conf 0.37), A81@4.7Å(now 11.5,conf 0.37), Y8@5.0Å(now 9.4,conf 0.27), L83@5.4Å(now 10.9,conf 0.24), V70@5.5Å(now 8.1,conf 0.24)
  - push-out (wants farther): T17@7.9Å(now 3.0,conf 0.67), E16@10.4Å(now 3.7,conf 0.66), G15@10.5Å(now 3.9,conf 0.58), F13@12.8Å(now 4.5,conf 0.49), V14@10.8Å(now 4.0,conf 0.49), L24@10.2Å(now 7.5,conf 0.40)
  - L57↔A81: targets 4.3/4.7Å but partners are 19.8Å apart → too_far_apart by 10.8Å
  - I58↔A81: targets 4.5/4.7Å but partners are 18.2Å apart → too_far_apart by 9.0Å
  - L57↔L7: targets 4.3/4.7Å but partners are 16.2Å apart → too_far_apart by 7.2Å
- **H55** — severity 51.78, 29 conflict(s); suspect input ~`L24` (group: pull_in)
  - pull-in (wants closer): E50@4.0Å(now 8.7,conf 0.45), I22@4.3Å(now 9.7,conf 0.41), E23@4.7Å(now 10.9,conf 0.37), L24@4.8Å(now 12.4,conf 0.36), G31@4.9Å(now 10.3,conf 0.35)
  - push-out (wants farther): L59@10.8Å(now 7.1,conf 0.84), G52@6.8Å(now 0.6,conf 0.52), H60@13.0Å(now 8.8,conf 0.34), C62@18.7Å(now 12.8,conf 0.34)
  - E50↔L24: targets 4.0/4.8Å but partners are 19.5Å apart → too_far_apart by 10.7Å
  - E50↔I22: targets 4.0/4.3Å but partners are 17.4Å apart → too_far_apart by 9.2Å
  - E50↔E23: targets 4.0/4.7Å but partners are 18.7Å apart → too_far_apart by 10.0Å
- **L7** — severity 47.30, 41 conflict(s); suspect input ~`E21` (group: pull_in)
  - pull-in (wants closer): V70@4.5Å(now 11.4,conf 0.39), F20@4.7Å(now 10.6,conf 0.37), A80@4.7Å(now 7.3,conf 0.37), E21@4.8Å(now 15.7,conf 0.36), S71@4.9Å(now 10.6,conf 0.35), I22@5.0Å(now 11.1,conf 0.27), W33@5.2Å(now 13.5,conf 0.26)
  - A80↔E21: targets 4.7/4.8Å but partners are 18.7Å apart → too_far_apart by 9.2Å
  - E21↔A81: targets 4.8/4.8Å but partners are 17.1Å apart → too_far_apart by 7.5Å
  - S79↔E21: targets 4.7/4.8Å but partners are 16.5Å apart → too_far_apart by 7.1Å
- **V70** — severity 44.61, 31 conflict(s); suspect input ~`A81` (group: push_out)
  - pull-in (wants closer): L35@4.0Å(now 11.2,conf 0.45), G65@10.0Å(now 12.5,conf 0.44), A81@4.1Å(now 9.2,conf 0.43), N82@4.2Å(now 8.3,conf 0.43), Q63@9.2Å(now 11.7,conf 0.40), L7@4.5Å(now 11.4,conf 0.39), F20@5.5Å(now 8.1,conf 0.24)
  - push-out (wants farther): A74@10.0Å(now 7.5,conf 0.59), Q73@8.4Å(now 5.4,conf 0.52)
  - L35↔A81: targets 4.0/4.1Å but partners are 19.3Å apart → too_far_apart by 11.1Å
  - L35↔N82: targets 4.0/4.2Å but partners are 19.4Å apart → too_far_apart by 11.2Å
  - L35↔L7: targets 4.0/4.5Å but partners are 18.8Å apart → too_far_apart by 10.3Å
- **L57** — severity 36.12, 19 conflict(s); suspect input ~`I49` (group: push_out)
  - pull-in (wants closer): F20@4.3Å(now 13.2,conf 0.41), E21@4.3Å(now 13.5,conf 0.41), W33@5.2Å(now 13.8,conf 0.26)
  - push-out (wants farther): G52@10.7Å(now 6.7,conf 0.52), L64@20.8Å(now 12.1,conf 0.34)
  - E21↔I49: targets 4.3/4.5Å but partners are 18.8Å apart → too_far_apart by 9.9Å
  - F20↔I49: targets 4.3/4.5Å but partners are 18.1Å apart → too_far_apart by 9.3Å
  - E21↔E47: targets 4.3/4.9Å but partners are 17.4Å apart → too_far_apart by 8.1Å

## Secondary Structure (DSSP-like)

- helix(H)=48 · strand(E)=25 · 3-10(G)=11 · coil(C)=3

```
CEHHEEGEEECEHHHHHEGHGHHHHGHHEHGHEEGECEHEEHEEEGGHHHEHHHGHHHEHHEHHHHHEHHHHGEHHHEGHHHHHHHE
```

## Backbone H-bond Network

- total=81 · helix(i→i+4)=21 · sheet=60
  - F13 ↔ T17  (helix)
  - E16 ↔ F20  (helix)
  - F20 ↔ L24  (helix)
  - E23 ↔ P27  (helix)
  - L24 ↔ D28  (helix)
  - D28 ↔ Q32  (helix)
  - I48 ↔ G52  (helix)
  - G52 ↔ I56  (helix)
  - K53 ↔ L57  (helix)
  - K54 ↔ I58  (helix)
  - L57 ↔ N61  (helix)
  - N61 ↔ G65  (helix)
  - Q63 ↔ T67  (helix)
  - M66 ↔ V70  (helix)
  - T67 ↔ S71  (helix)
  - S71 ↔ A75  (helix)
  - F72 ↔ N76  (helix)
  - N76 ↔ A80  (helix)
  - A80 ↔ K84  (helix)
  - A81 ↔ V85  (helix)
  - … +61 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=21 · exposed=41 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=593 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=432 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=6.4067 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=38 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 73 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
