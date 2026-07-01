# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2HIU\sequence\2HIU.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\2HIU\seeds\seed_4\2HIU.pdb`
- residues: 47
- mode: oracle
- ca_rmsd: 3.837 A
- tm_score_ca_ordered: 0.3939412330271448
- heavy_atom_rmsd: 5.281 A
- sidechain_heavy_atom_rmsd: 6.130 A
- **all-atom quality (honest):** heavy 5.281 A, sidechain 6.130 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/43 (0.0)
- lj_severe: 0
- lj_near: 5
- distogram_pairs: 366
- bin_accuracy: 0.527

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=residue_block reason=accepted tested=36
- rigid_domain_reconvergence: applied=True accepted=12 rmsd=5.5808000728331795 -> 4.900599354579659 A
- topology_reconvergence: applied=True accepted=1/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 3.8367619846643652
- ga_delta_rmsd: 0.041334834485209804  ga_fitness_mode: energy
- pre_local_rmsd: 3.866407339121568  localized_anchor_rmsd: 3.8368036603365328

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** K47 → 21 conflicts (57%)
- explained: 21/37 conflicts by 1 root cause(s)
- metrics: hubs=16 (frac 0.34), conflicts/hub=2.3, max_incompat=5.26Å, chain_span=0.957
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): K47 — explain ~21/37 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **R40** — severity 18.20, 9 conflict(s); suspect input ~`K47` (group: pull_in)
  - pull-in (wants closer): E16@10.7Å(now 14.6,conf 0.55)
  - push-out (wants farther): P46@19.0Å(now 15.3,conf 0.99), K47@22.4Å(now 15.3,conf 0.67), L35@10.0Å(now 6.3,conf 0.55)
  - Y44↔K47: targets 13.0/22.4Å but partners are 4.2Å apart → too_close_together by 5.2Å
  - F43↔K47: targets 10.0/22.4Å but partners are 7.5Å apart → too_close_together by 4.9Å
  - T45↔K47: targets 15.4/22.4Å but partners are 3.1Å apart → too_close_together by 3.9Å
- **C37** — severity 12.04, 6 conflict(s); suspect input ~`K47` (group: push_out)
  - push-out (wants farther): K47@20.4Å(now 14.1,conf 0.59), N21@16.5Å(now 13.9,conf 0.55)
  - L33↔K47: targets 5.4/20.4Å but partners are 10.1Å apart → too_close_together by 4.9Å
  - Y44↔K47: targets 12.0/20.4Å but partners are 4.2Å apart → too_close_together by 4.2Å
  - F43↔K47: targets 9.1/20.4Å but partners are 7.5Å apart → too_close_together by 3.8Å
- **C5** — severity 8.03, 4 conflict(s); suspect input ~`Q22` (group: pull_in)
  - pull-in (wants closer): Q22@6.7Å(now 13.4,conf 0.55), N21@9.0Å(now 12.8,conf 0.55)
  - V2↔Q22: targets 7.2/6.7Å but partners are 19.2Å apart → too_far_apart by 5.3Å
  - I1↔Q22: targets 6.4/6.7Å but partners are 16.8Å apart → too_far_apart by 3.6Å
  - S8↔Q22: targets 4.9/6.7Å but partners are 15.1Å apart → too_far_apart by 3.5Å
- **G41** — severity 4.45, 2 conflict(s); suspect input ~`Y44` (group: push_out)
  - push-out (wants farther): K47@19.0Å(now 14.1,conf 0.67), P46@16.3Å(now 13.0,conf 0.55)
  - K47↔Y44: targets 19.0/10.1Å but partners are 4.2Å apart → too_close_together by 4.6Å
  - T45↔K47: targets 13.0/19.0Å but partners are 3.1Å apart → too_close_together by 2.9Å
- **E39** — severity 2.88, 2 conflict(s); suspect input ~`P46` (group: push_out)
  - push-out (wants farther): P46@20.9Å(now 16.5,conf 0.59)
  - Y34↔P46: targets 7.1/20.9Å but partners are 11.2Å apart → too_close_together by 2.6Å
  - F42↔P46: targets 9.1/20.9Å but partners are 9.5Å apart → too_close_together by 2.2Å
- **C6** — severity 2.88, 2 conflict(s); suspect input ~`L24` (group: pull_in)
  - pull-in (wants closer): E3@5.2Å(now 8.2,conf 0.82), V20@13.4Å(now 16.5,conf 0.55)
  - E3↔L24: targets 5.2/4.9Å but partners are 12.7Å apart → too_far_apart by 2.6Å
  - E3↔C25: targets 5.2/4.1Å but partners are 11.4Å apart → too_far_apart by 2.2Å

## Secondary Structure (DSSP-like)

- helix(H)=21 · strand(E)=18 · 3-10(G)=5 · coil(C)=3

```
CEGEHHHECEEHHEHEHHGEHHEGHEEEHHHHHHEHEEHEHEGEGHC
```

## Backbone H-bond Network

- total=42 · helix(i→i+4)=4 · sheet=38
  - Y13 ↔ N17  (helix)
  - Y18 ↔ Q22  (helix)
  - C25 ↔ L29  (helix)
  - L29 ↔ L33  (helix)
  - V2 ↔ S8  (sheet)
  - V2 ↔ C10  (sheet)
  - V2 ↔ E16  (sheet)
  - Q4 ↔ C10  (sheet)
  - Q4 ↔ S11  (sheet)
  - Q4 ↔ E16  (sheet)
  - Q4 ↔ H23  (sheet)
  - S8 ↔ E16  (sheet)
  - S8 ↔ H23  (sheet)
  - S8 ↔ G26  (sheet)
  - S8 ↔ H28  (sheet)
  - C10 ↔ E16  (sheet)
  - C10 ↔ V20  (sheet)
  - C10 ↔ H23  (sheet)
  - C10 ↔ G26  (sheet)
  - C10 ↔ H28  (sheet)
  - … +22 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=19 · exposed=13 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=192 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=89 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.4132 (restraint satisfaction; lower=better)
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
