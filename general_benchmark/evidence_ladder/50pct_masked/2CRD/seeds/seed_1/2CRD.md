# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2CRD\sequence\2CRD.pdb`
- output_pdb: `general_benchmark\evidence_ladder\50pct_masked\2CRD\seeds\seed_1\2CRD.pdb`
- residues: 34
- mode: oracle
- ca_rmsd: 0.059 A
- tm_score_ca_ordered: 0.998495881220231
- heavy_atom_rmsd: 2.533 A
- sidechain_heavy_atom_rmsd: 3.160 A
- **all-atom quality (honest):** heavy 2.533 A, sidechain 3.160 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/33 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 248
- bin_accuracy: 0.984

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=36
- rigid_domain_reconvergence: applied=True accepted=14 rmsd=3.6239205542733757 -> 2.6196841642774165 A
- topology_reconvergence: applied=True accepted=3/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.05868121147469427
- ga_delta_rmsd: 2.3060749910695537  ga_fitness_mode: energy
- pre_local_rmsd: 0.058645691193161445  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `HEAVY_ATOM_RMSD_HIGH`
- reasons: `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=9 · strand(E)=14 · 3-10(G)=8 · coil(C)=3

```
EEEEGGEHHEHGHHHHGGEHEGCCEEGHGECEEE
```

## Backbone H-bond Network

- total=26 · helix(i→i+4)=3 · sheet=23
  - K9 ↔ S13  (helix)
  - C11 ↔ C15  (helix)
  - Q16 ↔ N20  (helix)
  - T1 ↔ E10  (sheet)
  - T1 ↔ H19  (sheet)
  - N2 ↔ E10  (sheet)
  - V3 ↔ E10  (sheet)
  - S4 ↔ E10  (sheet)
  - T7 ↔ K25  (sheet)
  - T7 ↔ C26  (sheet)
  - E10 ↔ K25  (sheet)
  - E10 ↔ C26  (sheet)
  - E10 ↔ K30  (sheet)
  - H19 ↔ R32  (sheet)
  - H19 ↔ C33  (sheet)
  - H19 ↔ Y34  (sheet)
  - T21 ↔ R32  (sheet)
  - T21 ↔ C33  (sheet)
  - T21 ↔ Y34  (sheet)
  - K25 ↔ K30  (sheet)
  - … +6 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=10 · exposed=15 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=127 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=62 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.7106 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C26, C11–C31, C15–C33

## Side-chain Rotamers (χ1/χ2)

- 33 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
