# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1YCC\sequence\1YCC.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1YCC\seeds\seed_5\1YCC.pdb`
- residues: 103
- mode: oracle
- ca_rmsd: 3.257 A
- tm_score_ca_ordered: 0.7677629186073119
- heavy_atom_rmsd: 4.635 A
- sidechain_heavy_atom_rmsd: 5.523 A
- **all-atom quality (honest):** heavy 4.635 A, sidechain 5.523 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/84 (0.0)
- lj_severe: 0
- lj_near: 9
- distogram_pairs: 1051
- bin_accuracy: 0.657

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=54
- rigid_domain_reconvergence: applied=True accepted=5 rmsd=6.959114230046678 -> 6.470329847562924 A
- topology_reconvergence: applied=True accepted=0/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 3.257415467420994
- ga_delta_rmsd: 3.0630887234724433  ga_fitness_mode: energy
- pre_local_rmsd: 3.283600946117968  localized_anchor_rmsd: 3.2574121142391483

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** E1-K3 → 70 conflicts (56%); C103 → 16 conflicts (13%); K8 → 7 conflicts (6%)
- explained: 93/126 conflicts by 3 root cause(s)
- metrics: hubs=34 (frac 0.33), conflicts/hub=3.7, max_incompat=8.77Å, chain_span=0.99
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): E1-K3 + C103 + K8 — explain ~93/126 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **C103** — severity 25.30, 9 conflict(s); suspect input ~`E1` (group: pull_in)
  - pull-in (wants closer): L99@5.1Å(now 7.8,conf 0.91), Y98@7.4Å(now 10.8,conf 0.79), A11@11.7Å(now 16.9,conf 0.55)
  - push-out (wants farther): V61@17.0Å(now 7.8,conf 0.99), E1@20.0Å(now 14.4,conf 0.72), K80@21.6Å(now 14.5,conf 0.61), Q46@15.0Å(now 11.7,conf 0.55), R42@11.6Å(now 8.1,conf 0.55), E65@11.7Å(now 7.6,conf 0.55)
  - Y98↔E1: targets 7.4/20.0Å but partners are 4.5Å apart → too_close_together by 8.0Å
  - L99↔E1: targets 5.1/20.0Å but partners are 8.0Å apart → too_close_together by 6.9Å
  - T97↔E1: targets 10.6/20.0Å but partners are 3.0Å apart → too_close_together by 6.4Å
- **Y98** — severity 24.03, 9 conflict(s); suspect input ~`E1` (group: pull_in)
  - pull-in (wants closer): C103@7.4Å(now 10.8,conf 0.79)
  - push-out (wants farther): Y75@21.2Å(now 17.7,conf 0.60), E1@17.0Å(now 4.5,conf 0.55)
  - A7↔E1: targets 4.5/17.0Å but partners are 4.9Å apart → too_close_together by 7.7Å
  - D94↔E1: targets 7.0/17.0Å but partners are 3.8Å apart → too_close_together by 6.2Å
  - L95↔E1: targets 5.0/17.0Å but partners are 6.0Å apart → too_close_together by 6.0Å
- **K8** — severity 21.88, 10 conflict(s); suspect input ~`E1` (group: push_out)
  - push-out (wants farther): F2@17.0Å(now 12.9,conf 1.00), A4@12.6Å(now 8.3,conf 0.79), E1@20.8Å(now 8.4,conf 0.59), L19@14.9Å(now 10.8,conf 0.55), K3@15.1Å(now 10.5,conf 0.55), F14@9.9Å(now 6.8,conf 0.55)
  - E1↔G5: targets 20.8/8.9Å but partners are 3.3Å apart → too_close_together by 8.6Å
  - A11↔E1: targets 3.0/20.8Å but partners are 10.0Å apart → too_close_together by 7.8Å
  - A4↔E1: targets 12.6/20.8Å but partners are 4.4Å apart → too_close_together by 3.8Å
- **K9** — severity 21.53, 10 conflict(s); suspect input ~`E1` (group: push_out)
  - push-out (wants farther): A4@12.7Å(now 10.0,conf 0.82), F2@16.0Å(now 12.4,conf 0.72), E1@19.6Å(now 8.4,conf 0.57), K3@14.2Å(now 10.9,conf 0.55)
  - S6↔E1: targets 5.2/19.6Å but partners are 6.5Å apart → too_close_together by 7.9Å
  - G5↔E1: targets 8.6/19.6Å but partners are 3.3Å apart → too_close_together by 7.7Å
  - E1↔T97: targets 19.6/9.0Å but partners are 3.0Å apart → too_close_together by 7.5Å
- **A7** — severity 15.21, 6 conflict(s); suspect input ~`E1` (group: push_out)
  - push-out (wants farther): K3@13.0Å(now 6.7,conf 0.99), A4@9.0Å(now 4.9,conf 0.99), E1@17.8Å(now 4.9,conf 0.55), F2@14.0Å(now 9.2,conf 0.55)
  - Y98↔E1: targets 4.5/17.8Å but partners are 4.5Å apart → too_close_together by 8.8Å
  - G10↔E1: targets 5.0/17.8Å but partners are 6.3Å apart → too_close_together by 6.5Å
  - E1↔L95: targets 17.8/6.9Å but partners are 6.0Å apart → too_close_together by 4.9Å
- **P77** — severity 14.93, 5 conflict(s); suspect input ~`A102` (group: push_out)
  - push-out (wants farther): F83@13.0Å(now 8.4,conf 0.99), A102@27.3Å(now 19.0,conf 0.92), G84@13.4Å(now 8.7,conf 0.79), A82@12.0Å(now 8.3,conf 0.72), K87@17.7Å(now 14.9,conf 0.55)
  - Y71↔A102: targets 11.0/27.3Å but partners are 10.7Å apart → too_close_together by 5.6Å
  - L72↔A102: targets 13.0/27.3Å but partners are 10.3Å apart → too_close_together by 4.0Å
  - M81↔A102: targets 11.0/27.3Å but partners are 13.1Å apart → too_close_together by 3.3Å

## Secondary Structure (DSSP-like)

- helix(H)=38 · strand(E)=36 · 3-10(G)=19 · coil(C)=10

```
EEEHHGHHHHEHHHHEEGHHCEGGEGGEEEEHEECGEHHHCEEGCECEHGEECGHGHEGHEGEECEGHHHGHECEGHHEHEGEGECHEHHHHEHHGHEHHHEC
```

## Backbone H-bond Network

- total=75 · helix(i→i+4)=10 · sheet=65
  - A4 ↔ K8  (helix)
  - G5 ↔ K9  (helix)
  - K8 ↔ T12  (helix)
  - G10 ↔ F14  (helix)
  - K15 ↔ L19  (helix)
  - M68 ↔ L72  (helix)
  - K87 ↔ D91  (helix)
  - K90 ↔ D94  (helix)
  - D91 ↔ L95  (helix)
  - T97 ↔ K101  (helix)
  - E1 ↔ A11  (sheet)
  - K3 ↔ A11  (sheet)
  - A11 ↔ T16  (sheet)
  - A11 ↔ R17  (sheet)
  - A11 ↔ H22  (sheet)
  - T16 ↔ H22  (sheet)
  - R17 ↔ H22  (sheet)
  - H22 ↔ G28  (sheet)
  - H22 ↔ P29  (sheet)
  - H22 ↔ H30  (sheet)
  - … +55 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=26 · exposed=42 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=429 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=197 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.0087 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=9 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 84 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
