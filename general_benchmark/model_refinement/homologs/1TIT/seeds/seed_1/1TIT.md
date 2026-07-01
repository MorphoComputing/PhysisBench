# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1TIT\sequence\1TIT.pdb`
- output_pdb: `general_benchmark\model_refinement\homologs\1TIT\seeds\seed_1\1TIT.pdb`
- residues: 87
- mode: oracle
- ca_rmsd: 13.503 A
- tm_score_ca_ordered: 0.12138383689705322
- heavy_atom_rmsd: 13.807 A
- sidechain_heavy_atom_rmsd: 14.348 A
- **all-atom quality (honest):** heavy 13.807 A, sidechain 14.348 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/73 (0.0)
- lj_severe: 0
- lj_near: 16
- distogram_pairs: 3156
- bin_accuracy: 0.406

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=residue_block reason=accepted tested=48
- rigid_domain_reconvergence: applied=True accepted=7 rmsd=13.759454450812184 -> 11.751247302981696 A
- topology_reconvergence: applied=True accepted=1/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 13.502518267986293
- ga_delta_rmsd: -2.839338763002811  ga_fitness_mode: energy
- pre_local_rmsd: 13.912681591993119  localized_anchor_rmsd: 13.502528537410075

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** I1-L7 → 1029 conflicts (34%); S71-Q73 → 629 conflicts (21%); L35-Q38 → 393 conflicts (13%)
- explained: 2051/3024 conflicts by 3 root cause(s)
- metrics: hubs=87 (frac 1.0), conflicts/hub=34.8, max_incompat=13.06Å, chain_span=0.989
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): I1-L7 + S71-Q73 + L35-Q38 — explain ~2051/3024 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **S25** — severity 177.08, 105 conflict(s); suspect input ~`E2` (group: push_out)
  - pull-in (wants closer): L64@27.5Å(now 38.1,conf 1.00), G65@27.5Å(now 37.8,conf 1.00), Q63@27.5Å(now 36.5,conf 1.00), N61@27.5Å(now 33.0,conf 1.00), C62@27.5Å(now 32.3,conf 1.00), T67@27.5Å(now 34.2,conf 1.00), M66@27.5Å(now 34.3,conf 1.00), H60@27.5Å(now 32.6,conf 1.00), G68@27.5Å(now 33.0,conf 1.00), E87@27.5Å(now 30.3,conf 0.99), L59@27.5Å(now 30.8,conf 0.99), K86@27.5Å(now 30.6,conf 0.99), E69@27.5Å(now 31.7,conf 0.98), N82@27.5Å(now 31.1,conf 0.98), A80@27.5Å(now 30.1,conf 0.98), K84@27.5Å(now 30.3,conf 0.98), V85@27.4Å(now 30.5,conf 0.96), Q73@27.4Å(now 30.7,conf 0.95), V70@27.3Å(now 30.2,conf 0.93), S71@23.7Å(now 26.9,conf 0.51), A74@22.0Å(now 24.7,conf 0.47), E2@5.7Å(now 14.7,conf 0.43), G9@20.0Å(now 22.7,conf 0.41), I1@6.2Å(now 11.9,conf 0.40), V3@6.4Å(now 15.2,conf 0.39), Y8@16.9Å(now 20.1,conf 0.35), L7@13.8Å(now 17.4,conf 0.34), P6@11.0Å(now 16.7,conf 0.34)
  - push-out (wants farther): T41@27.5Å(now 24.9,conf 1.00), S43@27.5Å(now 25.0,conf 0.99), A77@27.5Å(now 22.3,conf 0.98), A42@27.4Å(now 20.6,conf 0.97), L40@25.6Å(now 21.2,conf 0.63), G37@25.4Å(now 19.4,conf 0.61), K34@24.3Å(now 21.2,conf 0.54), P39@22.9Å(now 19.0,conf 0.49), L35@22.3Å(now 17.6,conf 0.47), H19@20.0Å(now 17.3,conf 0.41), K54@19.4Å(now 16.8,conf 0.39), W33@17.2Å(now 14.6,conf 0.35), D45@17.2Å(now 13.1,conf 0.35), K53@16.1Å(now 13.3,conf 0.34), G52@16.1Å(now 12.9,conf 0.34), V29@9.2Å(now 4.1,conf 0.34), D28@10.1Å(now 4.8,conf 0.34), G31@12.9Å(now 8.5,conf 0.34), I48@12.6Å(now 9.6,conf 0.34), H30@12.4Å(now 6.3,conf 0.34)
  - A77↔E2: targets 27.5/5.7Å but partners are 11.2Å apart → too_close_together by 10.6Å
  - G37↔E2: targets 25.4/5.7Å but partners are 10.1Å apart → too_close_together by 9.5Å
  - A77↔V3: targets 27.5/6.4Å but partners are 10.8Å apart → too_close_together by 10.3Å
- **L24** — severity 164.57, 108 conflict(s); suspect input ~`V3` (group: push_out)
  - pull-in (wants closer): L64@27.5Å(now 37.5,conf 1.00), G65@27.5Å(now 37.0,conf 1.00), Q63@27.5Å(now 35.7,conf 1.00), N61@27.5Å(now 32.5,conf 1.00), C62@27.5Å(now 31.6,conf 1.00), T67@27.5Å(now 33.3,conf 1.00), M66@27.5Å(now 33.6,conf 1.00), G68@27.5Å(now 32.2,conf 1.00), H60@27.5Å(now 32.5,conf 1.00), E69@27.5Å(now 31.1,conf 0.99), L59@27.5Å(now 30.8,conf 0.99), V70@27.4Å(now 29.9,conf 0.96), V3@5.3Å(now 13.2,conf 0.46), F72@20.9Å(now 23.6,conf 0.43), E2@6.1Å(now 13.1,conf 0.41), I1@7.0Å(now 10.7,conf 0.37), G9@17.1Å(now 19.7,conf 0.35), P6@8.4Å(now 13.9,conf 0.35), L7@10.6Å(now 14.3,conf 0.34), Y8@13.9Å(now 17.0,conf 0.34)
  - push-out (wants farther): T41@27.5Å(now 24.4,conf 0.99), A42@27.4Å(now 20.9,conf 0.97), A77@27.4Å(now 21.2,conf 0.95), V14@27.2Å(now 23.4,conf 0.90), G15@27.2Å(now 23.3,conf 0.89), L40@26.5Å(now 21.6,conf 0.74), E16@26.1Å(now 23.5,conf 0.68), P39@24.6Å(now 19.7,conf 0.56), I49@23.6Å(now 20.8,conf 0.51), G37@21.9Å(now 16.8,conf 0.46), N76@20.4Å(now 17.5,conf 0.42), L35@19.2Å(now 15.3,conf 0.39), K53@17.6Å(now 14.8,conf 0.36), G52@16.9Å(now 14.3,conf 0.35), D45@16.9Å(now 13.6,conf 0.35), I48@14.8Å(now 10.8,conf 0.34), G31@10.3Å(now 7.5,conf 0.34), H30@10.5Å(now 6.5,conf 0.34)
  - A77↔V3: targets 27.4/5.3Å but partners are 10.8Å apart → too_close_together by 11.3Å
  - A77↔E2: targets 27.4/6.1Å but partners are 11.2Å apart → too_close_together by 10.2Å
  - K78↔V3: targets 27.4/5.3Å but partners are 13.5Å apart → too_close_together by 8.7Å
- **G37** — severity 116.88, 80 conflict(s); suspect input ~`E11` (group: pull_in)
  - pull-in (wants closer): L57@27.5Å(now 31.4,conf 1.00), I56@27.5Å(now 30.4,conf 1.00), G15@16.2Å(now 25.8,conf 0.35), E16@16.0Å(now 23.2,conf 0.34), T17@15.0Å(now 17.8,conf 0.34), V10@10.3Å(now 14.2,conf 0.34), V14@14.1Å(now 25.3,conf 0.34), F13@14.0Å(now 24.7,conf 0.34), E11@10.6Å(now 18.3,conf 0.34), V12@12.0Å(now 21.4,conf 0.34)
  - push-out (wants farther): P44@27.5Å(now 20.0,conf 1.00), T41@27.5Å(now 18.5,conf 1.00), L40@27.5Å(now 20.7,conf 1.00), A77@27.5Å(now 19.3,conf 1.00), G52@27.5Å(now 23.8,conf 1.00), K78@27.5Å(now 20.0,conf 1.00), I48@27.5Å(now 21.8,conf 1.00), E50@27.5Å(now 22.4,conf 0.99), S79@27.5Å(now 20.7,conf 0.98), D45@27.5Å(now 17.4,conf 0.98), A80@27.4Å(now 20.8,conf 0.97), A75@27.4Å(now 21.3,conf 0.96), A81@27.2Å(now 18.1,conf 0.90), N82@27.2Å(now 22.9,conf 0.88), P27@26.6Å(now 21.6,conf 0.76), E26@26.5Å(now 21.1,conf 0.75), L83@26.5Å(now 22.4,conf 0.74), D28@26.4Å(now 20.9,conf 0.74), S25@25.4Å(now 19.4,conf 0.61), I1@24.9Å(now 11.7,conf 0.57), V29@24.5Å(now 18.5,conf 0.55), N76@23.7Å(now 16.0,conf 0.51), E2@22.8Å(now 10.1,conf 0.49), H30@22.7Å(now 15.7,conf 0.48), F72@22.6Å(now 19.9,conf 0.48), E4@22.0Å(now 11.3,conf 0.46), L24@21.9Å(now 16.8,conf 0.46), E23@20.5Å(now 16.1,conf 0.42), V3@20.3Å(now 9.6,conf 0.41), K34@6.0Å(now 2.7,conf 0.41), K5@19.8Å(now 10.9,conf 0.40), G31@19.4Å(now 12.9,conf 0.39), I22@17.2Å(now 13.8,conf 0.35), Q32@16.7Å(now 7.3,conf 0.35), P6@16.5Å(now 7.2,conf 0.35), E21@16.1Å(now 13.5,conf 0.34), H19@14.2Å(now 11.0,conf 0.34), L7@13.4Å(now 8.4,conf 0.34), W33@13.3Å(now 5.1,conf 0.34)
  - L83↔E11: targets 26.5/10.6Å but partners are 6.7Å apart → too_close_together by 9.1Å
  - A81↔V10: targets 27.2/10.3Å but partners are 8.9Å apart → too_close_together by 8.0Å
  - V85↔E11: targets 25.9/10.6Å but partners are 7.3Å apart → too_close_together by 8.0Å
- **E26** — severity 114.11, 76 conflict(s); suspect input ~`I1` (group: push_out)
  - pull-in (wants closer): L64@27.5Å(now 37.4,conf 1.00), G65@27.5Å(now 37.4,conf 1.00), Q63@27.5Å(now 36.0,conf 1.00), N61@27.5Å(now 32.4,conf 1.00), T67@27.5Å(now 33.8,conf 1.00), C62@27.5Å(now 31.7,conf 1.00), M66@27.5Å(now 33.8,conf 1.00), E87@27.5Å(now 31.7,conf 1.00), G68@27.5Å(now 32.6,conf 1.00), K86@27.5Å(now 32.0,conf 0.99), H60@27.5Å(now 31.7,conf 0.99), K84@27.5Å(now 31.6,conf 0.99), N82@27.5Å(now 32.3,conf 0.99), V85@27.5Å(now 31.9,conf 0.98), A80@27.4Å(now 30.8,conf 0.97), E69@27.4Å(now 31.1,conf 0.97), L83@27.4Å(now 30.5,conf 0.96), Q73@27.4Å(now 30.4,conf 0.95), S71@22.8Å(now 25.9,conf 0.49), G9@21.9Å(now 24.5,conf 0.46), Y8@19.0Å(now 22.0,conf 0.38), I1@6.8Å(now 12.4,conf 0.38), E2@8.0Å(now 15.3,conf 0.35), L7@15.9Å(now 19.3,conf 0.34), V3@9.1Å(now 16.0,conf 0.34), P6@13.8Å(now 18.4,conf 0.34)
  - push-out (wants farther): E47@27.5Å(now 21.4,conf 1.00), D51@27.5Å(now 23.9,conf 0.99), T41@27.4Å(now 24.4,conf 0.97), S43@27.4Å(now 24.2,conf 0.96), A77@27.4Å(now 22.1,conf 0.94), A42@27.0Å(now 19.6,conf 0.83), G37@26.5Å(now 21.1,conf 0.75), K34@25.3Å(now 22.7,conf 0.61), N76@24.0Å(now 20.6,conf 0.53), L35@22.0Å(now 19.1,conf 0.46), V29@6.8Å(now 3.8,conf 0.38), H30@10.3Å(now 7.0,conf 0.34), I48@12.5Å(now 8.0,conf 0.34)
  - E47↔E2: targets 27.5/8.0Å but partners are 8.8Å apart → too_close_together by 10.7Å
  - E47↔I1: targets 27.5/6.8Å but partners are 10.8Å apart → too_close_together by 9.9Å
  - E47↔V3: targets 27.5/9.1Å but partners are 8.3Å apart → too_close_together by 10.1Å
- **E23** — severity 112.87, 86 conflict(s); suspect input ~`V3` (group: push_out)
  - pull-in (wants closer): L64@27.5Å(now 36.3,conf 1.00), Q63@27.5Å(now 34.2,conf 1.00), G65@27.5Å(now 35.7,conf 1.00), N61@27.5Å(now 31.1,conf 1.00), C62@27.5Å(now 30.4,conf 1.00), T67@27.5Å(now 32.3,conf 1.00), M66@27.5Å(now 32.5,conf 1.00), G68@27.5Å(now 31.4,conf 1.00), H60@27.5Å(now 31.4,conf 1.00), E69@27.5Å(now 30.4,conf 0.98), V3@6.4Å(now 12.4,conf 0.39), A74@19.1Å(now 22.4,conf 0.38), P6@6.9Å(now 11.9,conf 0.38), F72@17.9Å(now 21.5,conf 0.36), L7@8.3Å(now 11.9,conf 0.35), E2@8.9Å(now 12.9,conf 0.34), Y8@11.1Å(now 14.2,conf 0.34)
  - push-out (wants farther): D51@27.5Å(now 24.7,conf 0.99), A42@27.5Å(now 22.6,conf 0.99), L40@27.4Å(now 23.8,conf 0.94), A77@27.1Å(now 20.2,conf 0.87), P39@27.0Å(now 22.2,conf 0.83), E87@27.0Å(now 24.4,conf 0.83), K78@26.9Å(now 23.6,conf 0.82), V14@26.1Å(now 19.9,conf 0.69), G15@25.9Å(now 19.8,conf 0.66), A81@25.8Å(now 22.9,conf 0.66), F13@24.6Å(now 20.9,conf 0.56), I49@23.8Å(now 21.0,conf 0.52), E16@23.0Å(now 20.0,conf 0.49), G37@20.5Å(now 16.1,conf 0.42), D45@18.6Å(now 15.6,conf 0.37), L35@18.6Å(now 15.4,conf 0.37), K53@18.4Å(now 15.6,conf 0.37), I48@15.1Å(now 11.9,conf 0.34), H30@12.3Å(now 9.5,conf 0.34)
  - A77↔V3: targets 27.1/6.4Å but partners are 10.8Å apart → too_close_together by 9.9Å
  - A77↔K36: targets 27.1/5.3Å but partners are 15.4Å apart → too_close_together by 6.4Å
  - K78↔V3: targets 26.9/6.4Å but partners are 13.5Å apart → too_close_together by 7.0Å
- **Q38** — severity 90.57, 77 conflict(s); suspect input ~`V3` (group: pull_in)
  - pull-in (wants closer): H60@27.5Å(now 33.8,conf 1.00), E69@27.5Å(now 30.0,conf 1.00), L59@27.5Å(now 32.8,conf 1.00), V70@27.5Å(now 30.1,conf 1.00), I58@27.5Å(now 31.1,conf 1.00)
  - push-out (wants farther): E47@27.5Å(now 18.0,conf 1.00), C46@27.5Å(now 21.2,conf 1.00), A77@27.5Å(now 20.3,conf 1.00), S43@27.5Å(now 20.5,conf 0.99), K78@27.5Å(now 23.3,conf 0.99), P44@27.5Å(now 20.7,conf 0.99), A42@27.5Å(now 17.3,conf 0.99), I49@27.5Å(now 24.6,conf 0.98), A81@27.5Å(now 23.4,conf 0.98), T41@27.5Å(now 19.0,conf 0.98), H55@27.3Å(now 24.1,conf 0.92), K54@27.0Å(now 22.6,conf 0.85), A75@25.7Å(now 20.4,conf 0.64), N76@25.4Å(now 17.7,conf 0.62), K53@25.1Å(now 19.6,conf 0.59), I48@24.1Å(now 15.6,conf 0.53), G52@23.3Å(now 17.9,conf 0.50), E50@21.9Å(now 16.0,conf 0.46), W33@6.9Å(now 4.2,conf 0.38), D45@18.6Å(now 11.8,conf 0.37), H19@16.6Å(now 13.2,conf 0.35), K34@13.5Å(now 10.9,conf 0.34), K5@13.0Å(now 6.2,conf 0.34), E4@12.8Å(now 3.6,conf 0.34), L35@12.2Å(now 6.9,conf 0.34)
  - E47↔V3: targets 27.5/9.3Å but partners are 8.3Å apart → too_close_together by 9.9Å
  - E47↔E2: targets 27.5/10.0Å but partners are 8.8Å apart → too_close_together by 8.7Å
  - A77↔V3: targets 27.5/9.3Å but partners are 10.8Å apart → too_close_together by 7.4Å

## Secondary Structure (DSSP-like)

- helix(H)=32 · strand(E)=43 · 3-10(G)=7 · coil(C)=5

```
CECHGGEEGEEECHHEEEEGEEEGEEHEEEEEEHEHHHEHHHEHEHHHHHHHEEGEEECEHHHHHHEHEEHHHEEGHEEEEECHHEE
```

## Backbone H-bond Network

- total=74 · helix(i→i+4)=9 · sheet=65
  - G37 ↔ T41  (helix)
  - A42 ↔ C46  (helix)
  - P44 ↔ I48  (helix)
  - C46 ↔ E50  (helix)
  - I48 ↔ G52  (helix)
  - N61 ↔ G65  (helix)
  - L64 ↔ G68  (helix)
  - G68 ↔ F72  (helix)
  - Q73 ↔ A77  (helix)
  - E2 ↔ L7  (sheet)
  - E2 ↔ H19  (sheet)
  - E2 ↔ E21  (sheet)
  - L7 ↔ T17  (sheet)
  - L7 ↔ A18  (sheet)
  - L7 ↔ H19  (sheet)
  - L7 ↔ E21  (sheet)
  - L7 ↔ I22  (sheet)
  - L7 ↔ E23  (sheet)
  - Y8 ↔ T17  (sheet)
  - Y8 ↔ A18  (sheet)
  - … +54 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=17 · exposed=38 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=234 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=112 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=3.7569 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=16 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 73 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
