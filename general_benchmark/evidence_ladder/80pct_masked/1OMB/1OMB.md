# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set/general_benchmark/1OMB/sequence/1OMB.pdb`
- output_pdb: `general_benchmark/evidence_ladder/80pct_masked/1OMB/seeds/seed_1/1OMB.pdb`
- residues: 33
- mode: oracle
- ca_rmsd: 4.635 A
- tm_score_ca_ordered: 0.26054396835489724
- heavy_atom_rmsd: 5.948 A
- sidechain_heavy_atom_rmsd: 6.988 A
- **all-atom quality (honest):** heavy 5.948 A, sidechain 6.988 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/27 (0.0)
- lj_severe: 0
- lj_near: 11
- distogram_pairs: 93
- bin_accuracy: 0.538

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=rejected_local_chirality_regression tested=33
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 4.634551519282073
- ga_delta_rmsd: 0.5709933667836387  ga_fitness_mode: energy
- pre_local_rmsd: 4.634595320133367  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** E31 → 5 conflicts (83%)
- explained: 5/6 conflicts by 1 root cause(s)
- metrics: hubs=5 (frac 0.152), conflicts/hub=1.2, max_incompat=4.32Å, chain_span=0.606
- **fix-first:** [LOW_CONFLICT] Root cause(s): E31 — explain ~5/6 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **S24** — severity 3.78, 2 conflict(s); suspect input ~`E31` (group: push_out)
  - push-out (wants farther): T13@17.9Å(now 13.7,conf 0.55), K14@16.9Å(now 13.5,conf 0.55)
  - T13↔E31: targets 17.9/8.7Å but partners are 5.6Å apart → too_close_together by 3.6Å
  - K14↔E31: targets 16.9/8.7Å but partners are 4.9Å apart → too_close_together by 3.3Å
- **E31** — severity 2.35, 1 conflict(s); suspect input ~`G11` (group: push_out)
  - push-out (wants farther): G11@13.6Å(now 5.8,conf 0.55)
  - K7↔G11: targets 4.7/13.6Å but partners are 4.5Å apart → too_close_together by 4.3Å
- **C23** — severity 1.69, 1 conflict(s); suspect input ~`G12` (group: push_out)
  - push-out (wants farther): G12@14.4Å(now 9.7,conf 0.55)
  - E31↔G12: targets 6.3/14.4Å but partners are 5.0Å apart → too_close_together by 3.1Å
- **T13** — severity 1.12, 1 conflict(s); suspect input ~`W10` (group: push_out)
  - push-out (wants farther): S24@17.9Å(now 13.7,conf 0.55), K7@8.9Å(now 5.8,conf 0.55), N29@13.4Å(now 10.8,conf 0.55), C21@10.4Å(now 5.2,conf 0.55), G6@10.2Å(now 5.1,conf 0.55)
  - S24↔W10: targets 17.9/7.8Å but partners are 8.1Å apart → too_close_together by 2.1Å
- **G11** — severity 0.82, 1 conflict(s); suspect input ~`E31` (group: push_out)
  - push-out (wants farther): R22@13.3Å(now 9.8,conf 0.55), E31@13.6Å(now 5.8,conf 0.55)
  - C8↔E31: targets 8.9/13.6Å but partners are 3.1Å apart → too_close_together by 1.5Å

## Secondary Structure (DSSP-like)

- helix(H)=11 · strand(E)=14 · 3-10(G)=4 · coil(C)=4

```
CEEHEEEHHEHHCHECEGHEGCEEHHEGHHEGE
```

## Backbone H-bond Network

- total=36 · helix(i→i+4)=3 · sheet=33
  - D4 ↔ C8  (helix)
  - C8 ↔ G12  (helix)
  - M25 ↔ N29  (helix)
  - A2 ↔ K7  (sheet)
  - A2 ↔ C15  (sheet)
  - A2 ↔ R17  (sheet)
  - A2 ↔ P20  (sheet)
  - E3 ↔ W10  (sheet)
  - E3 ↔ C15  (sheet)
  - E3 ↔ R17  (sheet)
  - Y5 ↔ W10  (sheet)
  - Y5 ↔ C15  (sheet)
  - Y5 ↔ R17  (sheet)
  - Y5 ↔ P20  (sheet)
  - Y5 ↔ C23  (sheet)
  - G6 ↔ C15  (sheet)
  - G6 ↔ R17  (sheet)
  - G6 ↔ P20  (sheet)
  - K7 ↔ C15  (sheet)
  - K7 ↔ R17  (sheet)
  - … +16 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=19 · exposed=8 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=163 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=100 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.5888 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=11 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C8–C21, C15–C32, C23–C30

## Side-chain Rotamers (χ1/χ2)

- 27 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`1OMB.ensemble.pdb`)
- RMSF mean=2.198Å max=4.688Å (per-residue in .per_residue.csv)
- most flexible residues: 33, 18, 13, 32, 6

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1OMB.pae.csv`
- mean=0.967Å · max=4.259Å · AlphaFold-PAE analog (low block = rigid unit/domain)
