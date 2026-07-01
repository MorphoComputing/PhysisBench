# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1VII\sequence\1VII.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1VII\seeds\seed_0\1VII.pdb`
- residues: 34
- mode: oracle
- ca_rmsd: 2.183 A
- tm_score_ca_ordered: 0.48326086215444414
- heavy_atom_rmsd: 4.095 A
- sidechain_heavy_atom_rmsd: 5.155 A
- **all-atom quality (honest):** heavy 4.095 A, sidechain 5.155 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/29 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 218
- bin_accuracy: 0.766

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=30
- rigid_domain_reconvergence: applied=True accepted=8 rmsd=2.659841033791128 -> 1.8560349679052162 A
- topology_reconvergence: applied=True accepted=6/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 2.1829251536319862
- ga_delta_rmsd: -0.5333140222579582  ga_fitness_mode: energy
- pre_local_rmsd: 2.182934223289316  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=13 · strand(E)=14 · 3-10(G)=1 · coil(C)=6

```
CEHEHHHHCEECEEHHHEHHEEHEEGCEEHECHC
```

## Backbone H-bond Network

- total=34 · helix(i→i+4)=3 · sheet=31
  - D3 ↔ K7  (helix)
  - S15 ↔ N19  (helix)
  - N19 ↔ W23  (helix)
  - S2 ↔ F10  (sheet)
  - S2 ↔ G11  (sheet)
  - S2 ↔ T13  (sheet)
  - S2 ↔ R14  (sheet)
  - E4 ↔ F10  (sheet)
  - E4 ↔ G11  (sheet)
  - E4 ↔ T13  (sheet)
  - E4 ↔ R14  (sheet)
  - F10 ↔ A18  (sheet)
  - F10 ↔ Q25  (sheet)
  - F10 ↔ L28  (sheet)
  - F10 ↔ K29  (sheet)
  - G11 ↔ A18  (sheet)
  - G11 ↔ L28  (sheet)
  - T13 ↔ A18  (sheet)
  - T13 ↔ Q25  (sheet)
  - T13 ↔ L28  (sheet)
  - … +14 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=13 · exposed=14 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=99 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=13 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.9347 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 29 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
