# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2ACY\sequence\2ACY.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\2ACY\seeds\seed_9\2ACY.pdb`
- residues: 96
- mode: oracle
- ca_rmsd: 0.514 A
- tm_score_ca_ordered: 0.9812117181288819
- heavy_atom_rmsd: 2.967 A
- sidechain_heavy_atom_rmsd: 3.855 A
- **all-atom quality (honest):** heavy 2.967 A, sidechain 3.855 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/83 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 1236
- bin_accuracy: 0.924

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=rejected_domain_topology_regression tested=48
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.5139671498630018
- ga_delta_rmsd: 7.665869328662095  ga_fitness_mode: energy
- pre_local_rmsd: 0.51705263431956  localized_anchor_rmsd: 0.5139634253934997

## Failure Classification

- primary_reason: `LOCAL_HOTSPOT_REMAINS`
- reasons: `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=27 · strand(E)=39 · 3-10(G)=19 · coil(C)=11

```
ECEECECEEEGEGEHCEHEHHGHHHGHHHHHGGEGEEEECEHEHECEEEEEECGHGHHHHHHHHHEECEHHEGCEEGGGECGEHEGEEGEGEGEGC
```

## Backbone H-bond Network

- total=53 · helix(i→i+4)=12 · sheet=41
  - F20 ↔ Y24  (helix)
  - F21 ↔ T25  (helix)
  - K23 ↔ A27  (helix)
  - Y24 ↔ E28  (helix)
  - T25 ↔ G29  (helix)
  - A27 ↔ K31  (helix)
  - S55 ↔ H59  (helix)
  - V57 ↔ Q61  (helix)
  - R58 ↔ E62  (helix)
  - H59 ↔ W63  (helix)
  - M60 ↔ L64  (helix)
  - Q61 ↔ E65  (helix)
  - E1 ↔ I6  (sheet)
  - I12 ↔ Q17  (sheet)
  - G14 ↔ V19  (sheet)
  - L34 ↔ G48  (sheet)
  - L34 ↔ Q49  (sheet)
  - L34 ↔ L50  (sheet)
  - L34 ↔ Q51  (sheet)
  - L34 ↔ G52  (sheet)
  - … +33 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=43 · exposed=28 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=383 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=212 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.4365 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 83 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
