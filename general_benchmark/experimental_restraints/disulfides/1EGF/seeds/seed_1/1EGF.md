# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1EGF\sequence\1EGF.pdb`
- output_pdb: `general_benchmark\experimental_restraints\disulfides\1EGF\seeds\seed_1\1EGF.pdb`
- residues: 51
- mode: refinement
- ca_rmsd: 7.768 A
- tm_score_ca_ordered: 0.15015148784317853
- heavy_atom_rmsd: 9.125 A
- sidechain_heavy_atom_rmsd: 10.446 A
- **all-atom quality (honest):** heavy 9.125 A, sidechain 10.446 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/45 (0.0)
- lj_severe: 0
- lj_near: 56
- distogram_pairs: 3
- bin_accuracy: 0.667

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=38 · strand(E)=8 · 3-10(G)=4 · coil(C)=1

```
EEGHHEHEEHHGGHHHEHHHHHGHHHHHHHHHHHHEHHHHHHHHHHHEHHC
```

## Backbone H-bond Network

- total=38 · helix(i→i+4)=26 · sheet=12
  - D10 ↔ L14  (helix)
  - L14 ↔ V18  (helix)
  - G16 ↔ M20  (helix)
  - V18 ↔ I22  (helix)
  - M20 ↔ S24  (helix)
  - H21 ↔ L25  (helix)
  - I22 ↔ D26  (helix)
  - S24 ↔ Y28  (helix)
  - L25 ↔ T29  (helix)
  - D26 ↔ C30  (helix)
  - S27 ↔ N31  (helix)
  - Y28 ↔ C32  (helix)
  - T29 ↔ V33  (helix)
  - C30 ↔ I34  (helix)
  - N31 ↔ G35  (helix)
  - V33 ↔ S37  (helix)
  - I34 ↔ G38  (helix)
  - G35 ↔ D39  (helix)
  - S37 ↔ C41  (helix)
  - G38 ↔ Q42  (helix)
  - … +18 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=15 · exposed=16 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=519 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=396 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.829 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=56 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C19, C13–C30, C32–C41

## Side-chain Rotamers (χ1/χ2)

- 45 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
