# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1SHG\sequence\1SHG.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm3\1SHG\seeds\seed_0\1SHG.pdb`
- residues: 55
- mode: oracle
- ca_rmsd: 1.241 A
- tm_score_ca_ordered: 0.8141698025826138
- heavy_atom_rmsd: 3.241 A
- sidechain_heavy_atom_rmsd: 4.121 A
- **all-atom quality (honest):** heavy 3.241 A, sidechain 4.121 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/50 (0.0)
- lj_severe: 0
- lj_near: 5
- distogram_pairs: 1378
- bin_accuracy: 0.300

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=39
- rigid_domain_reconvergence: applied=True accepted=7 rmsd=1.599907362023132 -> 1.295988186015866 A
- topology_reconvergence: applied=True accepted=1/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 1.241078882626571
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 1.2672881215108465  localized_anchor_rmsd: 1.2410668309577784

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_NEAR_MISS_LT_1A`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** D42-V47 → 334 conflicts (40%); P14-K21 → 204 conflicts (25%); L27-N32 → 133 conflicts (16%)
- explained: 671/827 conflicts by 3 root cause(s)
- metrics: hubs=55 (frac 1.0), conflicts/hub=15.0, max_incompat=10.31Å, chain_span=0.982
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): D42-V47 + P14-K21 + L27-N32 — explain ~671/827 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **V47** — severity 26.31, 39 conflict(s); suspect input ~`T31` (group: push_out)
  - pull-in (wants closer): I24@8.7Å(now 12.5,conf 0.19), T31@8.8Å(now 11.6,conf 0.19), L27@7.1Å(now 9.7,conf 0.27), D23@6.3Å(now 12.2,conf 0.32), K21@7.0Å(now 12.3,conf 0.27), G22@10.1Å(now 14.6,conf 0.16)
  - push-out (wants farther): N32@16.6Å(now 10.3,conf 0.15), V3@17.5Å(now 10.4,conf 0.17), D42@17.4Å(now 13.2,conf 0.17)
  - W35↔D23: targets 5.6/6.3Å but partners are 17.6Å apart → too_far_apart by 5.7Å
  - W36↔D23: targets 6.2/6.3Å but partners are 16.2Å apart → too_far_apart by 3.8Å
  - W35↔K21: targets 5.6/7.0Å but partners are 17.1Å apart → too_far_apart by 4.5Å
- **R43** — severity 24.46, 33 conflict(s); suspect input ~`E1` (group: pull_in)
  - pull-in (wants closer): Q10@9.9Å(now 13.4,conf 0.16), K20@8.6Å(now 13.1,conf 0.20), D23@7.9Å(now 13.1,conf 0.23)
  - push-out (wants farther): K33@21.5Å(now 18.9,conf 0.28), Y7@23.3Å(now 17.5,conf 0.38), S30@19.5Å(now 15.3,conf 0.21), L28@16.4Å(now 12.1,conf 0.15), K12@18.8Å(now 14.2,conf 0.20), K21@19.4Å(now 16.3,conf 0.21), E1@19.6Å(now 14.8,conf 0.22)
  - E1↔L27: targets 19.6/7.9Å but partners are 5.2Å apart → too_close_together by 6.5Å
  - D23↔K21: targets 7.9/19.4Å but partners are 5.4Å apart → too_close_together by 6.0Å
  - Y7↔K20: targets 23.3/8.6Å but partners are 8.4Å apart → too_close_together by 6.3Å
- **S30** — severity 22.70, 36 conflict(s); suspect input ~`A5` (group: pull_in)
  - pull-in (wants closer): G22@16.4Å(now 20.2,conf 0.15), T26@8.5Å(now 11.4,conf 0.20), A50@7.4Å(now 10.4,conf 0.25), A5@8.6Å(now 14.8,conf 0.20)
  - push-out (wants farther): D42@21.5Å(now 18.3,conf 0.28), Y9@19.8Å(now 16.9,conf 0.22), R43@19.5Å(now 15.3,conf 0.21), Q44@19.7Å(now 12.5,conf 0.22), V40@17.0Å(now 13.6,conf 0.16), V3@16.4Å(now 10.8,conf 0.15), V17@17.9Å(now 15.1,conf 0.18), L6@20.1Å(now 16.5,conf 0.23)
  - A5↔L6: targets 8.6/20.1Å but partners are 3.6Å apart → too_close_together by 7.9Å
  - K37↔Q44: targets 7.4/19.7Å but partners are 5.9Å apart → too_close_together by 6.4Å
  - Q44↔G45: targets 19.7/9.1Å but partners are 4.2Å apart → too_close_together by 6.4Å
- **K21** — severity 20.06, 27 conflict(s); suspect input ~`V47` (group: push_out)
  - pull-in (wants closer): T31@16.9Å(now 22.1,conf 0.16), Y51@6.6Å(now 9.4,conf 0.30), V52@6.1Å(now 10.3,conf 0.34), V47@7.0Å(now 12.3,conf 0.27)
  - push-out (wants farther): F46@18.5Å(now 15.7,conf 0.19), L27@18.6Å(now 15.0,conf 0.19), E11@18.5Å(now 14.3,conf 0.19), R43@19.4Å(now 16.3,conf 0.21)
  - K33↔V52: targets 22.5/6.1Å but partners are 11.3Å apart → too_close_together by 5.0Å
  - F46↔V47: targets 18.5/7.0Å but partners are 3.6Å apart → too_close_together by 7.9Å
  - N32↔V47: targets 22.5/7.0Å but partners are 10.3Å apart → too_close_together by 5.2Å
- **L2** — severity 18.50, 23 conflict(s); suspect input ~`G45` (group: pull_in)
  - pull-in (wants closer): S13@19.0Å(now 21.5,conf 0.20), K12@18.3Å(now 21.2,conf 0.19), A49@8.2Å(now 12.0,conf 0.21), Y7@10.4Å(now 14.4,conf 0.15), Q44@8.6Å(now 12.9,conf 0.20)
  - push-out (wants farther): T26@9.6Å(now 4.6,conf 0.17), I24@9.5Å(now 5.9,conf 0.17), K33@19.3Å(now 16.6,conf 0.21), D8@18.1Å(now 15.4,conf 0.18), T31@17.8Å(now 15.2,conf 0.18), P48@16.6Å(now 13.1,conf 0.15), G45@18.8Å(now 14.8,conf 0.20), A50@22.8Å(now 13.7,conf 0.35), D42@16.9Å(now 13.9,conf 0.16)
  - A49↔A50: targets 8.2/22.8Å but partners are 4.7Å apart → too_close_together by 9.9Å
  - A50↔V52: targets 22.8/9.3Å but partners are 5.6Å apart → too_close_together by 7.9Å
  - G45↔Q44: targets 18.8/8.6Å but partners are 4.2Å apart → too_close_together by 6.0Å
- **L55** — severity 17.45, 26 conflict(s); suspect input ~`W36` (group: push_out)
  - pull-in (wants closer): S13@22.3Å(now 25.5,conf 0.32), Q10@19.2Å(now 22.4,conf 0.21), E39@9.8Å(now 14.8,conf 0.16), A49@8.3Å(now 12.0,conf 0.21), A5@7.1Å(now 11.0,conf 0.27), W36@10.0Å(now 14.8,conf 0.16)
  - push-out (wants farther): F46@19.1Å(now 16.6,conf 0.20), K33@21.3Å(now 16.2,conf 0.27), Y7@19.6Å(now 16.4,conf 0.22)
  - K33↔A49: targets 21.3/8.3Å but partners are 5.4Å apart → too_close_together by 7.6Å
  - D8↔A5: targets 20.6/7.1Å but partners are 7.8Å apart → too_close_together by 5.7Å
  - Y7↔A5: targets 19.6/7.1Å but partners are 6.2Å apart → too_close_together by 6.3Å

## Secondary Structure (DSSP-like)

- helix(H)=14 · strand(E)=22 · 3-10(G)=11 · coil(C)=8

```
EEGECCEGGGHHEHEECEGGHHECEEGECHHEGHEEHHHGHCEEEEGEHHGCEEC
```

## Backbone H-bond Network

- total=40 · helix(i→i+4)=3 · sheet=37
  - S30 ↔ D34  (helix)
  - D34 ↔ V38  (helix)
  - K37 ↔ N41  (helix)
  - L4 ↔ D23  (sheet)
  - Y7 ↔ T18  (sheet)
  - Y7 ↔ D23  (sheet)
  - S13 ↔ T18  (sheet)
  - R15 ↔ W35  (sheet)
  - E16 ↔ W35  (sheet)
  - E16 ↔ W36  (sheet)
  - T18 ↔ D23  (sheet)
  - T18 ↔ L25  (sheet)
  - L25 ↔ R43  (sheet)
  - L25 ↔ Q44  (sheet)
  - T26 ↔ W36  (sheet)
  - T26 ↔ R43  (sheet)
  - T26 ↔ Q44  (sheet)
  - T26 ↔ G45  (sheet)
  - T26 ↔ F46  (sheet)
  - L28 ↔ W35  (sheet)
  - … +20 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=12 · exposed=28 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=203 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=122 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.8047 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=5 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 50 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
