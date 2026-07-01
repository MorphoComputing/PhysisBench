# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1KTH\sequence\1KTH.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1KTH\seeds\seed_7\1KTH.pdb`
- residues: 56
- mode: oracle
- ca_rmsd: 3.342 A
- tm_score_ca_ordered: 0.5894952445833205
- heavy_atom_rmsd: 4.527 A
- sidechain_heavy_atom_rmsd: 5.391 A
- **all-atom quality (honest):** heavy 4.527 A, sidechain 5.391 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/48 (0.0)
- lj_severe: 0
- lj_near: 12
- distogram_pairs: 489
- bin_accuracy: 0.669

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=residue_block reason=accepted tested=42
- rigid_domain_reconvergence: applied=True accepted=5 rmsd=5.384532162527659 -> 4.510948318255848 A
- topology_reconvergence: applied=True accepted=6/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 3.3417072754274018
- ga_delta_rmsd: -1.6671874145230494  ga_fitness_mode: energy
- pre_local_rmsd: 3.3416508158579945  localized_anchor_rmsd: 3.3416508158579945

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** T1 → 16 conflicts (57%)
- explained: 16/28 conflicts by 1 root cause(s)
- metrics: hubs=12 (frac 0.214), conflicts/hub=2.3, max_incompat=6.78Å, chain_span=0.893
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): T1 — explain ~16/28 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **C13** — severity 28.14, 9 conflict(s); suspect input ~`T1` (group: push_out)
  - push-out (wants farther): T1@27.4Å(now 20.1,conf 0.94)
  - T1↔D9: targets 27.4/11.1Å but partners are 9.5Å apart → too_close_together by 6.8Å
  - E10↔T1: targets 9.0/27.4Å but partners are 12.3Å apart → too_close_together by 6.1Å
  - T1↔F44: targets 27.4/17.8Å but partners are 3.3Å apart → too_close_together by 6.2Å
- **A30** — severity 7.38, 4 conflict(s); suspect input ~`T1` (group: push_out)
  - push-out (wants farther): T1@17.4Å(now 10.9,conf 0.55)
  - Y22↔T1: targets 6.4/17.4Å but partners are 6.7Å apart → too_close_together by 4.3Å
  - T1↔F44: targets 17.4/10.0Å but partners are 3.3Å apart → too_close_together by 4.1Å
  - T1↔K43: targets 17.4/10.0Å but partners are 4.1Å apart → too_close_together by 3.2Å
- **W20** — severity 4.62, 2 conflict(s); suspect input ~`T1` (group: push_out)
  - push-out (wants farther): T1@16.1Å(now 7.7,conf 0.55)
  - C50↔T1: targets 6.6/16.1Å but partners are 4.7Å apart → too_close_together by 4.8Å
  - N42↔T1: targets 7.9/16.1Å but partners are 4.6Å apart → too_close_together by 3.6Å
- **D2** — severity 3.05, 2 conflict(s); suspect input ~`K5` (group: push_out)
  - push-out (wants farther): L6@8.2Å(now 4.8,conf 0.69), C50@13.4Å(now 10.3,conf 0.55), E49@16.2Å(now 11.5,conf 0.55)
  - E49↔K5: targets 16.2/5.8Å but partners are 6.8Å apart → too_close_together by 3.6Å
  - C50↔K5: targets 13.4/5.8Å but partners are 5.4Å apart → too_close_together by 2.2Å
- **Q47** — severity 2.96, 2 conflict(s); suspect input ~`L6` (group: push_out)
  - push-out (wants farther): K52@10.1Å(now 7.3,conf 0.67), L6@16.4Å(now 11.4,conf 0.55)
  - F44↔L6: targets 7.1/16.4Å but partners are 5.7Å apart → too_close_together by 3.6Å
  - C50↔L6: targets 6.2/16.4Å but partners are 8.4Å apart → too_close_together by 1.8Å
- **E49** — severity 2.73, 2 conflict(s); suspect input ~`D2` (group: push_out)
  - push-out (wants farther): D2@16.2Å(now 11.5,conf 0.55)
  - G45↔D2: targets 7.0/16.2Å but partners are 6.2Å apart → too_close_together by 3.0Å
  - V53↔D2: targets 7.5/16.2Å but partners are 6.6Å apart → too_close_together by 2.0Å

## Secondary Structure (DSSP-like)

- helix(H)=13 · strand(E)=28 · 3-10(G)=10 · coil(C)=5

```
EEHHHEGGGHEEEECEGEEEEEGHEGGEGGHECEEGEHEEECEEHCHHEHHEHECE
```

## Backbone H-bond Network

- total=53 · helix(i→i+4)=1 · sheet=52
  - Q47 ↔ E51  (helix)
  - T1 ↔ L6  (sheet)
  - T1 ↔ K19  (sheet)
  - T1 ↔ W20  (sheet)
  - T1 ↔ Y21  (sheet)
  - D2 ↔ Y21  (sheet)
  - L6 ↔ W20  (sheet)
  - L6 ↔ Y21  (sheet)
  - L6 ↔ Y22  (sheet)
  - G11 ↔ F16  (sheet)
  - G11 ↔ L18  (sheet)
  - G11 ↔ K19  (sheet)
  - R14 ↔ Y34  (sheet)
  - F16 ↔ F32  (sheet)
  - F16 ↔ Y34  (sheet)
  - F16 ↔ G35  (sheet)
  - L18 ↔ F32  (sheet)
  - L18 ↔ Y34  (sheet)
  - L18 ↔ G35  (sheet)
  - K19 ↔ F32  (sheet)
  - … +33 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=20 · exposed=18 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=243 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=152 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.2523 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=12 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C4–C54, C13–C37, C29–C50

## Side-chain Rotamers (χ1/χ2)

- 48 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
