# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1JRJ\sequence\1JRJ.pdb`
- output_pdb: `glp_1_family\noe\1JRJ\seeds\seed_2\1JRJ.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 11.196 A
- tm_score_ca_ordered: 0.0724777487067829
- heavy_atom_rmsd: 11.083 A
- sidechain_heavy_atom_rmsd: 11.047 A
- **all-atom quality (honest):** heavy 11.083 A, sidechain 11.047 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/30 (0.0)
- lj_severe: 0
- lj_near: 28
- distogram_pairs: 47
- bin_accuracy: 0.574

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=25 · strand(E)=10 · 3-10(G)=2 · coil(C)=0

```
EHHHHHHHHHEEHHHEHHHHHHHEHHHGEEHHGHEEE
```

## Backbone H-bond Network

- total=39 · helix(i→i+4)=15 · sheet=24
  - E2 ↔ T6  (helix)
  - G3 ↔ S7  (helix)
  - T4 ↔ D8  (helix)
  - F5 ↔ L9  (helix)
  - L9 ↔ M13  (helix)
  - M13 ↔ A17  (helix)
  - E14 ↔ V18  (helix)
  - E15 ↔ R19  (helix)
  - A17 ↔ F21  (helix)
  - V18 ↔ I22  (helix)
  - R19 ↔ E23  (helix)
  - F21 ↔ L25  (helix)
  - I22 ↔ K26  (helix)
  - E23 ↔ N27  (helix)
  - N27 ↔ S31  (helix)
  - G1 ↔ K11  (sheet)
  - G1 ↔ Q12  (sheet)
  - G1 ↔ E16  (sheet)
  - K11 ↔ E16  (sheet)
  - K11 ↔ G29  (sheet)
  - … +19 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=10 · exposed=14 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=303 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=177 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.3183 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=28 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 30 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
