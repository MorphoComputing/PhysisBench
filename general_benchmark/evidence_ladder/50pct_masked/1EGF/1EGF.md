# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1EGF\sequence\1EGF.pdb`
- output_pdb: `general_benchmark\evidence_ladder\50pct_masked\1EGF\seeds\seed_0\1EGF.pdb`
- residues: 51
- mode: oracle
- ca_rmsd: 0.132 A
- tm_score_ca_ordered: 0.9967347341615129
- heavy_atom_rmsd: 2.890 A
- sidechain_heavy_atom_rmsd: 3.867 A
- **all-atom quality (honest):** heavy 2.890 A, sidechain 3.867 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/45 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 588
- bin_accuracy: 0.976

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=36
- rigid_domain_reconvergence: applied=True accepted=2 rmsd=0.23337714011313365 -> 0.18729691732311649 A
- topology_reconvergence: applied=True accepted=5/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.13154547922130352
- ga_delta_rmsd: -0.10460178391234903  ga_fitness_mode: energy
- pre_local_rmsd: 0.13414974898675489  localized_anchor_rmsd: 0.13160507323170742

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=11 · strand(E)=27 · 3-10(G)=6 · coil(C)=7

```
EECCEEHHEEGHCEHEEECEEGGHGHEEEEEEECHEEEHEHHEHECEGGEC
```

## Backbone H-bond Network

- total=106 · helix(i→i+4)=2 · sheet=104
  - S8 ↔ Y12  (helix)
  - G35 ↔ D39  (helix)
  - S1 ↔ M20  (sheet)
  - S1 ↔ H21  (sheet)
  - Y2 ↔ V18  (sheet)
  - Y2 ↔ M20  (sheet)
  - Y2 ↔ H21  (sheet)
  - C5 ↔ D10  (sheet)
  - C5 ↔ G17  (sheet)
  - C5 ↔ V18  (sheet)
  - C5 ↔ M20  (sheet)
  - C5 ↔ H21  (sheet)
  - P6 ↔ M20  (sheet)
  - P6 ↔ H21  (sheet)
  - Y9 ↔ L14  (sheet)
  - Y9 ↔ M20  (sheet)
  - Y9 ↔ H21  (sheet)
  - Y9 ↔ S27  (sheet)
  - Y9 ↔ Y28  (sheet)
  - Y9 ↔ T29  (sheet)
  - … +86 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=15 · exposed=25 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=185 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=100 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.6255 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C19, C13–C30, C32–C41

## Side-chain Rotamers (χ1/χ2)

- 45 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`1EGF.ensemble.pdb`)
- RMSF mean=0.038Å max=0.118Å (per-residue in .per_residue.csv)
- most flexible residues: 46, 35, 37, 51, 7

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1EGF.pae.csv`
- mean=0.023Å · max=0.132Å · AlphaFold-PAE analog (low block = rigid unit/domain)
