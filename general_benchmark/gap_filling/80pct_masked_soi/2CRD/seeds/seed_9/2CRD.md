# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2CRD\sequence\2CRD.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\2CRD\seeds\seed_9\2CRD.pdb`
- residues: 34
- mode: oracle
- ca_rmsd: 6.941 A
- tm_score_ca_ordered: 0.15840964387195328
- heavy_atom_rmsd: 8.700 A
- sidechain_heavy_atom_rmsd: 9.976 A
- **all-atom quality (honest):** heavy 8.700 A, sidechain 9.976 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/33 (0.0)
- lj_severe: 0
- lj_near: 2
- distogram_pairs: 215
- bin_accuracy: 0.665

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=rejected_lj_regression tested=30
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 6.94157138580837
- ga_delta_rmsd: -1.7189172762238094  ga_fitness_mode: energy
- pre_local_rmsd: 6.941499881886688  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** —
- explained: 0/2 conflicts by 0 root cause(s)
- metrics: hubs=2 (frac 0.059), conflicts/hub=1.0, max_incompat=2.39Å, chain_span=0.029
- **fix-first:** [LOW_CONFLICT] Root cause(s): — — explain ~0/2 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **V14** — severity 1.40, 1 conflict(s); suspect input ~`E10` (group: push_out)
  - push-out (wants farther): T7@12.6Å(now 9.6,conf 0.79)
  - T7↔E10: targets 12.6/6.5Å but partners are 3.6Å apart → too_close_together by 2.4Å
- **S13** — severity 0.95, 1 conflict(s); suspect input ~`K9` (group: push_out)
  - push-out (wants farther): T7@12.6Å(now 8.2,conf 0.79)
  - T7↔K9: targets 12.6/7.3Å but partners are 3.4Å apart → too_close_together by 1.8Å

## Secondary Structure (DSSP-like)

- helix(H)=11 · strand(E)=14 · 3-10(G)=4 · coil(C)=5

```
CEEEEGHHHHHHGHGCHCEECECGEEEEEEHHHE
```

## Backbone H-bond Network

- total=11 · helix(i→i+4)=2 · sheet=9
  - T7 ↔ C11  (helix)
  - S8 ↔ W12  (helix)
  - N2 ↔ H19  (sheet)
  - V3 ↔ H19  (sheet)
  - C5 ↔ K25  (sheet)
  - H19 ↔ Y34  (sheet)
  - N20 ↔ Y34  (sheet)
  - S22 ↔ Y34  (sheet)
  - K25 ↔ K30  (sheet)
  - K25 ↔ Y34  (sheet)
  - C26 ↔ Y34  (sheet)

## Solvent Accessibility (burial)

- buried=9 · exposed=17 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=129 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=61 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.2778 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=2 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C26, C11–C31, C15–C33

## Side-chain Rotamers (χ1/χ2)

- 33 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
