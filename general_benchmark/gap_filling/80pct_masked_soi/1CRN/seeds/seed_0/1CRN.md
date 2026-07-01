# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1CRN\sequence\1CRN.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1CRN\seeds\seed_0\1CRN.pdb`
- residues: 44
- mode: oracle
- ca_rmsd: 1.549 A
- tm_score_ca_ordered: 0.7667330536569128
- heavy_atom_rmsd: 3.179 A
- sidechain_heavy_atom_rmsd: 4.112 A
- **all-atom quality (honest):** heavy 3.179 A, sidechain 4.112 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/35 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 329
- bin_accuracy: 0.821

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=30
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 1.5486807511502605
- ga_delta_rmsd: 0.06765563308114109  ga_fitness_mode: energy
- pre_local_rmsd: 1.5719672083355256  localized_anchor_rmsd: 1.548654143199926

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=17 · strand(E)=15 · 3-10(G)=8 · coil(C)=4

```
EEGCECHHHHGHEHHHEHEEEGHHGHHGCGEGEEEEGCHEHHHE
```

## Backbone H-bond Network

- total=17 · helix(i→i+4)=6 · sheet=11
  - A8 ↔ F12  (helix)
  - S10 ↔ V14  (helix)
  - F12 ↔ R16  (helix)
  - V14 ↔ P18  (helix)
  - A23 ↔ T27  (helix)
  - C39 ↔ Y43  (helix)
  - T1 ↔ N13  (sheet)
  - T1 ↔ P21  (sheet)
  - C2 ↔ N13  (sheet)
  - N13 ↔ G19  (sheet)
  - N13 ↔ T20  (sheet)
  - N13 ↔ P21  (sheet)
  - N13 ↔ C31  (sheet)
  - P21 ↔ I33  (sheet)
  - C31 ↔ A44  (sheet)
  - I33 ↔ P40  (sheet)
  - I34 ↔ P40  (sheet)

## Solvent Accessibility (burial)

- buried=17 · exposed=14 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=143 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=45 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.5101 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C2–C39, C3–C31, C15–C25

## Side-chain Rotamers (χ1/χ2)

- 35 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
