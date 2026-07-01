# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set/general_benchmark/4INS/sequence/4INS.pdb`
- output_pdb: `general_benchmark/evidence_ladder/80pct_masked/4INS/seeds/seed_1/4INS.pdb`
- residues: 94
- mode: oracle
- ca_rmsd: 8.427 A
- tm_score_ca_ordered: 0.3025543619086721
- heavy_atom_rmsd: 9.692 A
- sidechain_heavy_atom_rmsd: 10.860 A
- **all-atom quality (honest):** heavy 9.692 A, sidechain 10.860 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 6/6
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/86 (0.0)
- lj_severe: 0
- lj_near: 34
- distogram_pairs: 836
- bin_accuracy: 0.427

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=global reason=rejected_domain_topology_regression tested=54
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 8.427209630912738
- ga_delta_rmsd: 0.08427632016612918  ga_fitness_mode: energy
- pre_local_rmsd: 8.43450686130664  localized_anchor_rmsd: 8.42721445425624

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** G41-K47 → 141 conflicts (48%); Y65-N68 → 63 conflicts (22%); S55-C57 → 22 conflicts (8%)
- explained: 226/292 conflicts by 3 root cause(s)
- metrics: hubs=63 (frac 0.67), conflicts/hub=4.6, max_incompat=13.36Å, chain_span=0.989
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): G41-K47 + Y65-N68 + S55-C57 — explain ~226/292 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **C19** — severity 52.27, 23 conflict(s); suspect input ~`G41` (group: pull_in)
  - pull-in (wants closer): V83@20.4Å(now 23.0,conf 0.59), G41@5.8Å(now 10.9,conf 0.55), Y65@15.8Å(now 18.5,conf 0.55)
  - push-out (wants farther): S55@24.7Å(now 19.3,conf 0.70), S58@25.5Å(now 21.3,conf 0.70), G26@17.9Å(now 13.7,conf 0.55)
  - S55↔G41: targets 24.7/5.8Å but partners are 11.0Å apart → too_close_together by 7.9Å
  - S55↔P93: targets 24.7/11.6Å but partners are 6.8Å apart → too_close_together by 6.2Å
  - S58↔G41: targets 25.5/5.8Å but partners are 13.9Å apart → too_close_together by 5.8Å
- **Y18** — severity 41.91, 17 conflict(s); suspect input ~`F43` (group: pull_in)
  - pull-in (wants closer): V83@19.8Å(now 22.3,conf 0.58), F43@5.9Å(now 14.8,conf 0.55), Y44@7.5Å(now 12.8,conf 0.55)
  - push-out (wants farther): S55@27.3Å(now 21.7,conf 0.93), S58@26.8Å(now 22.7,conf 0.81), T54@25.5Å(now 21.8,conf 0.70), N21@16.6Å(now 6.1,conf 0.55), S74@16.4Å(now 13.4,conf 0.55), C6@15.8Å(now 11.9,conf 0.55), I9@16.0Å(now 11.2,conf 0.55)
  - S55↔F43: targets 27.3/5.9Å but partners are 12.1Å apart → too_close_together by 9.3Å
  - S58↔F43: targets 26.8/5.9Å but partners are 13.5Å apart → too_close_together by 7.3Å
  - E50↔F43: targets 22.5/5.9Å but partners are 9.8Å apart → too_close_together by 6.8Å
- **L71** — severity 34.28, 13 conflict(s); suspect input ~`L76` (group: push_out)
  - push-out (wants farther): K47@26.8Å(now 15.2,conf 0.82), T45@21.3Å(now 15.3,conf 0.60), G85@17.3Å(now 13.9,conf 0.55), Y91@12.9Å(now 8.8,conf 0.55), L82@12.8Å(now 10.3,conf 0.55), C84@15.2Å(now 12.0,conf 0.55), N68@9.4Å(now 5.3,conf 0.55), S27@15.6Å(now 12.9,conf 0.55)
  - K47↔L76: targets 26.8/4.9Å but partners are 8.6Å apart → too_close_together by 13.4Å
  - K47↔V77: targets 26.8/8.5Å but partners are 8.9Å apart → too_close_together by 9.4Å
  - T45↔L76: targets 21.3/4.9Å but partners are 9.9Å apart → too_close_together by 6.5Å
- **C57** — severity 33.31, 12 conflict(s); suspect input ~`N68` (group: push_out)
  - pull-in (wants closer): V20@27.5Å(now 31.0,conf 1.00), T7@27.5Å(now 31.8,conf 1.00)
  - push-out (wants farther): K47@27.4Å(now 18.5,conf 0.97), P46@24.3Å(now 14.9,conf 0.72)
  - K47↔N68: targets 27.4/5.3Å but partners are 13.4Å apart → too_close_together by 8.7Å
  - K47↔L80: targets 27.4/12.0Å but partners are 6.9Å apart → too_close_together by 8.6Å
  - P46↔N68: targets 24.3/5.3Å but partners are 11.1Å apart → too_close_together by 8.0Å
- **R87** — severity 26.70, 12 conflict(s); suspect input ~`P46` (group: pull_in)
  - pull-in (wants closer): P46@7.3Å(now 12.2,conf 0.55)
  - push-out (wants farther): E50@22.8Å(now 19.4,conf 0.71), V49@20.4Å(now 17.8,conf 0.59), C52@20.1Å(now 17.3,conf 0.58), S74@19.1Å(now 9.2,conf 0.56), L24@18.3Å(now 15.4,conf 0.55), L76@16.7Å(now 9.1,conf 0.55)
  - S74↔P46: targets 19.1/7.3Å but partners are 3.5Å apart → too_close_together by 8.3Å
  - S74↔C84: targets 19.1/5.6Å but partners are 7.6Å apart → too_close_together by 5.8Å
  - V49↔P46: targets 20.4/7.3Å but partners are 7.8Å apart → too_close_together by 5.3Å
- **T45** — severity 26.48, 11 conflict(s); suspect input ~`F90` (group: pull_in)
  - pull-in (wants closer): T7@15.5Å(now 20.1,conf 0.55)
  - push-out (wants farther): V67@27.2Å(now 19.7,conf 0.89), T54@26.8Å(now 19.5,conf 0.81), H70@24.5Å(now 21.3,conf 0.71), Q51@22.5Å(now 12.3,conf 0.68), L71@21.3Å(now 15.3,conf 0.60), P93@17.4Å(now 12.5,conf 0.55), Y34@13.8Å(now 10.1,conf 0.55)
  - V67↔C84: targets 27.2/10.5Å but partners are 10.3Å apart → too_close_together by 6.4Å
  - V67↔Y65: targets 27.2/12.4Å but partners are 8.5Å apart → too_close_together by 6.3Å
  - L71↔Y65: targets 21.3/12.4Å but partners are 3.1Å apart → too_close_together by 5.8Å

## Secondary Structure (DSSP-like)

- helix(H)=59 · strand(E)=18 · 3-10(G)=12 · coil(C)=5

```
CHHHHHHEHEHHHHHEHEHHEEGHGEHGHGHGHHGCCGHGHHHHHHHEHGHEEHHHHHHHGGEHHHHHEHHHEHHHHHGHEHHHEHHHHCECEE
```

## Backbone H-bond Network

- total=63 · helix(i→i+4)=36 · sheet=27
  - V2 ↔ C6  (helix)
  - E3 ↔ T7  (helix)
  - C5 ↔ I9  (helix)
  - T7 ↔ S11  (helix)
  - I9 ↔ Y13  (helix)
  - S11 ↔ L15  (helix)
  - Y13 ↔ N17  (helix)
  - L15 ↔ C19  (helix)
  - V20 ↔ L24  (helix)
  - S27 ↔ E31  (helix)
  - L29 ↔ L33  (helix)
  - E39 ↔ F43  (helix)
  - G41 ↔ T45  (helix)
  - F42 ↔ P46  (helix)
  - F43 ↔ K47  (helix)
  - T45 ↔ V49  (helix)
  - K47 ↔ Q51  (helix)
  - Q51 ↔ S55  (helix)
  - T54 ↔ S58  (helix)
  - S55 ↔ L59  (helix)
  - … +43 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=27 · exposed=38 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=523 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=294 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.4084 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=34 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=6: C5–C10, C6–C25, C19–C37, C52–C57, C53–C72, C66–C84

## Side-chain Rotamers (χ1/χ2)

- 86 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
