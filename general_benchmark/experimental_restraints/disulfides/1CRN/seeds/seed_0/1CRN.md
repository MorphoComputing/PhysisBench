# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1CRN\sequence\1CRN.pdb`
- output_pdb: `general_benchmark\experimental_restraints\disulfides\1CRN\seeds\seed_0\1CRN.pdb`
- residues: 44
- mode: refinement
- ca_rmsd: 6.276 A
- tm_score_ca_ordered: 0.1833131434661997
- heavy_atom_rmsd: 7.659 A
- sidechain_heavy_atom_rmsd: 8.978 A
- **all-atom quality (honest):** heavy 7.659 A, sidechain 8.978 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/35 (0.0)
- lj_severe: 0
- lj_near: 21
- distogram_pairs: 3
- bin_accuracy: 0.333

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=26 · strand(E)=9 · 3-10(G)=8 · coil(C)=1

```
CHGEEGHHHHEHGHHGGHHHHHGHHEHHGHHHHHEHHGHEEEHE
```

## Backbone H-bond Network

- total=23 · helix(i→i+4)=11 · sheet=12
  - A8 ↔ F12  (helix)
  - S10 ↔ V14  (helix)
  - V14 ↔ P18  (helix)
  - C15 ↔ G19  (helix)
  - P18 ↔ E22  (helix)
  - T20 ↔ I24  (helix)
  - P21 ↔ C25  (helix)
  - I24 ↔ Y28  (helix)
  - Y28 ↔ I32  (helix)
  - I33 ↔ A37  (helix)
  - C39 ↔ Y43  (helix)
  - P4 ↔ N11  (sheet)
  - S5 ↔ N11  (sheet)
  - N11 ↔ A26  (sheet)
  - A26 ↔ P35  (sheet)
  - A26 ↔ P40  (sheet)
  - A26 ↔ G41  (sheet)
  - A26 ↔ D42  (sheet)
  - A26 ↔ A44  (sheet)
  - P35 ↔ P40  (sheet)
  - … +3 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=21 · exposed=11 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=374 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=236 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.9771 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=21 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C2–C39, C3–C31, C15–C25

## Side-chain Rotamers (χ1/χ2)

- 35 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
