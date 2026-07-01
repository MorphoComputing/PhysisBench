# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\3IOL\sequence\3IOL.pdb`
- output_pdb: `glp_1_family\80pct_masked\3IOL\seeds\seed_2\3IOL.pdb`
- residues: 24
- mode: refinement
- ca_rmsd: 3.500 A
- tm_score_ca_ordered: 0.10662775374974076
- heavy_atom_rmsd: 5.258 A
- sidechain_heavy_atom_rmsd: 6.448 A
- **all-atom quality (honest):** heavy 5.258 A, sidechain 6.448 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/20 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 46
- bin_accuracy: 0.761

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=16 · strand(E)=5 · 3-10(G)=3 · coil(C)=0

```
EHHEHHEGHHEGHHHHHHHHGHHE
```

## Backbone H-bond Network

- total=9 · helix(i→i+4)=7 · sheet=2
  - D5 ↔ Y9  (helix)
  - Y9 ↔ Q13  (helix)
  - L10 ↔ A14  (helix)
  - Q13 ↔ E17  (helix)
  - A14 ↔ F18  (helix)
  - A15 ↔ I19  (helix)
  - I19 ↔ V23  (helix)
  - T1 ↔ S7  (sheet)
  - S4 ↔ E11  (sheet)

## Solvent Accessibility (burial)

- buried=9 · exposed=9 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=60 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=0 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.7381 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 20 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
