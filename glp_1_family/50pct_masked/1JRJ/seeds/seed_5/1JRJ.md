# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1JRJ\sequence\1JRJ.pdb`
- output_pdb: `glp_1_family\50pct_masked\1JRJ\seeds\seed_5\1JRJ.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 4.185 A
- tm_score_ca_ordered: 0.3340427288027849
- heavy_atom_rmsd: 5.946 A
- sidechain_heavy_atom_rmsd: 7.151 A
- **all-atom quality (honest):** heavy 5.946 A, sidechain 7.151 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/30 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 323
- bin_accuracy: 0.947

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=24 · strand(E)=7 · 3-10(G)=4 · coil(C)=2

```
EEHHGHHHHGHHHHGHHHHHHHHHHGHHEHHEECCEE
```

## Backbone H-bond Network

- total=18 · helix(i→i+4)=16 · sheet=2
  - G3 ↔ S7  (helix)
  - T4 ↔ D8  (helix)
  - S7 ↔ K11  (helix)
  - D8 ↔ Q12  (helix)
  - Q12 ↔ E16  (helix)
  - M13 ↔ A17  (helix)
  - E14 ↔ V18  (helix)
  - E16 ↔ L20  (helix)
  - A17 ↔ F21  (helix)
  - V18 ↔ I22  (helix)
  - R19 ↔ E23  (helix)
  - L20 ↔ W24  (helix)
  - F21 ↔ L25  (helix)
  - E23 ↔ N27  (helix)
  - W24 ↔ G28  (helix)
  - N27 ↔ S31  (helix)
  - G29 ↔ P36  (sheet)
  - G29 ↔ P37  (sheet)

## Solvent Accessibility (burial)

- buried=19 · exposed=6 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=102 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=9 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.4572 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 30 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
