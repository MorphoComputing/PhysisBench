# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2KNM\sequence\2KNM.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm1\2KNM\seeds\seed_0\2KNM.pdb`
- residues: 28
- mode: oracle
- ca_rmsd: 0.548 A
- tm_score_ca_ordered: 0.8265426377739956
- heavy_atom_rmsd: 2.576 A
- sidechain_heavy_atom_rmsd: 3.396 A
- **all-atom quality (honest):** heavy 2.576 A, sidechain 3.396 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 325
- bin_accuracy: 0.698

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=domain_block reason=accepted tested=27
- rigid_domain_reconvergence: applied=True accepted=5 rmsd=0.7875218945910136 -> 0.5859512996836161 A
- topology_reconvergence: applied=True accepted=2/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.5484076487295317
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 0.5483508235187853  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** —
- explained: 0/2 conflicts by 0 root cause(s)
- metrics: hubs=2 (frac 0.071), conflicts/hub=1.0, max_incompat=2.57Å, chain_span=0.357
- **fix-first:** [LOW_CONFLICT] Root cause(s): — — explain ~0/2 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **P2** — severity 0.88, 1 conflict(s); suspect input ~`P11` (group: pull_in)
  - pull-in (wants closer): C12@8.2Å(now 10.7,conf 0.35)
  - C12↔P11: targets 8.2/14.8Å but partners are 4.1Å apart → too_close_together by 2.6Å
- **C12** — severity 0.68, 1 conflict(s); suspect input ~`I1` (group: pull_in)
  - pull-in (wants closer): P2@8.2Å(now 10.7,conf 0.35)
  - P2↔I1: targets 8.2/13.9Å but partners are 3.8Å apart → too_close_together by 2.0Å

## Secondary Structure (DSSP-like)

- helix(H)=13 · strand(E)=8 · 3-10(G)=5 · coil(C)=2

```
CEHCEGEHHGGHHHHGHHHEHEHHEGEE
```

## Backbone H-bond Network

- total=19 · helix(i→i+4)=4 · sheet=15
  - V8 ↔ C12  (helix)
  - I13 ↔ I17  (helix)
  - S15 ↔ C19  (helix)
  - C19 ↔ S23  (helix)
  - P2 ↔ C7  (sheet)
  - P2 ↔ S20  (sheet)
  - P2 ↔ K22  (sheet)
  - E5 ↔ S20  (sheet)
  - E5 ↔ K22  (sheet)
  - E5 ↔ V25  (sheet)
  - C7 ↔ S20  (sheet)
  - C7 ↔ K22  (sheet)
  - C7 ↔ V25  (sheet)
  - C7 ↔ Y27  (sheet)
  - S20 ↔ V25  (sheet)
  - S20 ↔ Y27  (sheet)
  - S20 ↔ R28  (sheet)
  - K22 ↔ Y27  (sheet)
  - K22 ↔ R28  (sheet)

## Solvent Accessibility (burial)

- buried=8 · exposed=13 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=96 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=45 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.1968 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C19, C7–C21, C12–C26

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`2KNM.ensemble.pdb`)
- RMSF mean=0.137Å max=0.288Å (per-residue in .per_residue.csv)
- most flexible residues: 17, 14, 16, 2, 28

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `2KNM.pae.csv`
- mean=0.075Å · max=0.464Å · AlphaFold-PAE analog (low block = rigid unit/domain)
