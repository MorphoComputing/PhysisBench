# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set/general_benchmark/2KNM/sequence/2KNM.pdb`
- output_pdb: `general_benchmark/evidence_ladder/0pct_masked/2KNM/seeds/seed_0/2KNM.pdb`
- residues: 28
- mode: oracle
- ca_rmsd: 0.017 A
- tm_score_ca_ordered: 0.9997741028561515
- heavy_atom_rmsd: 2.564 A
- sidechain_heavy_atom_rmsd: 3.233 A
- **all-atom quality (honest):** heavy 2.564 A, sidechain 3.233 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 325
- bin_accuracy: 0.997

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=27
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.01672319260377141
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 0.016772232737878753  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=9 · strand(E)=8 · 3-10(G)=7 · coil(C)=4

```
CEGCEEHHGEGGHHHHHGCECEHHEGGE
```

## Backbone H-bond Network

- total=15 · helix(i→i+4)=1 · sheet=14
  - I13 ↔ I17  (helix)
  - P2 ↔ S20  (sheet)
  - P2 ↔ K22  (sheet)
  - E5 ↔ I10  (sheet)
  - E5 ↔ S20  (sheet)
  - E5 ↔ K22  (sheet)
  - E5 ↔ V25  (sheet)
  - S6 ↔ S20  (sheet)
  - S6 ↔ K22  (sheet)
  - S6 ↔ V25  (sheet)
  - I10 ↔ S20  (sheet)
  - I10 ↔ V25  (sheet)
  - S20 ↔ V25  (sheet)
  - S20 ↔ R28  (sheet)
  - K22 ↔ R28  (sheet)

## Solvent Accessibility (burial)

- buried=8 · exposed=11 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=99 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=49 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.7042 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C19, C7–C21, C12–C26

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
