# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1JBL\sequence\1JBL.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm3\1JBL\seeds\seed_1\1JBL.pdb`
- residues: 12
- mode: oracle
- ca_rmsd: 2.701 A
- tm_score_ca_ordered: 0.0888384375201773
- heavy_atom_rmsd: 3.699 A
- sidechain_heavy_atom_rmsd: 4.409 A
- **all-atom quality (honest):** heavy 3.699 A, sidechain 4.409 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 1/1
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/12 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 45
- bin_accuracy: 0.200

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=12
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 2.7008154525257497
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 2.700863603565755  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** I6 → 6 conflicts (100%)
- explained: 6/6 conflicts by 1 root cause(s)
- metrics: hubs=4 (frac 0.333), conflicts/hub=1.5, max_incompat=5.95Å, chain_span=0.5
- **fix-first:** [LOW_CONFLICT] Root cause(s): I6 — explain ~6/6 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **C10** — severity 1.71, 2 conflict(s); suspect input ~`I6` (group: push_out)
  - push-out (wants farther): C2@6.6Å(now 3.8,conf 0.30), I6@16.8Å(now 9.7,conf 0.16)
  - P7↔I6: targets 7.0/16.8Å but partners are 3.8Å apart → too_close_together by 6.0Å
  - I6↔K4: targets 16.8/6.5Å but partners are 5.4Å apart → too_close_together by 4.9Å
- **F11** — severity 1.22, 2 conflict(s); suspect input ~`I6` (group: push_out)
  - push-out (wants farther): R1@8.5Å(now 5.9,conf 0.20), I6@17.0Å(now 11.9,conf 0.16)
  - P7↔I6: targets 7.9/17.0Å but partners are 3.8Å apart → too_close_together by 5.3Å
  - I6↔K4: targets 17.0/9.2Å but partners are 5.4Å apart → too_close_together by 2.3Å
- **P12** — severity 0.53, 1 conflict(s); suspect input ~`P8` (group: push_out)
  - push-out (wants farther): I6@18.5Å(now 14.4,conf 0.19)
  - I6↔P8: targets 18.5/9.7Å but partners are 5.6Å apart → too_close_together by 3.2Å
- **I6** — severity 0.40, 1 conflict(s); suspect input ~`I9` (group: push_out)
  - push-out (wants farther): P12@18.5Å(now 14.4,conf 0.19), C10@16.8Å(now 9.7,conf 0.16), F11@17.0Å(now 11.9,conf 0.16)
  - C10↔I9: targets 16.8/10.3Å but partners are 3.9Å apart → too_close_together by 2.6Å

## Secondary Structure (DSSP-like)

- helix(H)=4 · strand(E)=6 · 3-10(G)=1 · coil(C)=1

```
EECEGHHEHEHE
```

## Backbone H-bond Network

- total=8 · helix(i→i+4)=1 · sheet=7
  - P7 ↔ F11  (helix)
  - R1 ↔ P8  (sheet)
  - R1 ↔ C10  (sheet)
  - R1 ↔ P12  (sheet)
  - C2 ↔ P8  (sheet)
  - C2 ↔ C10  (sheet)
  - C2 ↔ P12  (sheet)
  - K4 ↔ C10  (sheet)

## Solvent Accessibility (burial)

- buried=6 · exposed=3 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=29 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=11 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.7575 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=1: C2–C10

## Side-chain Rotamers (χ1/χ2)

- 12 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
