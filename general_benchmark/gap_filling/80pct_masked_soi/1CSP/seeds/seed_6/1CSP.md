# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1CSP\sequence\1CSP.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1CSP\seeds\seed_6\1CSP.pdb`
- residues: 65
- mode: oracle
- ca_rmsd: 0.478 A
- tm_score_ca_ordered: 0.9738875627130459
- heavy_atom_rmsd: 2.520 A
- sidechain_heavy_atom_rmsd: 3.349 A
- **all-atom quality (honest):** heavy 2.520 A, sidechain 3.349 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/52 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 633
- bin_accuracy: 0.924

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=36
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.47792719601637346
- ga_delta_rmsd: 2.7118362959359716  ga_fitness_mode: energy
- pre_local_rmsd: 0.48577806892205394  localized_anchor_rmsd: 0.4779017165011818

## Failure Classification

- primary_reason: `HEAVY_ATOM_RMSD_HIGH`
- reasons: `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=6 · strand(E)=34 · 3-10(G)=15 · coil(C)=10

```
CEEEGGEGCHEECCEEGGECHEECGEGEHHHEGEGEECEGECGEEECEEGGEEHEEEEEEGGECE
```

## Backbone H-bond Network

- total=66 · helix(i→i+4)=0 · sheet=66
  - E2 ↔ V19  (sheet)
  - E2 ↔ Q22  (sheet)
  - G3 ↔ F16  (sheet)
  - G3 ↔ V19  (sheet)
  - G3 ↔ Q22  (sheet)
  - G3 ↔ D23  (sheet)
  - K4 ↔ G15  (sheet)
  - K4 ↔ F16  (sheet)
  - K4 ↔ V19  (sheet)
  - K4 ↔ Q22  (sheet)
  - K4 ↔ D23  (sheet)
  - W7 ↔ K12  (sheet)
  - W7 ↔ G15  (sheet)
  - W7 ↔ F16  (sheet)
  - W7 ↔ F26  (sheet)
  - E11 ↔ H28  (sheet)
  - K12 ↔ H28  (sheet)
  - G15 ↔ F26  (sheet)
  - G15 ↔ H28  (sheet)
  - G15 ↔ I32  (sheet)
  - … +46 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=34 · exposed=14 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=226 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=139 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.4271 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 52 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
