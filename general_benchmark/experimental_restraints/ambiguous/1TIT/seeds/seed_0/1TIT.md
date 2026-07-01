# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1TIT\sequence\1TIT.pdb`
- output_pdb: `general_benchmark\experimental_restraints\ambiguous\1TIT\seeds\seed_0\1TIT.pdb`
- residues: 87
- mode: refinement
- ca_rmsd: 10.614 A
- tm_score_ca_ordered: 0.17817430333799344
- heavy_atom_rmsd: 11.745 A
- sidechain_heavy_atom_rmsd: 12.922 A
- **all-atom quality (honest):** heavy 11.745 A, sidechain 12.922 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/73 (0.0)
- lj_severe: 0
- lj_near: 110
- distogram_pairs: 8
- bin_accuracy: 0.375

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=62 · strand(E)=14 · 3-10(G)=8 · coil(C)=3

```
CEGHHHHHGHHHHHHEHEHHHHHHHHHEHHHHGHHHHGEHHEHHHGHHHEHHGGEHEEHHCHHGHHEHHHHHHHEHHCHHEHHHHHE
```

## Backbone H-bond Network

- total=67 · helix(i→i+4)=39 · sheet=28
  - E4 ↔ Y8  (helix)
  - P6 ↔ V10  (helix)
  - L7 ↔ E11  (helix)
  - Y8 ↔ V12  (helix)
  - V10 ↔ V14  (helix)
  - E11 ↔ G15  (helix)
  - G15 ↔ H19  (helix)
  - T17 ↔ E21  (helix)
  - H19 ↔ E23  (helix)
  - E21 ↔ S25  (helix)
  - I22 ↔ E26  (helix)
  - E23 ↔ P27  (helix)
  - S25 ↔ V29  (helix)
  - E26 ↔ H30  (helix)
  - P27 ↔ G31  (helix)
  - H30 ↔ K34  (helix)
  - G31 ↔ L35  (helix)
  - Q32 ↔ K36  (helix)
  - K36 ↔ L40  (helix)
  - G37 ↔ T41  (helix)
  - … +47 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=20 · exposed=43 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=1267 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=999 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.4042 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=110 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 73 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
