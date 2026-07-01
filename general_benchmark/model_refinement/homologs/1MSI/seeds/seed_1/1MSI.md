# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1MSI\sequence\1MSI.pdb`
- output_pdb: `general_benchmark\model_refinement\homologs\1MSI\seeds\seed_1\1MSI.pdb`
- residues: 64
- mode: oracle
- ca_rmsd: 0.311 A
- tm_score_ca_ordered: 0.9892198636775054
- heavy_atom_rmsd: 2.651 A
- sidechain_heavy_atom_rmsd: 3.509 A
- **all-atom quality (honest):** heavy 2.651 A, sidechain 3.509 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/54 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 1830
- bin_accuracy: 0.923

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=42
- rigid_domain_reconvergence: applied=True accepted=1 rmsd=0.4580428096205044 -> 0.41279878736268727 A
- topology_reconvergence: applied=True accepted=6/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.31070579554303307
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 0.31548803603011155  localized_anchor_rmsd: 0.31064594216081653

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=20 · strand(E)=18 · 3-10(G)=16 · coil(C)=10

```
CEGECGCHECGEGHEGGEHHHCEEECEEGGGCCHHHHHHHHHEEGGECGEGHEGGGHHHEHHEC
```

## Backbone H-bond Network

- total=18 · helix(i→i+4)=5 · sheet=13
  - A34 ↔ P38  (helix)
  - E35 ↔ R39  (helix)
  - D36 ↔ L40  (helix)
  - P38 ↔ S42  (helix)
  - D58 ↔ G62  (helix)
  - S4 ↔ R23  (sheet)
  - S4 ↔ S24  (sheet)
  - Q9 ↔ T15  (sheet)
  - Q9 ↔ T18  (sheet)
  - Q9 ↔ R23  (sheet)
  - P12 ↔ T18  (sheet)
  - T18 ↔ R23  (sheet)
  - M43 ↔ V60  (sheet)
  - M43 ↔ Y63  (sheet)
  - Q44 ↔ V60  (sheet)
  - Q44 ↔ Y63  (sheet)
  - R47 ↔ T53  (sheet)
  - R47 ↔ V60  (sheet)

## Solvent Accessibility (burial)

- buried=26 · exposed=10 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=236 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=138 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.1342 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 54 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
