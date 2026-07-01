# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1CSP\sequence\1CSP.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1CSP\seeds\seed_1\1CSP.pdb`
- residues: 65
- mode: oracle
- ca_rmsd: 3.382 A
- tm_score_ca_ordered: 0.6191906300161172
- heavy_atom_rmsd: 4.514 A
- sidechain_heavy_atom_rmsd: 5.390 A
- **all-atom quality (honest):** heavy 4.514 A, sidechain 5.390 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/52 (0.0)
- lj_severe: 0
- lj_near: 21
- distogram_pairs: 635
- bin_accuracy: 0.622

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=rejected_lj_regression tested=39
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 3.3820881557825726
- ga_delta_rmsd: 3.217429098847635  ga_fitness_mode: energy
- pre_local_rmsd: 3.3925802146236164  localized_anchor_rmsd: 3.382124890751812

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** G36-T39 → 20 conflicts (50%); I32 → 7 conflicts (18%); E65 → 7 conflicts (18%)
- explained: 34/40 conflicts by 3 root cause(s)
- metrics: hubs=19 (frac 0.292), conflicts/hub=2.1, max_incompat=6.3Å, chain_span=0.877
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): G36-T39 + I32 + E65 — explain ~34/40 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **A45** — severity 12.21, 5 conflict(s); suspect input ~`E65` (group: push_out)
  - pull-in (wants closer): E65@5.4Å(now 12.3,conf 0.56), K64@6.5Å(now 10.5,conf 0.55)
  - push-out (wants farther): T39@13.0Å(now 8.9,conf 0.99)
  - K38↔E65: targets 15.0/5.4Å but partners are 3.6Å apart → too_close_together by 6.0Å
  - E65↔E20: targets 5.4/12.8Å but partners are 23.3Å apart → too_far_apart by 5.1Å
  - K38↔K64: targets 15.0/6.5Å but partners are 4.1Å apart → too_close_together by 4.4Å
- **L1** — severity 10.51, 4 conflict(s); suspect input ~`G36` (group: pull_in)
  - pull-in (wants closer): E65@10.8Å(now 15.7,conf 0.82)
  - push-out (wants farther): F8@19.0Å(now 16.3,conf 1.00), G36@22.8Å(now 17.3,conf 0.71), H28@16.5Å(now 12.4,conf 0.55)
  - E65↔G36: targets 10.8/22.8Å but partners are 6.3Å apart → too_close_together by 5.7Å
  - F48↔G36: targets 5.0/22.8Å but partners are 14.4Å apart → too_close_together by 3.3Å
  - G36↔T63: targets 22.8/10.6Å but partners are 7.8Å apart → too_close_together by 4.3Å
- **G36** — severity 8.27, 2 conflict(s); suspect input ~`L1` (group: push_out)
  - push-out (wants farther): L1@22.8Å(now 17.3,conf 0.71)
  - Q33↔L1: targets 9.0/22.8Å but partners are 7.5Å apart → too_close_together by 6.3Å
  - I32↔L1: targets 10.6/22.8Å but partners are 6.8Å apart → too_close_together by 5.4Å
- **V46** — severity 7.87, 5 conflict(s); suspect input ~`E65` (group: pull_in)
  - pull-in (wants closer): E65@4.7Å(now 10.1,conf 0.59)
  - push-out (wants farther): E41@10.9Å(now 7.9,conf 0.91), T39@11.4Å(now 7.4,conf 0.79), L40@9.4Å(now 5.7,conf 0.79)
  - E65↔K4: targets 4.7/6.0Å but partners are 14.4Å apart → too_far_apart by 3.8Å
  - E65↔E18: targets 4.7/9.7Å but partners are 17.7Å apart → too_far_apart by 3.3Å
  - T39↔E65: targets 11.4/4.7Å but partners are 3.8Å apart → too_close_together by 2.9Å
- **Q44** — severity 4.64, 2 conflict(s); suspect input ~`E65` (group: pull_in)
  - pull-in (wants closer): E65@7.8Å(now 11.9,conf 0.55)
  - push-out (wants farther): E41@6.6Å(now 2.9,conf 0.79), T39@10.8Å(now 8.1,conf 0.55)
  - F37↔E65: targets 17.0/7.8Å but partners are 4.1Å apart → too_close_together by 5.0Å
  - K38↔E65: targets 15.0/7.8Å but partners are 3.6Å apart → too_close_together by 3.5Å
- **T39** — severity 4.30, 4 conflict(s); suspect input ~`G34` (group: pull_in)
  - pull-in (wants closer): E11@8.8Å(now 12.2,conf 0.55)
  - push-out (wants farther): A45@13.0Å(now 8.9,conf 0.99), V46@11.4Å(now 7.4,conf 0.79), Q44@10.8Å(now 8.1,conf 0.55)
  - E11↔G34: targets 8.8/10.2Å but partners are 21.1Å apart → too_far_apart by 2.1Å
  - E11↔E35: targets 8.8/10.8Å but partners are 21.7Å apart → too_far_apart by 2.1Å
  - E11↔Q33: targets 8.8/9.9Å but partners are 20.7Å apart → too_far_apart by 2.0Å

## Secondary Structure (DSSP-like)

- helix(H)=12 · strand(E)=38 · 3-10(G)=9 · coil(C)=6

```
EEEGGHEHHEHCEECEEEEEHEEEGHEEGHEECEEECGEGEGHHCEEEEHCEEGEEGEEEEHEHE
```

## Backbone H-bond Network

- total=111 · helix(i→i+4)=1 · sheet=110
  - F26 ↔ S30  (helix)
  - L1 ↔ I17  (sheet)
  - L1 ↔ E18  (sheet)
  - L1 ↔ V19  (sheet)
  - E2 ↔ F16  (sheet)
  - E2 ↔ I17  (sheet)
  - E2 ↔ E18  (sheet)
  - E2 ↔ V19  (sheet)
  - E2 ↔ E20  (sheet)
  - E2 ↔ Q22  (sheet)
  - G3 ↔ F16  (sheet)
  - G3 ↔ I17  (sheet)
  - G3 ↔ E18  (sheet)
  - G3 ↔ V19  (sheet)
  - G3 ↔ E20  (sheet)
  - G3 ↔ Q22  (sheet)
  - G3 ↔ D23  (sheet)
  - W7 ↔ G13  (sheet)
  - W7 ↔ F14  (sheet)
  - W7 ↔ F16  (sheet)
  - … +91 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=30 · exposed=16 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=279 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=187 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.0981 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=21 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 52 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
