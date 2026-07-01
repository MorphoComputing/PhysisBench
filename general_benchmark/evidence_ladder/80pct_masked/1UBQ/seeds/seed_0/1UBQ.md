# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set/general_benchmark/1UBQ/sequence/1UBQ.pdb`
- output_pdb: `general_benchmark/evidence_ladder/80pct_masked/1UBQ/seeds/seed_0/1UBQ.pdb`
- residues: 74
- mode: oracle
- ca_rmsd: 6.088 A
- tm_score_ca_ordered: 0.46041580338854526
- heavy_atom_rmsd: 6.745 A
- sidechain_heavy_atom_rmsd: 7.260 A
- **all-atom quality (honest):** heavy 6.745 A, sidechain 7.260 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/67 (0.0)
- lj_severe: 0
- lj_near: 18
- distogram_pairs: 511
- bin_accuracy: 0.501

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=48
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 6.087675179328756
- ga_delta_rmsd: -0.37023602559577107  ga_fitness_mode: energy
- pre_local_rmsd: 6.149202728338672  localized_anchor_rmsd: 6.087689806004733

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** L7-I12 → 74 conflicts (76%); G52-T54 → 14 conflicts (14%)
- explained: 88/98 conflicts by 2 root cause(s)
- metrics: hubs=32 (frac 0.432), conflicts/hub=3.1, max_incompat=11.97Å, chain_span=0.824
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): L7-I12 + G52-T54 — explain ~88/98 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **D20** — severity 30.26, 10 conflict(s); suspect input ~`V25` (group: push_out)
  - push-out (wants farther): L7@23.3Å(now 11.0,conf 0.76), G9@25.0Å(now 6.9,conf 0.69), F3@15.0Å(now 8.9,conf 0.55)
  - G9↔V25: targets 25.0/7.0Å but partners are 6.0Å apart → too_close_together by 12.0Å
  - L7↔V25: targets 23.3/7.0Å but partners are 6.8Å apart → too_close_together by 9.5Å
  - G9↔T54: targets 25.0/5.3Å but partners are 12.8Å apart → too_close_together by 7.0Å
- **T54** — severity 28.09, 10 conflict(s); suspect input ~`D20` (group: push_out)
  - push-out (wants farther): L7@23.1Å(now 13.1,conf 0.75), T11@21.1Å(now 11.5,conf 0.60), G46@16.4Å(now 13.7,conf 0.55), F3@16.2Å(now 9.7,conf 0.55)
  - T11↔D20: targets 21.1/5.3Å but partners are 7.0Å apart → too_close_together by 8.8Å
  - L7↔E50: targets 23.1/8.6Å but partners are 7.0Å apart → too_close_together by 7.5Å
  - T11↔P18: targets 21.1/6.5Å but partners are 7.3Å apart → too_close_together by 7.2Å
- **D57** — severity 15.04, 7 conflict(s); suspect input ~`P18` (group: push_out)
  - push-out (wants farther): T11@22.8Å(now 14.2,conf 0.71), I12@21.6Å(now 17.3,conf 0.61), A45@12.6Å(now 9.2,conf 0.55), I43@13.6Å(now 10.6,conf 0.55)
  - T11↔P18: targets 22.8/8.3Å but partners are 7.3Å apart → too_close_together by 7.2Å
  - T11↔S19: targets 22.8/8.6Å but partners are 7.4Å apart → too_close_together by 6.8Å
  - T11↔V16: targets 22.8/14.0Å but partners are 3.8Å apart → too_close_together by 5.0Å
- **I12** — severity 11.41, 6 conflict(s); suspect input ~`V4` (group: push_out)
  - push-out (wants farther): D57@21.6Å(now 17.3,conf 0.61), R53@21.1Å(now 16.9,conf 0.60), T21@18.0Å(now 12.3,conf 0.55), E23@16.9Å(now 11.6,conf 0.55), L55@16.8Å(now 11.9,conf 0.55), V16@12.5Å(now 9.4,conf 0.55), I22@15.8Å(now 13.0,conf 0.55)
  - R53↔V4: targets 21.1/5.2Å but partners are 11.7Å apart → too_close_together by 4.2Å
  - V4↔L55: targets 5.2/16.8Å but partners are 7.4Å apart → too_close_together by 4.2Å
  - D57↔V4: targets 21.6/5.2Å but partners are 12.6Å apart → too_close_together by 3.8Å
- **G9** — severity 11.08, 7 conflict(s); suspect input ~`V4` (group: pull_in)
  - pull-in (wants closer): S64@16.4Å(now 20.4,conf 0.55)
  - push-out (wants farther): Y58@23.6Å(now 18.1,conf 0.76), D20@25.0Å(now 6.9,conf 0.69), I22@21.8Å(now 6.8,conf 0.62), V16@21.3Å(now 9.7,conf 0.60), L49@20.4Å(now 16.4,conf 0.59), Q30@17.6Å(now 8.4,conf 0.55)
  - D20↔V4: targets 25.0/10.2Å but partners are 8.7Å apart → too_close_together by 6.1Å
  - D20↔F3: targets 25.0/12.1Å but partners are 8.9Å apart → too_close_together by 4.1Å
  - I22↔V4: targets 21.8/10.2Å but partners are 8.7Å apart → too_close_together by 2.9Å
- **R53** — severity 11.00, 4 conflict(s); suspect input ~`I22` (group: push_out)
  - push-out (wants farther): K10@25.4Å(now 12.3,conf 0.69), I12@21.1Å(now 16.9,conf 0.60), F3@18.4Å(now 12.2,conf 0.55), I2@16.7Å(now 13.4,conf 0.55), F44@13.1Å(now 10.6,conf 0.55), K47@12.4Å(now 9.2,conf 0.55)
  - K10↔I22: targets 25.4/6.0Å but partners are 7.6Å apart → too_close_together by 11.8Å
  - K10↔D57: targets 25.4/6.3Å but partners are 14.7Å apart → too_close_together by 4.5Å
  - I12↔I22: targets 21.1/6.0Å but partners are 13.0Å apart → too_close_together by 2.0Å

## Secondary Structure (DSSP-like)

- helix(H)=36 · strand(E)=23 · 3-10(G)=13 · coil(C)=2

```
EECCEHHEEEEHHHGEHGHEHHHHEHGHHHHEGGHHEHEGGHHEHHHGHGEHHHHHHEGGEEGEEGEEHHHHHE
```

## Backbone H-bond Network

- total=53 · helix(i→i+4)=14 · sheet=39
  - T13 ↔ E17  (helix)
  - E17 ↔ T21  (helix)
  - I22 ↔ K26  (helix)
  - N24 ↔ K28  (helix)
  - K26 ↔ Q30  (helix)
  - D31 ↔ I35  (helix)
  - D38 ↔ L42  (helix)
  - L42 ↔ G46  (helix)
  - I43 ↔ K47  (helix)
  - A45 ↔ L49  (helix)
  - L49 ↔ R53  (helix)
  - G52 ↔ S56  (helix)
  - R53 ↔ D57  (helix)
  - V69 ↔ R73  (helix)
  - Q1 ↔ K10  (sheet)
  - Q1 ↔ T11  (sheet)
  - Q1 ↔ V16  (sheet)
  - Q1 ↔ D20  (sheet)
  - I2 ↔ K10  (sheet)
  - I2 ↔ T11  (sheet)
  - … +33 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=32 · exposed=7 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=380 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=229 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.3669 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=18 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 67 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
