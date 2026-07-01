# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2ACY\sequence\2ACY.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\2ACY\seeds\seed_7\2ACY.pdb`
- residues: 96
- mode: oracle
- ca_rmsd: 0.471 A
- tm_score_ca_ordered: 0.983460786223417
- heavy_atom_rmsd: 3.168 A
- sidechain_heavy_atom_rmsd: 4.184 A
- **all-atom quality (honest):** heavy 3.168 A, sidechain 4.184 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/83 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 1237
- bin_accuracy: 0.920

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=residue_block reason=accepted tested=54
- rigid_domain_reconvergence: applied=True accepted=7 rmsd=7.111403712833252 -> 6.38701014580168 A
- topology_reconvergence: applied=True accepted=0/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.4705476812843893
- ga_delta_rmsd: 5.759420709983069  ga_fitness_mode: energy
- pre_local_rmsd: 0.4759884318865422  localized_anchor_rmsd: 0.4705360586289343

## Failure Classification

- primary_reason: `HEAVY_ATOM_RMSD_HIGH`
- reasons: `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=28 · strand(E)=40 · 3-10(G)=17 · coil(C)=11

```
EECECEEEEEEEGEGEEHEHHHGHHGHHHHHHGEGEECECGHEHECEEEEEECHHHHHHHHHHHGEEECHHEECEEGECECGEGGGEEGEHEGGGC
```

## Backbone H-bond Network

- total=53 · helix(i→i+4)=14 · sheet=39
  - G18 ↔ R22  (helix)
  - F20 ↔ Y24  (helix)
  - F21 ↔ T25  (helix)
  - Y24 ↔ E28  (helix)
  - T25 ↔ G29  (helix)
  - A27 ↔ K31  (helix)
  - E28 ↔ L32  (helix)
  - A54 ↔ R58  (helix)
  - S55 ↔ H59  (helix)
  - K56 ↔ M60  (helix)
  - V57 ↔ Q61  (helix)
  - R58 ↔ E62  (helix)
  - H59 ↔ W63  (helix)
  - M60 ↔ L64  (helix)
  - E1 ↔ I6  (sheet)
  - E1 ↔ S7  (sheet)
  - E11 ↔ V16  (sheet)
  - I12 ↔ Q17  (sheet)
  - G14 ↔ V19  (sheet)
  - L34 ↔ G48  (sheet)
  - … +33 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=44 · exposed=28 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=380 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=207 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.4388 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 83 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
