# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1GCN\sequence\1GCN.pdb`
- output_pdb: `glp_1_family\50pct_masked\1GCN\seeds\seed_0\1GCN.pdb`
- residues: 27
- mode: refinement
- ca_rmsd: 3.250 A
- tm_score_ca_ordered: 0.22775397478910467
- heavy_atom_rmsd: 4.938 A
- sidechain_heavy_atom_rmsd: 6.004 A
- **all-atom quality (honest):** heavy 4.938 A, sidechain 6.004 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 150
- bin_accuracy: 0.880

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=12 · strand(E)=9 · 3-10(G)=5 · coil(C)=1

```
EEGCEHHHHEHGHEEHEHGGHHEHHGE
```

## Backbone H-bond Network

- total=8 · helix(i→i+4)=4 · sheet=4
  - S7 ↔ K11  (helix)
  - Y9 ↔ L13  (helix)
  - A18 ↔ V22  (helix)
  - F21 ↔ L25  (helix)
  - F5 ↔ S10  (sheet)
  - S10 ↔ S15  (sheet)
  - S10 ↔ R17  (sheet)
  - R17 ↔ Q23  (sheet)

## Solvent Accessibility (burial)

- buried=13 · exposed=8 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=64 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=0 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.5378 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
