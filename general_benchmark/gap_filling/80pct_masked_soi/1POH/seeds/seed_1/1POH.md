# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1POH\sequence\1POH.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1POH\seeds\seed_1\1POH.pdb`
- residues: 83
- mode: oracle
- ca_rmsd: 8.075 A
- tm_score_ca_ordered: 0.29325053162783443
- heavy_atom_rmsd: 9.135 A
- sidechain_heavy_atom_rmsd: 10.195 A
- **all-atom quality (honest):** heavy 9.135 A, sidechain 10.195 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/68 (0.0)
- lj_severe: 0
- lj_near: 34
- distogram_pairs: 957
- bin_accuracy: 0.476

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=global reason=rejected_local_chirality_regression tested=42
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=536 mode=rotamer
- phase_b_ca_rmsd_after: 8.075296718791163
- ga_delta_rmsd: 1.5162767911964448  ga_fitness_mode: energy
- pre_local_rmsd: 8.090805552686016  localized_anchor_rmsd: 8.075287484752177

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** E74-L83 → 285 conflicts (68%); K48-L52 → 36 conflicts (9%); V34-A41 → 29 conflicts (7%)
- explained: 350/421 conflicts by 3 root cause(s)
- metrics: hubs=57 (frac 0.687), conflicts/hub=7.4, max_incompat=11.7Å, chain_span=0.988
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): E74-L83 + K48-L52 + V34-A41 — explain ~350/421 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **K39** — severity 64.03, 23 conflict(s); suspect input ~`K78` (group: push_out)
  - push-out (wants farther): Q70@21.6Å(now 17.2,conf 0.61), H75@21.4Å(now 10.0,conf 0.60), K78@21.1Å(now 4.7,conf 0.60), A9@20.4Å(now 16.7,conf 0.59), A81@19.8Å(now 5.8,conf 0.57), V5@15.4Å(now 11.7,conf 0.55)
  - T35↔K78: targets 5.0/21.1Å but partners are 4.4Å apart → too_close_together by 11.7Å
  - S36↔A81: targets 5.1/19.8Å but partners are 3.4Å apart → too_close_together by 11.3Å
  - T35↔A81: targets 5.0/19.8Å but partners are 3.5Å apart → too_close_together by 11.2Å
- **H75** — severity 52.82, 17 conflict(s); suspect input ~`K39` (group: pull_in)
  - pull-in (wants closer): T15@19.5Å(now 23.2,conf 0.57), A19@15.4Å(now 20.6,conf 0.55)
  - push-out (wants farther): G38@22.0Å(now 12.9,conf 0.63), K39@21.4Å(now 10.0,conf 0.60), Q50@20.4Å(now 17.1,conf 0.59), T61@13.2Å(now 8.7,conf 0.55), V34@13.4Å(now 7.9,conf 0.55), E65@14.2Å(now 9.6,conf 0.55)
  - K78↔K39: targets 5.1/21.4Å but partners are 4.7Å apart → too_close_together by 11.6Å
  - K78↔G38: targets 5.1/22.0Å but partners are 6.6Å apart → too_close_together by 10.3Å
  - L79↔K39: targets 6.6/21.4Å but partners are 4.3Å apart → too_close_together by 10.5Å
- **K78** — severity 49.72, 20 conflict(s); suspect input ~`E82` (group: pull_in)
  - pull-in (wants closer): H14@16.8Å(now 20.5,conf 0.55), A9@13.2Å(now 19.0,conf 0.55), K71@10.6Å(now 14.7,conf 0.55), A19@15.7Å(now 21.1,conf 0.55), L13@13.7Å(now 16.4,conf 0.55)
  - push-out (wants farther): T51@21.8Å(now 13.5,conf 0.62), K39@21.1Å(now 4.7,conf 0.60), Q50@20.0Å(now 15.3,conf 0.58), L49@17.9Å(now 12.2,conf 0.55), T61@12.6Å(now 6.5,conf 0.55)
  - K39↔E82: targets 21.1/6.2Å but partners are 3.6Å apart → too_close_together by 11.4Å
  - K39↔A81: targets 21.1/5.3Å but partners are 5.8Å apart → too_close_together by 10.0Å
  - T51↔E82: targets 21.8/6.2Å but partners are 6.9Å apart → too_close_together by 8.8Å
- **G38** — severity 48.81, 19 conflict(s); suspect input ~`E82` (group: pull_in)
  - pull-in (wants closer): S42@13.0Å(now 16.2,conf 1.00), E31@17.1Å(now 19.8,conf 0.91)
  - push-out (wants farther): E82@23.0Å(now 7.3,conf 0.73), H75@22.0Å(now 12.9,conf 0.63), A72@20.8Å(now 17.3,conf 0.59), L76@19.0Å(now 12.1,conf 0.56), V60@9.4Å(now 6.9,conf 0.55)
  - T35↔E82: targets 6.6/23.0Å but partners are 6.4Å apart → too_close_together by 10.0Å
  - E82↔L52: targets 23.0/9.6Å but partners are 3.6Å apart → too_close_together by 9.8Å
  - T35↔H75: targets 6.6/22.0Å but partners are 8.0Å apart → too_close_together by 7.4Å
- **K48** — severity 44.32, 23 conflict(s); suspect input ~`L52` (group: push_out)
  - push-out (wants farther): D68@22.2Å(now 17.8,conf 0.65), A9@20.1Å(now 16.2,conf 0.58), Q3@19.8Å(now 13.8,conf 0.57), L83@19.1Å(now 10.8,conf 0.56), I7@17.6Å(now 13.0,conf 0.55), M80@16.9Å(now 8.7,conf 0.55), P17@15.3Å(now 12.6,conf 0.55)
  - L83↔L52: targets 19.1/7.4Å but partners are 3.2Å apart → too_close_together by 8.5Å
  - T51↔L83: targets 5.1/19.1Å but partners are 6.8Å apart → too_close_together by 7.2Å
  - A41↔M80: targets 5.4/16.9Å but partners are 4.9Å apart → too_close_together by 6.6Å
- **L79** — severity 43.97, 18 conflict(s); suspect input ~`L52` (group: push_out)
  - pull-in (wants closer): L83@5.1Å(now 9.2,conf 0.91), R16@13.2Å(now 18.5,conf 0.55), K23@11.4Å(now 16.4,conf 0.55), T8@11.6Å(now 14.9,conf 0.55), F28@13.7Å(now 16.7,conf 0.55), I7@10.3Å(now 13.2,conf 0.55)
  - push-out (wants farther): N37@20.0Å(now 11.5,conf 0.58), L52@17.8Å(now 8.1,conf 0.55), V34@13.2Å(now 6.1,conf 0.55), L46@15.8Å(now 12.2,conf 0.55)
  - L83↔N37: targets 5.1/20.0Å but partners are 5.1Å apart → too_close_together by 9.8Å
  - L83↔L52: targets 5.1/17.8Å but partners are 3.2Å apart → too_close_together by 9.5Å
  - E82↔L52: targets 5.0/17.8Å but partners are 3.6Å apart → too_close_together by 9.2Å

## Secondary Structure (DSSP-like)

- helix(H)=39 · strand(E)=20 · 3-10(G)=13 · coil(C)=11

```
CEGHHHGHEHHHHGHEHHGHHHEHHEGEHECEECCEHCHEHHHHEEHGCHEHEHGEEECCCCEGGEHGHGHHHGGHHHHHHHC
```

## Backbone H-bond Network

- total=46 · helix(i→i+4)=17 · sheet=29
  - E4 ↔ T8  (helix)
  - T6 ↔ P10  (helix)
  - N11 ↔ T15  (helix)
  - L13 ↔ P17  (helix)
  - A18 ↔ V22  (helix)
  - Q20 ↔ E24  (helix)
  - A25 ↔ T29  (helix)
  - K39 ↔ A43  (helix)
  - A43 ↔ F47  (helix)
  - Q50 ↔ L54  (helix)
  - E67 ↔ K71  (helix)
  - E69 ↔ V73  (helix)
  - A72 ↔ L76  (helix)
  - V73 ↔ V77  (helix)
  - L76 ↔ M80  (helix)
  - V77 ↔ A81  (helix)
  - K78 ↔ E82  (helix)
  - A9 ↔ R16  (sheet)
  - R16 ↔ K23  (sheet)
  - K23 ↔ F28  (sheet)
  - … +26 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=27 · exposed=22 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=478 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=302 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=3.5776 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=34 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 68 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
