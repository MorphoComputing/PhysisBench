# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\4PTI\sequence\4PTI.pdb`
- output_pdb: `general_benchmark\model_refinement\homologs\4PTI\seeds\seed_0\4PTI.pdb`
- residues: 56
- mode: oracle
- ca_rmsd: 11.207 A
- tm_score_ca_ordered: 0.10976868449357137
- heavy_atom_rmsd: 11.763 A
- sidechain_heavy_atom_rmsd: 12.479 A
- **all-atom quality (honest):** heavy 11.763 A, sidechain 12.479 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/45 (0.0)
- lj_severe: 0
- lj_near: 33
- distogram_pairs: 499
- bin_accuracy: 0.048

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=rejected_local_chirality_regression tested=33
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 11.20748027686275
- ga_delta_rmsd: 0.6490689226303399  ga_fitness_mode: energy
- pre_local_rmsd: 11.207476371840855  localized_anchor_rmsd: 11.207476371840855

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** T31-G36 → 331 conflicts (50%); Y20-Y22 → 132 conflicts (20%); A39-R41 → 76 conflicts (11%)
- explained: 539/667 conflicts by 3 root cause(s)
- metrics: hubs=37 (frac 0.661), conflicts/hub=18.0, max_incompat=14.54Å, chain_span=0.929
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): T31-G36 + Y20-Y22 + A39-R41 — explain ~539/667 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **K40** — severity 87.04, 48 conflict(s); suspect input ~`Y34` (group: push_out)
  - push-out (wants farther): N23@27.5Å(now 15.1,conf 1.00), L5@27.5Å(now 20.7,conf 1.00), A24@27.5Å(now 13.1,conf 1.00), G27@27.5Å(now 8.7,conf 1.00), Y20@27.5Å(now 19.1,conf 1.00), F3@27.5Å(now 19.4,conf 1.00), I18@27.5Å(now 22.0,conf 1.00), Y22@27.5Å(now 12.3,conf 0.99), R16@27.5Å(now 21.7,conf 0.99), I17@27.5Å(now 22.3,conf 0.99), E6@27.5Å(now 22.4,conf 0.99), D2@27.5Å(now 20.6,conf 0.98), S46@27.4Å(now 18.1,conf 0.97), R19@27.4Å(now 21.9,conf 0.97), K45@27.4Å(now 16.2,conf 0.95), G11@27.2Å(now 20.2,conf 0.90), A26@27.1Å(now 11.4,conf 0.85), Y9@26.5Å(now 16.6,conf 0.74), Q30@25.7Å(now 13.0,conf 0.64), T53@24.5Å(now 14.5,conf 0.55), T10@24.4Å(now 18.2,conf 0.54), F21@23.6Å(now 18.9,conf 0.51), K25@19.4Å(now 12.0,conf 0.39), P1@18.9Å(now 14.7,conf 0.38), L28@16.7Å(now 11.6,conf 0.35), F32@15.6Å(now 6.6,conf 0.34), E48@14.6Å(now 11.6,conf 0.34), R52@14.4Å(now 11.9,conf 0.34), V33@13.5Å(now 5.7,conf 0.34), G36@13.2Å(now 9.4,conf 0.34), T31@13.1Å(now 3.4,conf 0.34), G35@12.6Å(now 9.2,conf 0.34)
  - G27↔Y34: targets 27.5/6.0Å but partners are 7.0Å apart → too_close_together by 14.5Å
  - A24↔Y34: targets 27.5/6.0Å but partners are 11.1Å apart → too_close_together by 10.4Å
  - Y22↔Y34: targets 27.5/6.0Å but partners are 11.3Å apart → too_close_together by 10.2Å
- **Y34** — severity 61.02, 35 conflict(s); suspect input ~`K40` (group: push_out)
  - push-out (wants farther): L5@27.5Å(now 19.8,conf 1.00), Y22@27.5Å(now 11.3,conf 1.00), Y20@27.5Å(now 17.7,conf 1.00), F3@27.5Å(now 18.0,conf 0.99), I18@27.5Å(now 19.9,conf 0.98), A26@27.4Å(now 13.1,conf 0.97), Q30@27.3Å(now 14.9,conf 0.92), R16@27.3Å(now 19.8,conf 0.92), R19@27.3Å(now 19.4,conf 0.91), I17@27.2Å(now 20.3,conf 0.90), E6@27.1Å(now 20.7,conf 0.87), F21@27.0Å(now 18.8,conf 0.83), D2@26.7Å(now 18.4,conf 0.78), S46@26.2Å(now 15.0,conf 0.71), K45@25.4Å(now 13.2,conf 0.61), G11@25.0Å(now 18.4,conf 0.58), R41@23.1Å(now 7.7,conf 0.50), Y9@22.9Å(now 15.1,conf 0.49), T53@22.4Å(now 11.4,conf 0.48), T10@20.9Å(now 16.9,conf 0.43), K25@19.3Å(now 13.9,conf 0.39), L28@18.9Å(now 13.9,conf 0.38), A39@10.3Å(now 6.4,conf 0.34), R52@12.4Å(now 9.7,conf 0.34), T31@12.4Å(now 5.5,conf 0.34)
  - A26↔K40: targets 27.4/6.0Å but partners are 11.4Å apart → too_close_together by 10.1Å
  - Y22↔K40: targets 27.5/6.0Å but partners are 12.3Å apart → too_close_together by 9.2Å
  - Q30↔K40: targets 27.3/6.0Å but partners are 13.0Å apart → too_close_together by 8.3Å
- **G35** — severity 59.54, 39 conflict(s); suspect input ~`A39` (group: push_out)
  - push-out (wants farther): L5@27.5Å(now 19.1,conf 1.00), Y20@27.5Å(now 16.6,conf 1.00), F3@27.5Å(now 18.9,conf 1.00), S46@27.5Å(now 19.9,conf 1.00), K45@27.5Å(now 18.8,conf 1.00), N23@27.5Å(now 15.1,conf 0.99), A24@27.5Å(now 16.1,conf 0.99), G11@27.5Å(now 23.5,conf 0.99), D2@27.5Å(now 23.1,conf 0.99), R16@27.5Å(now 22.6,conf 0.99), E6@27.5Å(now 22.0,conf 0.98), I18@27.5Å(now 20.0,conf 0.98), G27@27.5Å(now 10.7,conf 0.98), I17@27.4Å(now 21.6,conf 0.97), R19@27.4Å(now 21.7,conf 0.97), T53@27.4Å(now 19.6,conf 0.94), Y9@27.1Å(now 18.5,conf 0.87), R41@27.1Å(now 9.7,conf 0.85), T10@26.6Å(now 21.2,conf 0.76), F32@25.8Å(now 11.1,conf 0.66), Y22@25.8Å(now 9.6,conf 0.65), P1@24.4Å(now 20.1,conf 0.55), T31@24.0Å(now 7.2,conf 0.53), R52@21.4Å(now 17.4,conf 0.45), E48@20.4Å(now 15.9,conf 0.42), A26@19.2Å(now 4.9,conf 0.39), F21@18.5Å(now 13.6,conf 0.37), D49@18.0Å(now 13.7,conf 0.36), Q30@15.8Å(now 4.2,conf 0.34), L28@9.2Å(now 6.3,conf 0.34), K40@12.6Å(now 9.2,conf 0.34)
  - G27↔A39: targets 27.5/8.4Å but partners are 7.7Å apart → too_close_together by 11.4Å
  - T31↔A39: targets 24.0/8.4Å but partners are 7.0Å apart → too_close_together by 8.6Å
  - A24↔A39: targets 27.5/8.4Å but partners are 10.7Å apart → too_close_together by 8.4Å
- **A26** — severity 55.76, 33 conflict(s); suspect input ~`Y22` (group: push_out)
  - push-out (wants farther): E6@27.5Å(now 19.3,conf 1.00), F32@27.5Å(now 14.8,conf 1.00), G11@27.5Å(now 21.2,conf 1.00), R16@27.5Å(now 20.1,conf 1.00), V33@27.5Å(now 16.9,conf 1.00), T31@27.5Å(now 10.7,conf 1.00), R52@27.5Å(now 21.1,conf 1.00), I18@27.5Å(now 18.9,conf 1.00), I17@27.5Å(now 19.4,conf 1.00), E48@27.5Å(now 19.2,conf 1.00), Y9@27.5Å(now 16.0,conf 1.00), P1@27.5Å(now 19.3,conf 1.00), D49@27.5Å(now 17.8,conf 1.00), T10@27.5Å(now 18.6,conf 1.00), R19@27.5Å(now 20.5,conf 1.00), Y34@27.4Å(now 13.1,conf 0.97), K40@27.1Å(now 11.4,conf 0.85), G36@26.6Å(now 11.3,conf 0.76), A39@22.7Å(now 9.4,conf 0.48), G35@19.2Å(now 4.9,conf 0.39), N23@17.4Å(now 13.6,conf 0.35), Q30@15.5Å(now 3.8,conf 0.34)
  - I18↔Y22: targets 27.5/7.8Å but partners are 10.7Å apart → too_close_together by 8.9Å
  - Y34↔Y22: targets 27.4/7.8Å but partners are 11.3Å apart → too_close_together by 8.3Å
  - G36↔Y22: targets 26.6/7.8Å but partners are 10.6Å apart → too_close_together by 8.2Å
- **D49** — severity 53.80, 37 conflict(s); suspect input ~`T31` (group: push_out)
  - push-out (wants farther): Y22@27.5Å(now 16.0,conf 1.00), Y20@27.5Å(now 22.9,conf 1.00), I18@27.5Å(now 23.7,conf 1.00), F3@27.5Å(now 24.7,conf 1.00), A26@27.5Å(now 17.8,conf 1.00), F21@27.5Å(now 24.0,conf 0.98), R19@27.5Å(now 23.9,conf 0.98), Q30@27.4Å(now 17.9,conf 0.95), Y9@27.3Å(now 22.6,conf 0.93), S46@24.9Å(now 14.0,conf 0.58), L28@24.1Å(now 18.9,conf 0.53), K25@23.0Å(now 20.0,conf 0.49), K45@22.9Å(now 10.8,conf 0.49), R41@18.9Å(now 8.6,conf 0.38), G35@18.0Å(now 13.7,conf 0.36), F32@9.3Å(now 3.2,conf 0.34), T53@15.2Å(now 8.8,conf 0.34), G36@14.2Å(now 8.3,conf 0.34)
  - K45↔R52: targets 22.9/5.2Å but partners are 8.9Å apart → too_close_together by 8.8Å
  - S46↔R52: targets 24.9/5.2Å but partners are 12.3Å apart → too_close_together by 7.4Å
  - A26↔T31: targets 27.5/9.1Å but partners are 10.7Å apart → too_close_together by 7.8Å
- **A39** — severity 53.03, 34 conflict(s); suspect input ~`Y34` (group: push_out)
  - push-out (wants farther): L5@27.5Å(now 17.4,conf 1.00), Y20@27.5Å(now 17.2,conf 1.00), F3@27.5Å(now 16.5,conf 1.00), N23@27.5Å(now 13.3,conf 1.00), A24@27.5Å(now 10.7,conf 1.00), I18@27.5Å(now 20.9,conf 1.00), G27@27.5Å(now 7.7,conf 1.00), S46@27.5Å(now 20.1,conf 1.00), K45@27.5Å(now 18.9,conf 0.99), D2@27.5Å(now 18.3,conf 0.99), R16@27.5Å(now 19.1,conf 0.99), E6@27.5Å(now 19.8,conf 0.99), I17@27.5Å(now 20.3,conf 0.99), R19@27.5Å(now 20.6,conf 0.98), G11@27.4Å(now 17.4,conf 0.97), Y22@27.2Å(now 11.2,conf 0.89), T53@27.1Å(now 17.7,conf 0.87), Y9@27.0Å(now 13.5,conf 0.83), T10@25.6Å(now 14.7,conf 0.64), A26@22.7Å(now 9.4,conf 0.48), P1@21.4Å(now 13.0,conf 0.45), Q30@20.8Å(now 12.1,conf 0.43), F32@20.6Å(now 10.7,conf 0.42), V33@19.0Å(now 9.1,conf 0.38), R52@18.8Å(now 15.9,conf 0.38), E48@18.7Å(now 15.1,conf 0.38), T31@18.3Å(now 7.0,conf 0.37), K25@16.7Å(now 8.6,conf 0.35), Y34@10.3Å(now 6.4,conf 0.34), L28@11.9Å(now 9.2,conf 0.34)
  - G27↔Y34: targets 27.5/10.3Å but partners are 7.0Å apart → too_close_together by 10.2Å
  - A26↔G35: targets 22.7/8.4Å but partners are 4.9Å apart → too_close_together by 9.4Å
  - Y22↔G35: targets 27.2/8.4Å but partners are 9.6Å apart → too_close_together by 9.3Å

## Secondary Structure (DSSP-like)

- helix(H)=40 · strand(E)=11 · 3-10(G)=4 · coil(C)=1

```
EECHGHHHEHHHHEHHEHHEHHHHGHHHHHEHHEHHHHHHHHEHGHGHHHHHHHEE
```

## Backbone H-bond Network

- total=40 · helix(i→i+4)=26 · sheet=14
  - C4 ↔ P8  (helix)
  - E6 ↔ T10  (helix)
  - P8 ↔ P12  (helix)
  - G11 ↔ A15  (helix)
  - P12 ↔ R16  (helix)
  - A15 ↔ R19  (helix)
  - I18 ↔ Y22  (helix)
  - R19 ↔ N23  (helix)
  - Y22 ↔ A26  (helix)
  - N23 ↔ G27  (helix)
  - A26 ↔ Q30  (helix)
  - L28 ↔ F32  (helix)
  - C29 ↔ V33  (helix)
  - F32 ↔ G36  (helix)
  - V33 ↔ C37  (helix)
  - G35 ↔ A39  (helix)
  - G36 ↔ K40  (helix)
  - C37 ↔ R41  (helix)
  - R38 ↔ N42  (helix)
  - K40 ↔ F44  (helix)
  - … +20 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=15 · exposed=31 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=270 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=194 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=11.1142 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=33 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C4–C54, C13–C37, C29–C50

## Side-chain Rotamers (χ1/χ2)

- 45 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
