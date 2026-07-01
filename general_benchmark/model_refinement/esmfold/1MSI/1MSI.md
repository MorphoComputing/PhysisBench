# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1MSI\sequence\1MSI.pdb`
- output_pdb: `general_benchmark\model_refinement\esmfold\1MSI\seeds\seed_0\1MSI.pdb`
- residues: 64
- mode: oracle
- ca_rmsd: 0.366 A
- tm_score_ca_ordered: 0.9843036825152254
- heavy_atom_rmsd: 2.552 A
- sidechain_heavy_atom_rmsd: 3.373 A
- **all-atom quality (honest):** heavy 2.552 A, sidechain 3.373 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/54 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 1891
- bin_accuracy: 0.921

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=39
- rigid_domain_reconvergence: applied=True accepted=2 rmsd=0.4090343872308457 -> 0.37812863214084647 A
- topology_reconvergence: applied=True accepted=1/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.3660043941943078
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 0.3722605853545746  localized_anchor_rmsd: 0.36602303277221376

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=20 · strand(E)=21 · 3-10(G)=14 · coil(C)=9

```
CEEGCGGHECGEGHEGEEHHHEEEEGEEGCECCHHHHHHHHHEEGGECGEGHEGCGHHHEHHEC
```

## Backbone H-bond Network

- total=27 · helix(i→i+4)=5 · sheet=22
  - A34 ↔ P38  (helix)
  - E35 ↔ R39  (helix)
  - D36 ↔ L40  (helix)
  - P38 ↔ S42  (helix)
  - D58 ↔ G62  (helix)
  - A3 ↔ M22  (sheet)
  - A3 ↔ R23  (sheet)
  - Q9 ↔ T15  (sheet)
  - Q9 ↔ L17  (sheet)
  - Q9 ↔ T18  (sheet)
  - Q9 ↔ M22  (sheet)
  - Q9 ↔ R23  (sheet)
  - P12 ↔ L17  (sheet)
  - P12 ↔ T18  (sheet)
  - T15 ↔ M22  (sheet)
  - L17 ↔ M22  (sheet)
  - L17 ↔ R23  (sheet)
  - T18 ↔ R23  (sheet)
  - R23 ↔ G31  (sheet)
  - S24 ↔ G31  (sheet)
  - … +7 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=24 · exposed=11 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=240 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=140 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.1168 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 54 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`1MSI.ensemble.pdb`)
- RMSF mean=0.03Å max=0.096Å (per-residue in .per_residue.csv)
- most flexible residues: 29, 1, 19, 60, 14

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1MSI.pae.csv`
- mean=0.02Å · max=0.123Å · AlphaFold-PAE analog (low block = rigid unit/domain)
