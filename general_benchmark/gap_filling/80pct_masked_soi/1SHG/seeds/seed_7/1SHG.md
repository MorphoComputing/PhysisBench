# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1SHG\sequence\1SHG.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1SHG\seeds\seed_7\1SHG.pdb`
- residues: 55
- mode: oracle
- ca_rmsd: 7.488 A
- tm_score_ca_ordered: 0.25208269450998594
- heavy_atom_rmsd: 8.202 A
- sidechain_heavy_atom_rmsd: 8.825 A
- **all-atom quality (honest):** heavy 8.202 A, sidechain 8.825 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/50 (0.0)
- lj_severe: 0
- lj_near: 18
- distogram_pairs: 474
- bin_accuracy: 0.407

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=rejected_lj_regression tested=36
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 7.4878048100382
- ga_delta_rmsd: 2.0080145091962125  ga_fitness_mode: energy
- pre_local_rmsd: 7.519625281110399  localized_anchor_rmsd: 7.4878041887697675

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** D8-K12 → 81 conflicts (39%); E1-L2 → 46 conflicts (22%)
- explained: 127/206 conflicts by 2 root cause(s)
- metrics: hubs=39 (frac 0.709), conflicts/hub=5.3, max_incompat=10.43Å, chain_span=0.982
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): D8-K12 + E1-L2 — explain ~127/206 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **K12** — severity 61.98, 21 conflict(s); suspect input ~`E1` (group: push_out)
  - push-out (wants farther): R15@8.7Å(now 3.7,conf 0.82), E1@23.8Å(now 15.3,conf 0.75), K54@22.5Å(now 19.8,conf 0.68), L27@19.3Å(now 11.3,conf 0.56), S30@19.2Å(now 10.3,conf 0.56), N29@19.1Å(now 11.2,conf 0.56), K37@14.3Å(now 8.6,conf 0.55)
  - E16↔S30: targets 5.4/19.2Å but partners are 3.4Å apart → too_close_together by 10.4Å
  - Y9↔E1: targets 9.4/23.8Å but partners are 7.0Å apart → too_close_together by 7.3Å
  - E16↔E1: targets 5.4/23.8Å but partners are 11.1Å apart → too_close_together by 7.3Å
- **Q10** — severity 49.93, 16 conflict(s); suspect input ~`E1` (group: pull_in)
  - pull-in (wants closer): M19@6.5Å(now 9.4,conf 0.55), K20@8.3Å(now 11.5,conf 0.55)
  - push-out (wants farther): V3@17.0Å(now 10.9,conf 0.99), R15@11.1Å(now 6.1,conf 0.91), P14@12.6Å(now 7.7,conf 0.79), E1@21.8Å(now 13.0,conf 0.62), T31@21.4Å(now 13.1,conf 0.61)
  - E1↔M19: targets 21.8/6.5Å but partners are 5.4Å apart → too_close_together by 9.8Å
  - E1↔T18: targets 21.8/4.6Å but partners are 9.6Å apart → too_close_together by 7.6Å
  - Y7↔E1: targets 11.0/21.8Å but partners are 3.8Å apart → too_close_together by 6.9Å
- **E1** — severity 32.38, 10 conflict(s); suspect input ~`Y7` (group: push_out)
  - push-out (wants farther): A5@13.0Å(now 4.6,conf 1.00), L4@11.0Å(now 2.8,conf 0.99), Y7@19.0Å(now 3.8,conf 0.99), D8@20.9Å(now 7.5,conf 0.91), P14@23.2Å(now 18.4,conf 0.75), K12@23.8Å(now 15.3,conf 0.75), Q10@21.8Å(now 13.0,conf 0.62), T18@18.6Å(now 9.6,conf 0.55), V17@17.5Å(now 9.5,conf 0.55), M19@16.6Å(now 5.4,conf 0.55), K33@16.3Å(now 12.8,conf 0.55), P48@16.2Å(now 11.9,conf 0.55), L6@15.7Å(now 3.7,conf 0.55)
  - L4↔Y7: targets 11.0/19.0Å but partners are 1.6Å apart → too_close_together by 6.4Å
  - Y7↔L55: targets 19.0/7.0Å but partners are 5.9Å apart → too_close_together by 6.1Å
  - A5↔Y7: targets 13.0/19.0Å but partners are 0.9Å apart → too_close_together by 5.1Å
- **D8** — severity 26.43, 10 conflict(s); suspect input ~`E1` (group: push_out)
  - push-out (wants farther): L2@17.0Å(now 6.2,conf 1.00), E1@20.9Å(now 7.5,conf 0.91), K33@19.3Å(now 14.4,conf 0.56), L27@16.6Å(now 12.2,conf 0.55), W35@15.0Å(now 11.2,conf 0.55), L4@11.0Å(now 6.1,conf 0.55), E39@14.9Å(now 7.7,conf 0.55), F46@13.4Å(now 10.1,conf 0.55), T18@7.8Å(now 4.3,conf 0.55), V3@13.6Å(now 5.1,conf 0.55)
  - E1↔A5: targets 20.9/7.1Å but partners are 4.6Å apart → too_close_together by 9.2Å
  - L2↔A5: targets 17.0/7.1Å but partners are 5.3Å apart → too_close_together by 4.5Å
  - E1↔L4: targets 20.9/11.0Å but partners are 2.8Å apart → too_close_together by 7.1Å
- **P14** — severity 25.38, 11 conflict(s); suspect input ~`L2` (group: push_out)
  - push-out (wants farther): E11@9.0Å(now 6.1,conf 0.94), Q10@12.6Å(now 7.7,conf 0.79), E1@23.2Å(now 18.4,conf 0.75), L2@22.5Å(now 15.5,conf 0.68), T26@19.1Å(now 14.3,conf 0.56), K33@19.1Å(now 16.2,conf 0.56)
  - L2↔V17: targets 22.5/8.2Å but partners are 6.6Å apart → too_close_together by 7.8Å
  - E1↔V17: targets 23.2/8.2Å but partners are 9.5Å apart → too_close_together by 5.5Å
  - E11↔L2: targets 9.0/22.5Å but partners are 9.4Å apart → too_close_together by 4.1Å
- **E11** — severity 22.52, 11 conflict(s); suspect input ~`L28` (group: pull_in)
  - pull-in (wants closer): T18@4.9Å(now 8.4,conf 0.58)
  - push-out (wants farther): L4@17.0Å(now 12.2,conf 1.00), P14@9.0Å(now 6.1,conf 0.94), R15@9.0Å(now 3.2,conf 0.94), L6@16.2Å(now 12.8,conf 0.69), L28@17.0Å(now 5.2,conf 0.55), E39@13.2Å(now 8.9,conf 0.55)
  - E16↔L28: targets 5.1/17.0Å but partners are 4.7Å apart → too_close_together by 7.2Å
  - V17↔L28: targets 5.0/17.0Å but partners are 5.6Å apart → too_close_together by 6.4Å
  - T18↔E39: targets 4.9/13.2Å but partners are 3.8Å apart → too_close_together by 4.5Å

## Secondary Structure (DSSP-like)

- helix(H)=24 · strand(E)=19 · 3-10(G)=7 · coil(C)=5

```
EHHHHHEGEGHHHHEGEHCCHEEHHGEHHHHEEGEEHGCEEHEGCEEEHHHHHEC
```

## Backbone H-bond Network

- total=48 · helix(i→i+4)=6 · sheet=42
  - L2 ↔ L6  (helix)
  - P14 ↔ T18  (helix)
  - K21 ↔ L25  (helix)
  - I24 ↔ L28  (helix)
  - L25 ↔ N29  (helix)
  - A49 ↔ K53  (helix)
  - E1 ↔ Y7  (sheet)
  - E1 ↔ Y9  (sheet)
  - E1 ↔ V17  (sheet)
  - Y7 ↔ V17  (sheet)
  - Y7 ↔ G22  (sheet)
  - Y7 ↔ D23  (sheet)
  - Y7 ↔ L27  (sheet)
  - Y9 ↔ R15  (sheet)
  - Y9 ↔ V17  (sheet)
  - Y9 ↔ G22  (sheet)
  - Y9 ↔ D23  (sheet)
  - Y9 ↔ L27  (sheet)
  - R15 ↔ L27  (sheet)
  - R15 ↔ N32  (sheet)
  - … +28 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=17 · exposed=22 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=299 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=197 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=4.6393 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=18 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 50 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
