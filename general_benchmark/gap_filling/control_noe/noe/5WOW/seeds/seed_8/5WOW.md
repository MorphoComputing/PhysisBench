# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\5WOW\sequence\5WOW.pdb`
- output_pdb: `general_benchmark\gap_filling\control_noe\noe\5WOW\seeds\seed_8\5WOW.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 7.247 A
- tm_score_ca_ordered: 0.08977085373875957
- heavy_atom_rmsd: 8.627 A
- sidechain_heavy_atom_rmsd: 9.475 A
- **all-atom quality (honest):** heavy 8.627 A, sidechain 9.475 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/31 (0.0)
- lj_severe: 0
- lj_near: 26
- distogram_pairs: 27
- bin_accuracy: 0.481

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=24 · strand(E)=10 · 3-10(G)=2 · coil(C)=1

```
CEHHEHEEEHHHHEHHHHEHHHEHHHEHHHHHGGHHE
```

## Backbone H-bond Network

- total=41 · helix(i→i+4)=14 · sheet=27
  - I6 ↔ C10  (helix)
  - R11 ↔ D15  (helix)
  - R12 ↔ C16  (helix)
  - D13 ↔ P17  (helix)
  - C16 ↔ C20  (helix)
  - P17 ↔ I21  (helix)
  - G18 ↔ C22  (helix)
  - C20 ↔ G24  (helix)
  - I21 ↔ N25  (helix)
  - C22 ↔ G26  (helix)
  - N25 ↔ G29  (helix)
  - G26 ↔ Y30  (helix)
  - P31 ↔ P35  (helix)
  - Y32 ↔ D36  (helix)
  - V2 ↔ L7  (sheet)
  - V2 ↔ Q8  (sheet)
  - V2 ↔ R9  (sheet)
  - V2 ↔ S14  (sheet)
  - V2 ↔ A19  (sheet)
  - K5 ↔ S14  (sheet)
  - … +21 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=12 · exposed=16 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=346 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=240 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.6326 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=26 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C20, C10–C22, C16–C28

## Side-chain Rotamers (χ1/χ2)

- 31 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
