# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1EGF\sequence\1EGF.pdb`
- output_pdb: `general_benchmark\experimental_restraints\disulfides\1EGF\seeds\seed_0\1EGF.pdb`
- residues: 51
- mode: refinement
- ca_rmsd: 8.942 A
- tm_score_ca_ordered: 0.0912171261971695
- heavy_atom_rmsd: 10.035 A
- sidechain_heavy_atom_rmsd: 10.870 A
- **all-atom quality (honest):** heavy 10.035 A, sidechain 10.870 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/45 (0.0)
- lj_severe: 0
- lj_near: 39
- distogram_pairs: 3
- bin_accuracy: 0.667

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=36 · strand(E)=12 · 3-10(G)=2 · coil(C)=1

```
EEGHHHEHHHEHHHEHHHHHHHEHEEHHHHHHEEHHHHHHHEGHEHHHHHC
```

## Backbone H-bond Network

- total=53 · helix(i→i+4)=24 · sheet=29
  - G4 ↔ S8  (helix)
  - C5 ↔ Y9  (helix)
  - P6 ↔ D10  (helix)
  - S8 ↔ Y12  (helix)
  - Y9 ↔ C13  (helix)
  - D10 ↔ L14  (helix)
  - Y12 ↔ G16  (helix)
  - C13 ↔ G17  (helix)
  - L14 ↔ V18  (helix)
  - G16 ↔ M20  (helix)
  - G17 ↔ H21  (helix)
  - V18 ↔ I22  (helix)
  - M20 ↔ S24  (helix)
  - S24 ↔ Y28  (helix)
  - S27 ↔ N31  (helix)
  - Y28 ↔ C32  (helix)
  - N31 ↔ G35  (helix)
  - C32 ↔ Y36  (helix)
  - G35 ↔ D39  (helix)
  - Y36 ↔ R40  (helix)
  - … +33 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=20 · exposed=20 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=434 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=284 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.5697 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=39 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C19, C13–C30, C32–C41

## Side-chain Rotamers (χ1/χ2)

- 45 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
