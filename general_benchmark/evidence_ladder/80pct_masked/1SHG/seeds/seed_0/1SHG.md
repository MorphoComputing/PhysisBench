# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set/general_benchmark/1SHG/sequence/1SHG.pdb`
- output_pdb: `general_benchmark/evidence_ladder/80pct_masked/1SHG/seeds/seed_0/1SHG.pdb`
- residues: 55
- mode: oracle
- ca_rmsd: 6.711 A
- tm_score_ca_ordered: 0.23262019614991578
- heavy_atom_rmsd: 7.739 A
- sidechain_heavy_atom_rmsd: 8.736 A
- **all-atom quality (honest):** heavy 7.739 A, sidechain 8.736 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/50 (0.0)
- lj_severe: 0
- lj_near: 38
- distogram_pairs: 276
- bin_accuracy: 0.290

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=insufficient_rmsd_improvement tested=39
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=436 mode=rotamer
- phase_b_ca_rmsd_after: 6.711214505111108
- ga_delta_rmsd: 0.9679103143057226  ga_fitness_mode: energy
- pre_local_rmsd: 6.741512670743691  localized_anchor_rmsd: 6.71116599256289

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** E16-I24 → 85 conflicts (64%); D34-V38 → 19 conflicts (14%); E1-L6 → 12 conflicts (9%)
- explained: 116/132 conflicts by 3 root cause(s)
- metrics: hubs=39 (frac 0.709), conflicts/hub=3.4, max_incompat=9.7Å, chain_span=0.945
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): E16-I24 + D34-V38 + E1-L6 — explain ~116/132 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **K21** — severity 26.63, 14 conflict(s); suspect input ~`L2` (group: push_out)
  - push-out (wants farther): N29@19.8Å(now 13.3,conf 0.58), S30@19.2Å(now 15.2,conf 0.56), L28@18.6Å(now 11.6,conf 0.55), W35@16.9Å(now 10.1,conf 0.55), P48@12.9Å(now 10.0,conf 0.55), W36@15.8Å(now 8.8,conf 0.55), E16@15.9Å(now 8.1,conf 0.55), L2@14.2Å(now 5.9,conf 0.55)
  - L4↔L2: targets 8.0/14.2Å but partners are 0.6Å apart → too_close_together by 5.7Å
  - L6↔L28: targets 5.3/18.6Å but partners are 8.4Å apart → too_close_together by 4.9Å
  - L6↔E16: targets 5.3/15.9Å but partners are 5.7Å apart → too_close_together by 5.0Å
- **T31** — severity 22.71, 13 conflict(s); suspect input ~`V38` (group: push_out)
  - push-out (wants farther): G22@22.6Å(now 11.2,conf 0.69), K20@22.3Å(now 8.7,conf 0.66), Q10@21.4Å(now 10.9,conf 0.61), I24@19.3Å(now 12.7,conf 0.56), L28@9.5Å(now 6.0,conf 0.55)
  - K20↔L28: targets 22.3/9.5Å but partners are 7.6Å apart → too_close_together by 5.2Å
  - Q10↔V47: targets 21.4/12.8Å but partners are 3.7Å apart → too_close_together by 4.9Å
  - G22↔L28: targets 22.6/9.5Å but partners are 9.2Å apart → too_close_together by 3.9Å
- **D34** — severity 18.11, 7 conflict(s); suspect input ~`P48` (group: pull_in)
  - pull-in (wants closer): P48@5.8Å(now 10.8,conf 0.55)
  - push-out (wants farther): D23@19.0Å(now 6.0,conf 0.56), L2@17.1Å(now 9.3,conf 0.55), E39@16.6Å(now 11.5,conf 0.55), V38@12.9Å(now 9.9,conf 0.55), V3@14.8Å(now 8.2,conf 0.55), N29@11.4Å(now 3.3,conf 0.55), E16@12.6Å(now 7.5,conf 0.55)
  - D23↔P48: targets 19.0/5.8Å but partners are 5.3Å apart → too_close_together by 7.8Å
  - P48↔E39: targets 5.8/16.6Å but partners are 3.6Å apart → too_close_together by 7.1Å
  - R43↔P48: targets 19.3/5.8Å but partners are 7.8Å apart → too_close_together by 5.7Å
- **S30** — severity 15.73, 7 conflict(s); suspect input ~`G22` (group: push_out)
  - push-out (wants farther): K21@19.2Å(now 15.2,conf 0.56), G22@19.1Å(now 11.4,conf 0.56), L25@12.6Å(now 9.7,conf 0.55)
  - W36↔G22: targets 5.0/19.1Å but partners are 4.4Å apart → too_close_together by 9.7Å
  - W36↔K21: targets 5.0/19.2Å but partners are 8.8Å apart → too_close_together by 5.4Å
  - G22↔L2: targets 19.1/11.4Å but partners are 3.7Å apart → too_close_together by 4.0Å
- **Q10** — severity 15.46, 5 conflict(s); suspect input ~`M19` (group: push_out)
  - push-out (wants farther): E1@21.8Å(now 13.3,conf 0.62), T31@21.4Å(now 10.9,conf 0.61), L6@13.0Å(now 5.7,conf 0.55), D23@12.9Å(now 7.6,conf 0.55), A50@14.2Å(now 9.8,conf 0.55), A49@14.0Å(now 9.5,conf 0.55)
  - T31↔T18: targets 21.4/4.6Å but partners are 7.5Å apart → too_close_together by 9.3Å
  - T31↔M19: targets 21.4/6.5Å but partners are 6.6Å apart → too_close_together by 8.3Å
  - T31↔K20: targets 21.4/8.3Å but partners are 8.7Å apart → too_close_together by 4.4Å
- **L27** — severity 13.43, 8 conflict(s); suspect input ~`D8` (group: push_out)
  - push-out (wants farther): D8@16.6Å(now 13.1,conf 0.55), K20@15.2Å(now 8.7,conf 0.55), G22@14.6Å(now 8.9,conf 0.55), T18@14.1Å(now 10.6,conf 0.55)
  - V38↔D8: targets 4.7/16.6Å but partners are 7.4Å apart → too_close_together by 4.5Å
  - V3↔K20: targets 6.4/15.2Å but partners are 4.8Å apart → too_close_together by 4.0Å
  - D8↔I24: targets 16.6/9.5Å but partners are 3.2Å apart → too_close_together by 3.9Å

## Secondary Structure (DSSP-like)

- helix(H)=32 · strand(E)=15 · 3-10(G)=8 · coil(C)=0

```
EEHEHHGGHEGHEHEHHEEHHHHHGHHEHHHEHEHGHHGGHHHEHHHGHHHEEHE
```

## Backbone H-bond Network

- total=46 · helix(i→i+4)=19 · sheet=27
  - A5 ↔ Y9  (helix)
  - K12 ↔ E16  (helix)
  - E16 ↔ K20  (helix)
  - V17 ↔ K21  (helix)
  - K20 ↔ I24  (helix)
  - G22 ↔ T26  (helix)
  - D23 ↔ L27  (helix)
  - T26 ↔ S30  (helix)
  - L27 ↔ T31  (helix)
  - N29 ↔ K33  (helix)
  - T31 ↔ W35  (helix)
  - K33 ↔ K37  (helix)
  - K37 ↔ N41  (helix)
  - V38 ↔ D42  (helix)
  - N41 ↔ G45  (helix)
  - D42 ↔ F46  (helix)
  - G45 ↔ A49  (helix)
  - F46 ↔ A50  (helix)
  - A50 ↔ K54  (helix)
  - L2 ↔ Q10  (sheet)
  - … +26 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=18 · exposed=16 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=499 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=359 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=4.3822 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=38 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 50 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
