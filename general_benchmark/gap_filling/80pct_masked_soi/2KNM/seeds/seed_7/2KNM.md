# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2KNM\sequence\2KNM.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\2KNM\seeds\seed_7\2KNM.pdb`
- residues: 28
- mode: oracle
- ca_rmsd: 1.592 A
- tm_score_ca_ordered: 0.49631130453099503
- heavy_atom_rmsd: 3.047 A
- sidechain_heavy_atom_rmsd: 3.889 A
- **all-atom quality (honest):** heavy 3.047 A, sidechain 3.889 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 2
- distogram_pairs: 159
- bin_accuracy: 0.723

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=domain_block reason=accepted tested=27
- rigid_domain_reconvergence: applied=True accepted=6 rmsd=3.8052033882509346 -> 3.4304867345972223 A
- topology_reconvergence: applied=True accepted=32/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 1.5924257831238422
- ga_delta_rmsd: 0.3157351583092125  ga_fitness_mode: energy
- pre_local_rmsd: 1.5924430860656908  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=6 · strand(E)=13 · 3-10(G)=5 · coil(C)=4

```
CEGGEEECGEECHHHEGEEGHEHHECEE
```

## Backbone H-bond Network

- total=32 · helix(i→i+4)=0 · sheet=32
  - P2 ↔ C7  (sheet)
  - P2 ↔ P11  (sheet)
  - P2 ↔ G18  (sheet)
  - P2 ↔ C19  (sheet)
  - P2 ↔ K22  (sheet)
  - E5 ↔ I10  (sheet)
  - E5 ↔ P11  (sheet)
  - E5 ↔ C19  (sheet)
  - E5 ↔ K22  (sheet)
  - E5 ↔ V25  (sheet)
  - S6 ↔ P11  (sheet)
  - S6 ↔ C19  (sheet)
  - S6 ↔ K22  (sheet)
  - S6 ↔ V25  (sheet)
  - C7 ↔ C19  (sheet)
  - C7 ↔ K22  (sheet)
  - C7 ↔ V25  (sheet)
  - C7 ↔ Y27  (sheet)
  - I10 ↔ V25  (sheet)
  - P11 ↔ C19  (sheet)
  - … +12 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=12 · exposed=9 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=108 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=57 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.6526 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=2 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C19, C7–C21, C12–C26

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
