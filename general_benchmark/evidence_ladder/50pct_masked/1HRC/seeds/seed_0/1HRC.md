# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1HRC\sequence\1HRC.pdb`
- output_pdb: `general_benchmark\evidence_ladder\50pct_masked\1HRC\seeds\seed_0\1HRC.pdb`
- residues: 102
- mode: oracle
- ca_rmsd: 0.233 A
- tm_score_ca_ordered: 0.9960895020229938
- heavy_atom_rmsd: 2.868 A
- sidechain_heavy_atom_rmsd: 3.780 A
- **all-atom quality (honest):** heavy 2.868 A, sidechain 3.780 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/85 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 1628
- bin_accuracy: 0.940

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=54
- rigid_domain_reconvergence: applied=True accepted=2 rmsd=0.32903515491054763 -> 0.302997914131818 A
- topology_reconvergence: applied=True accepted=2/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.23350583698679064
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 0.23730730440803832  localized_anchor_rmsd: 0.23349950053803187

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=45 · strand(E)=31 · 3-10(G)=17 · coil(C)=9

```
EHHHHHHHHHEEHHHEEEGECHEECEHEECGEGHEHEEEHCECGECEECHHHCEGEEGEHGHHHHGHHHGHHHHGHEHEGEGECGEGHHHHHHHHGHHGGHE
```

## Backbone H-bond Network

- total=84 · helix(i→i+4)=20 · sheet=64
  - V2 ↔ K6  (helix)
  - E3 ↔ K7  (helix)
  - K4 ↔ I8  (helix)
  - G5 ↔ F9  (helix)
  - K6 ↔ V10  (helix)
  - V10 ↔ A14  (helix)
  - G36 ↔ G40  (helix)
  - E60 ↔ M64  (helix)
  - L63 ↔ L67  (helix)
  - M64 ↔ E68  (helix)
  - L67 ↔ K71  (helix)
  - E68 ↔ K72  (helix)
  - K72 ↔ G76  (helix)
  - T88 ↔ D92  (helix)
  - E89 ↔ L93  (helix)
  - R90 ↔ I94  (helix)
  - E91 ↔ A95  (helix)
  - L93 ↔ L97  (helix)
  - I94 ↔ K98  (helix)
  - L97 ↔ T101  (helix)
  - … +64 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=35 · exposed=37 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=372 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=152 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.6338 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 85 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
