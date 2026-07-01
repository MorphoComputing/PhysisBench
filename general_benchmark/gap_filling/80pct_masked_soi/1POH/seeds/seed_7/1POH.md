# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1POH\sequence\1POH.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1POH\seeds\seed_7\1POH.pdb`
- residues: 83
- mode: oracle
- ca_rmsd: 10.366 A
- tm_score_ca_ordered: 0.26909087466234816
- heavy_atom_rmsd: 11.413 A
- sidechain_heavy_atom_rmsd: 12.402 A
- **all-atom quality (honest):** heavy 11.413 A, sidechain 12.402 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/68 (0.0)
- lj_severe: 0
- lj_near: 8
- distogram_pairs: 958
- bin_accuracy: 0.725

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=global reason=rejected_local_chirality_regression tested=45
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 10.366110551964256
- ga_delta_rmsd: -3.1325327438927237  ga_fitness_mode: energy
- pre_local_rmsd: 10.366614757357533  localized_anchor_rmsd: 10.366138148136484

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** —
- explained: 0/1 conflicts by 0 root cause(s)
- metrics: hubs=1 (frac 0.012), conflicts/hub=1.0, max_incompat=1.86Å, chain_span=0.0
- **fix-first:** [LOW_CONFLICT] Root cause(s): — — explain ~0/1 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **T8** — severity 1.01, 1 conflict(s); suspect input ~`V5` (group: push_out)
  - push-out (wants farther): F1@23.5Å(now 20.6,conf 1.00)
  - F1↔V5: targets 23.5/9.3Å but partners are 12.4Å apart → too_close_together by 1.9Å

## Secondary Structure (DSSP-like)

- helix(H)=33 · strand(E)=24 · 3-10(G)=16 · coil(C)=10

```
CEGHHCECEHGCGEEGHGHGHHGHHGHHHHHEECEGHGEEECHHEHGHHHCEEGEECEEECEGEEEHEHHHHHHGHHGHGHHC
```

## Backbone H-bond Network

- total=44 · helix(i→i+4)=10 · sheet=34
  - P17 ↔ F21  (helix)
  - F21 ↔ A25  (helix)
  - A25 ↔ T29  (helix)
  - G27 ↔ E31  (helix)
  - K44 ↔ K48  (helix)
  - L46 ↔ Q50  (helix)
  - E67 ↔ K71  (helix)
  - Q70 ↔ E74  (helix)
  - V73 ↔ V77  (helix)
  - V77 ↔ A81  (helix)
  - I7 ↔ H14  (sheet)
  - A9 ↔ H14  (sheet)
  - I32 ↔ S40  (sheet)
  - I32 ↔ A41  (sheet)
  - I32 ↔ S45  (sheet)
  - T33 ↔ K39  (sheet)
  - T33 ↔ S40  (sheet)
  - T33 ↔ A41  (sheet)
  - T33 ↔ S45  (sheet)
  - T33 ↔ L52  (sheet)
  - … +24 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=30 · exposed=27 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=355 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=192 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.0648 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=8 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 68 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
