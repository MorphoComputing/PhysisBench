# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1POH\sequence\1POH.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1POH\seeds\seed_6\1POH.pdb`
- residues: 83
- mode: oracle
- ca_rmsd: 2.295 A
- tm_score_ca_ordered: 0.7417834294343693
- heavy_atom_rmsd: 3.766 A
- sidechain_heavy_atom_rmsd: 4.722 A
- **all-atom quality (honest):** heavy 3.766 A, sidechain 4.722 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/68 (0.0)
- lj_severe: 0
- lj_near: 14
- distogram_pairs: 957
- bin_accuracy: 0.672

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=45
- rigid_domain_reconvergence: applied=True accepted=3 rmsd=3.1944001688628076 -> 2.8825537585676604 A
- topology_reconvergence: applied=True accepted=0/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 2.2949789576733877
- ga_delta_rmsd: 0.41657791904742636  ga_fitness_mode: energy
- pre_local_rmsd: 2.3519539637259035  localized_anchor_rmsd: 2.2949677310239927

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** Q2-T8 → 16 conflicts (48%); V22-K23 → 5 conflicts (15%); L54-Q56 → 4 conflicts (12%)
- explained: 25/33 conflicts by 3 root cause(s)
- metrics: hubs=21 (frac 0.253), conflicts/hub=1.6, max_incompat=5.17Å, chain_span=0.94
- **fix-first:** [LOW_CONFLICT] Root cause(s): Q2-T8 + V22-K23 + L54-Q56 — explain ~25/33 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **K39** — severity 9.80, 4 conflict(s); suspect input ~`E4` (group: push_out)
  - push-out (wants farther): Q3@15.7Å(now 10.4,conf 0.55), E4@14.1Å(now 8.5,conf 0.55)
  - T35↔E4: targets 5.0/14.1Å but partners are 3.9Å apart → too_close_together by 5.2Å
  - T35↔Q3: targets 5.0/15.7Å but partners are 5.6Å apart → too_close_together by 5.1Å
  - S36↔E4: targets 5.0/14.1Å but partners are 4.2Å apart → too_close_together by 4.9Å
- **A18** — severity 3.62, 3 conflict(s); suspect input ~`E82` (group: pull_in)
  - pull-in (wants closer): E82@12.3Å(now 17.7,conf 0.55)
  - T15↔E82: targets 5.3/12.3Å but partners are 20.2Å apart → too_far_apart by 2.6Å
  - F47↔E82: targets 10.3/12.3Å but partners are 24.8Å apart → too_far_apart by 2.2Å
  - V22↔E82: targets 6.0/12.3Å but partners are 20.0Å apart → too_far_apart by 1.8Å
- **A41** — severity 3.18, 2 conflict(s); suspect input ~`Q3` (group: push_out)
  - push-out (wants farther): Q3@15.2Å(now 11.7,conf 0.55)
  - V34↔Q3: targets 5.6/15.2Å but partners are 6.4Å apart → too_close_together by 3.2Å
  - T35↔Q3: targets 7.0/15.2Å but partners are 5.6Å apart → too_close_together by 2.6Å
- **L79** — severity 3.01, 2 conflict(s); suspect input ~`K23` (group: pull_in)
  - pull-in (wants closer): R16@13.2Å(now 16.2,conf 0.55), K23@11.4Å(now 14.4,conf 0.55)
  - E82↔K23: targets 5.0/11.4Å but partners are 19.4Å apart → too_far_apart by 3.0Å
  - H75↔R16: targets 5.4/13.2Å but partners are 21.1Å apart → too_far_apart by 2.5Å
- **K48** — severity 2.72, 2 conflict(s); suspect input ~`A41` (group: push_out)
  - push-out (wants farther): Q3@19.8Å(now 14.9,conf 0.57), I7@17.6Å(now 14.0,conf 0.55)
  - Q3↔A41: targets 19.8/5.4Å but partners are 11.7Å apart → too_close_together by 2.6Å
  - I7↔L54: targets 17.6/11.8Å but partners are 3.5Å apart → too_close_together by 2.3Å
- **S40** — severity 2.55, 2 conflict(s); suspect input ~`Q2` (group: push_out)
  - push-out (wants farther): Q2@13.2Å(now 8.3,conf 0.55), F1@15.5Å(now 12.9,conf 0.55)
  - T35↔Q2: targets 4.6/13.2Å but partners are 6.0Å apart → too_close_together by 2.6Å
  - V34↔Q2: targets 5.4/13.2Å but partners are 5.7Å apart → too_close_together by 2.0Å

## Secondary Structure (DSSP-like)

- helix(H)=28 · strand(E)=32 · 3-10(G)=14 · coil(C)=9

```
CEEGGCGGECGEHEGEHHHEHHHHHEHEHEHGEGEEHHEEEECHEGHEHEHECEEGEECEGGCEGEHHEHHEHEHHHEGHCHC
```

## Backbone H-bond Network

- total=74 · helix(i→i+4)=11 · sheet=63
  - L13 ↔ P17  (helix)
  - P17 ↔ F21  (helix)
  - A18 ↔ V22  (helix)
  - F21 ↔ A25  (helix)
  - A25 ↔ T29  (helix)
  - G27 ↔ E31  (helix)
  - F47 ↔ T51  (helix)
  - E67 ↔ K71  (helix)
  - K71 ↔ H75  (helix)
  - V73 ↔ V77  (helix)
  - L76 ↔ M80  (helix)
  - A9 ↔ H14  (sheet)
  - A9 ↔ R16  (sheet)
  - H14 ↔ Q20  (sheet)
  - Q20 ↔ K26  (sheet)
  - K26 ↔ T33  (sheet)
  - K26 ↔ S42  (sheet)
  - K26 ↔ S45  (sheet)
  - F28 ↔ T33  (sheet)
  - F28 ↔ S42  (sheet)
  - … +54 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=29 · exposed=29 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=345 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=183 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.0624 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=14 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 68 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
