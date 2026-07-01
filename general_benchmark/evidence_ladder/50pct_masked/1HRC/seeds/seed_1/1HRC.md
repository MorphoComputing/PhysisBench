# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1HRC\sequence\1HRC.pdb`
- output_pdb: `general_benchmark\evidence_ladder\50pct_masked\1HRC\seeds\seed_1\1HRC.pdb`
- residues: 102
- mode: oracle
- ca_rmsd: 0.234 A
- tm_score_ca_ordered: 0.9960852409396415
- heavy_atom_rmsd: 3.025 A
- sidechain_heavy_atom_rmsd: 4.022 A
- **all-atom quality (honest):** heavy 3.025 A, sidechain 4.022 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/85 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 1628
- bin_accuracy: 0.940

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=51
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.2336106755585966
- ga_delta_rmsd: 0.13454950925953868  ga_fitness_mode: energy
- pre_local_rmsd: 0.2374414725324505  localized_anchor_rmsd: 0.23362997245092054

## Failure Classification

- primary_reason: `HEAVY_ATOM_RMSD_HIGH`
- reasons: `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=48 · strand(E)=30 · 3-10(G)=17 · coil(C)=7

```
EHHHHHHHHHEEHHHEEEGECHEECEHEECGEGHCHEEEHHEHHEGEECHHHCEGEEGEHGHHHHGHHHGHHHHGHEHEGEGECGEGHHHHHHHHGHHGGHE
```

## Backbone H-bond Network

- total=84 · helix(i→i+4)=21 · sheet=63
  - V2 ↔ K6  (helix)
  - E3 ↔ K7  (helix)
  - K4 ↔ I8  (helix)
  - G5 ↔ F9  (helix)
  - K6 ↔ V10  (helix)
  - V10 ↔ A14  (helix)
  - G36 ↔ G40  (helix)
  - G40 ↔ G44  (helix)
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
