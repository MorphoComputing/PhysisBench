# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1CSP\sequence\1CSP.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1CSP\seeds\seed_2\1CSP.pdb`
- residues: 65
- mode: oracle
- ca_rmsd: 0.452 A
- tm_score_ca_ordered: 0.9751202325627213
- heavy_atom_rmsd: 2.716 A
- sidechain_heavy_atom_rmsd: 3.630 A
- **all-atom quality (honest):** heavy 2.716 A, sidechain 3.630 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/52 (0.0)
- lj_severe: 0
- lj_near: 1
- distogram_pairs: 633
- bin_accuracy: 0.913

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=45
- rigid_domain_reconvergence: applied=True accepted=8 rmsd=2.870003683358062 -> 2.60059767184613 A
- topology_reconvergence: applied=True accepted=33/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.4519216475074057
- ga_delta_rmsd: -0.10558998292203214  ga_fitness_mode: energy
- pre_local_rmsd: 0.46138452737884256  localized_anchor_rmsd: 0.45197026511828686

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=7 · strand(E)=32 · 3-10(G)=15 · coil(C)=11

```
CEEEGHEGHHEECCEEEEGGGEECGGGEGHHEGEEEECEGECHECEGEECGEEHEEEECEGCEGC
```

## Backbone H-bond Network

- total=61 · helix(i→i+4)=1 · sheet=60
  - K6 ↔ S10  (helix)
  - E2 ↔ I17  (sheet)
  - E2 ↔ E18  (sheet)
  - E2 ↔ Q22  (sheet)
  - G3 ↔ F16  (sheet)
  - G3 ↔ I17  (sheet)
  - G3 ↔ E18  (sheet)
  - G3 ↔ Q22  (sheet)
  - G3 ↔ D23  (sheet)
  - K4 ↔ G15  (sheet)
  - K4 ↔ F16  (sheet)
  - K4 ↔ I17  (sheet)
  - K4 ↔ E18  (sheet)
  - K4 ↔ Q22  (sheet)
  - K4 ↔ D23  (sheet)
  - W7 ↔ K12  (sheet)
  - W7 ↔ G15  (sheet)
  - W7 ↔ F16  (sheet)
  - W7 ↔ I17  (sheet)
  - W7 ↔ E18  (sheet)
  - … +41 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=35 · exposed=14 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=230 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=141 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.4457 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=1 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 52 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
