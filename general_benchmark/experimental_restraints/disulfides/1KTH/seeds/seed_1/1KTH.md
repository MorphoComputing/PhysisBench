# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1KTH\sequence\1KTH.pdb`
- output_pdb: `general_benchmark\experimental_restraints\disulfides\1KTH\seeds\seed_1\1KTH.pdb`
- residues: 56
- mode: refinement
- ca_rmsd: 9.664 A
- tm_score_ca_ordered: 0.097800335443289
- heavy_atom_rmsd: 10.706 A
- sidechain_heavy_atom_rmsd: 11.707 A
- **all-atom quality (honest):** heavy 10.706 A, sidechain 11.707 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/48 (0.0)
- lj_severe: 0
- lj_near: 55
- distogram_pairs: 3
- bin_accuracy: 0.333

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=42 · strand(E)=9 · 3-10(G)=4 · coil(C)=1

```
CEEHHHHHHHHHHEHHHEHGHHHGHEHHHHHHGHHEHHHHGHEHHHHHHHHEHHHE
```

## Backbone H-bond Network

- total=40 · helix(i→i+4)=27 · sheet=13
  - K5 ↔ D9  (helix)
  - L6 ↔ E10  (helix)
  - P7 ↔ G11  (helix)
  - D9 ↔ C13  (helix)
  - G11 ↔ D15  (helix)
  - T12 ↔ F16  (helix)
  - C13 ↔ I17  (helix)
  - D15 ↔ K19  (helix)
  - I17 ↔ Y21  (helix)
  - K19 ↔ D23  (helix)
  - Y21 ↔ N25  (helix)
  - D23 ↔ K27  (helix)
  - N25 ↔ C29  (helix)
  - S28 ↔ F32  (helix)
  - A30 ↔ Y34  (helix)
  - Y34 ↔ G38  (helix)
  - G35 ↔ G39  (helix)
  - G38 ↔ N42  (helix)
  - N40 ↔ F44  (helix)
  - N42 ↔ S46  (helix)
  - … +20 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=23 · exposed=15 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=580 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=416 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.9771 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=55 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C4–C54, C13–C37, C29–C50

## Side-chain Rotamers (χ1/χ2)

- 48 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
