# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1OMB\sequence\1OMB.pdb`
- output_pdb: `general_benchmark\model_refinement\homologs\1OMB\seeds\seed_0\1OMB.pdb`
- residues: 33
- mode: oracle
- ca_rmsd: 5.589 A
- tm_score_ca_ordered: 0.17366706821621217
- heavy_atom_rmsd: 6.790 A
- sidechain_heavy_atom_rmsd: 7.815 A
- **all-atom quality (honest):** heavy 6.790 A, sidechain 7.815 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/27 (0.0)
- lj_severe: 0
- lj_near: 8
- distogram_pairs: 309
- bin_accuracy: 0.589

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=global reason=rejected_domain_topology_regression tested=33
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 5.589169977748454
- ga_delta_rmsd: 0.08867174209449225  ga_fitness_mode: energy
- pre_local_rmsd: 5.589081357857375  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** N29 → 3 conflicts (100%)
- explained: 3/3 conflicts by 1 root cause(s)
- metrics: hubs=2 (frac 0.061), conflicts/hub=1.5, max_incompat=1.61Å, chain_span=0.091
- **fix-first:** [LOW_CONFLICT] Root cause(s): N29 — explain ~3/3 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **G18** — severity 1.09, 2 conflict(s); suspect input ~`C21` (group: push_out)
  - push-out (wants farther): N29@16.1Å(now 13.3,conf 0.35)
  - N29↔C21: targets 16.1/9.5Å but partners are 5.0Å apart → too_close_together by 1.6Å
  - C32↔N29: targets 6.3/16.1Å but partners are 8.3Å apart → too_close_together by 1.6Å
- **C15** — severity 0.54, 1 conflict(s); suspect input ~`N29` (group: push_out)
  - push-out (wants farther): N29@14.1Å(now 11.4,conf 0.34)
  - C21↔N29: targets 7.5/14.1Å but partners are 5.0Å apart → too_close_together by 1.6Å

## Secondary Structure (DSSP-like)

- helix(H)=10 · strand(E)=12 · 3-10(G)=5 · coil(C)=6

```
CHHHGGEGHEHEEHEGCCCEHHGEHCEHECEEE
```

## Backbone H-bond Network

- total=31 · helix(i→i+4)=1 · sheet=30
  - C21 ↔ M25  (helix)
  - K7 ↔ G12  (sheet)
  - K7 ↔ T13  (sheet)
  - K7 ↔ C15  (sheet)
  - K7 ↔ P20  (sheet)
  - K7 ↔ S24  (sheet)
  - K7 ↔ G27  (sheet)
  - W10 ↔ C15  (sheet)
  - W10 ↔ P20  (sheet)
  - W10 ↔ S24  (sheet)
  - W10 ↔ G27  (sheet)
  - W10 ↔ N29  (sheet)
  - G12 ↔ P20  (sheet)
  - G12 ↔ G27  (sheet)
  - G12 ↔ N29  (sheet)
  - T13 ↔ P20  (sheet)
  - T13 ↔ N29  (sheet)
  - T13 ↔ E31  (sheet)
  - T13 ↔ C32  (sheet)
  - C15 ↔ P20  (sheet)
  - … +11 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=12 · exposed=15 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=148 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=96 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.3012 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=8 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C8–C21, C15–C32, C23–C30

## Side-chain Rotamers (χ1/χ2)

- 27 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
