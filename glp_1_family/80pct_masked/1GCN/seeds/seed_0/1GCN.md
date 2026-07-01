# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1GCN\sequence\1GCN.pdb`
- output_pdb: `glp_1_family\80pct_masked\1GCN\seeds\seed_0\1GCN.pdb`
- residues: 27
- mode: refinement
- ca_rmsd: 3.239 A
- tm_score_ca_ordered: 0.18086107590050873
- heavy_atom_rmsd: 5.159 A
- sidechain_heavy_atom_rmsd: 6.442 A
- **all-atom quality (honest):** heavy 5.159 A, sidechain 6.442 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 60
- bin_accuracy: 0.933

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=12 · strand(E)=9 · 3-10(G)=6 · coil(C)=0

```
EEGGHGHEEEHEHGHHEGHGHHEHHHE
```

## Backbone H-bond Network

- total=8 · helix(i→i+4)=5 · sheet=3
  - S7 ↔ K11  (helix)
  - K11 ↔ S15  (helix)
  - S15 ↔ Q19  (helix)
  - F21 ↔ L25  (helix)
  - V22 ↔ M26  (helix)
  - S10 ↔ R17  (sheet)
  - Y12 ↔ R17  (sheet)
  - R17 ↔ Q23  (sheet)

## Solvent Accessibility (burial)

- buried=15 · exposed=8 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=62 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=0 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.4801 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
