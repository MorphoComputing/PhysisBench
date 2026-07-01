# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1NXB\sequence\1NXB.pdb`
- output_pdb: `general_benchmark\experimental_restraints\disulfides\1NXB\seeds\seed_0\1NXB.pdb`
- residues: 60
- mode: refinement
- ca_rmsd: 10.548 A
- tm_score_ca_ordered: 0.10558507690703359
- heavy_atom_rmsd: 11.135 A
- sidechain_heavy_atom_rmsd: 11.784 A
- **all-atom quality (honest):** heavy 11.135 A, sidechain 11.784 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 4/4
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/55 (0.0)
- lj_severe: 0
- lj_near: 60
- distogram_pairs: 4
- bin_accuracy: 0.250

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=49 · strand(E)=5 · 3-10(G)=4 · coil(C)=2

```
CHHHEHEHHHHHHHHHGHHHHHEHHHHHHHHGHHHEHHHHEHHGHHHHHHHHHHHGHHHC
```

## Backbone H-bond Network

- total=41 · helix(i→i+4)=36 · sheet=5
  - C2 ↔ H6  (helix)
  - N4 ↔ S8  (helix)
  - H6 ↔ P10  (helix)
  - S8 ↔ T12  (helix)
  - Q9 ↔ T13  (helix)
  - P10 ↔ K14  (helix)
  - Q11 ↔ T15  (helix)
  - T12 ↔ C16  (helix)
  - K14 ↔ P18  (helix)
  - C16 ↔ E20  (helix)
  - P18 ↔ S22  (helix)
  - E20 ↔ Y24  (helix)
  - S21 ↔ H25  (helix)
  - S22 ↔ K26  (helix)
  - Y24 ↔ W28  (helix)
  - H25 ↔ S29  (helix)
  - K26 ↔ D30  (helix)
  - Q27 ↔ F31  (helix)
  - S29 ↔ G33  (helix)
  - F31 ↔ I35  (helix)
  - … +21 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=12 · exposed=30 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=684 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=477 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.792 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=60 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=4: C2–C23, C16–C40, C42–C53, C54–C59

## Side-chain Rotamers (χ1/χ2)

- 55 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
