# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1KTH\sequence\1KTH.pdb`
- output_pdb: `general_benchmark\evidence_ladder\50pct_masked\1KTH\seeds\seed_1\1KTH.pdb`
- residues: 56
- mode: oracle
- ca_rmsd: 0.087 A
- tm_score_ca_ordered: 0.9987750010754833
- heavy_atom_rmsd: 3.061 A
- sidechain_heavy_atom_rmsd: 4.110 A
- **all-atom quality (honest):** heavy 3.061 A, sidechain 4.110 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/48 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 716
- bin_accuracy: 0.980

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=39
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=0.1233791200889951 -> 0.12201344306372217 A
- topology_reconvergence: applied=True accepted=21/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.08693834782889048
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 0.08939065884772472  localized_anchor_rmsd: 0.08686648383630796

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=14 · strand(E)=23 · 3-10(G)=11 · coil(C)=8

```
EEHHHEECGHGEEGECECEEECGHHGHEEEEECGGCEGEEGHCEGEHHHHHHGCEE
```

## Backbone H-bond Network

- total=42 · helix(i→i+4)=2 · sheet=40
  - Q47 ↔ E51  (helix)
  - K48 ↔ K52  (helix)
  - T1 ↔ L6  (sheet)
  - D2 ↔ P7  (sheet)
  - L6 ↔ W20  (sheet)
  - L6 ↔ Y21  (sheet)
  - P7 ↔ W20  (sheet)
  - P7 ↔ Y21  (sheet)
  - T12 ↔ I17  (sheet)
  - I17 ↔ R31  (sheet)
  - I17 ↔ F32  (sheet)
  - I17 ↔ C37  (sheet)
  - K19 ↔ C29  (sheet)
  - K19 ↔ A30  (sheet)
  - K19 ↔ R31  (sheet)
  - K19 ↔ F32  (sheet)
  - K19 ↔ G39  (sheet)
  - W20 ↔ S28  (sheet)
  - W20 ↔ C29  (sheet)
  - W20 ↔ A30  (sheet)
  - … +22 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=18 · exposed=20 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=205 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=116 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.6427 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C4–C54, C13–C37, C29–C50

## Side-chain Rotamers (χ1/χ2)

- 48 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
