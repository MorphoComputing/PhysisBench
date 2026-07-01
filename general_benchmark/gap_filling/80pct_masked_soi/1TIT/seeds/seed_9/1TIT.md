# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1TIT\sequence\1TIT.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1TIT\seeds\seed_9\1TIT.pdb`
- residues: 87
- mode: oracle
- ca_rmsd: 7.220 A
- tm_score_ca_ordered: 0.35832917844539197
- heavy_atom_rmsd: 8.410 A
- sidechain_heavy_atom_rmsd: 9.446 A
- **all-atom quality (honest):** heavy 8.410 A, sidechain 9.446 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/73 (0.0)
- lj_severe: 0
- lj_near: 32
- distogram_pairs: 1027
- bin_accuracy: 0.526

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=global reason=rejected_domain_topology_regression tested=45
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 7.220249421287726
- ga_delta_rmsd: 1.0210873518323718  ga_fitness_mode: energy
- pre_local_rmsd: 7.256853061717548  localized_anchor_rmsd: 7.220164165728427

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** G9-I22 → 272 conflicts (75%); H30-K34 → 52 conflicts (14%)
- explained: 324/364 conflicts by 2 root cause(s)
- metrics: hubs=57 (frac 0.655), conflicts/hub=6.4, max_incompat=9.17Å, chain_span=0.977
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): G9-I22 + H30-K34 — explain ~324/364 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **F13** — severity 59.38, 19 conflict(s); suspect input ~`G31` (group: pull_in)
  - pull-in (wants closer): H19@11.1Å(now 13.9,conf 0.91), K84@9.0Å(now 14.6,conf 0.55)
  - push-out (wants farther): G31@27.2Å(now 19.3,conf 0.88), P39@22.2Å(now 12.2,conf 0.64), S43@19.8Å(now 13.6,conf 0.57)
  - H19↔G31: targets 11.1/27.2Å but partners are 6.9Å apart → too_close_together by 9.2Å
  - A18↔G31: targets 9.0/27.2Å but partners are 10.0Å apart → too_close_together by 8.2Å
  - F20↔G31: targets 15.0/27.2Å but partners are 7.0Å apart → too_close_together by 5.2Å
- **A74** — severity 53.18, 27 conflict(s); suspect input ~`H30` (group: push_out)
  - pull-in (wants closer): H30@6.6Å(now 14.7,conf 0.55), Q32@6.9Å(now 12.9,conf 0.55), W33@9.0Å(now 11.7,conf 0.55), Q38@14.9Å(now 18.8,conf 0.55)
  - push-out (wants farther): V12@25.3Å(now 22.0,conf 0.69), E4@12.9Å(now 5.0,conf 0.55), P6@12.4Å(now 6.5,conf 0.55)
  - A77↔H30: targets 5.4/6.6Å but partners are 18.6Å apart → too_far_apart by 6.5Å
  - V12↔Q32: targets 25.3/6.9Å but partners are 12.3Å apart → too_close_together by 6.1Å
  - V12↔W33: targets 25.3/9.0Å but partners are 10.5Å apart → too_close_together by 5.8Å
- **V12** — severity 39.37, 22 conflict(s); suspect input ~`V85` (group: pull_in)
  - pull-in (wants closer): H19@8.9Å(now 11.6,conf 0.91), V85@5.6Å(now 11.8,conf 0.56), K84@7.0Å(now 12.8,conf 0.55)
  - push-out (wants farther): A75@27.5Å(now 24.3,conf 1.00), A74@25.3Å(now 22.0,conf 0.69), I22@19.2Å(now 16.4,conf 0.56), G37@19.0Å(now 8.9,conf 0.56), W33@17.5Å(now 10.5,conf 0.55)
  - H19↔V85: targets 8.9/5.6Å but partners are 21.1Å apart → too_far_apart by 6.7Å
  - A75↔G9: targets 27.5/9.0Å but partners are 15.5Å apart → too_close_together by 3.0Å
  - H19↔K84: targets 8.9/7.0Å but partners are 21.0Å apart → too_far_apart by 5.2Å
- **G31** — severity 35.64, 14 conflict(s); suspect input ~`E11` (group: pull_in)
  - pull-in (wants closer): Q73@5.3Å(now 12.9,conf 0.56), A75@7.2Å(now 11.9,conf 0.55), A81@15.7Å(now 18.4,conf 0.55), N76@9.8Å(now 16.2,conf 0.55)
  - push-out (wants farther): E26@13.0Å(now 10.4,conf 0.99), L24@11.1Å(now 7.7,conf 0.91), F13@27.2Å(now 19.3,conf 0.88), E11@22.8Å(now 17.0,conf 0.72), T17@20.5Å(now 15.3,conf 0.59), Y8@17.3Å(now 11.4,conf 0.55), F20@13.3Å(now 7.0,conf 0.55)
  - K34↔F13: targets 10.9/27.2Å but partners are 9.4Å apart → too_close_together by 6.9Å
  - K34↔E11: targets 10.9/22.8Å but partners are 6.2Å apart → too_close_together by 5.8Å
  - Q38↔F13: targets 13.1/27.2Å but partners are 9.6Å apart → too_close_together by 4.4Å
- **Q38** — severity 35.05, 14 conflict(s); suspect input ~`G9` (group: pull_in)
  - pull-in (wants closer): L35@5.0Å(now 7.7,conf 0.99), A74@14.9Å(now 18.8,conf 0.55)
  - push-out (wants farther): E16@20.7Å(now 12.3,conf 0.59), T17@18.9Å(now 12.2,conf 0.56), P6@18.9Å(now 15.2,conf 0.56), I22@18.7Å(now 13.4,conf 0.56), G9@17.2Å(now 5.5,conf 0.55)
  - T41↔E16: targets 9.1/20.7Å but partners are 3.6Å apart → too_close_together by 8.0Å
  - K34↔G9: targets 5.0/17.2Å but partners are 5.6Å apart → too_close_together by 6.6Å
  - T41↔T17: targets 9.1/18.9Å but partners are 3.5Å apart → too_close_together by 6.3Å
- **E11** — severity 32.90, 11 conflict(s); suspect input ~`S43` (group: pull_in)
  - pull-in (wants closer): A18@7.0Å(now 10.1,conf 0.99), K86@7.4Å(now 11.1,conf 0.55)
  - push-out (wants farther): A75@27.4Å(now 23.4,conf 0.96), H30@25.9Å(now 18.0,conf 0.72), G31@22.8Å(now 17.0,conf 0.72), S43@20.8Å(now 14.5,conf 0.59), G37@18.0Å(now 5.7,conf 0.55), C46@16.4Å(now 12.7,conf 0.55)
  - A18↔H30: targets 7.0/25.9Å but partners are 10.0Å apart → too_close_together by 8.9Å
  - A18↔S43: targets 7.0/20.8Å but partners are 6.2Å apart → too_close_together by 7.6Å
  - A18↔G31: targets 7.0/22.8Å but partners are 10.0Å apart → too_close_together by 5.8Å

## Secondary Structure (DSSP-like)

- helix(H)=25 · strand(E)=35 · 3-10(G)=18 · coil(C)=9

```
CECHEEGEECEGHHEHHEHHEGGGHEHEEHHEGHEHEGHEGHEHCCCEGEHHHEECCHEGCGEHHHGEEGGGGEHGEEEEEEHEEGE
```

## Backbone H-bond Network

- total=41 · helix(i→i+4)=2 · sheet=39
  - F13 ↔ T17  (helix)
  - H30 ↔ K34  (helix)
  - Y8 ↔ E21  (sheet)
  - G9 ↔ A18  (sheet)
  - G9 ↔ E21  (sheet)
  - E11 ↔ A18  (sheet)
  - A18 ↔ Q32  (sheet)
  - A18 ↔ L35  (sheet)
  - E21 ↔ D28  (sheet)
  - E21 ↔ V29  (sheet)
  - E21 ↔ Q32  (sheet)
  - E21 ↔ L40  (sheet)
  - Q32 ↔ G37  (sheet)
  - Q32 ↔ L40  (sheet)
  - Q32 ↔ I48  (sheet)
  - L35 ↔ L40  (sheet)
  - L40 ↔ I48  (sheet)
  - L40 ↔ L59  (sheet)
  - S43 ↔ I48  (sheet)
  - S43 ↔ L59  (sheet)
  - … +21 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=24 · exposed=34 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=396 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=275 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=3.0391 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=32 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 73 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
