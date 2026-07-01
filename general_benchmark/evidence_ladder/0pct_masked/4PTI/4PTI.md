# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set/general_benchmark/4PTI/sequence/4PTI.pdb`
- output_pdb: `general_benchmark/evidence_ladder/0pct_masked/4PTI/seeds/seed_1/4PTI.pdb`
- residues: 56
- mode: oracle
- ca_rmsd: 0.041 A
- tm_score_ca_ordered: 0.9997304298453532
- heavy_atom_rmsd: 2.703 A
- sidechain_heavy_atom_rmsd: 3.528 A
- **all-atom quality (honest):** heavy 2.703 A, sidechain 3.528 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/45 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 1431
- bin_accuracy: 0.979

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=42
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=0.06542843007445392 -> 0.06444905568781938 A
- topology_reconvergence: applied=True accepted=22/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.04074065182953195
- ga_delta_rmsd: -0.009285211700651205  ga_fitness_mode: energy
- pre_local_rmsd: 0.04204343557457483  localized_anchor_rmsd: 0.040670492650909

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=15 · strand(E)=19 · 3-10(G)=16 · coil(C)=6

```
EEHHHECCEGEGEGEGECEEGCGGHHGEEGCECGHGEGGEGHEEGEHHHHHHGHHE
```

## Backbone H-bond Network

- total=28 · helix(i→i+4)=3 · sheet=25
  - A47 ↔ M51  (helix)
  - E48 ↔ R52  (helix)
  - M51 ↔ G55  (helix)
  - P1 ↔ E6  (sheet)
  - Y9 ↔ I17  (sheet)
  - Y9 ↔ R19  (sheet)
  - Y9 ↔ Y20  (sheet)
  - G11 ↔ I17  (sheet)
  - G11 ↔ R19  (sheet)
  - A15 ↔ F32  (sheet)
  - I17 ↔ F32  (sheet)
  - I17 ↔ C37  (sheet)
  - R19 ↔ C29  (sheet)
  - R19 ↔ F32  (sheet)
  - R19 ↔ C37  (sheet)
  - Y20 ↔ L28  (sheet)
  - Y20 ↔ C29  (sheet)
  - Y20 ↔ F32  (sheet)
  - Y20 ↔ K40  (sheet)
  - L28 ↔ F44  (sheet)
  - … +8 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=16 · exposed=22 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=204 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=111 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.6538 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C4–C54, C13–C37, C29–C50

## Side-chain Rotamers (χ1/χ2)

- 45 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`4PTI.ensemble.pdb`)
- RMSF mean=0.026Å max=0.048Å (per-residue in .per_residue.csv)
- most flexible residues: 5, 8, 22, 12, 21

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `4PTI.pae.csv`
- mean=0.018Å · max=0.073Å · AlphaFold-PAE analog (low block = rigid unit/domain)
