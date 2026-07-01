# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2HIU\sequence\2HIU.pdb`
- output_pdb: `general_benchmark\evidence_ladder\50pct_masked\2HIU\seeds\seed_1\2HIU.pdb`
- residues: 47
- mode: oracle
- ca_rmsd: 1.737 A
- tm_score_ca_ordered: 0.7868000471541904
- heavy_atom_rmsd: 3.173 A
- sidechain_heavy_atom_rmsd: 3.759 A
- **all-atom quality (honest):** heavy 3.173 A, sidechain 3.759 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/43 (0.0)
- lj_severe: 0
- lj_near: 7
- distogram_pairs: 495
- bin_accuracy: 0.719

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=30
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 1.7366373569090838
- ga_delta_rmsd: 0.23346387971073002  ga_fitness_mode: energy
- pre_local_rmsd: 1.7798154982705219  localized_anchor_rmsd: 1.73663056255729

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** C19-V20 → 13 conflicts (72%); S11 → 4 conflicts (22%)
- explained: 17/18 conflicts by 2 root cause(s)
- metrics: hubs=8 (frac 0.17), conflicts/hub=2.2, max_incompat=3.24Å, chain_span=0.702
- **fix-first:** [LOW_CONFLICT] Root cause(s): C19-V20 + S11 — explain ~17/18 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **F42** — severity 6.95, 5 conflict(s); suspect input ~`L12` (group: pull_in)
  - pull-in (wants closer): C19@4.5Å(now 10.1,conf 0.60)
  - C19↔L12: targets 4.5/13.4Å but partners are 5.8Å apart → too_close_together by 3.0Å
  - C19↔N21: targets 4.5/20.5Å but partners are 13.3Å apart → too_close_together by 2.8Å
  - C19↔V36: targets 4.5/10.3Å but partners are 3.3Å apart → too_close_together by 2.5Å
- **Y44** — severity 6.02, 4 conflict(s); suspect input ~`L15` (group: pull_in)
  - pull-in (wants closer): E16@10.7Å(now 13.4,conf 0.55)
  - push-out (wants farther): V20@20.3Å(now 17.4,conf 0.59)
  - V20↔L15: targets 20.3/9.3Å but partners are 7.7Å apart → too_close_together by 3.2Å
  - V20↔E16: targets 20.3/10.7Å but partners are 6.4Å apart → too_close_together by 3.2Å
  - V20↔L12: targets 20.3/13.9Å but partners are 4.0Å apart → too_close_together by 2.3Å
- **C37** — severity 3.06, 2 conflict(s); suspect input ~`V20` (group: push_out)
  - push-out (wants farther): V20@16.0Å(now 12.8,conf 0.55)
  - L12↔V20: targets 8.8/16.0Å but partners are 4.0Å apart → too_close_together by 3.2Å
  - E16↔V20: targets 7.2/16.0Å but partners are 6.4Å apart → too_close_together by 2.4Å
- **Q14** — severity 2.50, 2 conflict(s); suspect input ~`Q22` (group: push_out)
  - push-out (wants farther): N21@11.0Å(now 7.0,conf 0.55), Q22@12.1Å(now 8.1,conf 0.55)
  - S11↔Q22: targets 5.1/12.1Å but partners are 4.3Å apart → too_close_together by 2.7Å
  - S11↔N21: targets 5.1/11.0Å but partners are 4.0Å apart → too_close_together by 1.9Å
- **L15** — severity 1.88, 2 conflict(s); suspect input ~`Q22` (group: push_out)
  - push-out (wants farther): Q22@12.2Å(now 9.0,conf 0.55)
  - S11↔Q22: targets 6.0/12.2Å but partners are 4.3Å apart → too_close_together by 1.8Å
  - C10↔Q22: targets 6.8/12.2Å but partners are 3.8Å apart → too_close_together by 1.6Å
- **N21** — severity 1.13, 1 conflict(s); suspect input ~`E16` (group: push_out)
  - push-out (wants farther): Q14@11.0Å(now 7.0,conf 0.55), Y13@11.2Å(now 8.0,conf 0.55), E16@14.1Å(now 9.1,conf 0.55)
  - S11↔E16: targets 6.1/14.1Å but partners are 6.0Å apart → too_close_together by 2.1Å

## Secondary Structure (DSSP-like)

- helix(H)=24 · strand(E)=13 · 3-10(G)=6 · coil(C)=4

```
CHHEEHHECEEHHHHHHHGEGECEGHHHGHHHHEHHHGHGEECEHHE
```

## Backbone H-bond Network

- total=33 · helix(i→i+4)=11 · sheet=22
  - V2 ↔ C6  (helix)
  - E3 ↔ T7  (helix)
  - L12 ↔ E16  (helix)
  - Y13 ↔ N17  (helix)
  - Q14 ↔ Y18  (helix)
  - G26 ↔ V30  (helix)
  - S27 ↔ E31  (helix)
  - H28 ↔ A32  (helix)
  - E31 ↔ L35  (helix)
  - A32 ↔ V36  (helix)
  - L35 ↔ E39  (helix)
  - Q4 ↔ C10  (sheet)
  - Q4 ↔ S11  (sheet)
  - Q4 ↔ Q22  (sheet)
  - Q4 ↔ L24  (sheet)
  - C5 ↔ C10  (sheet)
  - C5 ↔ S11  (sheet)
  - C5 ↔ V20  (sheet)
  - C5 ↔ Q22  (sheet)
  - C5 ↔ L24  (sheet)
  - … +13 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=21 · exposed=11 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=175 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=68 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.9413 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=7 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C10, C6–C25, C19–C37

## Side-chain Rotamers (χ1/χ2)

- 43 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
