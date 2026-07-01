# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1MSI\sequence\1MSI.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1MSI\seeds\seed_2\1MSI.pdb`
- residues: 64
- mode: oracle
- ca_rmsd: 0.416 A
- tm_score_ca_ordered: 0.9784406769708417
- heavy_atom_rmsd: 2.629 A
- sidechain_heavy_atom_rmsd: 3.573 A
- **all-atom quality (honest):** heavy 2.629 A, sidechain 3.573 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/54 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 612
- bin_accuracy: 0.904

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=39
- rigid_domain_reconvergence: applied=True accepted=8 rmsd=6.502677298264945 -> 5.679256949958001 A
- topology_reconvergence: applied=True accepted=1/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.41619090509281226
- ga_delta_rmsd: 4.61100047787078  ga_fitness_mode: energy
- pre_local_rmsd: 0.4346928397336583  localized_anchor_rmsd: 0.41616895085703115

## Failure Classification

- primary_reason: `HEAVY_ATOM_RMSD_HIGH`
- reasons: `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=14 · strand(E)=25 · 3-10(G)=13 · coil(C)=12

```
CEEEGGCHECGEEHEECEGHHCECEGEEGCECCHHHHHEHEHEEEGECGECHEGGGGHHECGEE
```

## Backbone H-bond Network

- total=21 · helix(i→i+4)=3 · sheet=18
  - A34 ↔ P38  (helix)
  - D36 ↔ L40  (helix)
  - P38 ↔ S42  (helix)
  - A3 ↔ R23  (sheet)
  - S4 ↔ R23  (sheet)
  - Q9 ↔ T15  (sheet)
  - Q9 ↔ T18  (sheet)
  - Q9 ↔ R23  (sheet)
  - T18 ↔ R23  (sheet)
  - E25 ↔ G31  (sheet)
  - R39 ↔ Q44  (sheet)
  - V41 ↔ V60  (sheet)
  - M43 ↔ V60  (sheet)
  - M43 ↔ Y63  (sheet)
  - Q44 ↔ V60  (sheet)
  - Q44 ↔ Y63  (sheet)
  - V45 ↔ P50  (sheet)
  - V45 ↔ V60  (sheet)
  - V45 ↔ Y63  (sheet)
  - R47 ↔ T53  (sheet)
  - … +1 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=22 · exposed=11 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=240 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=141 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.4478 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 54 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
