# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1ENH\sequence\1ENH.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm3\1ENH\seeds\seed_0\1ENH.pdb`
- residues: 52
- mode: oracle
- ca_rmsd: 9.825 A
- tm_score_ca_ordered: 0.18780622510059766
- heavy_atom_rmsd: 11.133 A
- sidechain_heavy_atom_rmsd: 11.886 A
- **all-atom quality (honest):** heavy 11.133 A, sidechain 11.886 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/47 (0.0)
- lj_severe: 0
- lj_near: 1
- distogram_pairs: 1225
- bin_accuracy: 0.293

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain_block reason=rejected_domain_topology_regression tested=27
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 9.82504375183462
- ga_delta_rmsd: -0.2970059123141837  ga_fitness_mode: energy
- pre_local_rmsd: 9.82504338083718  localized_anchor_rmsd: 9.82504338083718

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** L13-N20 → 334 conflicts (46%); F46-Q47 → 121 conflicts (17%); G36-N38 → 86 conflicts (12%)
- explained: 541/726 conflicts by 3 root cause(s)
- metrics: hubs=52 (frac 1.0), conflicts/hub=14.0, max_incompat=10.63Å, chain_span=0.981
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): L13-N20 + F46-Q47 + G36-N38 — explain ~541/726 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **N18** — severity 27.37, 32 conflict(s); suspect input ~`R28` (group: pull_in)
  - pull-in (wants closer): R28@7.1Å(now 14.6,conf 0.27), W45@8.7Å(now 11.3,conf 0.20)
  - push-out (wants farther): G36@21.4Å(now 18.8,conf 0.28), A40@20.6Å(now 17.9,conf 0.25), S6@22.4Å(now 16.2,conf 0.33), F5@21.1Å(now 16.6,conf 0.27), E25@23.4Å(now 16.9,conf 0.39), S32@21.4Å(now 16.3,conf 0.28), K43@17.7Å(now 13.0,conf 0.17), R50@17.6Å(now 9.7,conf 0.17), T24@16.6Å(now 14.0,conf 0.15)
  - E25↔R28: targets 23.4/7.1Å but partners are 5.7Å apart → too_close_together by 10.6Å
  - S32↔R28: targets 21.4/7.1Å but partners are 5.5Å apart → too_close_together by 8.9Å
  - R21↔E25: targets 6.1/23.4Å but partners are 11.3Å apart → too_close_together by 6.0Å
- **L13** — severity 24.08, 35 conflict(s); suspect input ~`N20` (group: push_out)
  - pull-in (wants closer): E8@5.7Å(now 9.2,conf 0.38), N20@6.4Å(now 9.8,conf 0.31), T24@9.4Å(now 12.9,conf 0.17), S7@5.9Å(now 9.7,conf 0.36), G36@8.5Å(now 11.3,conf 0.20), K49@6.1Å(now 10.5,conf 0.34)
  - push-out (wants farther): L10@9.0Å(now 5.1,conf 0.18), E16@9.3Å(now 4.4,conf 0.18), A4@16.6Å(now 12.5,conf 0.15), Q29@17.1Å(now 12.6,conf 0.16), R27@16.3Å(now 11.2,conf 0.15), T3@17.6Å(now 13.2,conf 0.17)
  - N20↔S7: targets 6.4/5.9Å but partners are 18.9Å apart → too_far_apart by 6.6Å
  - E8↔N20: targets 5.7/6.4Å but partners are 18.5Å apart → too_far_apart by 6.4Å
  - N20↔S6: targets 6.4/7.7Å but partners are 19.7Å apart → too_far_apart by 5.6Å
- **N20** — severity 20.87, 28 conflict(s); suspect input ~`L13` (group: pull_in)
  - pull-in (wants closer): R50@8.5Å(now 12.0,conf 0.20), L13@6.4Å(now 9.8,conf 0.31)
  - push-out (wants farther): R2@23.4Å(now 18.8,conf 0.39), S6@22.7Å(now 19.7,conf 0.34), L37@22.6Å(now 18.2,conf 0.33), S33@20.4Å(now 16.4,conf 0.24), Q9@19.5Å(now 16.8,conf 0.21), I44@18.2Å(now 14.5,conf 0.18), N48@18.7Å(now 15.2,conf 0.19), T24@10.2Å(now 7.6,conf 0.15), S32@19.7Å(now 14.7,conf 0.22)
  - S6↔L13: targets 22.7/6.4Å but partners are 10.0Å apart → too_close_together by 6.3Å
  - L37↔L13: targets 22.6/6.4Å but partners are 10.4Å apart → too_close_together by 5.8Å
  - Q9↔L13: targets 19.5/6.4Å but partners are 7.0Å apart → too_close_together by 6.1Å
- **Q47** — severity 17.97, 25 conflict(s); suspect input ~`R28` (group: pull_in)
  - pull-in (wants closer): R21@6.3Å(now 9.6,conf 0.32), N38@10.1Å(now 15.1,conf 0.16), I42@6.7Å(now 9.9,conf 0.29), R28@8.7Å(now 15.5,conf 0.19), Q41@7.0Å(now 10.7,conf 0.27)
  - push-out (wants farther): R50@6.1Å(now 3.0,conf 0.34), G36@23.2Å(now 18.2,conf 0.37), S6@18.1Å(now 14.0,conf 0.18), A51@8.7Å(now 4.3,conf 0.19), A11@20.8Å(now 10.8,conf 0.26), Q9@18.2Å(now 12.6,conf 0.18)
  - G36↔I42: targets 23.2/6.7Å but partners are 9.0Å apart → too_close_together by 7.5Å
  - R28↔Q29: targets 8.7/20.8Å but partners are 4.0Å apart → too_close_together by 8.0Å
  - G36↔Q41: targets 23.2/7.0Å but partners are 11.0Å apart → too_close_together by 5.2Å
- **S32** — severity 17.10, 27 conflict(s); suspect input ~`A4` (group: pull_in)
  - pull-in (wants closer): Y22@9.4Å(now 14.6,conf 0.17), F5@8.5Å(now 11.6,conf 0.20), S6@9.5Å(now 12.9,conf 0.17), T24@8.6Å(now 12.3,conf 0.20)
  - push-out (wants farther): L35@9.9Å(now 6.5,conf 0.16), N18@21.4Å(now 16.3,conf 0.28), F46@16.6Å(now 13.0,conf 0.15), A4@18.8Å(now 14.9,conf 0.20), R27@10.2Å(now 7.0,conf 0.15), R21@17.4Å(now 14.6,conf 0.17), S7@20.2Å(now 15.5,conf 0.23), N20@19.7Å(now 14.7,conf 0.22)
  - N18↔L13: targets 21.4/8.1Å but partners are 7.5Å apart → too_close_together by 5.8Å
  - A4↔F5: targets 18.8/8.5Å but partners are 4.0Å apart → too_close_together by 6.3Å
  - S6↔S7: targets 9.5/20.2Å but partners are 5.0Å apart → too_close_together by 5.6Å
- **L23** — severity 17.07, 28 conflict(s); suspect input ~`A11` (group: push_out)
  - pull-in (wants closer): R15@10.0Å(now 12.7,conf 0.16), F46@7.1Å(now 10.2,conf 0.27), R50@7.8Å(now 13.1,conf 0.23), N48@8.3Å(now 14.1,conf 0.21), Q41@8.6Å(now 11.3,conf 0.20)
  - push-out (wants farther): T3@21.0Å(now 16.9,conf 0.26), R2@17.5Å(now 14.8,conf 0.17), A11@19.6Å(now 15.4,conf 0.22), R26@8.9Å(now 6.3,conf 0.19), R12@17.6Å(now 13.7,conf 0.17)
  - T3↔Q41: targets 21.0/8.6Å but partners are 5.9Å apart → too_close_together by 6.5Å
  - A11↔F46: targets 19.6/7.1Å but partners are 7.9Å apart → too_close_together by 4.6Å
  - R50↔Q29: targets 7.8/8.1Å but partners are 20.4Å apart → too_far_apart by 4.4Å

## Secondary Structure (DSSP-like)

- helix(H)=34 · strand(E)=16 · 3-10(G)=1 · coil(C)=1

```
EEEEEEHHEHHHHHHHHHEGHCHHEHHHHEHHHHHEEEHHHHHHEHEHHHHE
```

## Backbone H-bond Network

- total=24 · helix(i→i+4)=14 · sheet=10
  - S7 ↔ A11  (helix)
  - E8 ↔ R12  (helix)
  - R12 ↔ E16  (helix)
  - L13 ↔ F17  (helix)
  - K14 ↔ N18  (helix)
  - F17 ↔ R21  (helix)
  - T24 ↔ R28  (helix)
  - R28 ↔ S32  (helix)
  - L31 ↔ L35  (helix)
  - L35 ↔ E39  (helix)
  - E39 ↔ K43  (helix)
  - I42 ↔ F46  (helix)
  - I44 ↔ N48  (helix)
  - F46 ↔ R50  (helix)
  - T3 ↔ Q9  (sheet)
  - A4 ↔ Q9  (sheet)
  - E25 ↔ Q30  (sheet)
  - Q30 ↔ G36  (sheet)
  - Q30 ↔ L37  (sheet)
  - Q30 ↔ N38  (sheet)
  - … +4 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=15 · exposed=24 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=178 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=45 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.8533 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=1 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 47 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
