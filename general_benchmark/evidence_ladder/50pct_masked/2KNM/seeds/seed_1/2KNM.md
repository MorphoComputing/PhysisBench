# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2KNM\sequence\2KNM.pdb`
- output_pdb: `general_benchmark\evidence_ladder\50pct_masked\2KNM\seeds\seed_1\2KNM.pdb`
- residues: 28
- mode: oracle
- ca_rmsd: 5.301 A
- tm_score_ca_ordered: 0.26806038356643697
- heavy_atom_rmsd: 6.020 A
- sidechain_heavy_atom_rmsd: 6.599 A
- **all-atom quality (honest):** heavy 6.020 A, sidechain 6.599 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 162
- bin_accuracy: 0.975

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=global reason=rejected_local_chirality_regression tested=21
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 5.300620814079533
- ga_delta_rmsd: -0.7887728472755047  ga_fitness_mode: energy
- pre_local_rmsd: 5.300673867171827  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=11 · strand(E)=8 · 3-10(G)=4 · coil(C)=5

```
CEHEHHHGCCEGHHHHHGGEEEHHCCEE
```

## Backbone H-bond Network

- total=19 · helix(i→i+4)=2 · sheet=17
  - C3 ↔ C7  (helix)
  - I13 ↔ I17  (helix)
  - P2 ↔ S20  (sheet)
  - P2 ↔ C21  (sheet)
  - P2 ↔ K22  (sheet)
  - G4 ↔ P11  (sheet)
  - G4 ↔ S20  (sheet)
  - G4 ↔ C21  (sheet)
  - G4 ↔ K22  (sheet)
  - P11 ↔ S20  (sheet)
  - P11 ↔ C21  (sheet)
  - P11 ↔ K22  (sheet)
  - P11 ↔ Y27  (sheet)
  - S20 ↔ Y27  (sheet)
  - S20 ↔ R28  (sheet)
  - C21 ↔ Y27  (sheet)
  - C21 ↔ R28  (sheet)
  - K22 ↔ Y27  (sheet)
  - K22 ↔ R28  (sheet)

## Solvent Accessibility (burial)

- buried=8 · exposed=11 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=97 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=47 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.7046 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C19, C7–C21, C12–C26

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
