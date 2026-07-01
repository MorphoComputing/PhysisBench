# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\5WOW\sequence\5WOW.pdb`
- output_pdb: `general_benchmark\experimental_restraints\noe\5WOW\seeds\seed_0\5WOW.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 7.089 A
- tm_score_ca_ordered: 0.1130905981382137
- heavy_atom_rmsd: 8.299 A
- sidechain_heavy_atom_rmsd: 9.359 A
- **all-atom quality (honest):** heavy 8.299 A, sidechain 9.359 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/31 (0.0)
- lj_severe: 0
- lj_near: 26
- distogram_pairs: 27
- bin_accuracy: 0.593

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=25 · strand(E)=9 · 3-10(G)=2 · coil(C)=1

```
ECHEHHEHEHHEHGGHHHHHHHEHEEHHHHHHHHHHE
```

## Backbone H-bond Network

- total=29 · helix(i→i+4)=11 · sheet=18
  - I6 ↔ C10  (helix)
  - D13 ↔ P17  (helix)
  - C16 ↔ C20  (helix)
  - P17 ↔ I21  (helix)
  - G18 ↔ C22  (helix)
  - C20 ↔ G24  (helix)
  - Y27 ↔ P31  (helix)
  - G29 ↔ D33  (helix)
  - Y30 ↔ V34  (helix)
  - P31 ↔ P35  (helix)
  - Y32 ↔ D36  (helix)
  - G1 ↔ L7  (sheet)
  - G1 ↔ R9  (sheet)
  - G1 ↔ R12  (sheet)
  - P4 ↔ R9  (sheet)
  - P4 ↔ R12  (sheet)
  - P4 ↔ R23  (sheet)
  - L7 ↔ R12  (sheet)
  - L7 ↔ R23  (sheet)
  - L7 ↔ G26  (sheet)
  - … +9 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=12 · exposed=11 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=337 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=212 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.0368 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=26 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C20, C10–C22, C16–C28

## Side-chain Rotamers (χ1/χ2)

- 31 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
