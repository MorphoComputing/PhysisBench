# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2HIU\sequence\2HIU.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\2HIU\seeds\seed_6\2HIU.pdb`
- residues: 47
- mode: oracle
- ca_rmsd: 2.724 A
- tm_score_ca_ordered: 0.5537209370681174
- heavy_atom_rmsd: 4.678 A
- sidechain_heavy_atom_rmsd: 5.761 A
- **all-atom quality (honest):** heavy 4.678 A, sidechain 5.761 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/43 (0.0)
- lj_severe: 0
- lj_near: 5
- distogram_pairs: 367
- bin_accuracy: 0.523

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=39
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 2.7236561720454717
- ga_delta_rmsd: 1.3870394678938944  ga_fitness_mode: energy
- pre_local_rmsd: 2.845017808799702  localized_anchor_rmsd: 2.7237477614639536

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** E16-Y18 → 11 conflicts (46%); V36 → 5 conflicts (21%)
- explained: 16/24 conflicts by 2 root cause(s)
- metrics: hubs=10 (frac 0.213), conflicts/hub=2.4, max_incompat=3.83Å, chain_span=0.745
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): E16-Y18 + V36 — explain ~16/24 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **V36** — severity 7.72, 5 conflict(s); suspect input ~`S11` (group: pull_in)
  - pull-in (wants closer): Y13@8.5Å(now 11.1,conf 0.55), S11@9.4Å(now 12.9,conf 0.55)
  - E39↔S11: targets 9.0/9.4Å but partners are 22.3Å apart → too_far_apart by 3.8Å
  - R40↔S11: targets 9.1/9.4Å but partners are 21.9Å apart → too_far_apart by 3.4Å
  - E39↔Y13: targets 9.0/8.5Å but partners are 20.9Å apart → too_far_apart by 3.4Å
- **Y18** — severity 6.89, 5 conflict(s); suspect input ~`Y44` (group: push_out)
  - pull-in (wants closer): N21@11.0Å(now 15.3,conf 0.99), S11@9.6Å(now 12.3,conf 0.69)
  - push-out (wants farther): G26@13.0Å(now 10.0,conf 0.55)
  - N21↔Y44: targets 11.0/6.0Å but partners are 20.6Å apart → too_far_apart by 3.6Å
  - N21↔F43: targets 11.0/6.0Å but partners are 20.4Å apart → too_far_apart by 3.4Å
  - S11↔F43: targets 9.6/6.0Å but partners are 17.6Å apart → too_far_apart by 2.0Å
- **E16** — severity 6.24, 5 conflict(s); suspect input ~`R40` (group: pull_in)
  - pull-in (wants closer): R40@10.7Å(now 15.5,conf 0.55)
  - Y13↔R40: targets 5.3/10.7Å but partners are 19.4Å apart → too_far_apart by 3.5Å
  - S11↔R40: targets 8.6/10.7Å but partners are 21.9Å apart → too_far_apart by 2.7Å
  - I9↔R40: targets 12.8/10.7Å but partners are 25.8Å apart → too_far_apart by 2.4Å
- **H28** — severity 2.85, 2 conflict(s); suspect input ~`N17` (group: push_out)
  - push-out (wants farther): N17@16.2Å(now 10.0,conf 0.55), T45@14.0Å(now 7.2,conf 0.55)
  - A32↔N17: targets 5.8/16.2Å but partners are 7.2Å apart → too_close_together by 3.1Å
  - L33↔N17: targets 8.8/16.2Å but partners are 5.2Å apart → too_close_together by 2.2Å
- **T7** — severity 2.67, 1 conflict(s); suspect input ~`C10` (group: pull_in)
  - pull-in (wants closer): F42@20.5Å(now 23.2,conf 0.59)
  - push-out (wants farther): S11@13.0Å(now 10.1,conf 0.99)
  - C10↔S11: targets 9.0/13.0Å but partners are 1.3Å apart → too_close_together by 2.7Å
- **L24** — severity 1.83, 2 conflict(s); suspect input ~`V20` (group: pull_in)
  - pull-in (wants closer): C19@11.0Å(now 13.9,conf 0.94), V20@9.9Å(now 12.5,conf 0.55)
  - S27↔V20: targets 7.0/9.9Å but partners are 18.6Å apart → too_far_apart by 1.7Å
  - C19↔C6: targets 11.0/4.9Å but partners are 17.5Å apart → too_far_apart by 1.6Å

## Secondary Structure (DSSP-like)

- helix(H)=18 · strand(E)=21 · 3-10(G)=6 · coil(C)=2

```
EEEEHHHCECEHHEHGEHHEEEEGGHHHHHHGGEHHHEHEEEGEEEE
```

## Backbone H-bond Network

- total=45 · helix(i→i+4)=5 · sheet=40
  - L15 ↔ C19  (helix)
  - G26 ↔ V30  (helix)
  - S27 ↔ E31  (helix)
  - E31 ↔ L35  (helix)
  - L35 ↔ E39  (helix)
  - I1 ↔ I9  (sheet)
  - I1 ↔ S11  (sheet)
  - I1 ↔ Q14  (sheet)
  - I1 ↔ N17  (sheet)
  - V2 ↔ I9  (sheet)
  - V2 ↔ S11  (sheet)
  - V2 ↔ N17  (sheet)
  - E3 ↔ I9  (sheet)
  - E3 ↔ S11  (sheet)
  - E3 ↔ Q22  (sheet)
  - E3 ↔ H23  (sheet)
  - Q4 ↔ I9  (sheet)
  - Q4 ↔ S11  (sheet)
  - Q4 ↔ Q14  (sheet)
  - Q4 ↔ V20  (sheet)
  - … +25 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=24 · exposed=8 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=183 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=83 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.0246 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=5 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C10, C6–C25, C19–C37

## Side-chain Rotamers (χ1/χ2)

- 43 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
