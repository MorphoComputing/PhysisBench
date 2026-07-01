# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\5WOW\sequence\5WOW.pdb`
- output_pdb: `general_benchmark\gap_filling\control_noe\noe\5WOW\seeds\seed_2\5WOW.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 7.057 A
- tm_score_ca_ordered: 0.09711892794736592
- heavy_atom_rmsd: 8.592 A
- sidechain_heavy_atom_rmsd: 9.450 A
- **all-atom quality (honest):** heavy 8.592 A, sidechain 9.450 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/31 (0.0)
- lj_severe: 0
- lj_near: 27
- distogram_pairs: 27
- bin_accuracy: 0.370

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=22 · strand(E)=6 · 3-10(G)=6 · coil(C)=3

```
CCHEGHGHEHEHHHHHHHHHHHHEHCGHEHGGGHHHE
```

## Backbone H-bond Network

- total=23 · helix(i→i+4)=13 · sheet=10
  - I6 ↔ C10  (helix)
  - Q8 ↔ R12  (helix)
  - C10 ↔ S14  (helix)
  - R12 ↔ C16  (helix)
  - D13 ↔ P17  (helix)
  - S14 ↔ G18  (helix)
  - D15 ↔ A19  (helix)
  - C16 ↔ C20  (helix)
  - P17 ↔ I21  (helix)
  - G18 ↔ C22  (helix)
  - A19 ↔ R23  (helix)
  - I21 ↔ N25  (helix)
  - Y30 ↔ V34  (helix)
  - P4 ↔ R9  (sheet)
  - P4 ↔ R11  (sheet)
  - P4 ↔ G24  (sheet)
  - R9 ↔ G24  (sheet)
  - R9 ↔ G29  (sheet)
  - R11 ↔ G24  (sheet)
  - R11 ↔ G29  (sheet)
  - … +3 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=17 · exposed=9 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=340 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=221 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.3001 (restraint satisfaction; lower=better)
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
