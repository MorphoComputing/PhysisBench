# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1VII\sequence\1VII.pdb`
- output_pdb: `general_benchmark\gap_filling\control_noe\noe\1VII\seeds\seed_9\1VII.pdb`
- residues: 34
- mode: refinement
- ca_rmsd: 6.466 A
- tm_score_ca_ordered: 0.0929940146915194
- heavy_atom_rmsd: 7.661 A
- sidechain_heavy_atom_rmsd: 8.589 A
- **all-atom quality (honest):** heavy 7.661 A, sidechain 8.589 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/29 (0.0)
- lj_severe: 0
- lj_near: 17
- distogram_pairs: 51
- bin_accuracy: 0.588

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=24 · strand(E)=8 · 3-10(G)=0 · coil(C)=2

```
CEEHHHHHEHHHEHHHHHHEHHEHHEHEHHHHHC
```

## Backbone H-bond Network

- total=32 · helix(i→i+4)=15 · sheet=17
  - E4 ↔ A8  (helix)
  - F6 ↔ F10  (helix)
  - K7 ↔ G11  (helix)
  - A8 ↔ M12  (helix)
  - F10 ↔ R14  (helix)
  - G11 ↔ S15  (helix)
  - M12 ↔ A16  (helix)
  - R14 ↔ A18  (helix)
  - S15 ↔ N19  (helix)
  - F17 ↔ P21  (helix)
  - A18 ↔ L22  (helix)
  - P21 ↔ Q25  (helix)
  - Q25 ↔ K29  (helix)
  - N27 ↔ E31  (helix)
  - K29 ↔ G33  (helix)
  - S2 ↔ V9  (sheet)
  - S2 ↔ T13  (sheet)
  - D3 ↔ V9  (sheet)
  - D3 ↔ T13  (sheet)
  - D3 ↔ L20  (sheet)
  - … +12 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=17 · exposed=5 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=307 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=192 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.1166 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=17 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 29 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
