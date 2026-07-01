# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2CRD\sequence\2CRD.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\2CRD\seeds\seed_3\2CRD.pdb`
- residues: 34
- mode: oracle
- ca_rmsd: 5.780 A
- tm_score_ca_ordered: 0.13170544037693743
- heavy_atom_rmsd: 7.426 A
- sidechain_heavy_atom_rmsd: 8.763 A
- **all-atom quality (honest):** heavy 7.426 A, sidechain 8.763 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/33 (0.0)
- lj_severe: 0
- lj_near: 10
- distogram_pairs: 215
- bin_accuracy: 0.465

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=global reason=rejected_local_chirality_regression tested=36
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 5.780212971633324
- ga_delta_rmsd: 0.9202952835154319  ga_fitness_mode: energy
- pre_local_rmsd: 5.780236720430474  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** C26-R32 → 31 conflicts (84%); C11-V14 → 5 conflicts (14%)
- explained: 36/37 conflicts by 2 root cause(s)
- metrics: hubs=13 (frac 0.382), conflicts/hub=2.8, max_incompat=5.57Å, chain_span=0.529
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): C26-R32 + C11-V14 — explain ~36/37 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **S22** — severity 7.66, 4 conflict(s); suspect input ~`C11` (group: pull_in)
  - pull-in (wants closer): C11@8.6Å(now 11.8,conf 0.55)
  - K29↔C11: targets 19.6/8.6Å but partners are 7.2Å apart → too_close_together by 3.7Å
  - C11↔K30: targets 8.6/16.3Å but partners are 4.0Å apart → too_close_together by 3.7Å
  - M27↔C11: targets 16.0/8.6Å but partners are 3.9Å apart → too_close_together by 3.5Å
- **N28** — severity 7.17, 5 conflict(s); suspect input ~`T21` (group: push_out)
  - push-out (wants farther): T21@20.2Å(now 15.8,conf 0.69), S13@18.1Å(now 15.0,conf 0.55), W12@15.7Å(now 10.3,conf 0.55)
  - C31↔T21: targets 7.2/20.2Å but partners are 9.7Å apart → too_close_together by 3.3Å
  - T21↔R32: targets 20.2/9.6Å but partners are 8.3Å apart → too_close_together by 2.3Å
  - C31↔W12: targets 7.2/15.7Å but partners are 5.6Å apart → too_close_together by 2.9Å
- **R17** — severity 5.67, 5 conflict(s); suspect input ~`C26` (group: push_out)
  - push-out (wants farther): Y34@12.8Å(now 10.2,conf 0.55), R32@13.2Å(now 9.2,conf 0.55), C26@16.2Å(now 13.4,conf 0.55)
  - C26↔C11: targets 16.2/10.0Å but partners are 3.6Å apart → too_close_together by 2.6Å
  - V14↔R32: targets 6.0/13.2Å but partners are 5.0Å apart → too_close_together by 2.2Å
  - S13↔Y34: targets 6.1/12.8Å but partners are 4.7Å apart → too_close_together by 2.1Å
- **M27** — severity 5.38, 4 conflict(s); suspect input ~`N20` (group: push_out)
  - push-out (wants farther): K30@5.8Å(now 1.9,conf 0.69), N20@19.5Å(now 15.2,conf 0.58), V14@14.6Å(now 8.0,conf 0.55), S13@15.9Å(now 12.4,conf 0.55)
  - C31↔N20: targets 6.8/19.5Å but partners are 9.9Å apart → too_close_together by 2.8Å
  - C31↔V14: targets 6.8/14.6Å but partners are 5.4Å apart → too_close_together by 2.4Å
  - R32↔N20: targets 7.4/19.5Å but partners are 9.8Å apart → too_close_together by 2.2Å
- **T21** — severity 5.24, 2 conflict(s); suspect input ~`N28` (group: push_out)
  - push-out (wants farther): N28@20.2Å(now 15.8,conf 0.69)
  - C15↔N28: targets 6.8/20.2Å but partners are 9.0Å apart → too_close_together by 4.4Å
  - N28↔Q16: targets 20.2/4.5Å but partners are 12.1Å apart → too_close_together by 3.6Å
- **H19** — severity 5.00, 3 conflict(s); suspect input ~`K29` (group: pull_in)
  - pull-in (wants closer): T1@10.6Å(now 14.1,conf 0.55)
  - push-out (wants farther): K29@19.9Å(now 16.5,conf 0.58)
  - K29↔T1: targets 19.9/10.6Å but partners are 5.3Å apart → too_close_together by 4.0Å
  - V14↔K29: targets 7.5/19.9Å but partners are 9.9Å apart → too_close_together by 2.5Å
  - C15↔K29: targets 7.6/19.9Å but partners are 9.9Å apart → too_close_together by 2.3Å

## Secondary Structure (DSSP-like)

- helix(H)=13 · strand(E)=13 · 3-10(G)=3 · coil(C)=5

```
EEHECHEEEGHEHHHHHHEHEHCCECCHHEEGGE
```

## Backbone H-bond Network

- total=27 · helix(i→i+4)=3 · sheet=24
  - C11 ↔ C15  (helix)
  - S13 ↔ R17  (helix)
  - L18 ↔ S22  (helix)
  - T1 ↔ T7  (sheet)
  - T1 ↔ S8  (sheet)
  - T1 ↔ K9  (sheet)
  - T1 ↔ W12  (sheet)
  - N2 ↔ W12  (sheet)
  - S4 ↔ K9  (sheet)
  - S4 ↔ W12  (sheet)
  - T7 ↔ W12  (sheet)
  - T7 ↔ K25  (sheet)
  - S8 ↔ K25  (sheet)
  - K9 ↔ T21  (sheet)
  - K9 ↔ K25  (sheet)
  - W12 ↔ H19  (sheet)
  - W12 ↔ T21  (sheet)
  - W12 ↔ K25  (sheet)
  - W12 ↔ K30  (sheet)
  - W12 ↔ C31  (sheet)
  - … +7 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=12 · exposed=14 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=176 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=115 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.2816 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=10 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C26, C11–C31, C15–C33

## Side-chain Rotamers (χ1/χ2)

- 33 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
