# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2ACY\sequence\2ACY.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\2ACY\seeds\seed_8\2ACY.pdb`
- residues: 96
- mode: oracle
- ca_rmsd: 10.741 A
- tm_score_ca_ordered: 0.23448102227423093
- heavy_atom_rmsd: 11.837 A
- sidechain_heavy_atom_rmsd: 12.804 A
- **all-atom quality (honest):** heavy 11.837 A, sidechain 12.804 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/83 (0.0)
- lj_severe: 0
- lj_near: 1
- distogram_pairs: 1237
- bin_accuracy: 0.866

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=global reason=rejected_window_topology_regression tested=48
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 10.74073949670785
- ga_delta_rmsd: -0.4771000792418665  ga_fitness_mode: energy
- pre_local_rmsd: 10.74073008874155  localized_anchor_rmsd: 10.74073008874155

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** E1-L5 → 4 conflicts (100%)
- explained: 4/4 conflicts by 1 root cause(s)
- metrics: hubs=3 (frac 0.031), conflicts/hub=1.3, max_incompat=2.88Å, chain_span=0.677
- **fix-first:** [LOW_CONFLICT] Root cause(s): E1-L5 — explain ~4/4 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **E1** — severity 1.89, 2 conflict(s); suspect input ~`L88` (group: push_out)
  - push-out (wants farther): L88@16.2Å(now 13.2,conf 0.55), V86@14.2Å(now 10.6,conf 0.55)
  - L5↔L88: targets 9.0/16.2Å but partners are 5.3Å apart → too_close_together by 1.9Å
  - T4↔V86: targets 6.6/14.2Å but partners are 6.0Å apart → too_close_together by 1.6Å
- **T66** — severity 1.73, 1 conflict(s); suspect input ~`G2` (group: pull_in)
  - pull-in (wants closer): G2@21.1Å(now 24.5,conf 0.60)
  - H73↔G2: targets 7.1/21.1Å but partners are 31.1Å apart → too_far_apart by 2.9Å
- **G2** — severity 0.90, 1 conflict(s); suspect input ~`L88` (group: push_out)
  - pull-in (wants closer): D42@27.5Å(now 34.9,conf 1.00), G14@27.5Å(now 31.3,conf 1.00), S72@27.5Å(now 31.2,conf 1.00), T66@21.1Å(now 24.5,conf 0.60)
  - push-out (wants farther): L88@15.9Å(now 10.5,conf 0.55)
  - L5↔L88: targets 9.0/15.9Å but partners are 5.3Å apart → too_close_together by 1.6Å

## Secondary Structure (DSSP-like)

- helix(H)=28 · strand(E)=31 · 3-10(G)=13 · coil(C)=24

```
CEHECCEGCECCEEGGEHGHHGGHHHHHHHHHHCEEECECEHCEEEEEECEECCHGHHHHHHGHGCEECHCECCEECHEGGGEHGHCCEEHECECC
```

## Backbone H-bond Network

- total=42 · helix(i→i+4)=12 · sheet=30
  - F20 ↔ Y24  (helix)
  - F21 ↔ T25  (helix)
  - Y24 ↔ E28  (helix)
  - T25 ↔ G29  (helix)
  - Q26 ↔ K30  (helix)
  - A27 ↔ K31  (helix)
  - E28 ↔ L32  (helix)
  - G29 ↔ G33  (helix)
  - S55 ↔ H59  (helix)
  - V57 ↔ Q61  (helix)
  - R58 ↔ E62  (helix)
  - M60 ↔ L64  (helix)
  - G2 ↔ S7  (sheet)
  - V35 ↔ G48  (sheet)
  - V35 ↔ Q49  (sheet)
  - V35 ↔ Q51  (sheet)
  - V35 ↔ G52  (sheet)
  - G36 ↔ Q47  (sheet)
  - G36 ↔ G48  (sheet)
  - G36 ↔ Q49  (sheet)
  - … +22 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=39 · exposed=30 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=400 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=226 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.5746 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=1 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 83 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
