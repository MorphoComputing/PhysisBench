# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1UBQ\sequence\1UBQ.pdb`
- output_pdb: `general_benchmark\evidence_ladder\50pct_masked\1UBQ\seeds\seed_1\1UBQ.pdb`
- residues: 74
- mode: oracle
- ca_rmsd: 0.135 A
- tm_score_ca_ordered: 0.9980798674878126
- heavy_atom_rmsd: 2.929 A
- sidechain_heavy_atom_rmsd: 3.821 A
- **all-atom quality (honest):** heavy 2.929 A, sidechain 3.821 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/67 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 1278
- bin_accuracy: 0.973

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=48
- rigid_domain_reconvergence: applied=True accepted=1 rmsd=0.18396358368810112 -> 0.16991344601674202 A
- topology_reconvergence: applied=True accepted=4/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.13544998646133144
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 0.13754625358667863  localized_anchor_rmsd: 0.13546247725065302

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=27 · strand(E)=23 · 3-10(G)=19 · coil(C)=5

```
CEEGGGHHHEEGEGCEEHHEEHHHHHHHHHHGCGEGHHHECGCEHHEGGEGHEEHHHGHEEHHEEGEGGEGGGE
```

## Backbone H-bond Network

- total=34 · helix(i→i+4)=11 · sheet=23
  - P18 ↔ I22  (helix)
  - S19 ↔ E23  (helix)
  - I22 ↔ K26  (helix)
  - E23 ↔ A27  (helix)
  - N24 ↔ K28  (helix)
  - V25 ↔ I29  (helix)
  - K26 ↔ Q30  (helix)
  - A27 ↔ D31  (helix)
  - G52 ↔ S56  (helix)
  - L55 ↔ N59  (helix)
  - N59 ↔ E63  (helix)
  - I2 ↔ T11  (sheet)
  - I2 ↔ T13  (sheet)
  - I2 ↔ V16  (sheet)
  - I2 ↔ E17  (sheet)
  - I2 ↔ D20  (sheet)
  - F3 ↔ K10  (sheet)
  - F3 ↔ T11  (sheet)
  - F3 ↔ T13  (sheet)
  - F3 ↔ V16  (sheet)
  - … +14 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=44 · exposed=5 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=240 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=108 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.6468 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 67 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`1UBQ.ensemble.pdb`)
- RMSF mean=0.028Å max=0.178Å (per-residue in .per_residue.csv)
- most flexible residues: 74, 2, 66, 14, 3

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1UBQ.pae.csv`
- mean=0.019Å · max=0.127Å · AlphaFold-PAE analog (low block = rigid unit/domain)
