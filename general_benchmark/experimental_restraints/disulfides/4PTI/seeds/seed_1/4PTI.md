# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\4PTI\sequence\4PTI.pdb`
- output_pdb: `general_benchmark\experimental_restraints\disulfides\4PTI\seeds\seed_1\4PTI.pdb`
- residues: 56
- mode: refinement
- ca_rmsd: 9.346 A
- tm_score_ca_ordered: 0.16259160834865202
- heavy_atom_rmsd: 10.521 A
- sidechain_heavy_atom_rmsd: 11.498 A
- **all-atom quality (honest):** heavy 10.521 A, sidechain 11.498 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/45 (0.0)
- lj_severe: 0
- lj_near: 47
- distogram_pairs: 3
- bin_accuracy: 0.000

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=41 · strand(E)=13 · 3-10(G)=1 · coil(C)=1

```
EECHEGHHEHEEHEHHEHHHHHHHHHHHHHHHHHHEHHEHHEHEHHHHHHHHHHHE
```

## Backbone H-bond Network

- total=54 · helix(i→i+4)=28 · sheet=26
  - C4 ↔ P8  (helix)
  - A15 ↔ R19  (helix)
  - R16 ↔ Y20  (helix)
  - I18 ↔ Y22  (helix)
  - R19 ↔ N23  (helix)
  - Y20 ↔ A24  (helix)
  - F21 ↔ K25  (helix)
  - Y22 ↔ A26  (helix)
  - N23 ↔ G27  (helix)
  - A24 ↔ L28  (helix)
  - K25 ↔ C29  (helix)
  - A26 ↔ Q30  (helix)
  - G27 ↔ T31  (helix)
  - L28 ↔ F32  (helix)
  - C29 ↔ V33  (helix)
  - Q30 ↔ Y34  (helix)
  - T31 ↔ G35  (helix)
  - V33 ↔ C37  (helix)
  - Y34 ↔ R38  (helix)
  - C37 ↔ R41  (helix)
  - … +34 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=23 · exposed=9 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=611 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=444 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.1253 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=47 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C4–C54, C13–C37, C29–C50

## Side-chain Rotamers (χ1/χ2)

- 45 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
