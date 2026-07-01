# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\5WOW\sequence\5WOW.pdb`
- output_pdb: `general_benchmark\gap_filling\control_noe\noe\5WOW\seeds\seed_7\5WOW.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 6.589 A
- tm_score_ca_ordered: 0.1230649687247588
- heavy_atom_rmsd: 7.605 A
- sidechain_heavy_atom_rmsd: 8.473 A
- **all-atom quality (honest):** heavy 7.605 A, sidechain 8.473 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/31 (0.0)
- lj_severe: 0
- lj_near: 15
- distogram_pairs: 27
- bin_accuracy: 0.481

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=20 · strand(E)=12 · 3-10(G)=2 · coil(C)=3

```
ECHHHGEEEHHHHHHHHEEHHHEHECHEGEECHHHHE
```

## Backbone H-bond Network

- total=44 · helix(i→i+4)=5 · sheet=39
  - C10 ↔ S14  (helix)
  - R11 ↔ D15  (helix)
  - D13 ↔ P17  (helix)
  - C16 ↔ C20  (helix)
  - C20 ↔ G24  (helix)
  - G1 ↔ L7  (sheet)
  - G1 ↔ Q8  (sheet)
  - G1 ↔ R9  (sheet)
  - G1 ↔ G18  (sheet)
  - G1 ↔ A19  (sheet)
  - L7 ↔ G18  (sheet)
  - L7 ↔ A19  (sheet)
  - L7 ↔ R23  (sheet)
  - Q8 ↔ G18  (sheet)
  - Q8 ↔ A19  (sheet)
  - Q8 ↔ R23  (sheet)
  - Q8 ↔ N25  (sheet)
  - Q8 ↔ C28  (sheet)
  - R9 ↔ G18  (sheet)
  - R9 ↔ A19  (sheet)
  - … +24 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=12 · exposed=12 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=274 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=164 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.0113 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=15 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C20, C10–C22, C16–C28

## Side-chain Rotamers (χ1/χ2)

- 31 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
