# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set/general_benchmark/1TIT/sequence/1TIT.pdb`
- output_pdb: `general_benchmark/evidence_ladder/80pct_masked/1TIT/seeds/seed_0/1TIT.pdb`
- residues: 87
- mode: oracle
- ca_rmsd: 5.873 A
- tm_score_ca_ordered: 0.46744099403028094
- heavy_atom_rmsd: 7.270 A
- sidechain_heavy_atom_rmsd: 8.474 A
- **all-atom quality (honest):** heavy 7.270 A, sidechain 8.474 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/73 (0.0)
- lj_severe: 0
- lj_near: 26
- distogram_pairs: 714
- bin_accuracy: 0.487

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=45
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 5.873062917576421
- ga_delta_rmsd: 0.474522025137909  ga_fitness_mode: energy
- pre_local_rmsd: 5.880591728978836  localized_anchor_rmsd: 5.873092958675422

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** W33-Q38 → 93 conflicts (50%); I1-E4 → 36 conflicts (19%); I56 → 10 conflicts (5%)
- explained: 139/188 conflicts by 3 root cause(s)
- metrics: hubs=54 (frac 0.621), conflicts/hub=3.5, max_incompat=8.99Å, chain_span=0.977
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): W33-Q38 + I1-E4 + I56 — explain ~139/188 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **S71** — severity 22.07, 15 conflict(s); suspect input ~`K36` (group: push_out)
  - pull-in (wants closer): K34@5.9Å(now 9.8,conf 0.55), G37@6.9Å(now 11.5,conf 0.55), K36@7.2Å(now 12.3,conf 0.55)
  - push-out (wants farther): I58@14.0Å(now 9.9,conf 0.55)
  - F13↔K36: targets 20.4/7.2Å but partners are 8.1Å apart → too_close_together by 5.1Å
  - E16↔K36: targets 20.0/7.2Å but partners are 7.8Å apart → too_close_together by 5.0Å
  - G37↔C62: targets 6.9/16.0Å but partners are 6.1Å apart → too_close_together by 2.9Å
- **T17** — severity 19.19, 12 conflict(s); suspect input ~`L57` (group: pull_in)
  - pull-in (wants closer): K54@19.2Å(now 22.1,conf 0.56), I56@12.6Å(now 16.3,conf 0.55)
  - push-out (wants farther): I1@27.5Å(now 24.0,conf 0.99), Q38@18.9Å(now 9.9,conf 0.56), P39@18.8Å(now 15.1,conf 0.56), V12@6.7Å(now 3.8,conf 0.55), E11@9.1Å(now 4.7,conf 0.55), F13@8.5Å(now 5.8,conf 0.55), K34@15.9Å(now 12.3,conf 0.55)
  - Q38↔L57: targets 18.9/9.8Å but partners are 4.1Å apart → too_close_together by 5.0Å
  - P39↔L57: targets 18.8/9.8Å but partners are 4.1Å apart → too_close_together by 4.9Å
  - I1↔F20: targets 27.5/10.2Å but partners are 13.8Å apart → too_close_together by 3.5Å
- **K5** — severity 18.04, 9 conflict(s); suspect input ~`Y8` (group: push_out)
  - push-out (wants farther): G15@26.8Å(now 23.0,conf 0.81), V14@26.6Å(now 23.8,conf 0.77), S43@25.9Å(now 19.7,conf 0.71), K34@17.4Å(now 10.7,conf 0.55), D28@17.4Å(now 13.7,conf 0.55), G31@14.8Å(now 8.7,conf 0.55)
  - S43↔I22: targets 25.9/5.1Å but partners are 15.4Å apart → too_close_together by 5.4Å
  - I22↔K34: targets 5.1/17.4Å but partners are 6.9Å apart → too_close_together by 5.5Å
  - I22↔G31: targets 5.1/14.8Å but partners are 5.7Å apart → too_close_together by 4.0Å
- **G37** — severity 17.05, 10 conflict(s); suspect input ~`W33` (group: pull_in)
  - pull-in (wants closer): S71@6.9Å(now 11.5,conf 0.55), A75@16.7Å(now 20.6,conf 0.55), A77@15.3Å(now 18.4,conf 0.55)
  - push-out (wants farther): P27@23.7Å(now 20.9,conf 0.75), E26@23.8Å(now 20.8,conf 0.75), D51@22.6Å(now 16.5,conf 0.68), K54@21.0Å(now 15.9,conf 0.60), E2@19.6Å(now 13.0,conf 0.57), V12@19.0Å(now 8.1,conf 0.56), E11@18.0Å(now 8.0,conf 0.55), E21@17.3Å(now 9.1,conf 0.55), D45@17.2Å(now 8.8,conf 0.55), I22@17.2Å(now 12.1,conf 0.55), L57@15.4Å(now 5.7,conf 0.55), T41@12.6Å(now 9.3,conf 0.55)
  - E21↔W33: targets 17.3/8.5Å but partners are 3.8Å apart → too_close_together by 5.0Å
  - E2↔S71: targets 19.6/6.9Å but partners are 7.7Å apart → too_close_together by 5.0Å
  - D51↔S71: targets 22.6/6.9Å but partners are 11.7Å apart → too_close_together by 4.0Å
- **M66** — severity 15.54, 10 conflict(s); suspect input ~`L35` (group: pull_in)
  - pull-in (wants closer): L35@6.3Å(now 10.5,conf 0.55)
  - push-out (wants farther): D28@27.5Å(now 24.7,conf 0.99), I1@27.4Å(now 23.1,conf 0.97), K53@27.0Å(now 22.2,conf 0.84), L57@13.9Å(now 10.4,conf 0.55)
  - I1↔L35: targets 27.4/6.3Å but partners are 16.1Å apart → too_close_together by 5.1Å
  - D28↔P39: targets 27.5/12.2Å but partners are 10.8Å apart → too_close_together by 4.5Å
  - I1↔W33: targets 27.4/12.3Å but partners are 12.5Å apart → too_close_together by 2.7Å
- **E50** — severity 14.98, 6 conflict(s); suspect input ~`P39` (group: pull_in)
  - pull-in (wants closer): E21@9.7Å(now 13.0,conf 0.55)
  - push-out (wants farther): E2@16.7Å(now 11.7,conf 0.55), P39@16.3Å(now 5.3,conf 0.55)
  - H55↔P39: targets 4.5/16.3Å but partners are 4.6Å apart → too_close_together by 7.2Å
  - I56↔P39: targets 5.5/16.3Å but partners are 4.1Å apart → too_close_together by 6.7Å
  - H55↔E2: targets 4.5/16.7Å but partners are 7.4Å apart → too_close_together by 4.8Å

## Secondary Structure (DSSP-like)

- helix(H)=35 · strand(E)=29 · 3-10(G)=15 · coil(C)=8

```
CEHHHGGGGHHHHHHEEEGCEEEHHEGHHHHEGHEHEEHCHHEHEHHEGEGHHHEHHHHEGHGHGHEECCEHHCGCEGGCEEEEEEE
```

## Backbone H-bond Network

- total=68 · helix(i→i+4)=9 · sheet=59
  - E11 ↔ G15  (helix)
  - L24 ↔ D28  (helix)
  - S25 ↔ V29  (helix)
  - H30 ↔ K34  (helix)
  - A42 ↔ C46  (helix)
  - G52 ↔ I56  (helix)
  - K53 ↔ L57  (helix)
  - I58 ↔ C62  (helix)
  - C62 ↔ M66  (helix)
  - E2 ↔ E21  (sheet)
  - E2 ↔ I22  (sheet)
  - E16 ↔ L35  (sheet)
  - T17 ↔ L35  (sheet)
  - T17 ↔ G37  (sheet)
  - A18 ↔ L35  (sheet)
  - A18 ↔ G37  (sheet)
  - A18 ↔ Q38  (sheet)
  - E21 ↔ Q32  (sheet)
  - E21 ↔ L35  (sheet)
  - E21 ↔ G37  (sheet)
  - … +48 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=30 · exposed=29 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=491 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=343 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.1832 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=26 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 73 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
