# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1POH\sequence\1POH.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1POH\seeds\seed_9\1POH.pdb`
- residues: 83
- mode: oracle
- ca_rmsd: 0.355 A
- tm_score_ca_ordered: 0.9888633939289925
- heavy_atom_rmsd: 2.603 A
- sidechain_heavy_atom_rmsd: 3.483 A
- **all-atom quality (honest):** heavy 2.603 A, sidechain 3.483 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.012
- rotamer_outliers: 0/68 (0.0)
- lj_severe: 0
- lj_near: 1
- distogram_pairs: 957
- bin_accuracy: 0.933

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=48
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.3548577742874563
- ga_delta_rmsd: 0.7977819528035013  ga_fitness_mode: energy
- pre_local_rmsd: 0.35703841313742074  localized_anchor_rmsd: 0.35491211092340047

## Failure Classification

- primary_reason: `HEAVY_ATOM_RMSD_HIGH`
- reasons: `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=32 · strand(E)=22 · 3-10(G)=16 · coil(C)=13

```
EEEEGECCEGGCGGGGHHHHHHHHHHHECECGEGCEHGEEECHHEHHHHHHEHHECEEEGCCEEGEHCCHGHHGHGHHHHHGC
```

## Backbone H-bond Network

- total=32 · helix(i→i+4)=15 · sheet=17
  - P17 ↔ F21  (helix)
  - A18 ↔ V22  (helix)
  - A19 ↔ K23  (helix)
  - Q20 ↔ E24  (helix)
  - F21 ↔ A25  (helix)
  - V22 ↔ K26  (helix)
  - K23 ↔ G27  (helix)
  - A43 ↔ F47  (helix)
  - K44 ↔ K48  (helix)
  - L46 ↔ Q50  (helix)
  - F47 ↔ T51  (helix)
  - Q50 ↔ L54  (helix)
  - V73 ↔ V77  (helix)
  - H75 ↔ L79  (helix)
  - V77 ↔ A81  (helix)
  - F28 ↔ T33  (sheet)
  - T33 ↔ K39  (sheet)
  - T33 ↔ S40  (sheet)
  - T33 ↔ A41  (sheet)
  - T33 ↔ S45  (sheet)
  - … +12 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=32 · exposed=23 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=317 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=155 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.4466 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=1 (steric clashes)
- ramachandran_forbidden_fraction=0.012

## Side-chain Rotamers (χ1/χ2)

- 68 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
