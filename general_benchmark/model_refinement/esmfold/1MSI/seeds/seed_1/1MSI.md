# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1MSI\sequence\1MSI.pdb`
- output_pdb: `general_benchmark\model_refinement\esmfold\1MSI\seeds\seed_1\1MSI.pdb`
- residues: 64
- mode: oracle
- ca_rmsd: 0.377 A
- tm_score_ca_ordered: 0.9838968583663374
- heavy_atom_rmsd: 2.629 A
- sidechain_heavy_atom_rmsd: 3.535 A
- **all-atom quality (honest):** heavy 2.629 A, sidechain 3.535 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/54 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 1891
- bin_accuracy: 0.923

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=36
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.37653775204413936
- ga_delta_rmsd: 0.01176510174772366  ga_fitness_mode: energy
- pre_local_rmsd: 0.3829125617643447  localized_anchor_rmsd: 0.3765277567536723

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=19 · strand(E)=21 · 3-10(G)=16 · coil(C)=8

```
EEGECGGHECGEGHEGEEHHHEECEGEEGCECCHHHHHHHHHEEGGECGEGHEGGGHHHEGHEC
```

## Backbone H-bond Network

- total=26 · helix(i→i+4)=5 · sheet=21
  - A34 ↔ P38  (helix)
  - E35 ↔ R39  (helix)
  - D36 ↔ L40  (helix)
  - P38 ↔ S42  (helix)
  - D58 ↔ G62  (helix)
  - S4 ↔ M22  (sheet)
  - S4 ↔ R23  (sheet)
  - Q9 ↔ T15  (sheet)
  - Q9 ↔ L17  (sheet)
  - Q9 ↔ T18  (sheet)
  - Q9 ↔ M22  (sheet)
  - Q9 ↔ R23  (sheet)
  - P12 ↔ L17  (sheet)
  - P12 ↔ T18  (sheet)
  - T15 ↔ M22  (sheet)
  - L17 ↔ M22  (sheet)
  - L17 ↔ R23  (sheet)
  - T18 ↔ R23  (sheet)
  - R23 ↔ G31  (sheet)
  - E25 ↔ G31  (sheet)
  - … +6 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=24 · exposed=11 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=241 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=141 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.1167 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 54 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
