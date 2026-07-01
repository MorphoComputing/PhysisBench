# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1YCC\sequence\1YCC.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1YCC\seeds\seed_7\1YCC.pdb`
- residues: 103
- mode: oracle
- ca_rmsd: 10.275 A
- tm_score_ca_ordered: 0.2210662630118193
- heavy_atom_rmsd: 10.995 A
- sidechain_heavy_atom_rmsd: 11.639 A
- **all-atom quality (honest):** heavy 10.995 A, sidechain 11.639 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/84 (0.0)
- lj_severe: 0
- lj_near: 46
- distogram_pairs: 1052
- bin_accuracy: 0.328

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=global reason=rejected_domain_topology_regression tested=51
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 10.275326957022214
- ga_delta_rmsd: 0.48598118701950277  ga_fitness_mode: energy
- pre_local_rmsd: 10.28451445960383  localized_anchor_rmsd: 10.275313823066373

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** E89-C103 → 559 conflicts (43%); G5-L13 → 273 conflicts (21%); M68-Y75 → 141 conflicts (11%)
- explained: 973/1300 conflicts by 3 root cause(s)
- metrics: hubs=96 (frac 0.932), conflicts/hub=13.5, max_incompat=18.11Å, chain_span=0.99
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): E89-C103 + G5-L13 + M68-Y75 — explain ~973/1300 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **K90** — severity 154.94, 36 conflict(s); suspect input ~`I96` (group: pull_in)
  - pull-in (wants closer): N93@5.1Å(now 9.2,conf 0.57), R17@14.9Å(now 23.3,conf 0.55), F2@9.5Å(now 21.9,conf 0.55), S69@10.3Å(now 14.1,conf 0.55), T16@16.0Å(now 25.0,conf 0.55)
  - push-out (wants farther): E48@27.5Å(now 11.3,conf 1.00), Y52@27.5Å(now 19.3,conf 0.99), G85@13.0Å(now 9.6,conf 0.94), L86@9.1Å(now 6.5,conf 0.91), T79@23.7Å(now 19.4,conf 0.75), F83@18.0Å(now 15.0,conf 0.72), G84@16.0Å(now 12.8,conf 0.72), K80@25.0Å(now 20.9,conf 0.69), K101@16.9Å(now 7.4,conf 0.55), E65@13.4Å(now 8.5,conf 0.55)
  - E48↔I96: targets 27.5/9.0Å but partners are 5.1Å apart → too_close_together by 13.4Å
  - E48↔L95: targets 27.5/8.0Å but partners are 4.3Å apart → too_close_together by 15.2Å
  - E48↔N93: targets 27.5/5.1Å but partners are 4.3Å apart → too_close_together by 18.1Å
- **T53** — severity 118.14, 23 conflict(s); suspect input ~`Q46` (group: pull_in)
  - pull-in (wants closer): T79@6.2Å(now 10.7,conf 0.55)
  - push-out (wants farther): S6@27.5Å(now 12.8,conf 1.00), D94@27.4Å(now 17.6,conf 0.96), L72@17.4Å(now 7.4,conf 0.55), R42@16.8Å(now 7.1,conf 0.55)
  - S6↔Q46: targets 27.5/10.9Å but partners are 3.2Å apart → too_close_together by 13.4Å
  - S6↔A47: targets 27.5/12.6Å but partners are 3.3Å apart → too_close_together by 11.6Å
  - S6↔G49: targets 27.5/12.8Å but partners are 3.8Å apart → too_close_together by 10.9Å
- **S6** — severity 117.80, 23 conflict(s); suspect input ~`G10` (group: push_out)
  - push-out (wants farther): T53@27.5Å(now 12.8,conf 1.00), G78@27.5Å(now 13.8,conf 1.00), E48@27.5Å(now 3.7,conf 1.00), L13@10.2Å(now 7.5,conf 0.69), L72@16.8Å(now 9.6,conf 0.55), R17@15.9Å(now 10.3,conf 0.55)
  - E48↔G10: targets 27.5/5.0Å but partners are 5.1Å apart → too_close_together by 17.4Å
  - E48↔K9: targets 27.5/5.2Å but partners are 8.4Å apart → too_close_together by 13.9Å
  - T53↔F2: targets 27.5/13.0Å but partners are 4.0Å apart → too_close_together by 10.5Å
- **Y52** — severity 114.66, 22 conflict(s); suspect input ~`Q46` (group: push_out)
  - push-out (wants farther): G5@27.5Å(now 7.8,conf 1.00), K90@27.5Å(now 19.3,conf 0.99), D64@19.2Å(now 12.9,conf 0.56), L72@17.4Å(now 7.7,conf 0.55), I39@14.4Å(now 4.5,conf 0.55), I76@11.9Å(now 3.4,conf 0.55)
  - G5↔Q46: targets 27.5/9.0Å but partners are 3.2Å apart → too_close_together by 15.3Å
  - G5↔E48: targets 27.5/10.9Å but partners are 4.3Å apart → too_close_together by 12.3Å
  - G5↔G45: targets 27.5/6.6Å but partners are 6.7Å apart → too_close_together by 14.2Å
- **E89** — severity 112.86, 26 conflict(s); suspect input ~`Q46` (group: push_out)
  - pull-in (wants closer): N93@6.1Å(now 9.7,conf 0.55), L13@12.9Å(now 21.2,conf 0.55), F2@8.4Å(now 21.1,conf 0.55), G5@10.1Å(now 15.8,conf 0.55)
  - push-out (wants farther): Q46@27.2Å(now 12.9,conf 0.91), K101@18.2Å(now 5.7,conf 0.55), D64@15.6Å(now 11.5,conf 0.55)
  - L95↔Q46: targets 9.1/27.2Å but partners are 5.3Å apart → too_close_together by 12.8Å
  - R92↔Q46: targets 5.0/27.2Å but partners are 9.5Å apart → too_close_together by 12.7Å
  - Q46↔I96: targets 27.2/9.4Å but partners are 4.9Å apart → too_close_together by 12.9Å
- **G10** — severity 112.18, 33 conflict(s); suspect input ~`Q46` (group: pull_in)
  - pull-in (wants closer): Y98@5.0Å(now 10.2,conf 0.57), K101@10.1Å(now 14.2,conf 0.55)
  - push-out (wants farther): A7@5.0Å(now 1.3,conf 0.99), N56@23.7Å(now 17.9,conf 0.76), Q46@23.8Å(now 6.0,conf 0.75)
  - S6↔Q46: targets 5.0/23.8Å but partners are 3.2Å apart → too_close_together by 15.6Å
  - A7↔Q46: targets 5.0/23.8Å but partners are 5.2Å apart → too_close_together by 13.6Å
  - G5↔Q46: targets 7.0/23.8Å but partners are 3.2Å apart → too_close_together by 13.6Å

## Secondary Structure (DSSP-like)

- helix(H)=52 · strand(E)=30 · 3-10(G)=9 · coil(C)=12

```
EEECEEEHHGEHHHEHHHHHGEEHHHCEEEHHHCCCECHCHEECEHHHHEGHCEHEHEHEHHGHHEHGHHGHHEHHEHHHEHCEGCHEHEGGHHEHHHHHHHC
```

## Backbone H-bond Network

- total=81 · helix(i→i+4)=19 · sheet=62
  - K8 ↔ T12  (helix)
  - T12 ↔ T16  (helix)
  - T16 ↔ Q20  (helix)
  - Q20 ↔ V24  (helix)
  - E48 ↔ Y52  (helix)
  - A55 ↔ K59  (helix)
  - I57 ↔ V61  (helix)
  - V61 ↔ E65  (helix)
  - E65 ↔ S69  (helix)
  - S69 ↔ T73  (helix)
  - L72 ↔ I76  (helix)
  - Y75 ↔ T79  (helix)
  - I76 ↔ K80  (helix)
  - G78 ↔ A82  (helix)
  - E89 ↔ N93  (helix)
  - N93 ↔ T97  (helix)
  - D94 ↔ Y98  (helix)
  - T97 ↔ K101  (helix)
  - Y98 ↔ A102  (helix)
  - K3 ↔ K15  (sheet)
  - … +61 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=34 · exposed=35 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=759 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=518 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=6.3071 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=46 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 84 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
