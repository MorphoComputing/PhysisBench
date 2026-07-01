# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1CSP\sequence\1CSP.pdb`
- output_pdb: `general_benchmark\evidence_ladder\50pct_masked\1CSP\seeds\seed_0\1CSP.pdb`
- residues: 65
- mode: oracle
- ca_rmsd: 0.089 A
- tm_score_ca_ordered: 0.9989821372766309
- heavy_atom_rmsd: 2.723 A
- sidechain_heavy_atom_rmsd: 3.574 A
- **all-atom quality (honest):** heavy 2.723 A, sidechain 3.574 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/52 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 976
- bin_accuracy: 0.981

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=45
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.08850697347852798
- ga_delta_rmsd: 0.02370451634804105  ga_fitness_mode: energy
- pre_local_rmsd: 0.08974256161707549  localized_anchor_rmsd: 0.08853778807393015

## Failure Classification

- primary_reason: `HEAVY_ATOM_RMSD_HIGH`
- reasons: `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=7 · strand(E)=29 · 3-10(G)=20 · coil(C)=9

```
CEEEGGEGGGGGGCEEEGECHEECGGEEHHHEGEEECCEGECHEGECEEGGEEHHEEEEGGGEGC
```

## Backbone H-bond Network

- total=63 · helix(i→i+4)=0 · sheet=63
  - E2 ↔ I17  (sheet)
  - E2 ↔ V19  (sheet)
  - E2 ↔ Q22  (sheet)
  - G3 ↔ F16  (sheet)
  - G3 ↔ I17  (sheet)
  - G3 ↔ V19  (sheet)
  - G3 ↔ Q22  (sheet)
  - G3 ↔ D23  (sheet)
  - K4 ↔ G15  (sheet)
  - K4 ↔ F16  (sheet)
  - K4 ↔ I17  (sheet)
  - K4 ↔ V19  (sheet)
  - K4 ↔ Q22  (sheet)
  - K4 ↔ D23  (sheet)
  - W7 ↔ G15  (sheet)
  - W7 ↔ F16  (sheet)
  - W7 ↔ I17  (sheet)
  - W7 ↔ V27  (sheet)
  - G15 ↔ V27  (sheet)
  - G15 ↔ H28  (sheet)
  - … +43 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=34 · exposed=14 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=233 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=142 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.6532 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 52 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
