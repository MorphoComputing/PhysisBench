# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1TIT\sequence\1TIT.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1TIT\seeds\seed_2\1TIT.pdb`
- residues: 87
- mode: oracle
- ca_rmsd: 6.884 A
- tm_score_ca_ordered: 0.4152437919742047
- heavy_atom_rmsd: 7.891 A
- sidechain_heavy_atom_rmsd: 8.899 A
- **all-atom quality (honest):** heavy 7.891 A, sidechain 8.899 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/73 (0.0)
- lj_severe: 0
- lj_near: 46
- distogram_pairs: 1027
- bin_accuracy: 0.395

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=45
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 6.883919473386612
- ga_delta_rmsd: -0.6040536840464865  ga_fitness_mode: energy
- pre_local_rmsd: 6.926023320826682  localized_anchor_rmsd: 6.883919117349173

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** W33-E50 → 583 conflicts (65%); I1-Y8 → 234 conflicts (26%)
- explained: 817/898 conflicts by 2 root cause(s)
- metrics: hubs=79 (frac 0.908), conflicts/hub=11.4, max_incompat=14.82Å, chain_span=0.989
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): W33-E50 + I1-Y8 — explain ~817/898 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **P44** — severity 151.52, 34 conflict(s); suspect input ~`E47` (group: pull_in)
  - pull-in (wants closer): E47@7.0Å(now 9.7,conf 0.99)
  - push-out (wants farther): I1@27.5Å(now 10.2,conf 1.00), E2@27.5Å(now 8.3,conf 1.00), T41@9.0Å(now 3.0,conf 0.99), L40@11.0Å(now 8.4,conf 0.94), G37@19.1Å(now 15.6,conf 0.91), P6@25.9Å(now 14.4,conf 0.71), E23@24.6Å(now 15.0,conf 0.70), Q38@16.4Å(now 10.1,conf 0.69), N82@22.4Å(now 18.3,conf 0.66), G9@22.4Å(now 16.3,conf 0.66)
  - E2↔E47: targets 27.5/7.0Å but partners are 5.7Å apart → too_close_together by 14.8Å
  - E2↔I48: targets 27.5/11.0Å but partners are 6.2Å apart → too_close_together by 10.3Å
  - I1↔E47: targets 27.5/7.0Å but partners are 10.8Å apart → too_close_together by 9.7Å
- **N61** — severity 91.47, 31 conflict(s); suspect input ~`I58` (group: pull_in)
  - pull-in (wants closer): I58@10.0Å(now 12.8,conf 0.72), I49@16.9Å(now 19.6,conf 0.55)
  - push-out (wants farther): I1@27.5Å(now 20.7,conf 1.00), E4@27.5Å(now 16.2,conf 0.99), A77@27.4Å(now 22.2,conf 0.95), K78@24.7Å(now 21.5,conf 0.70), L7@19.2Å(now 13.3,conf 0.56), Y8@18.0Å(now 9.0,conf 0.55)
  - E4↔I58: targets 27.5/10.0Å but partners are 3.6Å apart → too_close_together by 13.8Å
  - E4↔L57: targets 27.5/13.0Å but partners are 5.9Å apart → too_close_together by 8.6Å
  - E4↔C46: targets 27.5/9.4Å but partners are 6.9Å apart → too_close_together by 11.2Å
- **V14** — severity 90.58, 32 conflict(s); suspect input ~`K5` (group: pull_in)
  - pull-in (wants closer): E69@15.8Å(now 19.5,conf 0.55), L83@11.8Å(now 14.4,conf 0.55)
  - push-out (wants farther): Y8@17.0Å(now 10.4,conf 1.00), V3@27.5Å(now 19.8,conf 0.99), L7@19.0Å(now 15.4,conf 0.99), K5@26.6Å(now 19.0,conf 0.77), L40@17.8Å(now 12.7,conf 0.55), V10@12.3Å(now 8.0,conf 0.55)
  - F20↔V3: targets 15.0/27.5Å but partners are 6.3Å apart → too_close_together by 6.2Å
  - H19↔K5: targets 11.4/26.6Å but partners are 8.3Å apart → too_close_together by 6.8Å
  - V3↔A18: targets 27.5/8.6Å but partners are 12.9Å apart → too_close_together by 6.0Å
- **A42** — severity 87.11, 25 conflict(s); suspect input ~`E4` (group: push_out)
  - push-out (wants farther): Q38@12.9Å(now 8.1,conf 0.91), E4@23.9Å(now 4.0,conf 0.74), P6@20.7Å(now 13.4,conf 0.59), A75@19.4Å(now 13.4,conf 0.57), L7@18.5Å(now 11.4,conf 0.55), V29@16.9Å(now 12.0,conf 0.55), W33@9.4Å(now 6.5,conf 0.55), A74@16.3Å(now 13.5,conf 0.55)
  - E47↔E4: targets 4.8/23.9Å but partners are 6.7Å apart → too_close_together by 12.4Å
  - C46↔E4: targets 5.0/23.9Å but partners are 6.9Å apart → too_close_together by 12.0Å
  - D45↔E4: targets 7.0/23.9Å but partners are 6.9Å apart → too_close_together by 10.0Å
- **G15** — severity 86.18, 28 conflict(s); suspect input ~`K5` (group: pull_in)
  - pull-in (wants closer): E26@27.5Å(now 31.3,conf 1.00), I49@18.8Å(now 22.2,conf 0.56), D45@9.9Å(now 14.1,conf 0.55)
  - push-out (wants farther): V3@27.5Å(now 18.3,conf 0.99), K5@26.8Å(now 18.8,conf 0.81), V10@14.0Å(now 9.9,conf 0.72), Y8@18.9Å(now 11.4,conf 0.56)
  - K5↔D45: targets 26.8/9.9Å but partners are 6.0Å apart → too_close_together by 10.9Å
  - V3↔F20: targets 27.5/15.1Å but partners are 6.3Å apart → too_close_together by 6.1Å
  - V3↔A18: targets 27.5/9.0Å but partners are 12.9Å apart → too_close_together by 5.6Å
- **S43** — severity 83.64, 28 conflict(s); suspect input ~`K5` (group: pull_in)
  - pull-in (wants closer): C46@5.0Å(now 7.5,conf 0.99), E47@6.6Å(now 9.8,conf 0.79), L64@17.7Å(now 21.9,conf 0.55)
  - push-out (wants farther): K36@18.0Å(now 14.5,conf 0.72), K5@25.9Å(now 5.9,conf 0.71), K78@22.6Å(now 14.2,conf 0.69), K53@22.5Å(now 17.7,conf 0.68), Q38@15.0Å(now 11.8,conf 0.67), E11@20.8Å(now 17.7,conf 0.59), H19@16.3Å(now 10.8,conf 0.55)
  - C46↔K5: targets 5.0/25.9Å but partners are 8.3Å apart → too_close_together by 12.7Å
  - E47↔K5: targets 6.6/25.9Å but partners are 9.5Å apart → too_close_together by 9.8Å
  - E47↔K78: targets 6.6/22.6Å but partners are 8.1Å apart → too_close_together by 8.0Å

## Secondary Structure (DSSP-like)

- helix(H)=40 · strand(E)=27 · 3-10(G)=13 · coil(C)=7

```
CEHGHHEHHHHHHEHECEEGECEEHEHEEHHEHHHHHEHEEGHHHEEHHHHHHHEEHHHHGHGHHHCGGGGECGHEEEECGGHGCEE
```

## Backbone H-bond Network

- total=55 · helix(i→i+4)=12 · sheet=43
  - K5 ↔ G9  (helix)
  - G9 ↔ F13  (helix)
  - E11 ↔ G15  (helix)
  - P27 ↔ G31  (helix)
  - H30 ↔ K34  (helix)
  - W33 ↔ G37  (helix)
  - P39 ↔ S43  (helix)
  - D45 ↔ I49  (helix)
  - I49 ↔ K53  (helix)
  - K54 ↔ I58  (helix)
  - I58 ↔ C62  (helix)
  - C62 ↔ M66  (helix)
  - E2 ↔ L7  (sheet)
  - E2 ↔ E21  (sheet)
  - L7 ↔ A18  (sheet)
  - L7 ↔ H19  (sheet)
  - L7 ↔ E21  (sheet)
  - L7 ↔ E23  (sheet)
  - A18 ↔ Q38  (sheet)
  - H19 ↔ Q32  (sheet)
  - … +35 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=32 · exposed=30 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=612 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=498 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=4.6476 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=46 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 73 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
