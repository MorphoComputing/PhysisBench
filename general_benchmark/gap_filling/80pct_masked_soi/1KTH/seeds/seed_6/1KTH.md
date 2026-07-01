# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1KTH\sequence\1KTH.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1KTH\seeds\seed_6\1KTH.pdb`
- residues: 56
- mode: oracle
- ca_rmsd: 4.955 A
- tm_score_ca_ordered: 0.407128662113156
- heavy_atom_rmsd: 6.038 A
- sidechain_heavy_atom_rmsd: 6.992 A
- **all-atom quality (honest):** heavy 6.038 A, sidechain 6.992 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/48 (0.0)
- lj_severe: 0
- lj_near: 14
- distogram_pairs: 489
- bin_accuracy: 0.507

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=30
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 4.9554034796227056
- ga_delta_rmsd: -0.6788773719853198  ga_fitness_mode: energy
- pre_local_rmsd: 4.988264252077803  localized_anchor_rmsd: 4.95539164120401

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** K5-K8 → 73 conflicts (51%); T1-D2 → 48 conflicts (33%); C13-R14 → 13 conflicts (9%)
- explained: 134/144 conflicts by 3 root cause(s)
- metrics: hubs=30 (frac 0.536), conflicts/hub=4.8, max_incompat=9.27Å, chain_span=0.982
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): K5-K8 + T1-D2 + C13-R14 — explain ~134/144 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **C13** — severity 49.49, 18 conflict(s); suspect input ~`T1` (group: push_out)
  - push-out (wants farther): K8@15.0Å(now 11.3,conf 0.99), P7@17.0Å(now 10.6,conf 0.94), T1@27.4Å(now 20.8,conf 0.94), D9@12.0Å(now 9.3,conf 0.72), D2@25.2Å(now 19.3,conf 0.69), L6@19.8Å(now 15.0,conf 0.58)
  - E10↔T1: targets 9.0/27.4Å but partners are 13.3Å apart → too_close_together by 5.1Å
  - W20↔T1: targets 17.0/27.4Å but partners are 5.6Å apart → too_close_together by 4.8Å
  - E10↔D2: targets 9.0/25.2Å but partners are 10.0Å apart → too_close_together by 6.2Å
- **D2** — severity 45.00, 21 conflict(s); suspect input ~`W33` (group: push_out)
  - push-out (wants farther): K5@6.9Å(now 3.4,conf 0.91), K8@13.1Å(now 10.1,conf 0.91), D15@27.0Å(now 17.3,conf 0.84), D9@16.4Å(now 10.9,conf 0.69), C13@25.2Å(now 19.3,conf 0.69), G35@22.3Å(now 15.1,conf 0.66), W33@20.9Å(now 8.4,conf 0.60), Y34@19.7Å(now 12.6,conf 0.57), R31@18.9Å(now 5.8,conf 0.56), K19@18.4Å(now 8.7,conf 0.55)
  - K5↔W33: targets 6.9/20.9Å but partners are 7.4Å apart → too_close_together by 6.7Å
  - P7↔G35: targets 11.1/22.3Å but partners are 5.5Å apart → too_close_together by 5.7Å
  - K5↔R31: targets 6.9/18.9Å but partners are 6.3Å apart → too_close_together by 5.7Å
- **D15** — severity 36.12, 13 conflict(s); suspect input ~`D2` (group: push_out)
  - push-out (wants farther): K8@17.0Å(now 12.3,conf 0.99), D2@27.0Å(now 17.3,conf 0.84), L6@21.4Å(now 17.5,conf 0.60)
  - E10↔D2: targets 10.9/27.0Å but partners are 10.0Å apart → too_close_together by 6.1Å
  - D2↔F32: targets 27.0/13.3Å but partners are 4.4Å apart → too_close_together by 9.3Å
  - D2↔L18: targets 27.0/9.4Å but partners are 11.3Å apart → too_close_together by 6.3Å
- **R14** — severity 32.16, 14 conflict(s); suspect input ~`K5` (group: pull_in)
  - pull-in (wants closer): G36@6.7Å(now 11.3,conf 0.55)
  - push-out (wants farther): P7@19.0Å(now 13.4,conf 0.94), K8@16.6Å(now 12.4,conf 0.79), C4@23.8Å(now 20.2,conf 0.75), K5@24.6Å(now 17.3,conf 0.70)
  - E10↔K5: targets 10.6/24.6Å but partners are 8.4Å apart → too_close_together by 5.7Å
  - P7↔G36: targets 19.0/6.7Å but partners are 5.7Å apart → too_close_together by 6.6Å
  - G11↔P7: targets 9.0/19.0Å but partners are 6.5Å apart → too_close_together by 3.5Å
- **G35** — severity 18.60, 7 conflict(s); suspect input ~`D2` (group: push_out)
  - push-out (wants farther): D2@22.3Å(now 15.1,conf 0.66), K5@20.0Å(now 12.7,conf 0.58), L6@17.1Å(now 10.1,conf 0.55), G39@9.2Å(now 5.6,conf 0.52)
  - F32↔D2: targets 9.4/22.3Å but partners are 4.4Å apart → too_close_together by 8.5Å
  - F32↔K5: targets 9.4/20.0Å but partners are 4.2Å apart → too_close_together by 6.3Å
  - A30↔D2: targets 15.4/22.3Å but partners are 3.1Å apart → too_close_together by 3.8Å
- **T1** — severity 15.83, 7 conflict(s); suspect input ~`A30` (group: push_out)
  - push-out (wants farther): C13@27.4Å(now 20.8,conf 0.94), K8@16.6Å(now 9.8,conf 0.79), C4@6.0Å(now 1.6,conf 0.72), A30@17.4Å(now 3.7,conf 0.55), E51@12.5Å(now 7.2,conf 0.55), W20@16.1Å(now 5.6,conf 0.55)
  - C4↔A30: targets 6.0/17.4Å but partners are 3.9Å apart → too_close_together by 7.5Å
  - A30↔K5: targets 17.4/7.5Å but partners are 5.0Å apart → too_close_together by 4.9Å
  - C4↔W20: targets 6.0/16.1Å but partners are 5.3Å apart → too_close_together by 4.8Å

## Secondary Structure (DSSP-like)

- helix(H)=28 · strand(E)=16 · 3-10(G)=10 · coil(C)=2

```
EEHHHEHEGHHHHEHHCEGEEEGHHGHEHHHGCGEEHHHEEGGGHHHHHGHHHHEE
```

## Backbone H-bond Network

- total=38 · helix(i→i+4)=6 · sheet=32
  - I3 ↔ P7  (helix)
  - P7 ↔ G11  (helix)
  - G11 ↔ D15  (helix)
  - T12 ↔ F16  (helix)
  - K27 ↔ R31  (helix)
  - K48 ↔ K52  (helix)
  - T1 ↔ L6  (sheet)
  - T1 ↔ K8  (sheet)
  - T1 ↔ L18  (sheet)
  - T1 ↔ W20  (sheet)
  - T1 ↔ Y21  (sheet)
  - D2 ↔ K8  (sheet)
  - D2 ↔ L18  (sheet)
  - D2 ↔ W20  (sheet)
  - D2 ↔ Y21  (sheet)
  - D2 ↔ Y22  (sheet)
  - L6 ↔ L18  (sheet)
  - L6 ↔ W20  (sheet)
  - L6 ↔ Y21  (sheet)
  - L6 ↔ Y22  (sheet)
  - … +18 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=23 · exposed=19 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=280 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=173 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=3.4616 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=14 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C4–C54, C13–C37, C29–C50

## Side-chain Rotamers (χ1/χ2)

- 48 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
