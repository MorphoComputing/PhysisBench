# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1VII\sequence\1VII.pdb`
- output_pdb: `general_benchmark\model_refinement\esmfold\1VII\seeds\seed_1\1VII.pdb`
- residues: 34
- mode: oracle
- ca_rmsd: 1.472 A
- tm_score_ca_ordered: 0.636598050334169
- heavy_atom_rmsd: 3.433 A
- sidechain_heavy_atom_rmsd: 4.368 A
- **all-atom quality (honest):** heavy 3.433 A, sidechain 4.368 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/29 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 496
- bin_accuracy: 0.887

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=33
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 1.4719744335598428
- ga_delta_rmsd: -0.03912164236995519  ga_fitness_mode: energy
- pre_local_rmsd: 1.472011700494565  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_NEAR_MISS_LT_1A`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** —
- explained: 0/1 conflicts by 0 root cause(s)
- metrics: hubs=1 (frac 0.029), conflicts/hub=1.0, max_incompat=2.44Å, chain_span=0.0
- **fix-first:** [LOW_CONFLICT] Root cause(s): — — explain ~0/1 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **D3** — severity 0.89, 1 conflict(s); suspect input ~`G33` (group: push_out)
  - push-out (wants farther): G33@18.1Å(now 15.3,conf 0.36)
  - F6↔G33: targets 5.5/18.1Å but partners are 10.1Å apart → too_close_together by 2.4Å

## Secondary Structure (DSSP-like)

- helix(H)=23 · strand(E)=6 · 3-10(G)=3 · coil(C)=2

```
EEHHGHHGHHHEEHHHHHHEHGHHHHHHHHHECC
```

## Backbone H-bond Network

- total=15 · helix(i→i+4)=11 · sheet=4
  - D3 ↔ K7  (helix)
  - K7 ↔ G11  (helix)
  - G11 ↔ S15  (helix)
  - R14 ↔ A18  (helix)
  - S15 ↔ N19  (helix)
  - N19 ↔ W23  (helix)
  - W23 ↔ N27  (helix)
  - K24 ↔ L28  (helix)
  - Q25 ↔ K29  (helix)
  - Q26 ↔ K30  (helix)
  - N27 ↔ E31  (helix)
  - L1 ↔ T13  (sheet)
  - S2 ↔ T13  (sheet)
  - M12 ↔ L20  (sheet)
  - T13 ↔ L20  (sheet)

## Solvent Accessibility (burial)

- buried=9 · exposed=18 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=98 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=13 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.1723 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 29 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`1VII.ensemble.pdb`)
- RMSF mean=0.019Å max=0.051Å (per-residue in .per_residue.csv)
- most flexible residues: 26, 21, 34, 12, 3

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1VII.pae.csv`
- mean=0.014Å · max=0.054Å · AlphaFold-PAE analog (low block = rigid unit/domain)
