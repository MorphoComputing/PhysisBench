# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1UBQ\sequence\1UBQ.pdb`
- output_pdb: `general_benchmark\model_refinement\af2\1UBQ\seeds\seed_0\1UBQ.pdb`
- residues: 74
- mode: oracle
- ca_rmsd: 0.944 A
- tm_score_ca_ordered: 0.9621288128526317
- heavy_atom_rmsd: 2.845 A
- sidechain_heavy_atom_rmsd: 3.565 A
- **all-atom quality (honest):** heavy 2.845 A, sidechain 3.565 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/67 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 2556
- bin_accuracy: 0.936

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=39
- rigid_domain_reconvergence: applied=True accepted=1 rmsd=0.9418349944911172 -> 0.882469868580992 A
- topology_reconvergence: applied=True accepted=0/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.9437085618350338
- ga_delta_rmsd: -0.06330783453425914  ga_fitness_mode: energy
- pre_local_rmsd: 0.9457777031152511  localized_anchor_rmsd: 0.9437068574370644

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=26 · strand(E)=24 · 3-10(G)=22 · coil(C)=2

```
EEEGGEHGGEEGGGGEEHHEEHHHHHHHHHHGEHEGHHHEGGCEHHEGGGGHEEHHHGHEEHHEEGEGGGCGEE
```

## Backbone H-bond Network

- total=38 · helix(i→i+4)=13 · sheet=25
  - P18 ↔ I22  (helix)
  - S19 ↔ E23  (helix)
  - I22 ↔ K26  (helix)
  - E23 ↔ A27  (helix)
  - N24 ↔ K28  (helix)
  - V25 ↔ I29  (helix)
  - K26 ↔ Q30  (helix)
  - A27 ↔ D31  (helix)
  - Q30 ↔ G34  (helix)
  - G34 ↔ D38  (helix)
  - G52 ↔ S56  (helix)
  - L55 ↔ N59  (helix)
  - N59 ↔ E63  (helix)
  - Q1 ↔ T11  (sheet)
  - Q1 ↔ V16  (sheet)
  - Q1 ↔ E17  (sheet)
  - Q1 ↔ D20  (sheet)
  - I2 ↔ T11  (sheet)
  - I2 ↔ V16  (sheet)
  - I2 ↔ E17  (sheet)
  - … +18 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=33 · exposed=12 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=253 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=118 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.0678 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 67 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`1UBQ.ensemble.pdb`)
- RMSF mean=0.024Å max=0.067Å (per-residue in .per_residue.csv)
- most flexible residues: 56, 46, 3, 68, 43

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1UBQ.pae.csv`
- mean=0.017Å · max=0.119Å · AlphaFold-PAE analog (low block = rigid unit/domain)
