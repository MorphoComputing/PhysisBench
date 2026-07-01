# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1CRN\sequence\1CRN.pdb`
- output_pdb: `general_benchmark\evidence_ladder\50pct_masked\1CRN\seeds\seed_1\1CRN.pdb`
- residues: 44
- mode: oracle
- ca_rmsd: 6.680 A
- tm_score_ca_ordered: 0.3132632569984935
- heavy_atom_rmsd: 7.683 A
- sidechain_heavy_atom_rmsd: 8.624 A
- **all-atom quality (honest):** heavy 7.683 A, sidechain 8.624 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/35 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 430
- bin_accuracy: 0.958

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=rejected_domain_topology_regression tested=27
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 6.679782262145723
- ga_delta_rmsd: -2.2917272395448016  ga_fitness_mode: energy
- pre_local_rmsd: 6.679680363445941  localized_anchor_rmsd: 6.679680363445941

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=23 · strand(E)=7 · 3-10(G)=5 · coil(C)=9

```
CECHEHHHHHHHHHHGGHEGHHHHHHHHCECCEGHCECCEHHGC
```

## Backbone H-bond Network

- total=13 · helix(i→i+4)=12 · sheet=1
  - P4 ↔ A8  (helix)
  - I6 ↔ S10  (helix)
  - V7 ↔ N11  (helix)
  - A8 ↔ F12  (helix)
  - R9 ↔ N13  (helix)
  - S10 ↔ V14  (helix)
  - N11 ↔ C15  (helix)
  - V14 ↔ P18  (helix)
  - P18 ↔ E22  (helix)
  - E22 ↔ A26  (helix)
  - A23 ↔ T27  (helix)
  - I24 ↔ Y28  (helix)
  - I33 ↔ P40  (sheet)

## Solvent Accessibility (burial)

- buried=16 · exposed=15 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=144 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=47 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.6753 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C2–C39, C3–C31, C15–C25

## Side-chain Rotamers (χ1/χ2)

- 35 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
