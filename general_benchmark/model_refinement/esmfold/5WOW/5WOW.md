# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\5WOW\sequence\5WOW.pdb`
- output_pdb: `general_benchmark\model_refinement\esmfold\5WOW\seeds\seed_1\5WOW.pdb`
- residues: 37
- mode: oracle
- ca_rmsd: 3.757 A
- tm_score_ca_ordered: 0.35543856409308094
- heavy_atom_rmsd: 4.941 A
- sidechain_heavy_atom_rmsd: 5.800 A
- **all-atom quality (honest):** heavy 4.941 A, sidechain 5.800 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/31 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 595
- bin_accuracy: 0.785

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=domain_block reason=accepted tested=27
- rigid_domain_reconvergence: applied=True accepted=13 rmsd=4.149226040905912 -> 3.025166366921936 A
- topology_reconvergence: applied=True accepted=0/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 3.7569259432517694
- ga_delta_rmsd: -0.9571180040702689  ga_fitness_mode: energy
- pre_local_rmsd: 3.756961181008667  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** —
- explained: 0/1 conflicts by 0 root cause(s)
- metrics: hubs=1 (frac 0.027), conflicts/hub=1.0, max_incompat=1.71Å, chain_span=0.0
- **fix-first:** [LOW_CONFLICT] Root cause(s): — — explain ~0/1 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **P35** — severity 0.60, 1 conflict(s); suspect input ~`Y32` (group: push_out)
  - push-out (wants farther): P4@17.7Å(now 14.0,conf 0.36), V2@17.0Å(now 13.4,conf 0.35), K5@16.5Å(now 13.9,conf 0.35)
  - V2↔Y32: targets 17.0/8.4Å but partners are 6.8Å apart → too_close_together by 1.7Å

## Secondary Structure (DSSP-like)

- helix(H)=11 · strand(E)=16 · 3-10(G)=6 · coil(C)=4

```
EHHEEEHECEGEHHHEEEHEGGEHGGEEECHCHHEGC
```

## Backbone H-bond Network

- total=52 · helix(i→i+4)=2 · sheet=50
  - C3 ↔ L7  (helix)
  - D15 ↔ A19  (helix)
  - G1 ↔ C16  (sheet)
  - G1 ↔ P17  (sheet)
  - G1 ↔ G18  (sheet)
  - G1 ↔ C20  (sheet)
  - P4 ↔ C16  (sheet)
  - P4 ↔ P17  (sheet)
  - P4 ↔ G18  (sheet)
  - P4 ↔ C20  (sheet)
  - K5 ↔ C16  (sheet)
  - K5 ↔ P17  (sheet)
  - K5 ↔ G18  (sheet)
  - K5 ↔ C20  (sheet)
  - I6 ↔ C16  (sheet)
  - I6 ↔ P17  (sheet)
  - I6 ↔ G18  (sheet)
  - I6 ↔ C20  (sheet)
  - Q8 ↔ C16  (sheet)
  - Q8 ↔ P17  (sheet)
  - … +32 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=14 · exposed=5 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=127 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=69 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.1771 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C20, C10–C22, C16–C28

## Side-chain Rotamers (χ1/χ2)

- 31 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`5WOW.ensemble.pdb`)
- RMSF mean=2.807Å max=7.997Å (per-residue in .per_residue.csv)
- most flexible residues: 6, 7, 8, 5, 13

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `5WOW.pae.csv`
- mean=0.096Å · max=0.446Å · AlphaFold-PAE analog (low block = rigid unit/domain)
