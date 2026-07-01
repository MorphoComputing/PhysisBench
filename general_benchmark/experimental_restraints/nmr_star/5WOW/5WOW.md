# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\5WOW\sequence\5WOW.pdb`
- output_pdb: `general_benchmark\experimental_restraints\nmr_star\5WOW\seeds\seed_1\5WOW.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 6.256 A
- tm_score_ca_ordered: 0.13493191391641726
- heavy_atom_rmsd: 7.733 A
- sidechain_heavy_atom_rmsd: 9.007 A
- **all-atom quality (honest):** heavy 7.733 A, sidechain 9.007 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/31 (0.0)
- lj_severe: 0
- lj_near: 18
- distogram_pairs: 36
- bin_accuracy: 0.667

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=24 · strand(E)=9 · 3-10(G)=1 · coil(C)=3

```
CHHHHHHHHHEEHHHHEHEHCGHEHHHHHHEEECHHE
```

## Backbone H-bond Network

- total=30 · helix(i→i+4)=10 · sheet=20
  - V2 ↔ I6  (helix)
  - P4 ↔ Q8  (helix)
  - I6 ↔ C10  (helix)
  - R9 ↔ D13  (helix)
  - C10 ↔ S14  (helix)
  - S14 ↔ G18  (helix)
  - C16 ↔ C20  (helix)
  - R23 ↔ Y27  (helix)
  - N25 ↔ G29  (helix)
  - G26 ↔ Y30  (helix)
  - R11 ↔ P17  (sheet)
  - R11 ↔ A19  (sheet)
  - R11 ↔ G24  (sheet)
  - R11 ↔ P31  (sheet)
  - R12 ↔ P17  (sheet)
  - R12 ↔ A19  (sheet)
  - R12 ↔ G24  (sheet)
  - R12 ↔ P31  (sheet)
  - R12 ↔ Y32  (sheet)
  - P17 ↔ G24  (sheet)
  - … +10 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=24 · exposed=8 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=288 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=179 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.2647 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=18 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C20, C10–C22, C16–C28

## Side-chain Rotamers (χ1/χ2)

- 31 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`5WOW.ensemble.pdb`)
- RMSF mean=2.052Å max=4.373Å (per-residue in .per_residue.csv)
- most flexible residues: 10, 25, 21, 22, 19

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `5WOW.pae.csv`
- mean=1.032Å · max=4.603Å · AlphaFold-PAE analog (low block = rigid unit/domain)
