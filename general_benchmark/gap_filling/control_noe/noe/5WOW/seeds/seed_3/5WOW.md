# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\5WOW\sequence\5WOW.pdb`
- output_pdb: `general_benchmark\gap_filling\control_noe\noe\5WOW\seeds\seed_3\5WOW.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 6.833 A
- tm_score_ca_ordered: 0.12891769042547638
- heavy_atom_rmsd: 8.641 A
- sidechain_heavy_atom_rmsd: 9.890 A
- **all-atom quality (honest):** heavy 8.641 A, sidechain 9.890 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/31 (0.0)
- lj_severe: 0
- lj_near: 27
- distogram_pairs: 27
- bin_accuracy: 0.444

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=25 · strand(E)=8 · 3-10(G)=1 · coil(C)=3

```
CHHEHHHHHHHGHHEHHHEHHHHHHECCEHHHHHEEE
```

## Backbone H-bond Network

- total=25 · helix(i→i+4)=13 · sheet=12
  - V2 ↔ I6  (helix)
  - K5 ↔ R9  (helix)
  - I6 ↔ C10  (helix)
  - R9 ↔ D13  (helix)
  - C10 ↔ S14  (helix)
  - D13 ↔ P17  (helix)
  - S14 ↔ G18  (helix)
  - C16 ↔ C20  (helix)
  - P17 ↔ I21  (helix)
  - G18 ↔ C22  (helix)
  - C20 ↔ G24  (helix)
  - I21 ↔ N25  (helix)
  - Y30 ↔ V34  (helix)
  - P4 ↔ D15  (sheet)
  - P4 ↔ A19  (sheet)
  - D15 ↔ G26  (sheet)
  - D15 ↔ G29  (sheet)
  - A19 ↔ G26  (sheet)
  - A19 ↔ G29  (sheet)
  - A19 ↔ P35  (sheet)
  - … +5 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=12 · exposed=12 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=290 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=182 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.189 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=27 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C20, C10–C22, C16–C28

## Side-chain Rotamers (χ1/χ2)

- 31 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
