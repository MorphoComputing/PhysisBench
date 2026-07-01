# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\4INS\sequence\4INS.pdb`
- output_pdb: `general_benchmark\evidence_ladder\50pct_masked\4INS\seeds\seed_1\4INS.pdb`
- residues: 94
- mode: oracle
- ca_rmsd: 8.697 A
- tm_score_ca_ordered: 0.2826713757921733
- heavy_atom_rmsd: 9.885 A
- sidechain_heavy_atom_rmsd: 10.846 A
- **all-atom quality (honest):** heavy 9.885 A, sidechain 10.846 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 6/6
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/86 (0.0)
- lj_severe: 0
- lj_near: 26
- distogram_pairs: 2092
- bin_accuracy: 0.439

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=48
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 8.69725024518773
- ga_delta_rmsd: -1.9207137888341288  ga_fitness_mode: energy
- pre_local_rmsd: 8.707532497636112  localized_anchor_rmsd: 8.697281949528296

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** F43-K47 → 1100 conflicts (71%)
- explained: 1100/1547 conflicts by 1 root cause(s)
- metrics: hubs=86 (frac 0.915), conflicts/hub=18.0, max_incompat=13.84Å, chain_span=0.989
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): F43-K47 — explain ~1100/1547 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **C52** — severity 190.65, 69 conflict(s); suspect input ~`L76` (group: push_out)
  - pull-in (wants closer): S8@27.5Å(now 33.3,conf 1.00), V20@27.5Å(now 30.4,conf 1.00), N21@27.5Å(now 30.3,conf 1.00), T7@27.5Å(now 31.9,conf 1.00), I9@27.5Å(now 32.4,conf 1.00), Y13@27.5Å(now 30.1,conf 1.00), F90@14.6Å(now 17.3,conf 0.55), Y91@12.2Å(now 15.2,conf 0.55)
  - push-out (wants farther): K47@27.3Å(now 14.0,conf 0.92), P46@23.2Å(now 11.9,conf 0.76), Y44@18.8Å(now 14.0,conf 0.56), F43@18.2Å(now 11.8,conf 0.55)
  - K47↔L80: targets 27.3/11.0Å but partners are 3.8Å apart → too_close_together by 12.4Å
  - K47↔L71: targets 27.3/5.5Å but partners are 10.4Å apart → too_close_together by 11.3Å
  - K47↔H75: targets 27.3/10.5Å but partners are 5.2Å apart → too_close_together by 11.6Å
- **I1** — severity 145.94, 50 conflict(s); suspect input ~`T45` (group: pull_in)
  - pull-in (wants closer): S55@27.5Å(now 30.5,conf 1.00), I56@27.5Å(now 30.9,conf 1.00), E39@20.0Å(now 22.6,conf 0.58), P46@7.6Å(now 17.9,conf 0.55), Y44@9.0Å(now 14.6,conf 0.55), G41@16.2Å(now 20.4,conf 0.55), T45@8.0Å(now 18.4,conf 0.55)
  - push-out (wants farther): L71@26.0Å(now 23.3,conf 0.72), H75@21.4Å(now 17.1,conf 0.61), L76@20.8Å(now 18.2,conf 0.59), A79@20.1Å(now 17.2,conf 0.58), S74@19.5Å(now 16.1,conf 0.57), E78@17.8Å(now 13.9,conf 0.55), H23@11.3Å(now 3.7,conf 0.55), C25@10.6Å(now 7.7,conf 0.55), V20@16.3Å(now 13.5,conf 0.55), Q22@12.1Å(now 6.8,conf 0.55)
  - G73↔T45: targets 21.9/8.0Å but partners are 3.7Å apart → too_close_together by 10.2Å
  - H75↔P46: targets 21.4/7.6Å but partners are 4.0Å apart → too_close_together by 9.8Å
  - L71↔P46: targets 26.0/7.6Å but partners are 9.3Å apart → too_close_together by 9.1Å
- **E3** — severity 145.28, 53 conflict(s); suspect input ~`T45` (group: push_out)
  - pull-in (wants closer): S55@27.5Å(now 31.3,conf 1.00), T54@27.5Å(now 31.1,conf 1.00), G41@20.0Å(now 23.6,conf 0.58), F42@16.6Å(now 19.9,conf 0.55), K47@7.5Å(now 17.9,conf 0.55), Y44@11.4Å(now 17.2,conf 0.55), T45@9.9Å(now 21.0,conf 0.55)
  - push-out (wants farther): L76@22.0Å(now 19.1,conf 0.63), I9@9.3Å(now 6.2,conf 0.55), H23@10.3Å(now 7.0,conf 0.55), C25@8.1Å(now 5.1,conf 0.55)
  - C72↔T45: targets 26.9/9.9Å but partners are 6.0Å apart → too_close_together by 11.1Å
  - T7↔K47: targets 5.8/7.5Å but partners are 22.9Å apart → too_far_apart by 9.5Å
  - T7↔T45: targets 5.8/9.9Å but partners are 25.0Å apart → too_far_apart by 9.3Å
- **I56** — severity 135.59, 48 conflict(s); suspect input ~`C52` (group: push_out)
  - pull-in (wants closer): Q22@27.5Å(now 31.4,conf 1.00), C5@27.5Å(now 31.6,conf 1.00), I1@27.5Å(now 30.9,conf 1.00), F90@18.9Å(now 22.2,conf 0.56), K94@18.0Å(now 21.5,conf 0.55), P93@15.5Å(now 19.3,conf 0.55)
  - push-out (wants farther): K47@27.5Å(now 18.1,conf 1.00), P46@27.4Å(now 16.9,conf 0.95), Y44@22.7Å(now 18.4,conf 0.70), F43@22.4Å(now 16.6,conf 0.67), S27@21.9Å(now 19.3,conf 0.63), N64@14.5Å(now 11.5,conf 0.55)
  - P46↔C52: targets 27.4/4.7Å but partners are 11.9Å apart → too_close_together by 10.8Å
  - P46↔H75: targets 27.4/13.1Å but partners are 4.0Å apart → too_close_together by 10.3Å
  - P46↔H70: targets 27.4/4.9Å but partners are 12.9Å apart → too_close_together by 9.6Å
- **C57** — severity 126.03, 39 conflict(s); suspect input ~`C52` (group: push_out)
  - pull-in (wants closer): V20@27.5Å(now 34.1,conf 1.00), N21@27.5Å(now 33.5,conf 1.00), I9@27.5Å(now 34.4,conf 1.00), T7@27.5Å(now 33.1,conf 1.00), Y13@27.5Å(now 33.5,conf 1.00), Q22@27.5Å(now 30.9,conf 1.00), Q4@27.5Å(now 31.9,conf 1.00), Q14@27.5Å(now 31.9,conf 1.00), L12@27.5Å(now 31.7,conf 1.00), C6@27.5Å(now 30.5,conf 1.00), N17@27.5Å(now 30.0,conf 1.00), E16@27.5Å(now 30.0,conf 0.99), E86@21.4Å(now 24.6,conf 0.60), G88@19.2Å(now 22.2,conf 0.56), G85@18.4Å(now 21.2,conf 0.55), F89@16.6Å(now 19.1,conf 0.55), V83@12.9Å(now 15.5,conf 0.55), P93@15.2Å(now 18.0,conf 0.55), T92@16.1Å(now 18.9,conf 0.55)
  - push-out (wants farther): K47@27.4Å(now 15.6,conf 0.97), P46@24.3Å(now 15.4,conf 0.72), N64@11.2Å(now 8.1,conf 0.55)
  - K47↔L80: targets 27.4/12.0Å but partners are 3.8Å apart → too_close_together by 11.7Å
  - K47↔Q61: targets 27.4/6.2Å but partners are 11.7Å apart → too_close_together by 9.6Å
  - K47↔A79: targets 27.4/11.2Å but partners are 6.7Å apart → too_close_together by 9.6Å
- **T54** — severity 117.91, 40 conflict(s); suspect input ~`C72` (group: push_out)
  - pull-in (wants closer): S8@27.5Å(now 35.2,conf 1.00), T7@27.5Å(now 34.0,conf 1.00), N21@27.5Å(now 31.6,conf 1.00), V20@27.5Å(now 30.5,conf 1.00), E3@27.5Å(now 31.1,conf 1.00), C6@27.5Å(now 31.0,conf 1.00), S11@27.5Å(now 32.5,conf 1.00), Y13@27.5Å(now 30.6,conf 1.00), Y91@15.7Å(now 18.2,conf 0.55), P93@12.1Å(now 15.9,conf 0.55)
  - push-out (wants farther): P46@27.5Å(now 14.6,conf 0.99), G26@27.0Å(now 23.2,conf 0.85), T45@26.8Å(now 12.8,conf 0.81), H28@24.0Å(now 21.1,conf 0.74), Y44@22.8Å(now 16.4,conf 0.71), F43@21.8Å(now 13.2,conf 0.62), E31@20.4Å(now 16.9,conf 0.59), L35@20.1Å(now 16.8,conf 0.58), R40@18.5Å(now 15.8,conf 0.55), E39@15.6Å(now 12.7,conf 0.55)
  - T45↔C72: targets 26.8/8.1Å but partners are 6.0Å apart → too_close_together by 12.8Å
  - T45↔G73: targets 26.8/11.0Å but partners are 3.7Å apart → too_close_together by 12.1Å
  - P46↔C72: targets 27.5/8.1Å but partners are 7.7Å apart → too_close_together by 11.7Å

## Secondary Structure (DSSP-like)

- helix(H)=50 · strand(E)=26 · 3-10(G)=12 · coil(C)=6

```
CHHHHEHEEGHHHHHHGHHHEHCCEEHGHHHHHHHHEEHHEHHHHEHEGHEGHHEECEEHHGHGHHHEEEGHEHHHEHHHGHGEEHHECCEGGE
```

## Backbone H-bond Network

- total=68 · helix(i→i+4)=23 · sheet=45
  - E3 ↔ T7  (helix)
  - T7 ↔ S11  (helix)
  - L12 ↔ E16  (helix)
  - Q14 ↔ Y18  (helix)
  - E16 ↔ V20  (helix)
  - Y18 ↔ Q22  (helix)
  - S27 ↔ E31  (helix)
  - L29 ↔ L33  (helix)
  - V30 ↔ Y34  (helix)
  - A32 ↔ V36  (helix)
  - V36 ↔ R40  (helix)
  - E39 ↔ F43  (helix)
  - R40 ↔ Y44  (helix)
  - F43 ↔ K47  (helix)
  - E50 ↔ T54  (helix)
  - Q61 ↔ Y65  (helix)
  - E63 ↔ V67  (helix)
  - C72 ↔ L76  (helix)
  - S74 ↔ E78  (helix)
  - H75 ↔ A79  (helix)
  - … +48 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=27 · exposed=41 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=503 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=270 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.2085 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=26 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=6: C5–C10, C6–C25, C19–C37, C52–C57, C53–C72, C66–C84

## Side-chain Rotamers (χ1/χ2)

- 86 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
