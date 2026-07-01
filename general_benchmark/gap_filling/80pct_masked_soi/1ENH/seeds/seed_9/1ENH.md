# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1ENH\sequence\1ENH.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1ENH\seeds\seed_9\1ENH.pdb`
- residues: 52
- mode: oracle
- ca_rmsd: 0.468 A
- tm_score_ca_ordered: 0.9639604544831636
- heavy_atom_rmsd: 3.047 A
- sidechain_heavy_atom_rmsd: 3.884 A
- **all-atom quality (honest):** heavy 3.047 A, sidechain 3.884 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/47 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 438
- bin_accuracy: 0.890

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=rejected_local_chirality_regression tested=36
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.4676874504341813
- ga_delta_rmsd: 5.361908293855484  ga_fitness_mode: energy
- pre_local_rmsd: 0.4836417259344342  localized_anchor_rmsd: 0.4676880806679733

## Failure Classification

- primary_reason: `HEAVY_ATOM_RMSD_HIGH`
- reasons: `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=33 · strand(E)=13 · 3-10(G)=6 · coil(C)=0

```
EEEEEEGHHHHHGHHGHHHEHEEGHHHHEHHHHGHHEHHHHHHHGHEHHHHE
```

## Backbone H-bond Network

- total=20 · helix(i→i+4)=17 · sheet=3
  - E8 ↔ R12  (helix)
  - L10 ↔ K14  (helix)
  - A11 ↔ R15  (helix)
  - K14 ↔ N18  (helix)
  - R15 ↔ E19  (helix)
  - F17 ↔ R21  (helix)
  - R21 ↔ E25  (helix)
  - R26 ↔ Q30  (helix)
  - R27 ↔ L31  (helix)
  - R28 ↔ S32  (helix)
  - S32 ↔ G36  (helix)
  - G36 ↔ A40  (helix)
  - E39 ↔ K43  (helix)
  - A40 ↔ I44  (helix)
  - I42 ↔ F46  (helix)
  - I44 ↔ N48  (helix)
  - F46 ↔ R50  (helix)
  - L23 ↔ Q29  (sheet)
  - Q29 ↔ L37  (sheet)
  - Q47 ↔ K52  (sheet)

## Solvent Accessibility (burial)

- buried=12 · exposed=22 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=148 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=19 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.4559 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 47 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
