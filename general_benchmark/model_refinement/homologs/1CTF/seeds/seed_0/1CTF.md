# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1CTF\sequence\1CTF.pdb`
- output_pdb: `general_benchmark\model_refinement\homologs\1CTF\seeds\seed_0\1CTF.pdb`
- residues: 66
- mode: oracle
- ca_rmsd: 10.206 A
- tm_score_ca_ordered: 0.14099332660406816
- heavy_atom_rmsd: 10.754 A
- sidechain_heavy_atom_rmsd: 11.474 A
- **all-atom quality (honest):** heavy 10.754 A, sidechain 11.474 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/45 (0.0)
- lj_severe: 0
- lj_near: 14
- distogram_pairs: 1473
- bin_accuracy: 0.106

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=insufficient_rmsd_improvement tested=39
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 10.205878927881681
- ga_delta_rmsd: -0.7452316388752251  ga_fitness_mode: energy
- pre_local_rmsd: 10.205888905172031  localized_anchor_rmsd: 10.205888905172031

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** T23-S46 → 2065 conflicts (75%); A7-K12 → 372 conflicts (14%); G61-E65 → 144 conflicts (5%)
- explained: 2581/2755 conflicts by 3 root cause(s)
- metrics: hubs=59 (frac 0.894), conflicts/hub=46.7, max_incompat=16.32Å, chain_span=0.985
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): T23-S46 + A7-K12 + G61-E65 — explain ~2581/2755 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **I16** — severity 188.27, 147 conflict(s); suspect input ~`V19` (group: pull_in)
  - pull-in (wants closer): L27@7.8Å(now 12.2,conf 0.35), N11@8.4Å(now 11.0,conf 0.35), K28@9.8Å(now 13.5,conf 0.34)
  - push-out (wants farther): A60@27.5Å(now 22.1,conf 1.00), K55@27.5Å(now 21.3,conf 1.00), A50@27.5Å(now 24.1,conf 1.00), K54@27.5Å(now 21.7,conf 1.00), D49@27.5Å(now 24.5,conf 1.00), V45@27.5Å(now 23.0,conf 1.00), K6@27.5Å(now 23.4,conf 1.00), L5@27.5Å(now 24.5,conf 1.00), L57@27.5Å(now 21.6,conf 1.00), G61@27.5Å(now 19.4,conf 1.00), A52@27.5Å(now 21.8,conf 1.00), E51@27.5Å(now 22.6,conf 0.99), V3@27.5Å(now 24.3,conf 0.99), V66@27.5Å(now 22.1,conf 0.99), E65@27.3Å(now 19.6,conf 0.91), A7@27.2Å(now 18.2,conf 0.89), A62@27.2Å(now 19.0,conf 0.88), E43@27.1Å(now 20.9,conf 0.88), G44@27.1Å(now 21.1,conf 0.87), E63@26.6Å(now 18.7,conf 0.77), V64@26.6Å(now 18.4,conf 0.76), A10@26.3Å(now 16.8,conf 0.72), G9@25.4Å(now 14.2,conf 0.61), A8@25.2Å(now 15.5,conf 0.60), A40@24.1Å(now 18.2,conf 0.53), K42@24.0Å(now 18.2,conf 0.53), S36@21.6Å(now 16.6,conf 0.45), V19@5.5Å(now 2.8,conf 0.44), L41@21.1Å(now 15.9,conf 0.44), A39@14.6Å(now 11.6,conf 0.34), T23@10.2Å(now 7.6,conf 0.34)
  - G9↔N11: targets 25.4/8.4Å but partners are 4.1Å apart → too_close_together by 12.8Å
  - G9↔K12: targets 25.4/6.3Å but partners are 8.3Å apart → too_close_together by 10.7Å
  - A10↔N11: targets 26.3/8.4Å but partners are 6.4Å apart → too_close_together by 11.5Å
- **A10** — severity 168.80, 90 conflict(s); suspect input ~`A7` (group: pull_in)
  - pull-in (wants closer): E43@19.9Å(now 23.5,conf 0.40), A7@6.3Å(now 9.2,conf 0.40), G44@17.8Å(now 22.2,conf 0.36), K42@16.6Å(now 24.3,conf 0.35), L41@15.2Å(now 23.9,conf 0.34), S36@10.7Å(now 23.9,conf 0.34), A52@13.8Å(now 19.9,conf 0.34), E51@11.0Å(now 23.0,conf 0.34), A40@12.0Å(now 22.7,conf 0.34)
  - push-out (wants farther): E63@27.4Å(now 23.6,conf 0.97), A62@27.4Å(now 22.5,conf 0.96), E59@27.3Å(now 9.7,conf 0.92), V66@27.0Å(now 18.3,conf 0.84), A60@27.0Å(now 16.0,conf 0.84), E58@27.0Å(now 12.8,conf 0.84), K6@26.9Å(now 13.8,conf 0.83), K17@26.9Å(now 14.7,conf 0.82), D48@26.9Å(now 19.3,conf 0.82), K47@26.8Å(now 22.5,conf 0.80), V13@26.8Å(now 13.9,conf 0.79), V64@26.7Å(now 21.2,conf 0.78), K31@26.7Å(now 22.5,conf 0.78), E65@26.5Å(now 19.9,conf 0.74), V15@26.4Å(now 14.2,conf 0.72), I16@26.3Å(now 16.8,conf 0.72), A56@26.2Å(now 19.4,conf 0.71), E35@26.0Å(now 21.3,conf 0.68), D32@25.6Å(now 22.6,conf 0.64), A37@25.0Å(now 21.5,conf 0.58), A30@24.7Å(now 22.1,conf 0.56), R20@24.4Å(now 18.3,conf 0.55), V34@23.8Å(now 20.9,conf 0.52), D49@23.6Å(now 19.5,conf 0.51), L5@23.6Å(now 16.7,conf 0.51), A50@23.3Å(now 20.5,conf 0.50), D2@22.8Å(now 12.3,conf 0.49), V19@22.3Å(now 15.6,conf 0.47), F1@23.6Å(now 14.2,conf 0.42), K55@19.8Å(now 16.5,conf 0.40)
  - E59↔A7: targets 27.3/6.3Å but partners are 4.7Å apart → too_close_together by 16.3Å
  - K6↔A7: targets 26.9/6.3Å but partners are 5.6Å apart → too_close_together by 15.0Å
  - A60↔A7: targets 27.0/6.3Å but partners are 7.0Å apart → too_close_together by 13.7Å
- **A7** — severity 139.32, 87 conflict(s); suspect input ~`A40` (group: pull_in)
  - pull-in (wants closer): A10@6.3Å(now 9.2,conf 0.40), A40@8.7Å(now 17.3,conf 0.35), S36@15.2Å(now 22.1,conf 0.34), E51@14.3Å(now 20.3,conf 0.34), K42@13.4Å(now 18.0,conf 0.34), L41@12.7Å(now 18.7,conf 0.34)
  - push-out (wants farther): N11@27.5Å(now 10.7,conf 0.99), K12@27.5Å(now 14.1,conf 0.98), K17@27.4Å(now 16.5,conf 0.94), L27@27.4Å(now 24.2,conf 0.94), K28@27.3Å(now 23.3,conf 0.93), V15@27.3Å(now 17.3,conf 0.93), A37@27.2Å(now 22.8,conf 0.90), I16@27.2Å(now 18.2,conf 0.89), E63@27.2Å(now 16.5,conf 0.88), K31@27.2Å(now 22.6,conf 0.88), V13@27.2Å(now 17.2,conf 0.88), S46@27.1Å(now 21.6,conf 0.86), E35@27.0Å(now 21.9,conf 0.85), G26@26.9Å(now 22.0,conf 0.81), A62@26.8Å(now 15.1,conf 0.80), A56@26.6Å(now 19.6,conf 0.76), D32@26.4Å(now 21.8,conf 0.73), R20@26.0Å(now 17.5,conf 0.68), V34@26.0Å(now 21.4,conf 0.67), A30@25.9Å(now 21.3,conf 0.66), E29@25.9Å(now 21.8,conf 0.66), K47@25.2Å(now 18.4,conf 0.60), D48@25.1Å(now 16.3,conf 0.59), V19@24.7Å(now 16.2,conf 0.56), V66@24.5Å(now 9.3,conf 0.55), L25@24.0Å(now 19.4,conf 0.53), V64@23.9Å(now 13.7,conf 0.52), G24@23.9Å(now 18.5,conf 0.52), E59@23.8Å(now 4.7,conf 0.52), E65@23.5Å(now 11.8,conf 0.51), E58@22.8Å(now 8.6,conf 0.49), D49@22.3Å(now 15.2,conf 0.47), A50@22.2Å(now 16.7,conf 0.47), K54@22.1Å(now 19.1,conf 0.47), A60@22.0Å(now 7.0,conf 0.47), T23@21.3Å(now 16.1,conf 0.44), K55@21.1Å(now 16.9,conf 0.44), V45@21.1Å(now 18.2,conf 0.44), L57@20.9Å(now 15.6,conf 0.43), D2@18.2Å(now 7.3,conf 0.37), G61@14.9Å(now 9.1,conf 0.34), V3@14.7Å(now 8.0,conf 0.34), F1@19.2Å(now 7.8,conf 0.26)
  - N11↔A10: targets 27.5/6.3Å but partners are 6.4Å apart → too_close_together by 14.8Å
  - K12↔A10: targets 27.5/6.3Å but partners are 10.2Å apart → too_close_together by 11.0Å
  - S46↔A40: targets 27.1/8.7Å but partners are 8.5Å apart → too_close_together by 9.9Å
- **K31** — severity 129.59, 99 conflict(s); suspect input ~`K28` (group: pull_in)
  - pull-in (wants closer): K12@8.2Å(now 14.6,conf 0.35), K17@9.2Å(now 12.1,conf 0.34), N11@11.8Å(now 18.0,conf 0.34), V13@8.7Å(now 11.9,conf 0.23)
  - push-out (wants farther): E58@27.5Å(now 24.8,conf 1.00), D49@27.5Å(now 23.2,conf 1.00), V45@27.5Å(now 19.8,conf 1.00), L57@27.5Å(now 20.2,conf 1.00), A52@27.5Å(now 18.9,conf 1.00), E51@27.5Å(now 18.4,conf 1.00), G61@27.5Å(now 21.5,conf 0.98), G44@27.4Å(now 18.8,conf 0.95), A7@27.2Å(now 22.6,conf 0.88), E65@27.1Å(now 22.0,conf 0.88), A10@26.7Å(now 22.5,conf 0.78), A62@26.1Å(now 20.0,conf 0.68), E43@25.6Å(now 20.4,conf 0.63), V64@25.3Å(now 19.9,conf 0.60), A8@25.1Å(now 21.1,conf 0.59), E63@25.1Å(now 18.7,conf 0.58), G9@24.8Å(now 21.1,conf 0.57), S36@24.4Å(now 10.0,conf 0.55), A40@23.3Å(now 14.9,conf 0.50), K42@21.4Å(now 16.5,conf 0.45), V34@5.7Å(now 2.0,conf 0.43), L41@19.5Å(now 13.1,conf 0.39), A39@14.8Å(now 8.8,conf 0.34), A37@13.6Å(now 4.9,conf 0.34)
  - S36↔K28: targets 24.4/5.7Å but partners are 7.3Å apart → too_close_together by 11.4Å
  - S36↔E35: targets 24.4/6.2Å but partners are 7.6Å apart → too_close_together by 10.5Å
  - S36↔V34: targets 24.4/5.7Å but partners are 11.1Å apart → too_close_together by 7.6Å
- **A8** — severity 126.65, 80 conflict(s); suspect input ~`A40` (group: pull_in)
  - pull-in (wants closer): A40@7.0Å(now 18.6,conf 0.37), A52@17.0Å(now 20.0,conf 0.35), E51@15.0Å(now 22.2,conf 0.34), L41@10.3Å(now 19.1,conf 0.34), S36@12.7Å(now 22.5,conf 0.34), K42@11.9Å(now 18.8,conf 0.34)
  - push-out (wants farther): N11@27.4Å(now 7.2,conf 0.96), S46@27.4Å(now 22.9,conf 0.94), K12@27.2Å(now 10.8,conf 0.90), A56@27.2Å(now 20.2,conf 0.90), K47@27.0Å(now 20.5,conf 0.84), D48@26.9Å(now 18.8,conf 0.82), E63@26.5Å(now 17.3,conf 0.75), V13@26.5Å(now 14.1,conf 0.73), E59@26.3Å(now 7.6,conf 0.72), L27@26.3Å(now 23.1,conf 0.71), K17@26.2Å(now 13.3,conf 0.70), K28@26.1Å(now 22.8,conf 0.69), A62@26.0Å(now 15.9,conf 0.67), V15@25.9Å(now 14.3,conf 0.66), A37@25.4Å(now 21.6,conf 0.61), I16@25.2Å(now 15.5,conf 0.60), E58@25.1Å(now 11.9,conf 0.59), K31@25.1Å(now 21.1,conf 0.59), E35@24.6Å(now 20.9,conf 0.56), A60@24.3Å(now 9.6,conf 0.54), G26@24.1Å(now 20.7,conf 0.53), V66@23.9Å(now 11.6,conf 0.52), A50@23.8Å(now 19.4,conf 0.52), D49@23.6Å(now 18.2,conf 0.51), K54@23.5Å(now 20.6,conf 0.51), K55@22.9Å(now 18.4,conf 0.49), V64@22.4Å(now 14.5,conf 0.48), V34@22.4Å(now 19.8,conf 0.47), R20@22.4Å(now 15.0,conf 0.47), E65@22.4Å(now 13.0,conf 0.47), A30@22.3Å(now 19.6,conf 0.47), D2@21.4Å(now 10.3,conf 0.45), L57@21.3Å(now 17.6,conf 0.44), V19@21.1Å(now 13.4,conf 0.44), L25@20.7Å(now 17.9,conf 0.43), G24@20.6Å(now 16.9,conf 0.42), L5@20.3Å(now 11.6,conf 0.41), T23@18.1Å(now 14.2,conf 0.36), G61@16.4Å(now 11.1,conf 0.35), V3@15.5Å(now 11.7,conf 0.34), F1@22.0Å(now 11.7,conf 0.34)
  - K47↔A40: targets 27.0/7.0Å but partners are 8.0Å apart → too_close_together by 12.0Å
  - S46↔A40: targets 27.4/7.0Å but partners are 8.5Å apart → too_close_together by 11.8Å
  - E63↔A40: targets 26.5/7.0Å but partners are 9.6Å apart → too_close_together by 10.0Å
- **V15** — severity 126.20, 91 conflict(s); suspect input ~`N11` (group: pull_in)
  - pull-in (wants closer): A37@6.6Å(now 11.7,conf 0.38), K28@13.5Å(now 16.1,conf 0.34), L27@11.5Å(now 15.4,conf 0.34)
  - push-out (wants farther): A50@27.5Å(now 23.9,conf 1.00), K55@27.5Å(now 20.2,conf 1.00), D49@27.5Å(now 24.3,conf 1.00), K6@27.5Å(now 22.8,conf 1.00), K54@27.5Å(now 21.1,conf 1.00), V45@27.5Å(now 23.2,conf 1.00), L5@27.5Å(now 24.3,conf 1.00), G61@27.5Å(now 20.2,conf 1.00), L57@27.5Å(now 20.9,conf 1.00), V66@27.5Å(now 22.7,conf 1.00), V3@27.5Å(now 24.2,conf 1.00), F1@27.5Å(now 24.3,conf 1.00), A52@27.5Å(now 21.5,conf 0.99), E51@27.5Å(now 23.0,conf 0.99), A62@27.5Å(now 20.9,conf 0.98), E65@27.5Å(now 20.9,conf 0.98), E43@27.4Å(now 22.7,conf 0.96), E63@27.4Å(now 20.9,conf 0.95), V64@27.4Å(now 20.1,conf 0.94), A7@27.3Å(now 17.3,conf 0.93), G44@27.3Å(now 22.3,conf 0.91), A10@26.4Å(now 14.2,conf 0.72), K42@26.1Å(now 20.6,conf 0.68), G9@25.9Å(now 12.3,conf 0.66), A8@25.9Å(now 14.3,conf 0.66), A40@25.7Å(now 19.9,conf 0.65), L41@23.0Å(now 18.5,conf 0.49), S36@21.0Å(now 18.0,conf 0.43), A39@17.2Å(now 14.5,conf 0.35)
  - G9↔N11: targets 25.9/6.2Å but partners are 4.1Å apart → too_close_together by 15.5Å
  - A10↔N11: targets 26.4/6.2Å but partners are 6.4Å apart → too_close_together by 13.8Å
  - G9↔K12: targets 25.9/5.7Å but partners are 8.3Å apart → too_close_together by 11.8Å

## Secondary Structure (DSSP-like)

- helix(H)=34 · strand(E)=21 · 3-10(G)=8 · coil(C)=3

```
CEHHHEHEHHEEHHGHEGGHHHECGGEHEHHHHGEHHGHHHEHEHHEHHEHHHGHHEEHEEEHEEC
```

## Backbone H-bond Network

- total=38 · helix(i→i+4)=18 · sheet=20
  - L5 ↔ G9  (helix)
  - G9 ↔ V13  (helix)
  - A10 ↔ A14  (helix)
  - I16 ↔ R20  (helix)
  - K28 ↔ D32  (helix)
  - D32 ↔ S36  (helix)
  - L33 ↔ A37  (helix)
  - S36 ↔ A40  (helix)
  - A37 ↔ L41  (helix)
  - A39 ↔ E43  (helix)
  - L41 ↔ V45  (helix)
  - V45 ↔ D49  (helix)
  - D48 ↔ A52  (helix)
  - D49 ↔ L53  (helix)
  - E51 ↔ K55  (helix)
  - A52 ↔ A56  (helix)
  - K55 ↔ E59  (helix)
  - E59 ↔ E63  (helix)
  - D2 ↔ A8  (sheet)
  - N11 ↔ K17  (sheet)
  - … +18 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=7 · exposed=37 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=202 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=85 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=8.5304 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=14 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 45 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
