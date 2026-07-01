# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1KTH\sequence\1KTH.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1KTH\seeds\seed_2\1KTH.pdb`
- residues: 56
- mode: oracle
- ca_rmsd: 0.520 A
- tm_score_ca_ordered: 0.9609644241565783
- heavy_atom_rmsd: 2.956 A
- sidechain_heavy_atom_rmsd: 3.857 A
- **all-atom quality (honest):** heavy 2.956 A, sidechain 3.857 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/48 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 489
- bin_accuracy: 0.908

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=residue_block reason=accepted tested=45
- rigid_domain_reconvergence: applied=True accepted=12 rmsd=5.396131037004274 -> 4.431927247648015 A
- topology_reconvergence: applied=True accepted=0/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.5199685918238034
- ga_delta_rmsd: 3.195050265768671  ga_fitness_mode: energy
- pre_local_rmsd: 0.5327869001809704  localized_anchor_rmsd: 0.520020529921204

## Failure Classification

- primary_reason: `HEAVY_ATOM_RMSD_HIGH`
- reasons: `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=11 · strand(E)=25 · 3-10(G)=10 · coil(C)=10

```
CECHHEEGEGGCECECECEEEEGHEGHEEGEEEGHCECEECHCEGEHHHHGHGEEE
```

## Backbone H-bond Network

- total=61 · helix(i→i+4)=1 · sheet=60
  - K48 ↔ K52  (helix)
  - D2 ↔ P7  (sheet)
  - D2 ↔ Y22  (sheet)
  - L6 ↔ W20  (sheet)
  - L6 ↔ Y21  (sheet)
  - L6 ↔ Y22  (sheet)
  - L6 ↔ N25  (sheet)
  - P7 ↔ W20  (sheet)
  - P7 ↔ Y21  (sheet)
  - P7 ↔ Y22  (sheet)
  - P7 ↔ N25  (sheet)
  - D9 ↔ I17  (sheet)
  - D9 ↔ K19  (sheet)
  - D9 ↔ W20  (sheet)
  - D9 ↔ Y21  (sheet)
  - D9 ↔ Y22  (sheet)
  - C13 ↔ W33  (sheet)
  - D15 ↔ W33  (sheet)
  - I17 ↔ R31  (sheet)
  - I17 ↔ F32  (sheet)
  - … +41 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=18 · exposed=22 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=203 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=116 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.4596 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C4–C54, C13–C37, C29–C50

## Side-chain Rotamers (χ1/χ2)

- 48 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
