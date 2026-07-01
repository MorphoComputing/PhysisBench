# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1NXB\sequence\1NXB.pdb`
- output_pdb: `general_benchmark\model_refinement\esmfold\1NXB\seeds\seed_1\1NXB.pdb`
- residues: 60
- mode: oracle
- ca_rmsd: 1.606 A
- tm_score_ca_ordered: 0.822970781364147
- heavy_atom_rmsd: 3.397 A
- sidechain_heavy_atom_rmsd: 4.297 A
- **all-atom quality (honest):** heavy 3.397 A, sidechain 4.297 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 4/4
- ramachandran_forbidden_fraction: 0.017
- rotamer_outliers: 0/55 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 1653
- bin_accuracy: 0.891

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=45
- rigid_domain_reconvergence: applied=True accepted=10 rmsd=1.63979411133504 -> 1.248068243706655 A
- topology_reconvergence: applied=True accepted=0/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 1.6061929951499256
- ga_delta_rmsd: -0.39708711072929237  ga_fitness_mode: energy
- pre_local_rmsd: 1.6279548224854974  localized_anchor_rmsd: 1.6061962242157795

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=6 · strand(E)=29 · 3-10(G)=11 · coil(C)=14

```
CECEEGCHECCEEEGEEGGCHEGEGEEEEEHGECGGEEEEECEGGECHECCECECECHHE
```

## Backbone H-bond Network

- total=75 · helix(i→i+4)=0 · sheet=75
  - C2 ↔ T12  (sheet)
  - C2 ↔ T13  (sheet)
  - C2 ↔ K14  (sheet)
  - C2 ↔ C16  (sheet)
  - C2 ↔ S17  (sheet)
  - C2 ↔ S22  (sheet)
  - N4 ↔ Q9  (sheet)
  - N4 ↔ T12  (sheet)
  - N4 ↔ T13  (sheet)
  - N4 ↔ K14  (sheet)
  - N4 ↔ C16  (sheet)
  - N4 ↔ S22  (sheet)
  - N4 ↔ Y24  (sheet)
  - Q5 ↔ T12  (sheet)
  - Q5 ↔ T13  (sheet)
  - Q5 ↔ K14  (sheet)
  - Q5 ↔ Y24  (sheet)
  - T13 ↔ Y24  (sheet)
  - K14 ↔ S22  (sheet)
  - K14 ↔ Y24  (sheet)
  - … +55 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=22 · exposed=19 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=212 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=136 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.9877 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0167

## Disulfide Bonds Formed

- count=4: C2–C23, C16–C40, C42–C53, C54–C59

## Side-chain Rotamers (χ1/χ2)

- 55 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`1NXB.ensemble.pdb`)
- RMSF mean=0.027Å max=0.099Å (per-residue in .per_residue.csv)
- most flexible residues: 40, 30, 26, 22, 45

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1NXB.pae.csv`
- mean=0.019Å · max=0.133Å · AlphaFold-PAE analog (low block = rigid unit/domain)
