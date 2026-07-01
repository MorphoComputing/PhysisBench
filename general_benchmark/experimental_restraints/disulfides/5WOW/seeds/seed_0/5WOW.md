# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\5WOW\sequence\5WOW.pdb`
- output_pdb: `general_benchmark\experimental_restraints\disulfides\5WOW\seeds\seed_0\5WOW.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 7.043 A
- tm_score_ca_ordered: 0.082229407809715
- heavy_atom_rmsd: 7.848 A
- sidechain_heavy_atom_rmsd: 8.500 A
- **all-atom quality (honest):** heavy 7.848 A, sidechain 8.500 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/31 (0.0)
- lj_severe: 0
- lj_near: 20
- distogram_pairs: 3
- bin_accuracy: 0.333

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=27 · strand(E)=6 · 3-10(G)=4 · coil(C)=0

```
EHHHHHHHEHHHEHHHEGHHEHHGHHHHHHHGHGHHE
```

## Backbone H-bond Network

- total=26 · helix(i→i+4)=19 · sheet=7
  - V2 ↔ I6  (helix)
  - C3 ↔ L7  (helix)
  - P4 ↔ Q8  (helix)
  - I6 ↔ C10  (helix)
  - L7 ↔ R11  (helix)
  - Q8 ↔ R12  (helix)
  - C10 ↔ S14  (helix)
  - R11 ↔ D15  (helix)
  - R12 ↔ C16  (helix)
  - D15 ↔ A19  (helix)
  - C16 ↔ C20  (helix)
  - A19 ↔ R23  (helix)
  - C22 ↔ G26  (helix)
  - R23 ↔ Y27  (helix)
  - N25 ↔ G29  (helix)
  - G26 ↔ Y30  (helix)
  - Y27 ↔ P31  (helix)
  - G29 ↔ D33  (helix)
  - P31 ↔ P35  (helix)
  - G1 ↔ R9  (sheet)
  - … +6 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=20 · exposed=6 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=309 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=194 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.7179 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=20 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C20, C10–C22, C16–C28

## Side-chain Rotamers (χ1/χ2)

- 31 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
