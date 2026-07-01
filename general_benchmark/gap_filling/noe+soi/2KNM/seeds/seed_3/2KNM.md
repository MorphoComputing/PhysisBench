# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2KNM\sequence\2KNM.pdb`
- output_pdb: `general_benchmark\gap_filling\noe+soi\2KNM\seeds\seed_3\2KNM.pdb`
- residues: 28
- mode: refinement
- ca_rmsd: 3.302 A
- tm_score_ca_ordered: 0.23983015797495558
- heavy_atom_rmsd: 4.312 A
- sidechain_heavy_atom_rmsd: 5.079 A
- **all-atom quality (honest):** heavy 4.312 A, sidechain 5.079 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 12
- distogram_pairs: 133
- bin_accuracy: 0.556

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=8 · strand(E)=11 · 3-10(G)=6 · coil(C)=3

```
EEGECECCGGEHEHEHHHEHHHEGEGGE
```

## Backbone H-bond Network

- total=36 · helix(i→i+4)=4 · sheet=32
  - C12 ↔ A16  (helix)
  - S14 ↔ G18  (helix)
  - I17 ↔ C21  (helix)
  - G18 ↔ K22  (helix)
  - I1 ↔ S6  (sheet)
  - I1 ↔ P11  (sheet)
  - I1 ↔ I13  (sheet)
  - I1 ↔ S15  (sheet)
  - I1 ↔ C19  (sheet)
  - P2 ↔ P11  (sheet)
  - P2 ↔ I13  (sheet)
  - P2 ↔ S15  (sheet)
  - P2 ↔ C19  (sheet)
  - G4 ↔ P11  (sheet)
  - G4 ↔ I13  (sheet)
  - G4 ↔ S15  (sheet)
  - G4 ↔ C19  (sheet)
  - G4 ↔ S23  (sheet)
  - S6 ↔ P11  (sheet)
  - S6 ↔ I13  (sheet)
  - … +16 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=7 · exposed=14 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=156 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=103 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.4713 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=12 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C19, C7–C21, C12–C26

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
