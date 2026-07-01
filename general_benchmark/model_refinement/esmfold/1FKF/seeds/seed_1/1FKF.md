# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1FKF\sequence\1FKF.pdb`
- output_pdb: `general_benchmark\model_refinement\esmfold\1FKF\seeds\seed_1\1FKF.pdb`
- residues: 105
- mode: oracle
- ca_rmsd: 1.804 A
- tm_score_ca_ordered: 0.8686726856016642
- heavy_atom_rmsd: 3.471 A
- sidechain_heavy_atom_rmsd: 4.387 A
- **all-atom quality (honest):** heavy 3.471 A, sidechain 4.387 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/88 (0.0)
- lj_severe: 0
- lj_near: 5
- distogram_pairs: 3509
- bin_accuracy: 0.822

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=48
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 1.803595889152317
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 1.806940291388314  localized_anchor_rmsd: 1.8036122620965993

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** R12 → 8 conflicts (89%)
- explained: 8/9 conflicts by 1 root cause(s)
- metrics: hubs=6 (frac 0.057), conflicts/hub=1.5, max_incompat=3.32Å, chain_span=0.571
- **fix-first:** [LOW_CONFLICT] Root cause(s): R12 — explain ~8/9 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **E60** — severity 2.10, 2 conflict(s); suspect input ~`R12` (group: push_out)
  - push-out (wants farther): R12@17.3Å(now 13.0,conf 0.35)
  - Q64↔R12: targets 7.0/17.3Å but partners are 7.1Å apart → too_close_together by 3.2Å
  - A63↔R12: targets 5.7/17.3Å but partners are 8.9Å apart → too_close_together by 2.7Å
- **V1** — severity 1.96, 2 conflict(s); suspect input ~`Q64` (group: push_out)
  - push-out (wants farther): D10@21.0Å(now 18.3,conf 0.43), R12@20.8Å(now 16.2,conf 0.43), G11@19.3Å(now 16.1,conf 0.39)
  - R12↔Q64: targets 20.8/10.4Å but partners are 7.1Å apart → too_close_together by 3.3Å
  - R12↔G61: targets 20.8/6.3Å but partners are 12.4Å apart → too_close_together by 2.1Å
- **G61** — severity 1.65, 2 conflict(s); suspect input ~`R12` (group: push_out)
  - push-out (wants farther): R12@16.2Å(now 12.4,conf 0.35)
  - Q64↔R12: targets 5.9/16.2Å but partners are 7.1Å apart → too_close_together by 3.2Å
  - M65↔R12: targets 7.2/16.2Å but partners are 7.4Å apart → too_close_together by 1.6Å
- **Q2** — severity 0.89, 1 conflict(s); suspect input ~`Q64` (group: push_out)
  - push-out (wants farther): R12@19.8Å(now 15.8,conf 0.40), D10@19.6Å(now 16.9,conf 0.39), G11@17.8Å(now 14.8,conf 0.36)
  - R12↔Q64: targets 19.8/10.1Å but partners are 7.1Å apart → too_close_together by 2.6Å
- **V3** — severity 0.68, 1 conflict(s); suspect input ~`R12` (group: push_out)
  - push-out (wants farther): R12@16.9Å(now 13.4,conf 0.35), D10@16.1Å(now 13.5,conf 0.35), G11@14.4Å(now 11.9,conf 0.34)
  - Q64↔R12: targets 7.8/16.9Å but partners are 7.1Å apart → too_close_together by 1.9Å
- **W58** — severity 0.58, 1 conflict(s); suspect input ~`A80` (group: push_out)
  - push-out (wants farther): T84@17.9Å(now 15.3,conf 0.36), A83@17.7Å(now 15.1,conf 0.36)
  - A83↔A80: targets 17.7/8.5Å but partners are 7.5Å apart → too_close_together by 1.7Å

## Secondary Structure (DSSP-like)

- helix(H)=30 · strand(E)=35 · 3-10(G)=26 · coil(C)=14

```
CEEGCHEEEECGHEEGCHECGCECEEEEGHHHEGHEEHHHGHEEGCEGGHHHHEEHHHHGGHHHEEGHEGECGGGGHHHEHCGGGEHECEECHEGGGGGEECHEC
```

## Backbone H-bond Network

- total=46 · helix(i→i+4)=9 · sheet=37
  - D31 ↔ F35  (helix)
  - F35 ↔ R39  (helix)
  - S38 ↔ N42  (helix)
  - Q52 ↔ R56  (helix)
  - E53 ↔ G57  (helix)
  - W58 ↔ V62  (helix)
  - E59 ↔ A63  (helix)
  - Q64 ↔ G68  (helix)
  - P77 ↔ Y81  (helix)
  - V3 ↔ P8  (sheet)
  - G9 ↔ F14  (sheet)
  - G9 ↔ P15  (sheet)
  - D10 ↔ P15  (sheet)
  - F14 ↔ Q19  (sheet)
  - P15 ↔ V23  (sheet)
  - V23 ↔ S37  (sheet)
  - V23 ↔ K43  (sheet)
  - Y25 ↔ D36  (sheet)
  - Y25 ↔ S37  (sheet)
  - Y25 ↔ K43  (sheet)
  - … +26 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=24 · exposed=59 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=439 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=256 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.0068 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=5 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 88 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
