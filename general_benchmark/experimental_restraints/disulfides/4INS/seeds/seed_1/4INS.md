# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\4INS\sequence\4INS.pdb`
- output_pdb: `general_benchmark\experimental_restraints\disulfides\4INS\seeds\seed_1\4INS.pdb`
- residues: 94
- mode: refinement
- ca_rmsd: 10.474 A
- tm_score_ca_ordered: 0.15188400709494798
- heavy_atom_rmsd: 11.676 A
- sidechain_heavy_atom_rmsd: 12.827 A
- **all-atom quality (honest):** heavy 11.676 A, sidechain 12.827 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 6/6
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/86 (0.0)
- lj_severe: 0
- lj_near: 98
- distogram_pairs: 6
- bin_accuracy: 1.000

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=70 · strand(E)=14 · 3-10(G)=9 · coil(C)=1

```
CHHEHHHHHHHGHHHGHEHHHHHEHHHGHHEHEHHHHEHHHHHHEGHHHEHGHHHHHHHHHHEHHHHGHHEHHHHHHHHEEHGHGHHEHHGHHE
```

## Backbone H-bond Network

- total=69 · helix(i→i+4)=38 · sheet=31
  - V2 ↔ C6  (helix)
  - E3 ↔ T7  (helix)
  - C5 ↔ I9  (helix)
  - C6 ↔ C10  (helix)
  - I9 ↔ Y13  (helix)
  - C10 ↔ Q14  (helix)
  - Y13 ↔ N17  (helix)
  - N17 ↔ N21  (helix)
  - C19 ↔ H23  (helix)
  - N21 ↔ C25  (helix)
  - H23 ↔ S27  (helix)
  - C25 ↔ L29  (helix)
  - V30 ↔ Y34  (helix)
  - A32 ↔ V36  (helix)
  - V36 ↔ R40  (helix)
  - C37 ↔ G41  (helix)
  - R40 ↔ Y44  (helix)
  - F43 ↔ K47  (helix)
  - Y44 ↔ I48  (helix)
  - K47 ↔ Q51  (helix)
  - … +49 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=40 · exposed=27 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=1182 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=931 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.6808 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=98 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=6: C5–C10, C6–C25, C19–C37, C52–C57, C53–C72, C66–C84

## Side-chain Rotamers (χ1/χ2)

- 86 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
