# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2YXF\sequence\2YXF.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\2YXF\seeds\seed_4\2YXF.pdb`
- residues: 97
- mode: oracle
- ca_rmsd: 4.512 A
- tm_score_ca_ordered: 0.4711685208185645
- heavy_atom_rmsd: 5.729 A
- sidechain_heavy_atom_rmsd: 6.517 A
- **all-atom quality (honest):** heavy 5.729 A, sidechain 6.517 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 1/1
- ramachandran_forbidden_fraction: 0.010
- rotamer_outliers: 0/92 (0.0)
- lj_severe: 0
- lj_near: 30
- distogram_pairs: 1253
- bin_accuracy: 0.593

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=rejected_lj_regression tested=45
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 4.512272199142354
- ga_delta_rmsd: 2.420295838814922  ga_fitness_mode: energy
- pre_local_rmsd: 4.538075606939158  localized_anchor_rmsd: 4.512272216428607

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** V82-I92 → 107 conflicts (43%); E74-A79 → 41 conflicts (16%); I1-R3 → 27 conflicts (11%)
- explained: 175/251 conflicts by 3 root cause(s)
- metrics: hubs=62 (frac 0.639), conflicts/hub=4.0, max_incompat=12.27Å, chain_span=0.99
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): V82-I92 + E74-A79 + I1-R3 — explain ~175/251 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **S88** — severity 44.94, 11 conflict(s); suspect input ~`K58` (group: pull_in)
  - pull-in (wants closer): P14@27.5Å(now 32.1,conf 1.00), K75@27.5Å(now 30.6,conf 1.00)
  - push-out (wants farther): D59@23.5Å(now 9.5,conf 0.76), K58@24.7Å(now 14.2,conf 0.70), S57@25.4Å(now 16.9,conf 0.69)
  - V85↔D59: targets 7.1/23.5Å but partners are 4.2Å apart → too_close_together by 12.3Å
  - D59↔H84: targets 23.5/8.0Å but partners are 6.1Å apart → too_close_together by 9.4Å
  - V85↔K58: targets 7.1/24.7Å but partners are 9.2Å apart → too_close_together by 8.4Å
- **Q89** — severity 30.05, 11 conflict(s); suspect input ~`F56` (group: push_out)
  - pull-in (wants closer): G18@27.5Å(now 33.9,conf 1.00), P14@27.5Å(now 31.1,conf 1.00), G43@15.7Å(now 19.1,conf 0.55)
  - push-out (wants farther): F56@23.8Å(now 16.4,conf 0.75), H51@24.4Å(now 20.6,conf 0.71), L64@19.5Å(now 15.0,conf 0.57)
  - H84↔F56: targets 9.0/23.8Å but partners are 9.0Å apart → too_close_together by 5.8Å
  - N83↔F56: targets 7.4/23.8Å but partners are 10.8Å apart → too_close_together by 5.6Å
  - V82↔H51: targets 8.9/24.4Å but partners are 11.0Å apart → too_close_together by 4.6Å
- **I46** — severity 21.07, 10 conflict(s); suspect input ~`D96` (group: push_out)
  - push-out (wants farther): E74@17.9Å(now 12.1,conf 0.55), D96@17.5Å(now 10.4,conf 0.55), R97@17.4Å(now 11.7,conf 0.55), I92@13.9Å(now 9.9,conf 0.55), W95@14.0Å(now 8.4,conf 0.55)
  - K41↔D96: targets 7.0/17.5Å but partners are 3.8Å apart → too_close_together by 6.7Å
  - L40↔D96: targets 5.5/17.5Å but partners are 6.9Å apart → too_close_together by 5.1Å
  - D96↔N42: targets 17.5/9.6Å but partners are 3.9Å apart → too_close_together by 4.0Å
- **E74** — severity 20.91, 9 conflict(s); suspect input ~`E77` (group: push_out)
  - pull-in (wants closer): F56@27.5Å(now 32.7,conf 1.00), R3@27.5Å(now 31.0,conf 1.00), H84@27.5Å(now 30.4,conf 1.00)
  - push-out (wants farther): H51@23.6Å(now 20.0,conf 0.76), E50@22.6Å(now 16.8,conf 0.69), K48@21.2Å(now 15.6,conf 0.60), I46@17.9Å(now 12.1,conf 0.55)
  - Y78↔E50: targets 11.0/22.6Å but partners are 6.1Å apart → too_close_together by 5.5Å
  - I46↔E77: targets 17.9/8.2Å but partners are 4.1Å apart → too_close_together by 5.6Å
  - Y78↔K48: targets 11.0/21.2Å but partners are 5.2Å apart → too_close_together by 5.0Å
- **K58** — severity 20.37, 7 conflict(s); suspect input ~`I92` (group: push_out)
  - push-out (wants farther): L39@26.9Å(now 22.7,conf 0.84), I92@26.8Å(now 20.5,conf 0.81), S88@24.7Å(now 14.2,conf 0.70)
  - S61↔S88: targets 5.1/24.7Å but partners are 13.7Å apart → too_close_together by 5.9Å
  - F62↔I92: targets 7.2/26.8Å but partners are 14.9Å apart → too_close_together by 4.7Å
  - F62↔S88: targets 7.2/24.7Å but partners are 12.2Å apart → too_close_together by 5.3Å
- **A79** — severity 19.89, 9 conflict(s); suspect input ~`V85` (group: pull_in)
  - pull-in (wants closer): V85@19.4Å(now 22.3,conf 0.79)
  - push-out (wants farther): D59@27.5Å(now 24.4,conf 0.99), V49@13.1Å(now 6.4,conf 0.55), E50@16.1Å(now 8.5,conf 0.55)
  - D59↔N83: targets 27.5/13.0Å but partners are 10.8Å apart → too_close_together by 3.7Å
  - T86↔D59: targets 19.0/27.5Å but partners are 5.2Å apart → too_close_together by 3.3Å
  - D59↔V85: targets 27.5/19.4Å but partners are 4.2Å apart → too_close_together by 3.9Å

## Secondary Structure (DSSP-like)

- helix(H)=24 · strand(E)=44 · 3-10(G)=18 · coil(C)=11

```
EEHGGHHEEEEEEECHGHGEEEEGHGCEGEECGHECEECEEHEEGHGEGGCHEEGEHEHEEGECHCEHEGHEHHHEEHGEECEEHHCHEGHGCEEHE
```

## Backbone H-bond Network

- total=73 · helix(i→i+4)=4 · sheet=69
  - R3 ↔ I7  (helix)
  - N42 ↔ I46  (helix)
  - T71 ↔ K75  (helix)
  - E74 ↔ Y78  (helix)
  - Q8 ↔ L23  (sheet)
  - Q8 ↔ S28  (sheet)
  - V9 ↔ F22  (sheet)
  - V9 ↔ L23  (sheet)
  - V9 ↔ S28  (sheet)
  - Y10 ↔ N21  (sheet)
  - Y10 ↔ F22  (sheet)
  - Y10 ↔ L23  (sheet)
  - S11 ↔ S20  (sheet)
  - S11 ↔ N21  (sheet)
  - S11 ↔ F22  (sheet)
  - S11 ↔ L23  (sheet)
  - R12 ↔ S20  (sheet)
  - R12 ↔ N21  (sheet)
  - R12 ↔ F22  (sheet)
  - R12 ↔ L23  (sheet)
  - … +53 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=33 · exposed=36 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=439 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=305 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.7599 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=30 (steric clashes)
- ramachandran_forbidden_fraction=0.0103

## Disulfide Bonds Formed

- count=1: C25–C80

## Side-chain Rotamers (χ1/χ2)

- 92 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
