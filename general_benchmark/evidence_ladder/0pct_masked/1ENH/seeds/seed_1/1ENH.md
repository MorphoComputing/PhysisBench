# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set/general_benchmark/1ENH/sequence/1ENH.pdb`
- output_pdb: `general_benchmark/evidence_ladder/0pct_masked/1ENH/seeds/seed_1/1ENH.pdb`
- residues: 52
- mode: oracle
- ca_rmsd: 0.021 A
- tm_score_ca_ordered: 0.999916313259203
- heavy_atom_rmsd: 3.080 A
- sidechain_heavy_atom_rmsd: 3.989 A
- **all-atom quality (honest):** heavy 3.080 A, sidechain 3.989 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/47 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 1225
- bin_accuracy: 0.989

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=30
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=0.05188525683887785 -> 0.051245250564814174 A
- topology_reconvergence: applied=True accepted=6/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.02130149239970377
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 0.022340746620214947  localized_anchor_rmsd: 0.021335142097010578

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=36 · strand(E)=11 · 3-10(G)=4 · coil(C)=1

```
EEECEEHHHHHHHHHHHHGEGEEGHHHHHHHHHGEHEHHHHHHHHHHHHHHE
```

## Backbone H-bond Network

- total=24 · helix(i→i+4)=24 · sheet=0
  - S7 ↔ A11  (helix)
  - E8 ↔ R12  (helix)
  - Q9 ↔ L13  (helix)
  - L10 ↔ K14  (helix)
  - A11 ↔ R15  (helix)
  - R12 ↔ E16  (helix)
  - L13 ↔ F17  (helix)
  - K14 ↔ N18  (helix)
  - E25 ↔ Q29  (helix)
  - R26 ↔ Q30  (helix)
  - R27 ↔ L31  (helix)
  - R28 ↔ S32  (helix)
  - Q29 ↔ S33  (helix)
  - S32 ↔ G36  (helix)
  - G36 ↔ A40  (helix)
  - E39 ↔ K43  (helix)
  - A40 ↔ I44  (helix)
  - Q41 ↔ W45  (helix)
  - I42 ↔ F46  (helix)
  - K43 ↔ Q47  (helix)
  - … +4 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=13 · exposed=21 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=148 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=20 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.6901 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 47 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
