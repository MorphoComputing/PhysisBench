# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1KTH\sequence\1KTH.pdb`
- output_pdb: `general_benchmark\model_refinement\homologs\1KTH\seeds\seed_1\1KTH.pdb`
- residues: 56
- mode: oracle
- ca_rmsd: 1.314 A
- tm_score_ca_ordered: 0.9478503825818859
- heavy_atom_rmsd: 3.304 A
- sidechain_heavy_atom_rmsd: 4.232 A
- **all-atom quality (honest):** heavy 3.304 A, sidechain 4.232 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/48 (0.0)
- lj_severe: 0
- lj_near: 2
- distogram_pairs: 1275
- bin_accuracy: 0.909

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=36
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 1.3136412666875537
- ga_delta_rmsd: -0.20862380655322643  ga_fitness_mode: energy
- pre_local_rmsd: 1.3213347154032258  localized_anchor_rmsd: 1.3136091959619587

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_NEAR_MISS_LT_1A`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=16 · strand(E)=23 · 3-10(G)=11 · coil(C)=6

```
EEHHHEECGHEEECECEGEEECGHHGHEEECECGGGEGEEGHEEGEHHHHHHGHHE
```

## Backbone H-bond Network

- total=46 · helix(i→i+4)=4 · sheet=42
  - Q47 ↔ E51  (helix)
  - K48 ↔ K52  (helix)
  - C50 ↔ C54  (helix)
  - E51 ↔ A55  (helix)
  - T1 ↔ L6  (sheet)
  - T1 ↔ P7  (sheet)
  - D2 ↔ P7  (sheet)
  - L6 ↔ Y21  (sheet)
  - P7 ↔ W20  (sheet)
  - P7 ↔ Y21  (sheet)
  - G11 ↔ I17  (sheet)
  - G11 ↔ K19  (sheet)
  - T12 ↔ I17  (sheet)
  - I17 ↔ F32  (sheet)
  - I17 ↔ C37  (sheet)
  - K19 ↔ C29  (sheet)
  - K19 ↔ A30  (sheet)
  - K19 ↔ F32  (sheet)
  - K19 ↔ G39  (sheet)
  - W20 ↔ S28  (sheet)
  - … +26 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=17 · exposed=21 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=229 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=135 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.0818 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=2 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C4–C54, C13–C37, C29–C50

## Side-chain Rotamers (χ1/χ2)

- 48 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
