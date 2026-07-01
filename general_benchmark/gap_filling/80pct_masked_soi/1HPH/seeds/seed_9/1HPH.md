# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1HPH\sequence\1HPH.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1HPH\seeds\seed_9\1HPH.pdb`
- residues: 35
- mode: oracle
- ca_rmsd: 3.477 A
- tm_score_ca_ordered: 0.3382968807868684
- heavy_atom_rmsd: 5.073 A
- sidechain_heavy_atom_rmsd: 6.004 A
- **all-atom quality (honest):** heavy 5.073 A, sidechain 6.004 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/33 (0.0)
- lj_severe: 0
- lj_near: 1
- distogram_pairs: 235
- bin_accuracy: 0.655

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=residue_block reason=accepted tested=24
- rigid_domain_reconvergence: applied=True accepted=7 rmsd=5.384479068409937 -> 4.608610466064892 A
- topology_reconvergence: applied=True accepted=2/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 3.4774463030352702
- ga_delta_rmsd: 0.45595983124072514  ga_fitness_mode: energy
- pre_local_rmsd: 3.477427343642351  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=19 · strand(E)=9 · 3-10(G)=3 · coil(C)=4

```
CEHHHHEHECHEGHCGHEHHHHEHHHHGEHEHHEC
```

## Backbone H-bond Network

- total=13 · helix(i→i+4)=4 · sheet=9
  - I4 ↔ H8  (helix)
  - V20 ↔ R24  (helix)
  - W22 ↔ K26  (helix)
  - K26 ↔ V30  (helix)
  - S2 ↔ M7  (sheet)
  - S2 ↔ N9  (sheet)
  - M7 ↔ K12  (sheet)
  - N9 ↔ E18  (sheet)
  - K12 ↔ E18  (sheet)
  - K12 ↔ L23  (sheet)
  - E18 ↔ L23  (sheet)
  - L23 ↔ D29  (sheet)
  - D29 ↔ V34  (sheet)

## Solvent Accessibility (burial)

- buried=14 · exposed=7 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=89 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=3 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.4185 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=1 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 33 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
