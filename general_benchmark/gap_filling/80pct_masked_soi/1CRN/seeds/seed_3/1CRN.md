# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1CRN\sequence\1CRN.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1CRN\seeds\seed_3\1CRN.pdb`
- residues: 44
- mode: oracle
- ca_rmsd: 3.044 A
- tm_score_ca_ordered: 0.5057741176333613
- heavy_atom_rmsd: 3.798 A
- sidechain_heavy_atom_rmsd: 4.288 A
- **all-atom quality (honest):** heavy 3.798 A, sidechain 4.288 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/35 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 329
- bin_accuracy: 0.729

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=rejected_lj_regression tested=30
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 3.043995304650824
- ga_delta_rmsd: 0.9630429578616031  ga_fitness_mode: energy
- pre_local_rmsd: 3.0917879029926114  localized_anchor_rmsd: 3.044036429815826

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** —
- explained: 0/3 conflicts by 0 root cause(s)
- metrics: hubs=3 (frac 0.068), conflicts/hub=1.0, max_incompat=3.03Å, chain_span=0.523
- **fix-first:** [LOW_CONFLICT] Root cause(s): — — explain ~0/3 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **I24** — severity 1.80, 1 conflict(s); suspect input ~`T38` (group: push_out)
  - push-out (wants farther): T38@20.8Å(now 16.5,conf 0.59), A37@19.6Å(now 16.4,conf 0.57)
  - T27↔T38: targets 6.0/20.8Å but partners are 11.8Å apart → too_close_together by 3.0Å
- **S5** — severity 1.04, 1 conflict(s); suspect input ~`G41` (group: pull_in)
  - pull-in (wants closer): G41@10.9Å(now 13.4,conf 0.55)
  - S10↔G41: targets 9.0/10.9Å but partners are 21.8Å apart → too_far_apart by 1.9Å
- **Y28** — severity 0.94, 1 conflict(s); suspect input ~`A37` (group: push_out)
  - push-out (wants farther): A37@21.1Å(now 16.6,conf 0.60)
  - I32↔A37: targets 11.0/21.1Å but partners are 8.6Å apart → too_close_together by 1.6Å

## Secondary Structure (DSSP-like)

- helix(H)=20 · strand(E)=17 · 3-10(G)=3 · coil(C)=4

```
CCHEEEHHEHGHHEHHCGEEECHHHGHHEHEEEEHEEHHEHHHE
```

## Backbone H-bond Network

- total=28 · helix(i→i+4)=7 · sheet=21
  - C3 ↔ V7  (helix)
  - A8 ↔ F12  (helix)
  - F12 ↔ R16  (helix)
  - A23 ↔ T27  (helix)
  - I24 ↔ Y28  (helix)
  - P35 ↔ C39  (helix)
  - C39 ↔ Y43  (helix)
  - P4 ↔ R9  (sheet)
  - R9 ↔ V14  (sheet)
  - R9 ↔ T29  (sheet)
  - V14 ↔ G19  (sheet)
  - V14 ↔ T20  (sheet)
  - V14 ↔ P21  (sheet)
  - V14 ↔ T29  (sheet)
  - V14 ↔ C31  (sheet)
  - T20 ↔ T29  (sheet)
  - P21 ↔ T29  (sheet)
  - P21 ↔ C31  (sheet)
  - P21 ↔ I32  (sheet)
  - P21 ↔ I33  (sheet)
  - … +8 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=14 · exposed=19 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=146 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=47 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.344 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C2–C39, C3–C31, C15–C25

## Side-chain Rotamers (χ1/χ2)

- 35 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
