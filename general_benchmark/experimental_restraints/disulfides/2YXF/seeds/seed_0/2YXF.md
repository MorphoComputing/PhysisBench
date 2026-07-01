# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2YXF\sequence\2YXF.pdb`
- output_pdb: `general_benchmark\experimental_restraints\disulfides\2YXF\seeds\seed_0\2YXF.pdb`
- residues: 97
- mode: refinement
- ca_rmsd: 13.118 A
- tm_score_ca_ordered: 0.13139684216391623
- heavy_atom_rmsd: 13.891 A
- sidechain_heavy_atom_rmsd: 14.679 A
- **all-atom quality (honest):** heavy 13.891 A, sidechain 14.679 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 1/1
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/92 (0.0)
- lj_severe: 0
- lj_near: 118
- distogram_pairs: 1
- bin_accuracy: 0.000

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=66 · strand(E)=17 · 3-10(G)=12 · coil(C)=2

```
CEHHHGGHHEHHEHGHHEHHHGHEHEHGEHGHHHEHHEHHGHHHGHHHHEHHHHEHHHHHGHHHHEHHHHHHHHGHHHHHHHHEGECHHEHGHHHEE
```

## Backbone H-bond Network

- total=80 · helix(i→i+4)=43 · sheet=37
  - T4 ↔ Q8  (helix)
  - P5 ↔ V9  (helix)
  - Q8 ↔ R12  (helix)
  - R12 ↔ E16  (helix)
  - E16 ↔ S20  (helix)
  - N17 ↔ N21  (helix)
  - K19 ↔ L23  (helix)
  - N21 ↔ C25  (helix)
  - L23 ↔ V27  (helix)
  - F30 ↔ D34  (helix)
  - P32 ↔ E36  (helix)
  - S33 ↔ V37  (helix)
  - E36 ↔ L40  (helix)
  - L39 ↔ G43  (helix)
  - L40 ↔ E44  (helix)
  - N42 ↔ I46  (helix)
  - G43 ↔ E47  (helix)
  - E44 ↔ K48  (helix)
  - E47 ↔ H51  (helix)
  - K48 ↔ S52  (helix)
  - … +60 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=48 · exposed=12 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=1521 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=1205 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=3.3475 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=118 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=1: C25–C80

## Side-chain Rotamers (χ1/χ2)

- 92 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
