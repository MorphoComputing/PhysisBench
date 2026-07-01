# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\4INS\sequence\4INS.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\4INS\seeds\seed_5\4INS.pdb`
- residues: 94
- mode: oracle
- ca_rmsd: 8.484 A
- tm_score_ca_ordered: 0.29299388851670494
- heavy_atom_rmsd: 9.918 A
- sidechain_heavy_atom_rmsd: 11.147 A
- **all-atom quality (honest):** heavy 9.918 A, sidechain 11.147 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 6/6
- ramachandran_forbidden_fraction: 0.011
- rotamer_outliers: 0/86 (0.0)
- lj_severe: 0
- lj_near: 38
- distogram_pairs: 1197
- bin_accuracy: 0.358

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=48
- rigid_domain_reconvergence: applied=False accepted=1 rmsd=6.42080637054544 -> 6.063952489947193 A
- topology_reconvergence: applied=False accepted=0/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 8.483576367862922
- ga_delta_rmsd: -2.116667110145828  ga_fitness_mode: energy
- pre_local_rmsd: 8.489166733542485  localized_anchor_rmsd: 8.483555383504086

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** F43-E50 → 345 conflicts (39%); Q14-V20 → 217 conflicts (24%); N64-V67 → 109 conflicts (12%)
- explained: 671/890 conflicts by 3 root cause(s)
- metrics: hubs=88 (frac 0.936), conflicts/hub=10.1, max_incompat=12.11Å, chain_span=0.989
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): F43-E50 + Q14-V20 + N64-V67 — explain ~671/890 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **V67** — severity 116.91, 42 conflict(s); suspect input ~`Q61` (group: push_out)
  - push-out (wants farther): C19@27.5Å(now 23.9,conf 1.00), R40@27.5Å(now 21.1,conf 0.99), C25@27.4Å(now 20.9,conf 0.94), L35@27.3Å(now 21.2,conf 0.92), T45@27.2Å(now 18.9,conf 0.89), G38@27.1Å(now 21.8,conf 0.86), F42@26.6Å(now 19.2,conf 0.78), H28@23.7Å(now 20.0,conf 0.75), E50@17.7Å(now 5.7,conf 0.55), Q51@14.5Å(now 10.6,conf 0.55)
  - F42↔Q61: targets 26.6/7.5Å but partners are 11.5Å apart → too_close_together by 7.5Å
  - Y60↔E50: targets 5.0/17.7Å but partners are 3.3Å apart → too_close_together by 9.4Å
  - T45↔Q61: targets 27.2/7.5Å but partners are 12.3Å apart → too_close_together by 7.3Å
- **L71** — severity 111.90, 41 conflict(s); suspect input ~`L76` (group: push_out)
  - push-out (wants farther): V20@27.5Å(now 23.6,conf 1.00), Q4@27.5Å(now 22.8,conf 0.99), Y13@27.4Å(now 24.4,conf 0.95), Q14@27.4Å(now 23.5,conf 0.93), K47@26.8Å(now 15.5,conf 0.82), N64@15.0Å(now 6.9,conf 0.67), Y65@13.0Å(now 8.7,conf 0.67), T45@21.3Å(now 14.8,conf 0.60)
  - K47↔C66: targets 26.8/11.4Å but partners are 5.3Å apart → too_close_together by 10.1Å
  - H75↔K47: targets 6.8/26.8Å but partners are 10.5Å apart → too_close_together by 9.5Å
  - K47↔A79: targets 26.8/7.8Å but partners are 6.9Å apart → too_close_together by 12.1Å
- **K47** — severity 102.06, 32 conflict(s); suspect input ~`E50` (group: pull_in)
  - pull-in (wants closer): F43@8.9Å(now 11.5,conf 0.84), R40@14.5Å(now 20.8,conf 0.69), C6@12.3Å(now 14.9,conf 0.55)
  - push-out (wants farther): S55@27.5Å(now 20.6,conf 1.00), I56@27.5Å(now 20.8,conf 1.00), H70@27.5Å(now 17.2,conf 1.00), C57@27.4Å(now 19.1,conf 0.97), L71@26.8Å(now 15.5,conf 0.82), L62@20.5Å(now 11.2,conf 0.59), N64@19.6Å(now 11.0,conf 0.57), E16@18.4Å(now 15.4,conf 0.55)
  - F43↔L71: targets 8.9/26.8Å but partners are 9.2Å apart → too_close_together by 8.7Å
  - C57↔E50: targets 27.4/13.1Å but partners are 6.7Å apart → too_close_together by 7.6Å
  - H70↔E50: targets 27.5/13.1Å but partners are 7.6Å apart → too_close_together by 6.8Å
- **C19** — severity 88.66, 41 conflict(s); suspect input ~`E16` (group: pull_in)
  - pull-in (wants closer): Y13@7.1Å(now 9.9,conf 0.94), E50@20.1Å(now 22.7,conf 0.58), G41@5.8Å(now 9.6,conf 0.55), E16@5.2Å(now 12.2,conf 0.52)
  - push-out (wants farther): V67@27.5Å(now 23.9,conf 1.00), H23@12.6Å(now 4.0,conf 0.79), Q69@26.4Å(now 21.8,conf 0.76), S55@24.7Å(now 20.8,conf 0.70), S58@25.5Å(now 19.4,conf 0.70), G26@17.9Å(now 10.5,conf 0.55), L24@16.9Å(now 9.3,conf 0.55), S27@16.7Å(now 12.4,conf 0.55), E78@16.6Å(now 10.8,conf 0.55)
  - S58↔G41: targets 25.5/5.8Å but partners are 11.0Å apart → too_close_together by 8.8Å
  - S55↔G41: targets 24.7/5.8Å but partners are 11.9Å apart → too_close_together by 7.0Å
  - Q69↔G41: targets 26.4/5.8Å but partners are 13.7Å apart → too_close_together by 6.9Å
- **H70** — severity 82.34, 29 conflict(s); suspect input ~`H75` (group: push_out)
  - push-out (wants farther): K47@27.5Å(now 17.2,conf 1.00), L24@27.0Å(now 22.8,conf 0.84), T45@24.5Å(now 17.9,conf 0.71), L29@22.1Å(now 18.4,conf 0.64), S27@19.1Å(now 15.8,conf 0.56), G38@18.6Å(now 14.1,conf 0.55), E31@18.0Å(now 14.0,conf 0.55), Y34@17.7Å(now 10.7,conf 0.55), N64@16.5Å(now 7.1,conf 0.55), E63@15.5Å(now 12.3,conf 0.55), L62@11.9Å(now 8.5,conf 0.55), Y60@13.9Å(now 10.5,conf 0.55)
  - K47↔C66: targets 27.5/12.2Å but partners are 5.3Å apart → too_close_together by 9.9Å
  - L76↔K47: targets 9.0/27.5Å but partners are 11.8Å apart → too_close_together by 6.7Å
  - K47↔V77: targets 27.5/11.1Å but partners are 9.2Å apart → too_close_together by 7.2Å
- **C72** — severity 75.03, 27 conflict(s); suspect input ~`P46` (group: pull_in)
  - pull-in (wants closer): H75@5.4Å(now 8.6,conf 0.79)
  - push-out (wants farther): E3@26.9Å(now 24.3,conf 0.83), V2@22.8Å(now 19.4,conf 0.71), P46@22.7Å(now 14.8,conf 0.70), N64@16.6Å(now 10.0,conf 0.55), Y65@15.0Å(now 12.0,conf 0.55), R40@15.5Å(now 8.3,conf 0.55), G41@13.6Å(now 5.9,conf 0.55), T54@8.1Å(now 4.8,conf 0.55)
  - H75↔P46: targets 5.4/22.7Å but partners are 7.1Å apart → too_close_together by 10.1Å
  - V77↔P46: targets 8.9/22.7Å but partners are 5.0Å apart → too_close_together by 8.9Å
  - P46↔L76: targets 22.7/5.6Å but partners are 8.5Å apart → too_close_together by 8.6Å

## Secondary Structure (DSSP-like)

- helix(H)=60 · strand(E)=20 · 3-10(G)=10 · coil(C)=4

```
CHHHHHHHGEGHHHHHHEHGHHEEHHHHHHHHGHEHCEHGEHHEHEHHHHEEEHGHHHHHHHHHHHGHEGHHHHHHHHHGHEHEEHGECCEEHE
```

## Backbone H-bond Network

- total=51 · helix(i→i+4)=30 · sheet=21
  - V2 ↔ C6  (helix)
  - E3 ↔ T7  (helix)
  - Q4 ↔ S8  (helix)
  - S8 ↔ L12  (helix)
  - L12 ↔ E16  (helix)
  - Y13 ↔ N17  (helix)
  - L15 ↔ C19  (helix)
  - N17 ↔ N21  (helix)
  - N21 ↔ C25  (helix)
  - Q22 ↔ G26  (helix)
  - C25 ↔ L29  (helix)
  - S27 ↔ E31  (helix)
  - H28 ↔ A32  (helix)
  - A32 ↔ V36  (helix)
  - E39 ↔ F43  (helix)
  - F43 ↔ K47  (helix)
  - T45 ↔ V49  (helix)
  - E50 ↔ T54  (helix)
  - I56 ↔ Y60  (helix)
  - C57 ↔ Q61  (helix)
  - … +31 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=24 · exposed=41 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=596 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=386 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=4.357 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=38 (steric clashes)
- ramachandran_forbidden_fraction=0.0106

## Disulfide Bonds Formed

- count=6: C5–C10, C6–C25, C19–C37, C52–C57, C53–C72, C66–C84

## Side-chain Rotamers (χ1/χ2)

- 86 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
