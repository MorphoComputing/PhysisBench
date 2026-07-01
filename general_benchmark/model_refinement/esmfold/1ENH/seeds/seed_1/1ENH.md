# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1ENH\sequence\1ENH.pdb`
- output_pdb: `general_benchmark\model_refinement\esmfold\1ENH\seeds\seed_1\1ENH.pdb`
- residues: 52
- mode: oracle
- ca_rmsd: 0.719 A
- tm_score_ca_ordered: 0.9383518418243832
- heavy_atom_rmsd: 2.785 A
- sidechain_heavy_atom_rmsd: 3.464 A
- **all-atom quality (honest):** heavy 2.785 A, sidechain 3.464 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/47 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 1225
- bin_accuracy: 0.882

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=36
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.7186619983057514
- ga_delta_rmsd: 0.0008158331263997676  ga_fitness_mode: energy
- pre_local_rmsd: 0.847311234144223  localized_anchor_rmsd: 0.718666161671594

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=38 · strand(E)=9 · 3-10(G)=4 · coil(C)=1

```
EECGEEHHHHHHHHHHHHHEHEEGHHHHHHHHHGGHEHHHHHHHHHHHHHHE
```

## Backbone H-bond Network

- total=27 · helix(i→i+4)=27 · sheet=0
  - S7 ↔ A11  (helix)
  - E8 ↔ R12  (helix)
  - Q9 ↔ L13  (helix)
  - L10 ↔ K14  (helix)
  - A11 ↔ R15  (helix)
  - R12 ↔ E16  (helix)
  - L13 ↔ F17  (helix)
  - K14 ↔ N18  (helix)
  - R15 ↔ E19  (helix)
  - F17 ↔ R21  (helix)
  - R21 ↔ E25  (helix)
  - E25 ↔ Q29  (helix)
  - R26 ↔ Q30  (helix)
  - R27 ↔ L31  (helix)
  - R28 ↔ S32  (helix)
  - Q29 ↔ S33  (helix)
  - S32 ↔ G36  (helix)
  - G36 ↔ A40  (helix)
  - E39 ↔ K43  (helix)
  - A40 ↔ I44  (helix)
  - … +7 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=19 · exposed=17 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=147 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=18 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.1356 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 47 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
