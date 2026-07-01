# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1SHG\sequence\1SHG.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm3\1SHG\seeds\seed_1\1SHG.pdb`
- residues: 55
- mode: oracle
- ca_rmsd: 1.225 A
- tm_score_ca_ordered: 0.8194386663324014
- heavy_atom_rmsd: 3.628 A
- sidechain_heavy_atom_rmsd: 4.701 A
- **all-atom quality (honest):** heavy 3.628 A, sidechain 4.701 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/50 (0.0)
- lj_severe: 0
- lj_near: 3
- distogram_pairs: 1378
- bin_accuracy: 0.300

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=39
- rigid_domain_reconvergence: applied=True accepted=8 rmsd=1.7922240198113888 -> 1.3923409998402565 A
- topology_reconvergence: applied=True accepted=2/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 1.2247666935974064
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 1.2470675347056885  localized_anchor_rmsd: 1.224837432294572

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_NEAR_MISS_LT_1A`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** R43-A49 → 316 conflicts (40%); L27-N32 → 194 conflicts (25%); V52-L55 → 85 conflicts (11%)
- explained: 595/786 conflicts by 3 root cause(s)
- metrics: hubs=55 (frac 1.0), conflicts/hub=14.3, max_incompat=10.44Å, chain_span=0.982
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): R43-A49 + L27-N32 + V52-L55 — explain ~595/786 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **V47** — severity 27.08, 40 conflict(s); suspect input ~`T31` (group: push_out)
  - pull-in (wants closer): I24@8.7Å(now 12.4,conf 0.19), T31@8.8Å(now 12.0,conf 0.19), L27@7.1Å(now 10.2,conf 0.27), D23@6.3Å(now 11.7,conf 0.32), K21@7.0Å(now 11.9,conf 0.27), R43@8.1Å(now 10.6,conf 0.22), G22@10.1Å(now 13.7,conf 0.16)
  - push-out (wants farther): N32@16.6Å(now 10.7,conf 0.15), V3@17.5Å(now 9.9,conf 0.17), D42@17.4Å(now 13.3,conf 0.17)
  - W35↔D23: targets 5.6/6.3Å but partners are 17.6Å apart → too_far_apart by 5.7Å
  - W35↔K21: targets 5.6/7.0Å but partners are 17.5Å apart → too_far_apart by 4.9Å
  - T31↔K21: targets 8.8/7.0Å but partners are 22.5Å apart → too_far_apart by 6.8Å
- **R43** — severity 23.78, 31 conflict(s); suspect input ~`E1` (group: pull_in)
  - pull-in (wants closer): Q10@9.9Å(now 13.5,conf 0.16), K20@8.6Å(now 13.4,conf 0.20), D23@7.9Å(now 13.3,conf 0.23), V47@8.1Å(now 10.6,conf 0.22), L27@7.9Å(now 10.7,conf 0.23)
  - push-out (wants farther): Y7@23.3Å(now 17.9,conf 0.38), S30@19.5Å(now 15.8,conf 0.21), L28@16.4Å(now 12.7,conf 0.15), K12@18.8Å(now 14.4,conf 0.20), K21@19.4Å(now 16.4,conf 0.21), E1@19.6Å(now 15.2,conf 0.22)
  - E1↔L27: targets 19.6/7.9Å but partners are 5.3Å apart → too_close_together by 6.5Å
  - D23↔K21: targets 7.9/19.4Å but partners are 5.1Å apart → too_close_together by 6.4Å
  - Y7↔K20: targets 23.3/8.6Å but partners are 8.1Å apart → too_close_together by 6.6Å
- **S30** — severity 20.29, 31 conflict(s); suspect input ~`A5` (group: pull_in)
  - pull-in (wants closer): G22@16.4Å(now 20.1,conf 0.15), T26@8.5Å(now 11.7,conf 0.20), A50@7.4Å(now 10.1,conf 0.25), A5@8.6Å(now 14.3,conf 0.20)
  - push-out (wants farther): D42@21.5Å(now 18.3,conf 0.28), Y9@19.8Å(now 17.0,conf 0.22), R43@19.5Å(now 15.8,conf 0.21), Q44@19.7Å(now 13.1,conf 0.22), V40@17.0Å(now 14.0,conf 0.16), V3@16.4Å(now 10.2,conf 0.15), L6@20.1Å(now 16.6,conf 0.23)
  - A5↔L6: targets 8.6/20.1Å but partners are 3.7Å apart → too_close_together by 7.8Å
  - K37↔Q44: targets 7.4/19.7Å but partners are 6.3Å apart → too_close_together by 6.0Å
  - Y9↔V47: targets 19.8/7.7Å but partners are 7.2Å apart → too_close_together by 4.8Å
- **L2** — severity 19.09, 24 conflict(s); suspect input ~`G45` (group: pull_in)
  - pull-in (wants closer): S13@19.0Å(now 21.5,conf 0.20), K12@18.3Å(now 21.2,conf 0.19), A49@8.2Å(now 11.6,conf 0.21), Y7@10.4Å(now 14.7,conf 0.15), Q44@8.6Å(now 12.6,conf 0.20)
  - push-out (wants farther): T26@9.6Å(now 5.0,conf 0.17), I24@9.5Å(now 6.5,conf 0.17), K33@19.3Å(now 16.2,conf 0.21), T31@17.8Å(now 15.2,conf 0.18), P48@16.6Å(now 12.8,conf 0.15), G45@18.8Å(now 14.4,conf 0.20), A50@22.8Å(now 13.0,conf 0.35), D42@16.9Å(now 14.1,conf 0.16)
  - A49↔A50: targets 8.2/22.8Å but partners are 4.1Å apart → too_close_together by 10.4Å
  - A50↔V52: targets 22.8/9.3Å but partners are 4.8Å apart → too_close_together by 8.7Å
  - K33↔A49: targets 19.3/8.2Å but partners are 5.4Å apart → too_close_together by 5.6Å
- **K21** — severity 18.16, 24 conflict(s); suspect input ~`V47` (group: push_out)
  - pull-in (wants closer): T31@16.9Å(now 22.5,conf 0.16), Y51@6.6Å(now 9.9,conf 0.30), V52@6.1Å(now 10.7,conf 0.34), V47@7.0Å(now 11.9,conf 0.27)
  - push-out (wants farther): F46@18.5Å(now 15.7,conf 0.19), L27@18.6Å(now 15.5,conf 0.19), E11@18.5Å(now 14.4,conf 0.19), R43@19.4Å(now 16.4,conf 0.21)
  - K33↔V52: targets 22.5/6.1Å but partners are 10.8Å apart → too_close_together by 5.6Å
  - K33↔Y51: targets 22.5/6.6Å but partners are 11.2Å apart → too_close_together by 4.7Å
  - N32↔V52: targets 22.5/6.1Å but partners are 12.2Å apart → too_close_together by 4.2Å
- **L27** — severity 16.77, 27 conflict(s); suspect input ~`N32` (group: push_out)
  - pull-in (wants closer): S13@16.4Å(now 19.2,conf 0.15), W35@9.9Å(now 12.9,conf 0.16), N41@6.8Å(now 10.4,conf 0.29), V47@7.1Å(now 10.2,conf 0.27), V52@7.1Å(now 11.0,conf 0.27), N32@7.1Å(now 12.9,conf 0.27), R43@7.9Å(now 10.7,conf 0.23), G45@7.6Å(now 10.6,conf 0.24)
  - push-out (wants farther): E11@21.0Å(now 16.9,conf 0.26), D8@20.2Å(now 17.5,conf 0.23), K20@18.6Å(now 15.2,conf 0.19), K21@18.6Å(now 15.5,conf 0.19)
  - N41↔N32: targets 6.8/7.1Å but partners are 20.8Å apart → too_far_apart by 6.9Å
  - E11↔V47: targets 21.0/7.1Å but partners are 8.6Å apart → too_close_together by 5.4Å
  - E11↔G45: targets 21.0/7.6Å but partners are 9.4Å apart → too_close_together by 4.0Å

## Secondary Structure (DSSP-like)

- helix(H)=14 · strand(E)=26 · 3-10(G)=9 · coil(C)=6

```
ECGEECECEGHHEHEEEEEEGHEGGEEEHHHEGHEEHEGGHCEGEEHEHHHCEEC
```

## Backbone H-bond Network

- total=70 · helix(i→i+4)=3 · sheet=67
  - S30 ↔ D34  (helix)
  - K37 ↔ N41  (helix)
  - V47 ↔ Y51  (helix)
  - L4 ↔ Y9  (sheet)
  - L4 ↔ M19  (sheet)
  - L4 ↔ K20  (sheet)
  - L4 ↔ D23  (sheet)
  - A5 ↔ V17  (sheet)
  - A5 ↔ T18  (sheet)
  - A5 ↔ M19  (sheet)
  - A5 ↔ K20  (sheet)
  - A5 ↔ D23  (sheet)
  - Y7 ↔ V17  (sheet)
  - Y7 ↔ T18  (sheet)
  - Y7 ↔ M19  (sheet)
  - Y7 ↔ K20  (sheet)
  - Y7 ↔ D23  (sheet)
  - Y9 ↔ R15  (sheet)
  - Y9 ↔ E16  (sheet)
  - Y9 ↔ V17  (sheet)
  - … +50 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=5 · exposed=28 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=202 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=120 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.8005 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=3 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 50 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`1SHG.ensemble.pdb`)
- RMSF mean=0.229Å max=0.58Å (per-residue in .per_residue.csv)
- most flexible residues: 16, 39, 33, 10, 28

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1SHG.pae.csv`
- mean=0.15Å · max=0.745Å · AlphaFold-PAE analog (low block = rigid unit/domain)
