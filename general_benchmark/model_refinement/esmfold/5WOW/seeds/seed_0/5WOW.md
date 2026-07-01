# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\5WOW\sequence\5WOW.pdb`
- output_pdb: `general_benchmark\model_refinement\esmfold\5WOW\seeds\seed_0\5WOW.pdb`
- residues: 37
- mode: oracle
- ca_rmsd: 6.699 A
- tm_score_ca_ordered: 0.2159167312190927
- heavy_atom_rmsd: 7.952 A
- sidechain_heavy_atom_rmsd: 9.000 A
- **all-atom quality (honest):** heavy 7.952 A, sidechain 9.000 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/31 (0.0)
- lj_severe: 0
- lj_near: 1
- distogram_pairs: 595
- bin_accuracy: 0.736

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=global reason=rejected_domain_topology_regression tested=30
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 6.698593169349535
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 6.698576965692097  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=13 · strand(E)=14 · 3-10(G)=4 · coil(C)=6

```
CHHEEHHGEHHEHHHHEEHCECEHGEECECECHGEGE
```

## Backbone H-bond Network

- total=33 · helix(i→i+4)=4 · sheet=29
  - C3 ↔ L7  (helix)
  - L7 ↔ R11  (helix)
  - R11 ↔ D15  (helix)
  - D15 ↔ A19  (helix)
  - P4 ↔ P17  (sheet)
  - P4 ↔ G18  (sheet)
  - P4 ↔ I21  (sheet)
  - K5 ↔ P17  (sheet)
  - K5 ↔ G18  (sheet)
  - K5 ↔ I21  (sheet)
  - R9 ↔ P17  (sheet)
  - R9 ↔ I21  (sheet)
  - R9 ↔ R23  (sheet)
  - R9 ↔ G26  (sheet)
  - R9 ↔ Y27  (sheet)
  - R9 ↔ G29  (sheet)
  - R12 ↔ P17  (sheet)
  - R12 ↔ I21  (sheet)
  - R12 ↔ R23  (sheet)
  - R12 ↔ G26  (sheet)
  - … +13 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=14 · exposed=6 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=130 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=72 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.1771 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=1 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C20, C10–C22, C16–C28

## Side-chain Rotamers (χ1/χ2)

- 31 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
