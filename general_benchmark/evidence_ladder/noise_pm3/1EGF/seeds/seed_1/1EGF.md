# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1EGF\sequence\1EGF.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm3\1EGF\seeds\seed_1\1EGF.pdb`
- residues: 51
- mode: oracle
- ca_rmsd: 6.846 A
- tm_score_ca_ordered: 0.2552416743730966
- heavy_atom_rmsd: 7.664 A
- sidechain_heavy_atom_rmsd: 8.136 A
- **all-atom quality (honest):** heavy 7.664 A, sidechain 8.136 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/45 (0.0)
- lj_severe: 0
- lj_near: 5
- distogram_pairs: 1176
- bin_accuracy: 0.305

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=global reason=rejected_domain_topology_regression tested=36
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 6.846130645192024
- ga_delta_rmsd: -1.2515504358962746  ga_fitness_mode: energy
- pre_local_rmsd: 6.8560984050904885  localized_anchor_rmsd: 6.846137481558761

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** Y28-C32 → 375 conflicts (44%); R40-C41 → 145 conflicts (17%); G35-S37 → 90 conflicts (10%)
- explained: 610/861 conflicts by 3 root cause(s)
- metrics: hubs=51 (frac 1.0), conflicts/hub=16.9, max_incompat=11.0Å, chain_span=0.98
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): Y28-C32 + R40-C41 + G35-S37 — explain ~610/861 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **C41** — severity 46.68, 51 conflict(s); suspect input ~`H21` (group: pull_in)
  - pull-in (wants closer): D10@8.4Å(now 12.8,conf 0.20), H21@7.1Å(now 14.6,conf 0.26), Y28@9.8Å(now 12.5,conf 0.16), R47@8.3Å(now 11.8,conf 0.21), M20@9.3Å(now 12.9,conf 0.17), G11@6.5Å(now 11.0,conf 0.30)
  - push-out (wants farther): S37@8.2Å(now 5.5,conf 0.21), S24@22.4Å(now 18.2,conf 0.33), D26@21.6Å(now 18.6,conf 0.29), C13@9.9Å(now 5.8,conf 0.16), P3@22.6Å(now 18.5,conf 0.34), G16@10.2Å(now 6.1,conf 0.15), D45@9.8Å(now 6.9,conf 0.16), E50@17.8Å(now 14.9,conf 0.17), S27@17.8Å(now 15.1,conf 0.17)
  - P3↔H21: targets 22.6/7.1Å but partners are 4.8Å apart → too_close_together by 10.7Å
  - H21↔G35: targets 7.1/6.4Å but partners are 21.9Å apart → too_far_apart by 8.3Å
  - D26↔H21: targets 21.6/7.1Å but partners are 6.7Å apart → too_close_together by 7.8Å
- **H21** — severity 34.77, 38 conflict(s); suspect input ~`C41` (group: pull_in)
  - pull-in (wants closer): G35@18.2Å(now 21.9,conf 0.18), C41@7.1Å(now 14.6,conf 0.26), S24@5.9Å(now 10.0,conf 0.35), S8@7.3Å(now 11.2,conf 0.25)
  - push-out (wants farther): L46@23.5Å(now 20.9,conf 0.39), D45@24.9Å(now 19.3,conf 0.51), G4@8.1Å(now 4.9,conf 0.22), Y2@9.6Å(now 5.0,conf 0.17), P3@9.9Å(now 4.8,conf 0.16), T29@9.2Å(now 5.9,conf 0.18), N15@22.3Å(now 17.1,conf 0.32), C5@7.8Å(now 4.8,conf 0.23), G38@20.6Å(now 14.2,conf 0.25)
  - D45↔C41: targets 24.9/7.1Å but partners are 6.9Å apart → too_close_together by 10.8Å
  - N15↔C41: targets 22.3/7.1Å but partners are 5.1Å apart → too_close_together by 10.0Å
  - R44↔C41: targets 20.0/7.1Å but partners are 5.3Å apart → too_close_together by 7.5Å
- **C5** — severity 28.90, 33 conflict(s); suspect input ~`C32` (group: pull_in)
  - pull-in (wants closer): R47@20.2Å(now 22.8,conf 0.23), G16@9.3Å(now 13.9,conf 0.17), C32@7.8Å(now 14.1,conf 0.23), N31@8.4Å(now 11.6,conf 0.20)
  - push-out (wants farther): T43@22.1Å(now 18.8,conf 0.31), Y36@20.9Å(now 18.0,conf 0.26), V33@21.8Å(now 17.8,conf 0.30), H21@7.8Å(now 4.8,conf 0.23), S37@20.6Å(now 17.1,conf 0.25), L25@17.2Å(now 13.5,conf 0.17)
  - V33↔C32: targets 21.8/7.8Å but partners are 4.0Å apart → too_close_together by 10.0Å
  - Y36↔C32: targets 20.9/7.8Å but partners are 4.5Å apart → too_close_together by 8.6Å
  - S37↔C32: targets 20.6/7.8Å but partners are 5.5Å apart → too_close_together by 7.3Å
- **N31** — severity 24.67, 39 conflict(s); suspect input ~`Y2` (group: pull_in)
  - pull-in (wants closer): Y2@9.0Å(now 13.5,conf 0.18), P3@9.7Å(now 13.2,conf 0.17), C5@8.4Å(now 11.6,conf 0.20)
  - push-out (wants farther): V18@8.8Å(now 4.3,conf 0.19), S8@22.5Å(now 18.1,conf 0.33), L25@22.3Å(now 17.2,conf 0.32), Y9@18.7Å(now 15.4,conf 0.19), D26@18.3Å(now 15.7,conf 0.19), D10@19.8Å(now 15.0,conf 0.22), E23@19.6Å(now 15.3,conf 0.22), N15@16.8Å(now 9.7,conf 0.16)
  - C13↔D10: targets 6.3/19.8Å but partners are 7.5Å apart → too_close_together by 6.0Å
  - L25↔D39: targets 22.3/6.4Å but partners are 12.0Å apart → too_close_together by 3.9Å
  - S8↔C13: targets 22.5/6.3Å but partners are 12.6Å apart → too_close_together by 3.7Å
- **G35** — severity 24.02, 28 conflict(s); suspect input ~`C30` (group: push_out)
  - pull-in (wants closer): S8@22.4Å(now 26.8,conf 0.33), Y2@21.1Å(now 25.0,conf 0.27), P6@19.9Å(now 24.7,conf 0.23), Y9@19.7Å(now 23.5,conf 0.22), I22@18.5Å(now 21.8,conf 0.19), H21@18.2Å(now 21.9,conf 0.18), W48@6.3Å(now 10.4,conf 0.32), E50@10.1Å(now 13.9,conf 0.16), C30@8.1Å(now 14.3,conf 0.22)
  - push-out (wants farther): C19@20.0Å(now 17.3,conf 0.23), T43@9.8Å(now 7.2,conf 0.16), L51@23.9Å(now 16.7,conf 0.42)
  - W48↔L51: targets 6.3/23.9Å but partners are 8.1Å apart → too_close_together by 9.5Å
  - E50↔L51: targets 10.1/23.9Å but partners are 3.2Å apart → too_close_together by 10.6Å
  - C19↔C30: targets 20.0/8.1Å but partners are 4.6Å apart → too_close_together by 7.4Å
- **N15** — severity 20.94, 25 conflict(s); suspect input ~`N31` (group: pull_in)
  - pull-in (wants closer): Y2@18.9Å(now 21.5,conf 0.20), P3@17.3Å(now 20.6,conf 0.17), V18@6.7Å(now 10.1,conf 0.30)
  - push-out (wants farther): I22@22.9Å(now 18.6,conf 0.36), H21@22.3Å(now 17.1,conf 0.32), W48@20.8Å(now 17.4,conf 0.26), N31@16.8Å(now 9.7,conf 0.16)
  - H21↔V18: targets 22.3/6.7Å but partners are 9.7Å apart → too_close_together by 6.0Å
  - H21↔C30: targets 22.3/7.6Å but partners are 7.7Å apart → too_close_together by 6.9Å
  - I22↔C30: targets 22.9/7.6Å but partners are 8.9Å apart → too_close_together by 6.4Å

## Secondary Structure (DSSP-like)

- helix(H)=17 · strand(E)=21 · 3-10(G)=6 · coil(C)=7

```
CEECEEEGEHECCEHEHHHGEEHHHHEHHCEGEEHCEGEEHHHHEEHEGGC
```

## Backbone H-bond Network

- total=61 · helix(i→i+4)=5 · sheet=56
  - N15 ↔ C19  (helix)
  - C19 ↔ E23  (helix)
  - S24 ↔ Y28  (helix)
  - L25 ↔ T29  (helix)
  - T43 ↔ R47  (helix)
  - Y2 ↔ H21  (sheet)
  - Y2 ↔ I22  (sheet)
  - P3 ↔ H21  (sheet)
  - P3 ↔ I22  (sheet)
  - C5 ↔ G11  (sheet)
  - C5 ↔ H21  (sheet)
  - C5 ↔ I22  (sheet)
  - P6 ↔ G11  (sheet)
  - P6 ↔ H21  (sheet)
  - P6 ↔ I22  (sheet)
  - S7 ↔ H21  (sheet)
  - S7 ↔ S27  (sheet)
  - Y9 ↔ L14  (sheet)
  - Y9 ↔ H21  (sheet)
  - Y9 ↔ S27  (sheet)
  - … +41 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=13 · exposed=27 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=204 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=113 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.7156 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=5 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C19, C13–C30, C32–C41

## Side-chain Rotamers (χ1/χ2)

- 45 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
