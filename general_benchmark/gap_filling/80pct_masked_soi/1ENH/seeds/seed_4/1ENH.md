# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1ENH\sequence\1ENH.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1ENH\seeds\seed_4\1ENH.pdb`
- residues: 52
- mode: oracle
- ca_rmsd: 0.494 A
- tm_score_ca_ordered: 0.9650472784699391
- heavy_atom_rmsd: 3.120 A
- sidechain_heavy_atom_rmsd: 3.943 A
- **all-atom quality (honest):** heavy 3.120 A, sidechain 3.943 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/47 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 439
- bin_accuracy: 0.893

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=36
- rigid_domain_reconvergence: applied=True accepted=6 rmsd=5.628306210436934 -> 5.178081048950097 A
- topology_reconvergence: applied=True accepted=13/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.4939337293664523
- ga_delta_rmsd: 2.7367309185771007  ga_fitness_mode: energy
- pre_local_rmsd: 0.5024570243481671  localized_anchor_rmsd: 0.49387540423933207

## Failure Classification

- primary_reason: `LOCAL_HOTSPOT_REMAINS`
- reasons: `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=30 · strand(E)=11 · 3-10(G)=9 · coil(C)=2

```
EEECEEEHHHHHHHGHGHHCHEEGHGHHHHHHHGGHEHHHHHGHEHHHGHGE
```

## Backbone H-bond Network

- total=18 · helix(i→i+4)=16 · sheet=2
  - E8 ↔ R12  (helix)
  - Q9 ↔ L13  (helix)
  - L10 ↔ K14  (helix)
  - R12 ↔ E16  (helix)
  - K14 ↔ N18  (helix)
  - R21 ↔ E25  (helix)
  - E25 ↔ Q29  (helix)
  - R27 ↔ L31  (helix)
  - R28 ↔ S32  (helix)
  - Q29 ↔ S33  (helix)
  - S32 ↔ G36  (helix)
  - G36 ↔ A40  (helix)
  - A40 ↔ I44  (helix)
  - I42 ↔ F46  (helix)
  - I44 ↔ N48  (helix)
  - F46 ↔ R50  (helix)
  - L37 ↔ W45  (sheet)
  - W45 ↔ K52  (sheet)

## Solvent Accessibility (burial)

- buried=13 · exposed=20 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=149 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=19 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.4541 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 47 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
