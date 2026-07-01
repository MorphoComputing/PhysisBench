# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\5WOW\sequence\5WOW.pdb`
- output_pdb: `general_benchmark\gap_filling\control_noe\noe\5WOW\seeds\seed_5\5WOW.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 6.626 A
- tm_score_ca_ordered: 0.11898506081693158
- heavy_atom_rmsd: 7.186 A
- sidechain_heavy_atom_rmsd: 7.585 A
- **all-atom quality (honest):** heavy 7.186 A, sidechain 7.585 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/31 (0.0)
- lj_severe: 0
- lj_near: 16
- distogram_pairs: 27
- bin_accuracy: 0.407

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=27 · strand(E)=9 · 3-10(G)=1 · coil(C)=0

```
EHHHHHHHEEEHHHHHHHHHHHEHHHHHHEHEGEHHE
```

## Backbone H-bond Network

- total=31 · helix(i→i+4)=17 · sheet=14
  - V2 ↔ I6  (helix)
  - C3 ↔ L7  (helix)
  - P4 ↔ Q8  (helix)
  - Q8 ↔ R12  (helix)
  - R12 ↔ C16  (helix)
  - D13 ↔ P17  (helix)
  - S14 ↔ G18  (helix)
  - D15 ↔ A19  (helix)
  - C16 ↔ C20  (helix)
  - P17 ↔ I21  (helix)
  - G18 ↔ C22  (helix)
  - C20 ↔ G24  (helix)
  - I21 ↔ N25  (helix)
  - C22 ↔ G26  (helix)
  - N25 ↔ G29  (helix)
  - Y27 ↔ P31  (helix)
  - P31 ↔ P35  (helix)
  - G1 ↔ R9  (sheet)
  - G1 ↔ C10  (sheet)
  - G1 ↔ R11  (sheet)
  - … +11 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=20 · exposed=10 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=288 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=175 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.596 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=16 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C20, C10–C22, C16–C28

## Side-chain Rotamers (χ1/χ2)

- 31 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
