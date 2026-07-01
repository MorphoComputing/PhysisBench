# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1KTH\sequence\1KTH.pdb`
- output_pdb: `general_benchmark\experimental_restraints\disulfides\1KTH\seeds\seed_0\1KTH.pdb`
- residues: 56
- mode: refinement
- ca_rmsd: 9.676 A
- tm_score_ca_ordered: 0.15524724032763748
- heavy_atom_rmsd: 10.936 A
- sidechain_heavy_atom_rmsd: 12.114 A
- **all-atom quality (honest):** heavy 10.936 A, sidechain 12.114 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/48 (0.0)
- lj_severe: 0
- lj_near: 54
- distogram_pairs: 3
- bin_accuracy: 0.000

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=36 · strand(E)=14 · 3-10(G)=6 · coil(C)=0

```
EEGHEGHHEHHEHEHHHEHHHHEHHHGHHEHHHEEHHGHHHHHEHGHGHHHHEHHE
```

## Backbone H-bond Network

- total=56 · helix(i→i+4)=21 · sheet=35
  - C4 ↔ K8  (helix)
  - P7 ↔ G11  (helix)
  - G11 ↔ D15  (helix)
  - D15 ↔ K19  (helix)
  - F16 ↔ W20  (helix)
  - W20 ↔ P24  (helix)
  - Y21 ↔ N25  (helix)
  - Y22 ↔ T26  (helix)
  - P24 ↔ S28  (helix)
  - N25 ↔ C29  (helix)
  - S28 ↔ F32  (helix)
  - C29 ↔ W33  (helix)
  - F32 ↔ G36  (helix)
  - W33 ↔ C37  (helix)
  - G36 ↔ N40  (helix)
  - C37 ↔ E41  (helix)
  - G39 ↔ K43  (helix)
  - E41 ↔ G45  (helix)
  - K43 ↔ Q47  (helix)
  - G45 ↔ E49  (helix)
  - … +36 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=20 · exposed=22 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=613 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=446 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.1253 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=54 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C4–C54, C13–C37, C29–C50

## Side-chain Rotamers (χ1/χ2)

- 48 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
