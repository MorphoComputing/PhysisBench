# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1POH\sequence\1POH.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1POH\seeds\seed_2\1POH.pdb`
- residues: 83
- mode: oracle
- ca_rmsd: 2.766 A
- tm_score_ca_ordered: 0.6695575893091888
- heavy_atom_rmsd: 3.872 A
- sidechain_heavy_atom_rmsd: 4.670 A
- **all-atom quality (honest):** heavy 3.872 A, sidechain 4.670 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/68 (0.0)
- lj_severe: 0
- lj_near: 15
- distogram_pairs: 957
- bin_accuracy: 0.633

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=45
- rigid_domain_reconvergence: applied=True accepted=10 rmsd=5.7894468614278605 -> 5.399181998028404 A
- topology_reconvergence: applied=True accepted=0/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 2.7665306254523006
- ga_delta_rmsd: 2.4128624060031023  ga_fitness_mode: energy
- pre_local_rmsd: 2.838610287061535  localized_anchor_rmsd: 2.766476127872847

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** L46-T55 → 46 conflicts (51%); Q3-A9 → 10 conflicts (11%); E82 → 8 conflicts (9%)
- explained: 64/90 conflicts by 3 root cause(s)
- metrics: hubs=35 (frac 0.422), conflicts/hub=2.6, max_incompat=5.7Å, chain_span=0.988
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): L46-T55 + Q3-A9 + E82 — explain ~64/90 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **K39** — severity 14.63, 7 conflict(s); suspect input ~`Q3` (group: push_out)
  - push-out (wants farther): V5@15.4Å(now 11.7,conf 0.55), Q3@15.7Å(now 9.9,conf 0.55), E4@14.1Å(now 8.5,conf 0.55)
  - T35↔Q3: targets 5.0/15.7Å but partners are 5.0Å apart → too_close_together by 5.7Å
  - T35↔E4: targets 5.0/14.1Å but partners are 4.2Å apart → too_close_together by 4.9Å
  - S36↔E4: targets 5.1/14.1Å but partners are 4.3Å apart → too_close_together by 4.7Å
- **F47** — severity 13.00, 7 conflict(s); suspect input ~`V5` (group: push_out)
  - push-out (wants farther): T8@21.5Å(now 18.5,conf 0.61), P10@21.0Å(now 18.3,conf 0.60), V5@20.7Å(now 15.8,conf 0.59), A18@10.3Å(now 7.2,conf 0.55)
  - Q50↔V5: targets 5.0/20.7Å but partners are 10.9Å apart → too_close_together by 4.8Å
  - Q50↔T8: targets 5.0/21.5Å but partners are 12.3Å apart → too_close_together by 4.1Å
  - Q50↔P10: targets 5.0/21.0Å but partners are 12.9Å apart → too_close_together by 3.1Å
- **K48** — severity 9.61, 7 conflict(s); suspect input ~`A41` (group: push_out)
  - push-out (wants farther): A9@20.1Å(now 16.3,conf 0.58), Q3@19.8Å(now 14.1,conf 0.57), I7@17.6Å(now 12.4,conf 0.55), V22@11.0Å(now 8.3,conf 0.55), P17@15.3Å(now 11.8,conf 0.55), L13@13.3Å(now 9.6,conf 0.55), T15@13.4Å(now 10.1,conf 0.55)
  - Q3↔A41: targets 19.8/5.4Å but partners are 10.7Å apart → too_close_together by 3.7Å
  - S42↔Q3: targets 7.0/19.8Å but partners are 9.8Å apart → too_close_together by 2.9Å
  - T51↔I7: targets 5.1/17.6Å but partners are 9.8Å apart → too_close_together by 2.7Å
- **A9** — severity 9.10, 6 conflict(s); suspect input ~`K48` (group: pull_in)
  - pull-in (wants closer): E82@8.3Å(now 11.5,conf 0.55)
  - push-out (wants farther): K48@20.1Å(now 16.3,conf 0.58), L46@18.0Å(now 15.5,conf 0.55), Q50@16.1Å(now 12.3,conf 0.55)
  - L13↔K48: targets 7.1/20.1Å but partners are 9.6Å apart → too_close_together by 3.3Å
  - L13↔Q50: targets 7.1/16.1Å but partners are 5.8Å apart → too_close_together by 3.1Å
  - G12↔Q50: targets 5.0/16.1Å but partners are 8.1Å apart → too_close_together by 2.9Å
- **L46** — severity 7.45, 6 conflict(s); suspect input ~`T6` (group: pull_in)
  - pull-in (wants closer): T58@17.6Å(now 20.5,conf 0.55)
  - push-out (wants farther): T6@18.9Å(now 14.9,conf 0.56), A9@18.0Å(now 15.5,conf 0.55), I7@16.7Å(now 12.2,conf 0.55)
  - T6↔L54: targets 18.9/12.2Å but partners are 3.5Å apart → too_close_together by 3.2Å
  - L49↔T6: targets 5.0/18.9Å but partners are 10.9Å apart → too_close_together by 3.0Å
  - L49↔I7: targets 5.0/16.7Å but partners are 9.7Å apart → too_close_together by 2.0Å
- **L76** — severity 6.88, 4 conflict(s); suspect input ~`S30` (group: pull_in)
  - pull-in (wants closer): K44@11.5Å(now 14.1,conf 0.55), S30@12.3Å(now 15.6,conf 0.55), F28@10.2Å(now 13.7,conf 0.55)
  - E82↔S30: targets 9.0/12.3Å but partners are 25.1Å apart → too_far_apart by 3.8Å
  - E82↔F28: targets 9.0/10.2Å but partners are 22.9Å apart → too_far_apart by 3.8Å
  - L79↔S30: targets 5.0/12.3Å but partners are 20.0Å apart → too_far_apart by 2.8Å

## Secondary Structure (DSSP-like)

- helix(H)=26 · strand(E)=30 · 3-10(G)=16 · coil(C)=11

```
CEEGGGGGECGEHEGEHGHEHHEHHEHHHEGGEGCEHHEEGECHEHHEHECECEEGEECECECEGEHHEHHEHEGHHGHHCHC
```

## Backbone H-bond Network

- total=59 · helix(i→i+4)=7 · sheet=52
  - L13 ↔ P17  (helix)
  - P17 ↔ F21  (helix)
  - F21 ↔ A25  (helix)
  - A25 ↔ T29  (helix)
  - E67 ↔ K71  (helix)
  - V73 ↔ V77  (helix)
  - L76 ↔ M80  (helix)
  - A9 ↔ H14  (sheet)
  - H14 ↔ Q20  (sheet)
  - R16 ↔ K23  (sheet)
  - Q20 ↔ K26  (sheet)
  - K23 ↔ S42  (sheet)
  - K26 ↔ T33  (sheet)
  - K26 ↔ S42  (sheet)
  - K26 ↔ S45  (sheet)
  - S30 ↔ S42  (sheet)
  - S30 ↔ S45  (sheet)
  - T33 ↔ K39  (sheet)
  - T33 ↔ S40  (sheet)
  - T33 ↔ S42  (sheet)
  - … +39 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=34 · exposed=30 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=349 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=181 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.5139 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=15 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 68 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
