# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1JRJ\sequence\1JRJ.pdb`
- output_pdb: `glp_1_family\noe_fused\1JRJ\seeds\seed_5\1JRJ.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 2.596 A
- tm_score_ca_ordered: 0.46474639159921116
- heavy_atom_rmsd: 4.305 A
- sidechain_heavy_atom_rmsd: 5.652 A
- **all-atom quality (honest):** heavy 4.305 A, sidechain 5.652 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/30 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 196
- bin_accuracy: 0.862

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=20 · strand(E)=11 · 3-10(G)=5 · coil(C)=1

```
EEGEGHEHHHEHHHHHHHHGHHHHEHEHGEHHGCEEE
```

## Backbone H-bond Network

- total=24 · helix(i→i+4)=14 · sheet=10
  - T6 ↔ S10  (helix)
  - D8 ↔ Q12  (helix)
  - L9 ↔ M13  (helix)
  - S10 ↔ E14  (helix)
  - Q12 ↔ E16  (helix)
  - M13 ↔ A17  (helix)
  - E14 ↔ V18  (helix)
  - E15 ↔ R19  (helix)
  - A17 ↔ F21  (helix)
  - V18 ↔ I22  (helix)
  - R19 ↔ E23  (helix)
  - I22 ↔ K26  (helix)
  - W24 ↔ G28  (helix)
  - G28 ↔ S32  (helix)
  - L25 ↔ P30  (sheet)
  - L25 ↔ P35  (sheet)
  - L25 ↔ P36  (sheet)
  - L25 ↔ P37  (sheet)
  - N27 ↔ P35  (sheet)
  - N27 ↔ P36  (sheet)
  - … +4 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=19 · exposed=6 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=107 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=11 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.6856 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 30 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
