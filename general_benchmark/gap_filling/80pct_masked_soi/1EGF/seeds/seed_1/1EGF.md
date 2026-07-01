# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1EGF\sequence\1EGF.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1EGF\seeds\seed_1\1EGF.pdb`
- residues: 51
- mode: oracle
- ca_rmsd: 2.831 A
- tm_score_ca_ordered: 0.5326288556684381
- heavy_atom_rmsd: 4.864 A
- sidechain_heavy_atom_rmsd: 6.193 A
- **all-atom quality (honest):** heavy 4.864 A, sidechain 6.193 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/45 (0.0)
- lj_severe: 0
- lj_near: 11
- distogram_pairs: 413
- bin_accuracy: 0.593

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=residue_block reason=accepted tested=39
- rigid_domain_reconvergence: applied=True accepted=12 rmsd=6.351352536933699 -> 4.5673828015906395 A
- topology_reconvergence: applied=True accepted=0/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 2.8315119610099653
- ga_delta_rmsd: -1.2458007246073564  ga_fitness_mode: energy
- pre_local_rmsd: 2.86924030456127  localized_anchor_rmsd: 2.83147172528118

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** S7 → 5 conflicts (50%); L25 → 3 conflicts (30%)
- explained: 8/10 conflicts by 2 root cause(s)
- metrics: hubs=6 (frac 0.118), conflicts/hub=1.7, max_incompat=4.43Å, chain_span=0.549
- **fix-first:** [LOW_CONFLICT] Root cause(s): S7 + L25 — explain ~8/10 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **G35** — severity 4.25, 3 conflict(s); suspect input ~`L25` (group: push_out)
  - push-out (wants farther): Y28@20.9Å(now 17.9,conf 0.91), L25@26.9Å(now 23.0,conf 0.82)
  - D39↔L25: targets 13.0/26.9Å but partners are 11.6Å apart → too_close_together by 2.3Å
  - G38↔L25: targets 11.0/26.9Å but partners are 14.0Å apart → too_close_together by 1.9Å
  - L25↔C41: targets 26.9/8.5Å but partners are 16.8Å apart → too_close_together by 1.6Å
- **Y28** — severity 3.27, 2 conflict(s); suspect input ~`S7` (group: pull_in)
  - pull-in (wants closer): S7@11.4Å(now 16.1,conf 0.55)
  - push-out (wants farther): G35@20.9Å(now 17.9,conf 0.91)
  - L25↔S7: targets 9.0/11.4Å but partners are 24.8Å apart → too_far_apart by 4.4Å
  - S24↔S7: targets 9.6/11.4Å but partners are 22.6Å apart → too_far_apart by 1.6Å
- **H21** — severity 3.08, 2 conflict(s); suspect input ~`S7` (group: pull_in)
  - pull-in (wants closer): L25@9.0Å(now 12.0,conf 1.00), D26@7.2Å(now 9.9,conf 0.55)
  - L25↔S7: targets 9.0/12.5Å but partners are 24.8Å apart → too_far_apart by 3.3Å
  - D26↔S7: targets 7.2/12.5Å but partners are 22.0Å apart → too_far_apart by 2.3Å
- **S7** — severity 2.02, 1 conflict(s); suspect input ~`Y28` (group: pull_in)
  - pull-in (wants closer): Y28@11.4Å(now 16.1,conf 0.55)
  - S1↔Y28: targets 18.7/11.4Å but partners are 3.6Å apart → too_close_together by 3.7Å
- **N31** — severity 1.25, 1 conflict(s); suspect input ~`V18` (group: pull_in)
  - pull-in (wants closer): V18@5.3Å(now 8.6,conf 0.56)
  - G38↔V18: targets 6.8/5.3Å but partners are 14.3Å apart → too_far_apart by 2.2Å
- **G16** — severity 1.03, 1 conflict(s); suspect input ~`G11` (group: push_out)
  - push-out (wants farther): Y9@16.2Å(now 13.1,conf 0.55)
  - Y9↔G11: targets 16.2/10.1Å but partners are 4.2Å apart → too_close_together by 1.9Å

## Secondary Structure (DSSP-like)

- helix(H)=12 · strand(E)=25 · 3-10(G)=8 · coil(C)=6

```
EEEEHEHHCHGGGEHEEEECECEHHGEHEGEEGGHECHHGEHEEEEECEEC
```

## Backbone H-bond Network

- total=70 · helix(i→i+4)=2 · sheet=68
  - S24 ↔ Y28  (helix)
  - G38 ↔ Q42  (helix)
  - S1 ↔ V18  (sheet)
  - S1 ↔ C19  (sheet)
  - S1 ↔ H21  (sheet)
  - Y2 ↔ V18  (sheet)
  - Y2 ↔ C19  (sheet)
  - Y2 ↔ H21  (sheet)
  - P3 ↔ G17  (sheet)
  - P3 ↔ V18  (sheet)
  - P3 ↔ C19  (sheet)
  - P3 ↔ H21  (sheet)
  - P3 ↔ E23  (sheet)
  - G4 ↔ G17  (sheet)
  - G4 ↔ V18  (sheet)
  - G4 ↔ C19  (sheet)
  - G4 ↔ H21  (sheet)
  - P6 ↔ G17  (sheet)
  - P6 ↔ V18  (sheet)
  - P6 ↔ C19  (sheet)
  - … +50 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=15 · exposed=22 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=182 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=105 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.8401 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=11 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C19, C13–C30, C32–C41

## Side-chain Rotamers (χ1/χ2)

- 45 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
