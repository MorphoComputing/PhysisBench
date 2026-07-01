# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set/general_benchmark/1TIT/sequence/1TIT.pdb`
- output_pdb: `general_benchmark/evidence_ladder/80pct_masked/1TIT/seeds/seed_1/1TIT.pdb`
- residues: 87
- mode: oracle
- ca_rmsd: 4.469 A
- tm_score_ca_ordered: 0.48894028293687375
- heavy_atom_rmsd: 5.309 A
- sidechain_heavy_atom_rmsd: 6.189 A
- **all-atom quality (honest):** heavy 5.309 A, sidechain 6.189 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/73 (0.0)
- lj_severe: 0
- lj_near: 30
- distogram_pairs: 714
- bin_accuracy: 0.252

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=residue_block reason=accepted tested=48
- rigid_domain_reconvergence: applied=True accepted=10 rmsd=5.18406110415863 -> 4.481538062583431 A
- topology_reconvergence: applied=True accepted=0/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 4.4693745267827385
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 4.48500674042784  localized_anchor_rmsd: 4.469389755906713

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** G31-Q38 → 107 conflicts (41%); L64-T67 → 57 conflicts (22%); S79-L83 → 27 conflicts (10%)
- explained: 191/260 conflicts by 3 root cause(s)
- metrics: hubs=66 (frac 0.759), conflicts/hub=3.9, max_incompat=10.25Å, chain_span=0.989
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): G31-Q38 + L64-T67 + S79-L83 — explain ~191/260 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **E50** — severity 34.46, 16 conflict(s); suspect input ~`L57` (group: push_out)
  - push-out (wants farther): G65@23.5Å(now 16.5,conf 0.76), T67@23.0Å(now 14.9,conf 0.73), E2@16.7Å(now 14.0,conf 0.55), W33@11.0Å(now 8.0,conf 0.55), S43@14.9Å(now 11.9,conf 0.55), E26@13.4Å(now 8.9,conf 0.55), P39@16.3Å(now 10.8,conf 0.55)
  - G65↔L57: targets 23.5/7.6Å but partners are 10.3Å apart → too_close_together by 5.7Å
  - T67↔H55: targets 23.0/4.5Å but partners are 13.6Å apart → too_close_together by 4.9Å
  - G65↔E47: targets 23.5/9.9Å but partners are 8.5Å apart → too_close_together by 5.2Å
- **K53** — severity 29.53, 16 conflict(s); suspect input ~`L7` (group: pull_in)
  - pull-in (wants closer): K86@27.5Å(now 30.8,conf 1.00), A77@13.0Å(now 17.1,conf 0.55), K78@15.2Å(now 20.8,conf 0.55), L7@15.5Å(now 19.3,conf 0.55)
  - push-out (wants farther): T67@27.5Å(now 20.9,conf 0.99), M66@27.0Å(now 23.3,conf 0.84), Q38@23.4Å(now 17.5,conf 0.76), E69@22.6Å(now 20.1,conf 0.69), S43@22.5Å(now 18.2,conf 0.68), L40@22.4Å(now 18.3,conf 0.67), L35@22.1Å(now 17.8,conf 0.64)
  - T67↔F20: targets 27.5/15.0Å but partners are 5.8Å apart → too_close_together by 6.7Å
  - T67↔H19: targets 27.5/17.5Å but partners are 5.3Å apart → too_close_together by 4.7Å
  - M66↔L7: targets 27.0/15.5Å but partners are 7.2Å apart → too_close_together by 4.2Å
- **G37** — severity 28.91, 14 conflict(s); suspect input ~`S71` (group: push_out)
  - push-out (wants farther): P27@23.7Å(now 16.3,conf 0.75), E26@23.8Å(now 17.0,conf 0.75), D51@22.6Å(now 16.6,conf 0.68), I1@21.2Å(now 18.0,conf 0.60), K54@21.0Å(now 16.1,conf 0.60), E2@19.6Å(now 15.9,conf 0.57), V12@19.0Å(now 14.5,conf 0.56), E11@18.0Å(now 14.8,conf 0.55), E21@17.3Å(now 8.7,conf 0.55), D45@17.2Å(now 5.1,conf 0.55), I22@17.2Å(now 11.9,conf 0.55), H30@17.2Å(now 11.3,conf 0.55), L57@15.4Å(now 12.2,conf 0.55), T41@12.6Å(now 8.2,conf 0.55), W33@8.5Å(now 5.3,conf 0.55)
  - E26↔S71: targets 23.8/6.9Å but partners are 9.1Å apart → too_close_together by 7.8Å
  - P27↔S71: targets 23.7/6.9Å but partners are 9.8Å apart → too_close_together by 7.0Å
  - E21↔S71: targets 17.3/6.9Å but partners are 5.3Å apart → too_close_together by 5.2Å
- **K36** — severity 25.36, 10 conflict(s); suspect input ~`S71` (group: push_out)
  - push-out (wants farther): E26@26.5Å(now 18.3,conf 0.77), I1@22.9Å(now 18.7,conf 0.72), V29@22.4Å(now 19.6,conf 0.66), L24@21.2Å(now 17.6,conf 0.60), H30@19.5Å(now 16.2,conf 0.57), V3@19.1Å(now 13.8,conf 0.56), E47@17.6Å(now 13.6,conf 0.55), M66@7.5Å(now 4.3,conf 0.55), L64@12.3Å(now 6.1,conf 0.55), A42@15.9Å(now 12.4,conf 0.55)
  - E26↔S71: targets 26.5/7.2Å but partners are 9.1Å apart → too_close_together by 10.2Å
  - L24↔S71: targets 21.2/7.2Å but partners are 8.7Å apart → too_close_together by 5.3Å
  - I1↔S71: targets 22.9/7.2Å but partners are 10.5Å apart → too_close_together by 5.2Å
- **K54** — severity 22.20, 8 conflict(s); suspect input ~`F20` (group: pull_in)
  - pull-in (wants closer): E4@10.8Å(now 16.7,conf 0.55)
  - push-out (wants farther): L64@27.4Å(now 19.8,conf 0.97), Q63@26.6Å(now 16.3,conf 0.78), G37@21.0Å(now 16.1,conf 0.60)
  - Q63↔F20: targets 26.6/11.3Å but partners are 5.0Å apart → too_close_together by 10.2Å
  - L64↔F20: targets 27.4/11.3Å but partners are 8.0Å apart → too_close_together by 8.2Å
  - Q63↔I48: targets 26.6/11.6Å but partners are 8.3Å apart → too_close_together by 6.7Å
- **M66** — severity 19.33, 11 conflict(s); suspect input ~`L35` (group: pull_in)
  - pull-in (wants closer): G15@12.0Å(now 15.9,conf 0.55)
  - push-out (wants farther): D28@27.5Å(now 19.3,conf 0.99), I1@27.4Å(now 22.0,conf 0.97), K53@27.0Å(now 23.3,conf 0.84), G31@19.2Å(now 15.6,conf 0.56), P6@18.8Å(now 14.8,conf 0.56), K36@7.5Å(now 4.3,conf 0.55), S43@15.1Å(now 11.5,conf 0.55), A42@14.4Å(now 10.8,conf 0.55), W33@12.3Å(now 9.0,conf 0.55), P39@12.2Å(now 9.3,conf 0.55), A81@12.2Å(now 8.8,conf 0.55), D45@11.9Å(now 5.2,conf 0.55)
  - D28↔L35: targets 27.5/6.3Å but partners are 14.1Å apart → too_close_together by 7.1Å
  - D28↔W33: targets 27.5/12.3Å but partners are 10.5Å apart → too_close_together by 4.7Å
  - D28↔G31: targets 27.5/19.2Å but partners are 4.5Å apart → too_close_together by 3.8Å

## Secondary Structure (DSSP-like)

- helix(H)=52 · strand(E)=23 · 3-10(G)=8 · coil(C)=4

```
CEHHHEHEHHEGHEGCEECHGGHCHEHHHHHEHHEHEHEHHHEHHHHHHHHHHEHEHHHHEHHHHHHHEEHEHHGEGHGEEHHHGHE
```

## Backbone H-bond Network

- total=46 · helix(i→i+4)=25 · sheet=21
  - V3 ↔ L7  (helix)
  - K5 ↔ G9  (helix)
  - G9 ↔ F13  (helix)
  - S25 ↔ V29  (helix)
  - V29 ↔ W33  (helix)
  - H30 ↔ K34  (helix)
  - K36 ↔ L40  (helix)
  - L40 ↔ P44  (helix)
  - T41 ↔ D45  (helix)
  - D45 ↔ I49  (helix)
  - E47 ↔ D51  (helix)
  - I49 ↔ K53  (helix)
  - D51 ↔ H55  (helix)
  - K53 ↔ L57  (helix)
  - H55 ↔ L59  (helix)
  - I58 ↔ C62  (helix)
  - L59 ↔ Q63  (helix)
  - H60 ↔ L64  (helix)
  - C62 ↔ M66  (helix)
  - Q63 ↔ T67  (helix)
  - … +26 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=26 · exposed=36 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=511 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=364 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=3.0849 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=30 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 73 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`1TIT.ensemble.pdb`)
- RMSF mean=2.599Å max=7.499Å (per-residue in .per_residue.csv)
- most flexible residues: 53, 43, 44, 51, 45

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1TIT.pae.csv`
- mean=1.296Å · max=6.562Å · AlphaFold-PAE analog (low block = rigid unit/domain)
