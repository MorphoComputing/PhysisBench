# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1TIT\sequence\1TIT.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1TIT\seeds\seed_6\1TIT.pdb`
- residues: 87
- mode: oracle
- ca_rmsd: 3.954 A
- tm_score_ca_ordered: 0.6176025371201063
- heavy_atom_rmsd: 5.171 A
- sidechain_heavy_atom_rmsd: 6.191 A
- **all-atom quality (honest):** heavy 5.171 A, sidechain 6.191 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/73 (0.0)
- lj_severe: 0
- lj_near: 27
- distogram_pairs: 1027
- bin_accuracy: 0.558

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=48
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 3.95431470513549
- ga_delta_rmsd: 1.7014245114481357  ga_fitness_mode: energy
- pre_local_rmsd: 3.9792701947047955  localized_anchor_rmsd: 3.954354657869422

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** I1-K5 → 176 conflicts (51%); K34-P39 → 113 conflicts (33%); I49-D51 → 18 conflicts (5%)
- explained: 307/347 conflicts by 3 root cause(s)
- metrics: hubs=57 (frac 0.655), conflicts/hub=6.1, max_incompat=11.2Å, chain_span=0.977
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): I1-K5 + K34-P39 + I49-D51 — explain ~307/347 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **S43** — severity 54.87, 15 conflict(s); suspect input ~`K5` (group: push_out)
  - push-out (wants farther): G37@17.0Å(now 11.9,conf 1.00), Q38@15.0Å(now 7.8,conf 0.99), K36@18.6Å(now 12.4,conf 0.79), K5@25.9Å(now 17.4,conf 0.71), K34@13.3Å(now 7.6,conf 0.55), L40@8.7Å(now 5.5,conf 0.55)
  - E47↔K5: targets 5.4/25.9Å but partners are 11.3Å apart → too_close_together by 9.1Å
  - Q38↔C46: targets 15.0/5.0Å but partners are 4.5Å apart → too_close_together by 5.5Å
  - I48↔K5: targets 9.0/25.9Å but partners are 9.7Å apart → too_close_together by 7.2Å
- **A42** — severity 43.77, 14 conflict(s); suspect input ~`E4` (group: push_out)
  - push-out (wants farther): G37@15.0Å(now 11.6,conf 1.00), Q38@12.6Å(now 5.7,conf 0.79), E4@23.9Å(now 10.8,conf 0.74), L7@18.5Å(now 15.9,conf 0.55), I49@9.6Å(now 6.9,conf 0.55), K36@15.9Å(now 11.4,conf 0.55)
  - E47↔E4: targets 5.0/23.9Å but partners are 8.0Å apart → too_close_together by 10.9Å
  - E4↔I48: targets 23.9/6.3Å but partners are 7.7Å apart → too_close_together by 9.9Å
  - C46↔E4: targets 5.0/23.9Å but partners are 13.2Å apart → too_close_together by 5.7Å
- **V14** — severity 43.42, 18 conflict(s); suspect input ~`K5` (group: pull_in)
  - pull-in (wants closer): A75@27.5Å(now 32.5,conf 1.00), E69@15.8Å(now 18.7,conf 0.55)
  - push-out (wants farther): V3@27.5Å(now 24.9,conf 0.99), Y8@17.0Å(now 14.0,conf 0.99), K5@26.6Å(now 21.4,conf 0.77), K36@17.0Å(now 11.3,conf 0.55), V10@12.3Å(now 9.2,conf 0.55)
  - F20↔K5: targets 15.0/26.6Å but partners are 5.7Å apart → too_close_together by 5.9Å
  - H19↔K5: targets 11.4/26.6Å but partners are 9.7Å apart → too_close_together by 5.4Å
  - A18↔K5: targets 8.9/26.6Å but partners are 12.3Å apart → too_close_together by 5.4Å
- **G15** — severity 40.87, 18 conflict(s); suspect input ~`K5` (group: push_out)
  - pull-in (wants closer): E26@27.5Å(now 31.0,conf 1.00), C62@5.8Å(now 8.8,conf 0.55), G65@13.1Å(now 17.2,conf 0.55), L83@13.9Å(now 16.4,conf 0.55), M66@12.0Å(now 15.7,conf 0.55)
  - push-out (wants farther): V3@27.5Å(now 24.0,conf 0.99), K5@26.8Å(now 20.7,conf 0.81), V10@13.4Å(now 10.8,conf 0.79), Y8@18.9Å(now 15.3,conf 0.56)
  - F20↔K5: targets 15.0/26.8Å but partners are 5.7Å apart → too_close_together by 6.1Å
  - A18↔K5: targets 9.0/26.8Å but partners are 12.3Å apart → too_close_together by 5.5Å
  - K5↔H19: targets 26.8/12.6Å but partners are 9.7Å apart → too_close_together by 4.5Å
- **G37** — severity 38.65, 19 conflict(s); suspect input ~`D51` (group: pull_in)
  - pull-in (wants closer): S71@6.9Å(now 9.4,conf 0.55), A77@15.3Å(now 17.8,conf 0.55)
  - push-out (wants farther): A42@15.0Å(now 11.6,conf 1.00), S43@17.0Å(now 11.9,conf 1.00), P44@19.0Å(now 14.9,conf 0.94), D51@22.6Å(now 17.2,conf 0.68), I1@21.2Å(now 18.7,conf 0.60), K54@21.0Å(now 15.8,conf 0.60), E2@19.6Å(now 15.8,conf 0.57), V12@19.0Å(now 13.7,conf 0.56), E11@18.0Å(now 14.0,conf 0.55), D45@17.2Å(now 11.4,conf 0.55), L57@15.4Å(now 10.0,conf 0.55)
  - S43↔K34: targets 17.0/5.0Å but partners are 7.6Å apart → too_close_together by 4.4Å
  - Q32↔D51: targets 11.0/22.6Å but partners are 6.6Å apart → too_close_together by 5.0Å
  - G31↔D51: targets 14.0/22.6Å but partners are 3.7Å apart → too_close_together by 4.8Å
- **D51** — severity 36.15, 13 conflict(s); suspect input ~`Q38` (group: push_out)
  - push-out (wants farther): G37@22.6Å(now 17.2,conf 0.68), Q38@22.2Å(now 14.2,conf 0.65), E2@17.0Å(now 10.8,conf 0.55), G31@11.0Å(now 3.7,conf 0.55), Q73@15.3Å(now 12.2,conf 0.55), A75@15.3Å(now 8.5,conf 0.55)
  - I48↔Q38: targets 9.4/22.2Å but partners are 4.0Å apart → too_close_together by 8.8Å
  - I56↔Q38: targets 8.6/22.2Å but partners are 7.3Å apart → too_close_together by 6.4Å
  - L57↔Q38: targets 11.0/22.2Å but partners are 5.0Å apart → too_close_together by 6.2Å

## Secondary Structure (DSSP-like)

- helix(H)=23 · strand(E)=35 · 3-10(G)=12 · coil(C)=17

```
CECHHEEHHHHEHEHECEECEEEECEECEGEGGHHHHHEGHHHHEHCCCEGEHEEECCCEGGEGGHECECEHHEHCEGECEGGECEE
```

## Backbone H-bond Network

- total=55 · helix(i→i+4)=7 · sheet=48
  - E4 ↔ Y8  (helix)
  - G9 ↔ F13  (helix)
  - E11 ↔ G15  (helix)
  - K34 ↔ Q38  (helix)
  - G37 ↔ T41  (helix)
  - Q38 ↔ A42  (helix)
  - A42 ↔ C46  (helix)
  - E2 ↔ L7  (sheet)
  - E2 ↔ E21  (sheet)
  - E2 ↔ I22  (sheet)
  - P6 ↔ A18  (sheet)
  - P6 ↔ H19  (sheet)
  - P6 ↔ E21  (sheet)
  - P6 ↔ I22  (sheet)
  - P6 ↔ E23  (sheet)
  - P6 ↔ L24  (sheet)
  - L7 ↔ A18  (sheet)
  - L7 ↔ H19  (sheet)
  - L7 ↔ E21  (sheet)
  - L7 ↔ I22  (sheet)
  - … +35 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=34 · exposed=30 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=445 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=314 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.6782 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=27 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 73 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
