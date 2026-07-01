# Physis Fold — Run Report

**Verdict:** PASS

- reference_pdb: `set\general_benchmark\1CTF\sequence\1CTF.pdb`
- output_pdb: `general_benchmark\evidence_ladder\50pct_masked\1CTF\seeds\seed_0\1CTF.pdb`
- residues: 66
- mode: oracle
- ca_rmsd: 0.070 A
- tm_score_ca_ordered: 0.9993786685218937
- heavy_atom_rmsd: 2.144 A
- sidechain_heavy_atom_rmsd: 2.860 A
- **all-atom quality (honest):** heavy 2.144 A, sidechain 2.860 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/45 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 1008
- bin_accuracy: 0.976

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=45
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=0.1543760084448173 -> 0.15340977433141276 A
- topology_reconvergence: applied=True accepted=6/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.0698282304239379
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 0.0728027568829648  localized_anchor_rmsd: 0.06979290950900577

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`

## Secondary Structure (DSSP-like)

- helix(H)=38 · strand(E)=13 · 3-10(G)=10 · coil(C)=5

```
CECGGHEGEHHHHHHHHHHHHGEHEEGHGHHHHHHGGHEGHEGHEEHHHHHHHHHHHHHHCECEEC
```

## Backbone H-bond Network

- total=28 · helix(i→i+4)=26 · sheet=2
  - K6 ↔ A10  (helix)
  - A10 ↔ A14  (helix)
  - N11 ↔ V15  (helix)
  - K12 ↔ I16  (helix)
  - V13 ↔ K17  (helix)
  - A14 ↔ A18  (helix)
  - V15 ↔ V19  (helix)
  - I16 ↔ R20  (helix)
  - K17 ↔ G21  (helix)
  - R20 ↔ G24  (helix)
  - G24 ↔ K28  (helix)
  - K28 ↔ D32  (helix)
  - A30 ↔ V34  (helix)
  - K31 ↔ E35  (helix)
  - V34 ↔ P38  (helix)
  - G44 ↔ D48  (helix)
  - K47 ↔ E51  (helix)
  - D48 ↔ A52  (helix)
  - D49 ↔ L53  (helix)
  - A50 ↔ K54  (helix)
  - … +8 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=29 · exposed=19 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=245 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=100 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.6712 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 45 residues with modelled χ angles (full table in report JSON)
