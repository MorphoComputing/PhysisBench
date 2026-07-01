# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1JRJ\sequence\1JRJ.pdb`
- output_pdb: `glp_1_family\50pct_masked\1JRJ\seeds\seed_3\1JRJ.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 0.994 A
- tm_score_ca_ordered: 0.8526090280767009
- heavy_atom_rmsd: 2.820 A
- sidechain_heavy_atom_rmsd: 3.495 A
- **all-atom quality (honest):** heavy 2.820 A, sidechain 3.495 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/30 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 323
- bin_accuracy: 0.923

## Failure Classification

- primary_reason: `LOCAL_HOTSPOT_REMAINS`
- reasons: `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=21 · strand(E)=6 · 3-10(G)=9 · coil(C)=1

```
CEGHHHHHGGHHGHHHHEHHHHHHHGHGGHHEGEGEE
```

## Backbone H-bond Network

- total=15 · helix(i→i+4)=13 · sheet=2
  - T4 ↔ D8  (helix)
  - S7 ↔ K11  (helix)
  - D8 ↔ Q12  (helix)
  - K11 ↔ E15  (helix)
  - Q12 ↔ E16  (helix)
  - E15 ↔ R19  (helix)
  - E16 ↔ L20  (helix)
  - A17 ↔ F21  (helix)
  - R19 ↔ E23  (helix)
  - L20 ↔ W24  (helix)
  - F21 ↔ L25  (helix)
  - E23 ↔ N27  (helix)
  - N27 ↔ S31  (helix)
  - V18 ↔ P36  (sheet)
  - V18 ↔ P37  (sheet)

## Solvent Accessibility (burial)

- buried=19 · exposed=6 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=102 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=9 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.4763 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 30 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
