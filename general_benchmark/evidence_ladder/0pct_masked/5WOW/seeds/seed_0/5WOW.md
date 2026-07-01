# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set/general_benchmark/5WOW/sequence/5WOW.pdb`
- output_pdb: `general_benchmark/evidence_ladder/0pct_masked/5WOW/seeds/seed_0/5WOW.pdb`
- residues: 37
- mode: oracle
- ca_rmsd: 0.031 A
- tm_score_ca_ordered: 0.9996484060167977
- heavy_atom_rmsd: 3.163 A
- sidechain_heavy_atom_rmsd: 4.118 A
- **all-atom quality (honest):** heavy 3.163 A, sidechain 4.118 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/31 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 595
- bin_accuracy: 0.980

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=30
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=0.07007939856787755 -> 0.06820881279996421 A
- topology_reconvergence: applied=True accepted=8/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.031438869471390594
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 0.03141264816889468  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=12 · strand(E)=15 · 3-10(G)=5 · coil(C)=5

```
ECEHEECEECHEGHHEHEHEGGEHHHEECCEHHGGHE
```

## Backbone H-bond Network

- total=45 · helix(i→i+4)=3 · sheet=42
  - R11 ↔ D15  (helix)
  - D15 ↔ A19  (helix)
  - Y32 ↔ D36  (helix)
  - G1 ↔ C16  (sheet)
  - G1 ↔ G18  (sheet)
  - G1 ↔ C20  (sheet)
  - C3 ↔ Q8  (sheet)
  - C3 ↔ R9  (sheet)
  - C3 ↔ C16  (sheet)
  - C3 ↔ G18  (sheet)
  - C3 ↔ C20  (sheet)
  - C3 ↔ R23  (sheet)
  - K5 ↔ C16  (sheet)
  - K5 ↔ G18  (sheet)
  - K5 ↔ C20  (sheet)
  - I6 ↔ C16  (sheet)
  - I6 ↔ G18  (sheet)
  - I6 ↔ C20  (sheet)
  - Q8 ↔ C16  (sheet)
  - Q8 ↔ G18  (sheet)
  - … +25 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=13 · exposed=12 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=124 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=65 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.695 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C20, C10–C22, C16–C28

## Side-chain Rotamers (χ1/χ2)

- 31 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
