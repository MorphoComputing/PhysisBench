# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\5WOW\sequence\5WOW.pdb`
- output_pdb: `general_benchmark\experimental_restraints\disulfides\5WOW\seeds\seed_1\5WOW.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 5.274 A
- tm_score_ca_ordered: 0.17605826910739553
- heavy_atom_rmsd: 6.158 A
- sidechain_heavy_atom_rmsd: 6.822 A
- **all-atom quality (honest):** heavy 6.158 A, sidechain 6.822 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/31 (0.0)
- lj_severe: 0
- lj_near: 24
- distogram_pairs: 3
- bin_accuracy: 0.000

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=24 · strand(E)=9 · 3-10(G)=4 · coil(C)=0

```
EHEEHHHHEHHGHHHHGHHHHEEHEHHEHGHHGHHHE
```

## Backbone H-bond Network

- total=25 · helix(i→i+4)=10 · sheet=15
  - V2 ↔ I6  (helix)
  - I6 ↔ C10  (helix)
  - C10 ↔ S14  (helix)
  - R11 ↔ D15  (helix)
  - S14 ↔ G18  (helix)
  - D15 ↔ A19  (helix)
  - C16 ↔ C20  (helix)
  - C20 ↔ G24  (helix)
  - Y27 ↔ P31  (helix)
  - P31 ↔ P35  (helix)
  - G1 ↔ R9  (sheet)
  - C3 ↔ R9  (sheet)
  - C3 ↔ C22  (sheet)
  - C3 ↔ R23  (sheet)
  - P4 ↔ R9  (sheet)
  - P4 ↔ C22  (sheet)
  - P4 ↔ R23  (sheet)
  - R9 ↔ C22  (sheet)
  - R9 ↔ R23  (sheet)
  - R9 ↔ N25  (sheet)
  - … +5 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=18 · exposed=11 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=312 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=197 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.1253 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=24 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C20, C10–C22, C16–C28

## Side-chain Rotamers (χ1/χ2)

- 31 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
