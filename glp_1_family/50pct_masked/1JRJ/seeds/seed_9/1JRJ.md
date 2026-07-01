# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1JRJ\sequence\1JRJ.pdb`
- output_pdb: `glp_1_family\50pct_masked\1JRJ\seeds\seed_9\1JRJ.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 3.021 A
- tm_score_ca_ordered: 0.4191452284787297
- heavy_atom_rmsd: 4.643 A
- sidechain_heavy_atom_rmsd: 5.610 A
- **all-atom quality (honest):** heavy 4.643 A, sidechain 5.610 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/30 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 323
- bin_accuracy: 0.876

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=17 · strand(E)=18 · 3-10(G)=2 · coil(C)=0

```
EEEEEHHEEHHHEHHHHEHEGHHHEHEHHGHEEEEEE
```

## Backbone H-bond Network

- total=36 · helix(i→i+4)=9 · sheet=27
  - T6 ↔ S10  (helix)
  - S7 ↔ K11  (helix)
  - S10 ↔ E14  (helix)
  - K11 ↔ E15  (helix)
  - Q12 ↔ E16  (helix)
  - E15 ↔ R19  (helix)
  - R19 ↔ E23  (helix)
  - I22 ↔ K26  (helix)
  - W24 ↔ G28  (helix)
  - G3 ↔ D8  (sheet)
  - G3 ↔ L9  (sheet)
  - T4 ↔ L9  (sheet)
  - F5 ↔ M13  (sheet)
  - D8 ↔ M13  (sheet)
  - M13 ↔ V18  (sheet)
  - M13 ↔ L20  (sheet)
  - V18 ↔ L25  (sheet)
  - V18 ↔ P36  (sheet)
  - V18 ↔ P37  (sheet)
  - L20 ↔ L25  (sheet)
  - … +16 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=19 · exposed=6 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=98 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=8 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.512 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 30 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
