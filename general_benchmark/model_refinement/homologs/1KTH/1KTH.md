# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1KTH\sequence\1KTH.pdb`
- output_pdb: `general_benchmark\model_refinement\homologs\1KTH\seeds\seed_0\1KTH.pdb`
- residues: 56
- mode: oracle
- ca_rmsd: 0.566 A
- tm_score_ca_ordered: 0.9745382233945659
- heavy_atom_rmsd: 2.742 A
- sidechain_heavy_atom_rmsd: 3.579 A
- **all-atom quality (honest):** heavy 2.742 A, sidechain 3.579 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/48 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 1275
- bin_accuracy: 0.934

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=39
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.5656642178171354
- ga_delta_rmsd: 0.21303365614613268  ga_fitness_mode: energy
- pre_local_rmsd: 0.5697898072389807  localized_anchor_rmsd: 0.56571238528358

## Failure Classification

- primary_reason: `LOCAL_HOTSPOT_REMAINS`
- reasons: `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=16 · strand(E)=23 · 3-10(G)=10 · coil(C)=7

```
EEHHHEECGHGEECECECEEECGHHGHEEGEECGGGEHEEHHCEGEHHHHHHGEEE
```

## Backbone H-bond Network

- total=38 · helix(i→i+4)=3 · sheet=35
  - G38 ↔ N42  (helix)
  - Q47 ↔ E51  (helix)
  - K48 ↔ K52  (helix)
  - T1 ↔ L6  (sheet)
  - D2 ↔ P7  (sheet)
  - L6 ↔ Y21  (sheet)
  - P7 ↔ W20  (sheet)
  - P7 ↔ Y21  (sheet)
  - T12 ↔ I17  (sheet)
  - I17 ↔ R31  (sheet)
  - I17 ↔ F32  (sheet)
  - I17 ↔ C37  (sheet)
  - K19 ↔ C29  (sheet)
  - K19 ↔ R31  (sheet)
  - K19 ↔ F32  (sheet)
  - K19 ↔ G39  (sheet)
  - W20 ↔ S28  (sheet)
  - W20 ↔ C29  (sheet)
  - W20 ↔ R31  (sheet)
  - W20 ↔ F32  (sheet)
  - … +18 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=17 · exposed=20 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=200 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=112 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.0797 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C4–C54, C13–C37, C29–C50

## Side-chain Rotamers (χ1/χ2)

- 48 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`1KTH.ensemble.pdb`)
- RMSF mean=0.31Å max=4.669Å (per-residue in .per_residue.csv)
- most flexible residues: 56, 55, 1, 14, 15

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1KTH.pae.csv`
- mean=0.226Å · max=4.899Å · AlphaFold-PAE analog (low block = rigid unit/domain)
