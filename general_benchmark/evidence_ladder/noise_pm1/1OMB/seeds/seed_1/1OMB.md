# Physis Fold — Run Report

**Verdict:** PASS

- reference_pdb: `set\general_benchmark\1OMB\sequence\1OMB.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm1\1OMB\seeds\seed_1\1OMB.pdb`
- residues: 33
- mode: oracle
- ca_rmsd: 0.726 A
- tm_score_ca_ordered: 0.8154788843813986
- heavy_atom_rmsd: 2.183 A
- sidechain_heavy_atom_rmsd: 2.731 A
- **all-atom quality (honest):** heavy 2.183 A, sidechain 2.731 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/27 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 465
- bin_accuracy: 0.680

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=30
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.7256931696328114
- ga_delta_rmsd: 0.026670148642869873  ga_fitness_mode: energy
- pre_local_rmsd: 0.7257008399124856  localized_anchor_rmsd: None

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** E31-C32 → 5 conflicts (56%); Y5 → 3 conflicts (33%)
- explained: 8/9 conflicts by 2 root cause(s)
- metrics: hubs=5 (frac 0.152), conflicts/hub=1.8, max_incompat=3.01Å, chain_span=0.667
- **fix-first:** [LOW_CONFLICT] Root cause(s): E31-C32 + Y5 — explain ~8/9 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **R22** — severity 2.09, 3 conflict(s); suspect input ~`D4` (group: pull_in)
  - pull-in (wants closer): Y5@7.2Å(now 10.0,conf 0.37)
  - Y5↔D4: targets 7.2/13.5Å but partners are 3.7Å apart → too_close_together by 2.6Å
  - Y5↔E3: targets 7.2/15.2Å but partners are 6.0Å apart → too_close_together by 1.9Å
  - Y5↔M25: targets 7.2/7.4Å but partners are 16.2Å apart → too_far_apart by 1.6Å
- **C32** — severity 1.37, 2 conflict(s); suspect input ~`R17` (group: push_out)
  - push-out (wants farther): R17@13.5Å(now 11.0,conf 0.34)
  - R19↔R17: targets 5.6/13.5Å but partners are 5.7Å apart → too_close_together by 2.2Å
  - C15↔R17: targets 5.6/13.5Å but partners are 6.1Å apart → too_close_together by 1.8Å
- **E31** — severity 1.13, 2 conflict(s); suspect input ~`C15` (group: push_out)
  - push-out (wants farther): K7@7.0Å(now 4.4,conf 0.37), R17@17.1Å(now 14.6,conf 0.35), G27@12.9Å(now 10.2,conf 0.34)
  - R17↔C15: targets 17.1/9.3Å but partners are 6.1Å apart → too_close_together by 1.7Å
  - C23↔G27: targets 6.0/12.9Å but partners are 5.3Å apart → too_close_together by 1.6Å
- **G27** — severity 1.02, 1 conflict(s); suspect input ~`E31` (group: push_out)
  - push-out (wants farther): E31@12.9Å(now 10.2,conf 0.34)
  - C30↔E31: targets 5.8/12.9Å but partners are 4.2Å apart → too_close_together by 3.0Å
- **W10** — severity 0.59, 1 conflict(s); suspect input ~`C15` (group: push_out)
  - push-out (wants farther): C15@13.2Å(now 10.6,conf 0.34)
  - K14↔C15: targets 7.1/13.2Å but partners are 4.4Å apart → too_close_together by 1.7Å

## Secondary Structure (DSSP-like)

- helix(H)=4 · strand(E)=10 · 3-10(G)=12 · coil(C)=7

```
CEECHECGECHEGGCGGGECGGGHGGGEHEECE
```

## Backbone H-bond Network

- total=12 · helix(i→i+4)=0 · sheet=12
  - A2 ↔ R19  (sheet)
  - E3 ↔ R19  (sheet)
  - G6 ↔ G12  (sheet)
  - G6 ↔ R19  (sheet)
  - T9 ↔ R19  (sheet)
  - T9 ↔ T28  (sheet)
  - G12 ↔ R19  (sheet)
  - G12 ↔ C30  (sheet)
  - G12 ↔ E31  (sheet)
  - R19 ↔ C30  (sheet)
  - R19 ↔ E31  (sheet)
  - R19 ↔ T33  (sheet)

## Solvent Accessibility (burial)

- buried=15 · exposed=11 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=103 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=47 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.208 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C8–C21, C15–C32, C23–C30

## Side-chain Rotamers (χ1/χ2)

- 27 residues with modelled χ angles (full table in report JSON)
