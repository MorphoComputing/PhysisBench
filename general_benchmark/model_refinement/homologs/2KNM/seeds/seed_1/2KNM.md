# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2KNM\sequence\2KNM.pdb`
- output_pdb: `general_benchmark\model_refinement\homologs\2KNM\seeds\seed_1\2KNM.pdb`
- residues: 28
- mode: oracle
- ca_rmsd: 2.047 A
- tm_score_ca_ordered: 0.40803630089666837
- heavy_atom_rmsd: 3.081 A
- sidechain_heavy_atom_rmsd: 3.653 A
- **all-atom quality (honest):** heavy 3.081 A, sidechain 3.653 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.036
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 1
- distogram_pairs: 196
- bin_accuracy: 0.893

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=global reason=rejected_domain_topology_regression tested=27
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 2.0471034051730657
- ga_delta_rmsd: 3.184813859188444  ga_fitness_mode: energy
- pre_local_rmsd: 2.0470228204042944  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=15 · strand(E)=10 · 3-10(G)=1 · coil(C)=2

```
CHHHEEHHCEEGHHHEHHEHHHEHEHEE
```

## Backbone H-bond Network

- total=31 · helix(i→i+4)=6 · sheet=25
  - G4 ↔ V8  (helix)
  - I13 ↔ I17  (helix)
  - S14 ↔ G18  (helix)
  - I17 ↔ C21  (helix)
  - G18 ↔ K22  (helix)
  - K22 ↔ C26  (helix)
  - E5 ↔ I10  (sheet)
  - E5 ↔ P11  (sheet)
  - E5 ↔ A16  (sheet)
  - E5 ↔ C19  (sheet)
  - E5 ↔ S23  (sheet)
  - E5 ↔ V25  (sheet)
  - S6 ↔ P11  (sheet)
  - S6 ↔ A16  (sheet)
  - S6 ↔ C19  (sheet)
  - S6 ↔ S23  (sheet)
  - S6 ↔ V25  (sheet)
  - I10 ↔ A16  (sheet)
  - I10 ↔ V25  (sheet)
  - P11 ↔ A16  (sheet)
  - … +11 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=10 · exposed=9 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=104 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=50 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.174 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=1 (steric clashes)
- ramachandran_forbidden_fraction=0.0357

## Disulfide Bonds Formed

- count=3: C3–C19, C7–C21, C12–C26

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
