# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1JRJ\sequence\1JRJ.pdb`
- output_pdb: `glp_1_family\80pct_masked\1JRJ\seeds\seed_1\1JRJ.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 3.704 A
- tm_score_ca_ordered: 0.2918156767051234
- heavy_atom_rmsd: 5.301 A
- sidechain_heavy_atom_rmsd: 6.692 A
- **all-atom quality (honest):** heavy 5.301 A, sidechain 6.692 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/30 (0.0)
- lj_severe: 0
- lj_near: 1
- distogram_pairs: 126
- bin_accuracy: 0.770

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=19 · strand(E)=9 · 3-10(G)=7 · coil(C)=2

```
CEEEHGHEEEHHEHHHHHHHHHGGHGHGHHHHGGECE
```

## Backbone H-bond Network

- total=15 · helix(i→i+4)=11 · sheet=4
  - S7 ↔ K11  (helix)
  - K11 ↔ E15  (helix)
  - Q12 ↔ E16  (helix)
  - E14 ↔ V18  (helix)
  - E15 ↔ R19  (helix)
  - E16 ↔ L20  (helix)
  - A17 ↔ F21  (helix)
  - V18 ↔ I22  (helix)
  - F21 ↔ L25  (helix)
  - L25 ↔ G29  (helix)
  - N27 ↔ S31  (helix)
  - G3 ↔ D8  (sheet)
  - T4 ↔ L9  (sheet)
  - T4 ↔ S10  (sheet)
  - D8 ↔ M13  (sheet)

## Solvent Accessibility (burial)

- buried=19 · exposed=5 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=115 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=23 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.6038 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=1 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 30 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
