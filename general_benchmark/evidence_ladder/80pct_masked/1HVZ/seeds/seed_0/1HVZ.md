# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set/general_benchmark/1HVZ/sequence/1HVZ.pdb`
- output_pdb: `general_benchmark/evidence_ladder/80pct_masked/1HVZ/seeds/seed_0/1HVZ.pdb`
- residues: 16
- mode: oracle
- ca_rmsd: 4.510 A
- tm_score_ca_ordered: 0.04791865173838249
- heavy_atom_rmsd: 6.124 A
- sidechain_heavy_atom_rmsd: 7.178 A
- **all-atom quality (honest):** heavy 6.124 A, sidechain 7.178 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/15 (0.0)
- lj_severe: 0
- lj_near: 5
- distogram_pairs: 18
- bin_accuracy: 0.444

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=9
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 4.509757785919241
- ga_delta_rmsd: 1.3927448114730305  ga_fitness_mode: energy
- pre_local_rmsd: 4.509731416019363  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** —
- explained: 0/1 conflicts by 0 root cause(s)
- metrics: hubs=1 (frac 0.062), conflicts/hub=1.0, max_incompat=3.38Å, chain_span=0.0
- **fix-first:** [LOW_CONFLICT] Root cause(s): — — explain ~0/1 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **I14** — severity 1.84, 1 conflict(s); suspect input ~`C6` (group: push_out)
  - push-out (wants farther): R8@16.3Å(now 10.6,conf 0.55)
  - R8↔C6: targets 16.3/10.3Å but partners are 2.6Å apart → too_close_together by 3.4Å

## Secondary Structure (DSSP-like)

- helix(H)=9 · strand(E)=5 · 3-10(G)=0 · coil(C)=2

```
CCEHHHHEHHHEEHHE
```

## Backbone H-bond Network

- total=10 · helix(i→i+4)=4 · sheet=6
  - L5 ↔ G9  (helix)
  - C6 ↔ V10  (helix)
  - R7 ↔ C11  (helix)
  - C11 ↔ C15  (helix)
  - R3 ↔ R8  (sheet)
  - R3 ↔ R12  (sheet)
  - R3 ↔ C13  (sheet)
  - R3 ↔ T16  (sheet)
  - R8 ↔ C13  (sheet)
  - R8 ↔ T16  (sheet)

## Solvent Accessibility (burial)

- buried=5 · exposed=6 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=58 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=28 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.1418 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=5 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C2–C15, C4–C13, C6–C11

## Side-chain Rotamers (χ1/χ2)

- 15 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
