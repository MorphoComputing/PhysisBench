# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1EGF\sequence\1EGF.pdb`
- output_pdb: `general_benchmark\model_refinement\homologs\1EGF\seeds\seed_1\1EGF.pdb`
- residues: 51
- mode: oracle
- ca_rmsd: 5.352 A
- tm_score_ca_ordered: 0.3664769216552119
- heavy_atom_rmsd: 6.235 A
- sidechain_heavy_atom_rmsd: 6.855 A
- **all-atom quality (honest):** heavy 6.235 A, sidechain 6.855 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/45 (0.0)
- lj_severe: 0
- lj_near: 5
- distogram_pairs: 600
- bin_accuracy: 0.850

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=30
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 5.3518600757610155
- ga_delta_rmsd: -1.1402147309217634  ga_fitness_mode: energy
- pre_local_rmsd: 5.3860907279063195  localized_anchor_rmsd: 5.351861508465552

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=18 · strand(E)=20 · 3-10(G)=9 · coil(C)=4

```
CEEGHHEEHEHHEGEHEGGHEHEGCEECEEGGEHGHEHHEHHGHEEEHHHC
```

## Backbone H-bond Network

- total=46 · helix(i→i+4)=6 · sheet=40
  - C5 ↔ Y9  (helix)
  - Y12 ↔ G16  (helix)
  - G16 ↔ M20  (helix)
  - I34 ↔ G38  (helix)
  - G38 ↔ Q42  (helix)
  - R44 ↔ W48  (helix)
  - Y2 ↔ S7  (sheet)
  - Y2 ↔ S8  (sheet)
  - Y2 ↔ H21  (sheet)
  - P3 ↔ S8  (sheet)
  - P3 ↔ H21  (sheet)
  - P3 ↔ E23  (sheet)
  - S7 ↔ H21  (sheet)
  - S7 ↔ S27  (sheet)
  - S8 ↔ C13  (sheet)
  - S8 ↔ H21  (sheet)
  - S8 ↔ S27  (sheet)
  - D10 ↔ G17  (sheet)
  - D10 ↔ T29  (sheet)
  - D10 ↔ C30  (sheet)
  - … +26 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=25 · exposed=12 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=207 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=107 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.1125 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=5 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C19, C13–C30, C32–C41

## Side-chain Rotamers (χ1/χ2)

- 45 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
