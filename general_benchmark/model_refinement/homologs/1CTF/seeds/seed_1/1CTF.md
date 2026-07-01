# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1CTF\sequence\1CTF.pdb`
- output_pdb: `general_benchmark\model_refinement\homologs\1CTF\seeds\seed_1\1CTF.pdb`
- residues: 66
- mode: oracle
- ca_rmsd: 10.733 A
- tm_score_ca_ordered: 0.1497248808116614
- heavy_atom_rmsd: 11.454 A
- sidechain_heavy_atom_rmsd: 12.289 A
- **all-atom quality (honest):** heavy 11.454 A, sidechain 12.289 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/45 (0.0)
- lj_severe: 0
- lj_near: 12
- distogram_pairs: 1473
- bin_accuracy: 0.105

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=39
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 10.732658537072112
- ga_delta_rmsd: -1.8135359673053308  ga_fitness_mode: energy
- pre_local_rmsd: 10.975140034933675  localized_anchor_rmsd: 10.7326319578176

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** A30-S46 → 2520 conflicts (66%); K6-R20 → 904 conflicts (24%); L57-E65 → 290 conflicts (8%)
- explained: 3714/3808 conflicts by 3 root cause(s)
- metrics: hubs=59 (frac 0.894), conflicts/hub=64.5, max_incompat=18.43Å, chain_span=0.985
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): A30-S46 + K6-R20 + L57-E65 — explain ~3714/3808 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **I16** — severity 287.54, 193 conflict(s); suspect input ~`V19` (group: pull_in)
  - pull-in (wants closer): A30@6.2Å(now 8.8,conf 0.40), K31@6.3Å(now 10.1,conf 0.40), V34@6.5Å(now 9.5,conf 0.39), L27@7.8Å(now 12.0,conf 0.35), E35@9.1Å(now 12.8,conf 0.34), A37@9.8Å(now 13.8,conf 0.34), K28@9.8Å(now 14.2,conf 0.34)
  - push-out (wants farther): A60@27.5Å(now 18.6,conf 1.00), K55@27.5Å(now 20.2,conf 1.00), A50@27.5Å(now 21.1,conf 1.00), K54@27.5Å(now 20.6,conf 1.00), D49@27.5Å(now 23.0,conf 1.00), V45@27.5Å(now 21.9,conf 1.00), K6@27.5Å(now 19.1,conf 1.00), L5@27.5Å(now 20.4,conf 1.00), L57@27.5Å(now 21.2,conf 1.00), G61@27.5Å(now 16.2,conf 1.00), A52@27.5Å(now 21.4,conf 1.00), F1@27.5Å(now 22.6,conf 0.99), E51@27.5Å(now 21.9,conf 0.99), V3@27.5Å(now 20.9,conf 0.99), V66@27.5Å(now 19.9,conf 0.99), E65@27.3Å(now 17.3,conf 0.91), A7@27.2Å(now 16.2,conf 0.89), A62@27.2Å(now 16.0,conf 0.88), E43@27.1Å(now 19.8,conf 0.88), G44@27.1Å(now 20.4,conf 0.87), E63@26.6Å(now 15.7,conf 0.77), V64@26.6Å(now 16.4,conf 0.76), A10@26.3Å(now 14.5,conf 0.72), G9@25.4Å(now 11.9,conf 0.61), A8@25.2Å(now 13.9,conf 0.60), A40@24.1Å(now 16.9,conf 0.53), K42@24.0Å(now 17.5,conf 0.53), S36@21.6Å(now 15.7,conf 0.45), L41@21.1Å(now 14.6,conf 0.44), A39@14.6Å(now 12.1,conf 0.34), T23@10.2Å(now 7.1,conf 0.34)
  - G9↔N11: targets 25.4/8.4Å but partners are 3.9Å apart → too_close_together by 13.1Å
  - A10↔N11: targets 26.3/8.4Å but partners are 5.4Å apart → too_close_together by 12.5Å
  - G9↔V19: targets 25.4/5.5Å but partners are 9.9Å apart → too_close_together by 9.9Å
- **V15** — severity 250.76, 148 conflict(s); suspect input ~`N11` (group: pull_in)
  - pull-in (wants closer): A37@6.6Å(now 15.2,conf 0.38), V34@7.6Å(now 11.9,conf 0.36), K31@9.2Å(now 13.1,conf 0.34), A30@9.4Å(now 12.3,conf 0.34), E35@10.2Å(now 14.8,conf 0.34), L33@10.7Å(now 13.9,conf 0.34), K28@13.5Å(now 17.7,conf 0.34), L27@11.5Å(now 15.6,conf 0.34), D32@12.0Å(now 14.7,conf 0.34)
  - push-out (wants farther): A50@27.5Å(now 20.8,conf 1.00), K55@27.5Å(now 20.2,conf 1.00), D49@27.5Å(now 23.2,conf 1.00), K6@27.5Å(now 18.4,conf 1.00), K54@27.5Å(now 20.0,conf 1.00), V45@27.5Å(now 22.5,conf 1.00), L5@27.5Å(now 20.2,conf 1.00), G61@27.5Å(now 16.9,conf 1.00), L57@27.5Å(now 21.2,conf 1.00), V66@27.5Å(now 20.3,conf 1.00), V3@27.5Å(now 20.6,conf 1.00), F1@27.5Å(now 21.4,conf 1.00), A52@27.5Å(now 20.9,conf 0.99), E51@27.5Å(now 21.0,conf 0.99), A62@27.5Å(now 17.3,conf 0.98), E65@27.5Å(now 18.2,conf 0.98), E43@27.4Å(now 21.5,conf 0.96), E63@27.4Å(now 17.3,conf 0.95), V64@27.4Å(now 17.6,conf 0.94), A7@27.3Å(now 15.0,conf 0.93), G44@27.3Å(now 21.5,conf 0.91), A10@26.4Å(now 11.4,conf 0.72), K42@26.1Å(now 19.7,conf 0.68), G9@25.9Å(now 9.7,conf 0.66), A8@25.9Å(now 12.4,conf 0.66), A40@25.7Å(now 18.7,conf 0.65), L41@23.0Å(now 17.1,conf 0.49), S36@21.0Å(now 17.3,conf 0.43), T23@12.1Å(now 9.6,conf 0.34)
  - G9↔N11: targets 25.9/6.2Å but partners are 3.9Å apart → too_close_together by 15.8Å
  - A10↔N11: targets 26.4/6.2Å but partners are 5.4Å apart → too_close_together by 14.7Å
  - A8↔N11: targets 25.9/6.2Å but partners are 6.8Å apart → too_close_together by 12.8Å
- **K31** — severity 188.58, 135 conflict(s); suspect input ~`E35` (group: pull_in)
  - pull-in (wants closer): I16@6.3Å(now 10.1,conf 0.40), K12@8.2Å(now 13.9,conf 0.35), V19@8.9Å(now 12.2,conf 0.34), R20@9.0Å(now 13.1,conf 0.34), V15@9.2Å(now 13.1,conf 0.34), K17@9.2Å(now 13.7,conf 0.34), N11@11.8Å(now 18.1,conf 0.34), V13@8.7Å(now 13.8,conf 0.23)
  - push-out (wants farther): E58@27.5Å(now 23.3,conf 1.00), D49@27.5Å(now 23.9,conf 1.00), V45@27.5Å(now 20.5,conf 1.00), A60@27.5Å(now 22.8,conf 1.00), L57@27.5Å(now 21.4,conf 1.00), A52@27.5Å(now 22.5,conf 1.00), E51@27.5Å(now 24.2,conf 1.00), V66@27.5Å(now 24.1,conf 0.99), G61@27.5Å(now 19.2,conf 0.98), G44@27.4Å(now 19.0,conf 0.95), A7@27.2Å(now 23.5,conf 0.88), E65@27.1Å(now 21.0,conf 0.88), A10@26.7Å(now 23.4,conf 0.78), A62@26.1Å(now 18.6,conf 0.68), E43@25.6Å(now 18.8,conf 0.63), V64@25.3Å(now 19.6,conf 0.60), A8@25.1Å(now 21.9,conf 0.59), E63@25.1Å(now 18.2,conf 0.58), G9@24.8Å(now 20.7,conf 0.57), S36@24.4Å(now 11.0,conf 0.55), A40@23.3Å(now 14.8,conf 0.50), K42@21.4Å(now 14.7,conf 0.45), L41@19.5Å(now 11.5,conf 0.39), A39@14.8Å(now 8.8,conf 0.34), A37@13.6Å(now 9.1,conf 0.34)
  - S36↔E35: targets 24.4/6.2Å but partners are 4.1Å apart → too_close_together by 14.1Å
  - S36↔V34: targets 24.4/5.7Å but partners are 7.6Å apart → too_close_together by 11.2Å
  - A10↔N11: targets 26.7/11.8Å but partners are 5.4Å apart → too_close_together by 9.4Å
- **K12** — severity 176.94, 112 conflict(s); suspect input ~`V15` (group: pull_in)
  - pull-in (wants closer): V34@7.5Å(now 11.7,conf 0.36), E35@8.0Å(now 13.9,conf 0.35), K31@8.2Å(now 13.9,conf 0.35), A37@8.4Å(now 13.7,conf 0.35), A30@10.4Å(now 13.7,conf 0.34), L33@10.9Å(now 14.1,conf 0.34), D32@10.9Å(now 15.6,conf 0.34), E29@13.4Å(now 16.4,conf 0.34), K28@12.8Å(now 18.6,conf 0.34), L27@11.9Å(now 17.0,conf 0.34)
  - push-out (wants farther): L5@27.5Å(now 19.1,conf 1.00), L57@27.5Å(now 18.1,conf 1.00), V66@27.5Å(now 19.2,conf 1.00), A52@27.5Å(now 17.5,conf 1.00), V3@27.5Å(now 19.4,conf 1.00), G61@27.5Å(now 15.2,conf 1.00), E51@27.5Å(now 17.6,conf 1.00), F1@27.5Å(now 19.4,conf 1.00), E65@27.5Å(now 17.6,conf 1.00), G44@27.5Å(now 19.4,conf 0.99), A62@27.5Å(now 16.5,conf 0.99), A7@27.5Å(now 13.5,conf 0.98), E43@27.5Å(now 20.2,conf 0.98), V64@27.5Å(now 17.2,conf 0.98), E63@27.5Å(now 16.9,conf 0.98), A8@27.2Å(now 11.3,conf 0.90), A40@27.2Å(now 17.4,conf 0.89), G9@27.1Å(now 8.6,conf 0.87), K42@26.9Å(now 18.7,conf 0.82), L41@25.4Å(now 16.7,conf 0.61), S36@25.3Å(now 15.6,conf 0.61), A39@20.1Å(now 14.5,conf 0.41), T23@15.9Å(now 12.1,conf 0.34), V19@10.5Å(now 6.8,conf 0.34)
  - G9↔V15: targets 27.1/5.7Å but partners are 9.7Å apart → too_close_together by 11.7Å
  - S36↔A37: targets 25.3/8.4Å but partners are 3.6Å apart → too_close_together by 13.3Å
  - S36↔E35: targets 25.3/8.0Å but partners are 4.1Å apart → too_close_together by 13.2Å
- **V45** — severity 172.82, 85 conflict(s); suspect input ~`A50` (group: pull_in)
  - pull-in (wants closer): A10@20.9Å(now 23.5,conf 0.43)
  - push-out (wants farther): K28@27.5Å(now 21.2,conf 1.00), E35@27.5Å(now 14.1,conf 1.00), K31@27.5Å(now 20.5,conf 1.00), L27@27.5Å(now 22.9,conf 1.00), D32@27.5Å(now 20.1,conf 1.00), E29@27.5Å(now 21.7,conf 1.00), I16@27.5Å(now 21.9,conf 1.00), V15@27.5Å(now 22.5,conf 1.00), V34@27.5Å(now 16.8,conf 1.00), K17@27.5Å(now 24.0,conf 1.00), A37@27.5Å(now 13.1,conf 1.00), G26@27.5Å(now 23.6,conf 1.00), A30@27.5Å(now 21.2,conf 1.00), L33@27.5Å(now 17.0,conf 1.00), A62@27.5Å(now 15.9,conf 1.00), E63@27.5Å(now 17.4,conf 1.00), R20@27.5Å(now 24.7,conf 1.00), L25@27.5Å(now 23.0,conf 1.00), V19@27.5Å(now 22.1,conf 1.00), V64@27.5Å(now 17.9,conf 0.99), V13@27.5Å(now 22.9,conf 0.99), G61@27.5Å(now 12.6,conf 0.99), K42@27.5Å(now 11.7,conf 0.98), T23@27.5Å(now 24.6,conf 0.98), A60@27.5Å(now 14.0,conf 0.98), A39@27.5Å(now 14.7,conf 0.97), E59@27.4Å(now 10.1,conf 0.95), E65@27.4Å(now 18.3,conf 0.93), L41@27.3Å(now 13.8,conf 0.92), V66@27.0Å(now 18.1,conf 0.85), G9@24.9Å(now 21.8,conf 0.58), A40@24.2Å(now 9.6,conf 0.54), E58@23.7Å(now 8.4,conf 0.52), F1@24.3Å(now 19.6,conf 0.47), S36@20.4Å(now 10.3,conf 0.41), L57@6.5Å(now 3.8,conf 0.39), A52@9.9Å(now 6.9,conf 0.34), D48@14.2Å(now 5.4,conf 0.34), A56@10.5Å(now 3.2,conf 0.34), E51@13.4Å(now 8.9,conf 0.34), K55@13.1Å(now 5.2,conf 0.34), K54@12.2Å(now 8.5,conf 0.34)
  - E59↔A50: targets 27.4/5.9Å but partners are 3.0Å apart → too_close_together by 18.4Å
  - E58↔A50: targets 23.7/5.9Å but partners are 3.3Å apart → too_close_together by 14.5Å
  - E59↔L57: targets 27.4/6.5Å but partners are 6.9Å apart → too_close_together by 14.0Å
- **A10** — severity 164.91, 92 conflict(s); suspect input ~`A7` (group: pull_in)
  - pull-in (wants closer): V45@20.9Å(now 23.5,conf 0.43), E43@19.9Å(now 24.1,conf 0.40), A7@6.3Å(now 9.7,conf 0.40), G44@17.8Å(now 23.4,conf 0.36), K42@16.6Å(now 24.4,conf 0.35), L41@15.2Å(now 23.3,conf 0.34), S36@10.7Å(now 23.1,conf 0.34), A52@13.8Å(now 19.3,conf 0.34), E51@11.0Å(now 17.8,conf 0.34), A40@12.0Å(now 22.8,conf 0.34)
  - push-out (wants farther): E63@27.4Å(now 19.8,conf 0.97), A62@27.4Å(now 19.1,conf 0.96), E59@27.3Å(now 17.6,conf 0.92), V66@27.0Å(now 18.6,conf 0.84), A60@27.0Å(now 15.7,conf 0.84), E58@27.0Å(now 18.8,conf 0.84), K6@26.9Å(now 13.9,conf 0.83), K17@26.9Å(now 12.6,conf 0.82), V13@26.8Å(now 11.0,conf 0.79), V64@26.7Å(now 19.2,conf 0.78), K31@26.7Å(now 23.4,conf 0.78), E65@26.5Å(now 18.8,conf 0.74), V15@26.4Å(now 11.4,conf 0.72), I16@26.3Å(now 14.5,conf 0.72), E35@26.0Å(now 22.5,conf 0.68), A37@25.0Å(now 22.0,conf 0.58), R20@24.4Å(now 16.2,conf 0.55), V34@23.8Å(now 20.9,conf 0.52), L5@23.6Å(now 16.9,conf 0.51), A50@23.3Å(now 18.4,conf 0.50), D2@22.8Å(now 12.4,conf 0.49), V19@22.3Å(now 13.4,conf 0.47), F1@23.6Å(now 14.6,conf 0.42), G61@19.7Å(now 17.1,conf 0.40)
  - K6↔A7: targets 26.9/6.3Å but partners are 4.7Å apart → too_close_together by 15.9Å
  - A60↔A7: targets 27.0/6.3Å but partners are 7.5Å apart → too_close_together by 13.2Å
  - V66↔A7: targets 27.0/6.3Å but partners are 9.2Å apart → too_close_together by 11.5Å

## Secondary Structure (DSSP-like)

- helix(H)=32 · strand(E)=27 · 3-10(G)=4 · coil(C)=3

```
CEHHHEEEGHEHHHEHEHHGHEECEEGHGEHHHHEHHHHEHEHEHHECEEHHHHEHEEHHEEHEEE
```

## Backbone H-bond Network

- total=59 · helix(i→i+4)=11 · sheet=48
  - A10 ↔ A14  (helix)
  - K12 ↔ I16  (helix)
  - A14 ↔ A18  (helix)
  - K28 ↔ D32  (helix)
  - D32 ↔ S36  (helix)
  - V34 ↔ P38  (helix)
  - A37 ↔ L41  (helix)
  - A39 ↔ E43  (helix)
  - L41 ↔ V45  (helix)
  - A52 ↔ A56  (helix)
  - E59 ↔ E63  (helix)
  - D2 ↔ A7  (sheet)
  - D2 ↔ A8  (sheet)
  - A8 ↔ V15  (sheet)
  - A8 ↔ K17  (sheet)
  - A8 ↔ A22  (sheet)
  - N11 ↔ K17  (sheet)
  - N11 ↔ A22  (sheet)
  - V15 ↔ A22  (sheet)
  - V15 ↔ T23  (sheet)
  - … +39 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=19 · exposed=21 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=205 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=66 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=10.0396 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=12 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 45 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
