# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1CTF\sequence\1CTF.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1CTF\seeds\seed_9\1CTF.pdb`
- residues: 66
- mode: oracle
- ca_rmsd: 0.496 A
- tm_score_ca_ordered: 0.9734095305068418
- heavy_atom_rmsd: 2.346 A
- sidechain_heavy_atom_rmsd: 3.146 A
- **all-atom quality (honest):** heavy 2.346 A, sidechain 3.146 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/45 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 642
- bin_accuracy: 0.917

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=36
- rigid_domain_reconvergence: applied=True accepted=7 rmsd=4.829127826997633 -> 4.251093468424395 A
- topology_reconvergence: applied=True accepted=2/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.4961580184219701
- ga_delta_rmsd: 3.3448286140374512  ga_fitness_mode: energy
- pre_local_rmsd: 0.501903404333864  localized_anchor_rmsd: 0.4961534543381152

## Failure Classification

- primary_reason: `LOCAL_HOTSPOT_REMAINS`
- reasons: `LOCAL_HOTSPOT_REMAINS`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=32 · strand(E)=15 · 3-10(G)=12 · coil(C)=7

```
CEEECHEGEHHHHHHHHHHHHGEGEEGHHHHHHHGGEHECCEGHEEGGHGHHHHHHHGHHCECGEC
```

## Backbone H-bond Network

- total=23 · helix(i→i+4)=19 · sheet=4
  - K6 ↔ A10  (helix)
  - A10 ↔ A14  (helix)
  - N11 ↔ V15  (helix)
  - K12 ↔ I16  (helix)
  - V13 ↔ K17  (helix)
  - A14 ↔ A18  (helix)
  - V15 ↔ V19  (helix)
  - I16 ↔ R20  (helix)
  - K17 ↔ G21  (helix)
  - K28 ↔ D32  (helix)
  - E29 ↔ L33  (helix)
  - A30 ↔ V34  (helix)
  - V34 ↔ P38  (helix)
  - D49 ↔ L53  (helix)
  - E51 ↔ K55  (helix)
  - A52 ↔ A56  (helix)
  - L53 ↔ L57  (helix)
  - K55 ↔ E59  (helix)
  - A56 ↔ A60  (helix)
  - V3 ↔ T23  (sheet)
  - … +3 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=29 · exposed=20 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=253 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=106 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.45 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 45 residues with modelled χ angles (full table in report JSON)

## Warnings

- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
