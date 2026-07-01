# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\4PTI\sequence\4PTI.pdb`
- output_pdb: `general_benchmark\experimental_restraints\disulfides\4PTI\seeds\seed_0\4PTI.pdb`
- residues: 56
- mode: refinement
- ca_rmsd: 9.106 A
- tm_score_ca_ordered: 0.14763968570601352
- heavy_atom_rmsd: 9.970 A
- sidechain_heavy_atom_rmsd: 10.937 A
- **all-atom quality (honest):** heavy 9.970 A, sidechain 10.937 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/45 (0.0)
- lj_severe: 0
- lj_near: 41
- distogram_pairs: 3
- bin_accuracy: 0.333

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=36 · strand(E)=15 · 3-10(G)=4 · coil(C)=1

```
EHHHHHHEHHHEHEHHHHEEHHHHHGEEHEEEHHHHHEEHGHGHEHGHHHHHEHHC
```

## Backbone H-bond Network

- total=79 · helix(i→i+4)=20 · sheet=59
  - D2 ↔ E6  (helix)
  - F3 ↔ P7  (helix)
  - P7 ↔ G11  (helix)
  - Y9 ↔ C13  (helix)
  - G11 ↔ A15  (helix)
  - C13 ↔ I17  (helix)
  - I17 ↔ F21  (helix)
  - I18 ↔ Y22  (helix)
  - F21 ↔ K25  (helix)
  - K25 ↔ C29  (helix)
  - C29 ↔ V33  (helix)
  - V33 ↔ C37  (helix)
  - G36 ↔ K40  (helix)
  - K40 ↔ F44  (helix)
  - N42 ↔ S46  (helix)
  - F44 ↔ E48  (helix)
  - S46 ↔ C50  (helix)
  - E48 ↔ R52  (helix)
  - C50 ↔ C54  (helix)
  - M51 ↔ G55  (helix)
  - … +59 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=13 · exposed=21 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=574 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=413 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.9771 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=41 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C4–C54, C13–C37, C29–C50

## Side-chain Rotamers (χ1/χ2)

- 45 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`4PTI.ensemble.pdb`)
- RMSF mean=3.107Å max=7.442Å (per-residue in .per_residue.csv)
- most flexible residues: 35, 33, 11, 34, 2

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `4PTI.pae.csv`
- mean=1.597Å · max=6.86Å · AlphaFold-PAE analog (low block = rigid unit/domain)
