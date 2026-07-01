# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1FKF\sequence\1FKF.pdb`
- output_pdb: `general_benchmark\model_refinement\af2\1FKF\seeds\seed_1\1FKF.pdb`
- residues: 105
- mode: oracle
- ca_rmsd: 1.881 A
- tm_score_ca_ordered: 0.8557638131933433
- heavy_atom_rmsd: 3.565 A
- sidechain_heavy_atom_rmsd: 4.454 A
- **all-atom quality (honest):** heavy 3.565 A, sidechain 4.454 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/88 (0.0)
- lj_severe: 0
- lj_near: 5
- distogram_pairs: 3511
- bin_accuracy: 0.809

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=60
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 1.8806686388909581
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 1.8859998947261167  localized_anchor_rmsd: 1.880675947725239

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** R12 → 7 conflicts (58%); Y81 → 4 conflicts (33%)
- explained: 11/12 conflicts by 2 root cause(s)
- metrics: hubs=9 (frac 0.086), conflicts/hub=1.3, max_incompat=2.98Å, chain_span=0.571
- **fix-first:** [LOW_CONFLICT] Root cause(s): R12 + Y81 — explain ~11/12 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **E60** — severity 1.85, 2 conflict(s); suspect input ~`R12` (group: push_out)
  - push-out (wants farther): R12@17.1Å(now 13.2,conf 0.35)
  - Q64↔R12: targets 7.0/17.1Å but partners are 7.3Å apart → too_close_together by 2.9Å
  - A63↔R12: targets 5.8/17.1Å but partners are 9.0Å apart → too_close_together by 2.4Å
- **V1** — severity 1.74, 2 conflict(s); suspect input ~`Q64` (group: push_out)
  - push-out (wants farther): R12@20.7Å(now 16.7,conf 0.43), G11@19.3Å(now 16.6,conf 0.39)
  - R12↔Q64: targets 20.7/10.4Å but partners are 7.3Å apart → too_close_together by 3.0Å
  - R12↔G61: targets 20.7/6.4Å but partners are 12.6Å apart → too_close_together by 1.8Å
- **I55** — severity 1.46, 2 conflict(s); suspect input ~`P92` (group: push_out)
  - push-out (wants farther): G88@17.3Å(now 12.3,conf 0.35), P87@15.2Å(now 10.4,conf 0.34), P91@14.9Å(now 12.4,conf 0.34), P92@14.6Å(now 12.0,conf 0.34), T84@13.3Å(now 10.4,conf 0.34)
  - Y81↔P92: targets 7.4/14.6Å but partners are 4.6Å apart → too_close_together by 2.6Å
  - Y81↔P91: targets 7.4/14.9Å but partners are 5.9Å apart → too_close_together by 1.6Å
- **G61** — severity 0.96, 1 conflict(s); suspect input ~`R12` (group: push_out)
  - push-out (wants farther): R12@16.0Å(now 12.6,conf 0.34)
  - Q64↔R12: targets 5.9/16.0Å but partners are 7.3Å apart → too_close_together by 2.8Å
- **V54** — severity 0.88, 1 conflict(s); suspect input ~`Y81` (group: push_out)
  - push-out (wants farther): P92@17.4Å(now 14.5,conf 0.36), P91@17.3Å(now 14.1,conf 0.35), A83@16.8Å(now 14.2,conf 0.35), P87@16.3Å(now 10.1,conf 0.35), T84@15.8Å(now 12.6,conf 0.34), I89@15.8Å(now 12.7,conf 0.34)
  - P92↔Y81: targets 17.4/10.2Å but partners are 4.6Å apart → too_close_together by 2.6Å
- **R56** — severity 0.82, 1 conflict(s); suspect input ~`Y81` (group: push_out)
  - push-out (wants farther): P92@16.3Å(now 13.6,conf 0.35), T84@15.1Å(now 11.8,conf 0.34), A83@14.6Å(now 11.5,conf 0.34)
  - P92↔Y81: targets 16.3/9.3Å but partners are 4.6Å apart → too_close_together by 2.4Å

## Secondary Structure (DSSP-like)

- helix(H)=31 · strand(E)=37 · 3-10(G)=25 · coil(C)=12

```
CEEGGHEEEEGGHECECHECGCEGEGEEGHEHEGHEEHHHEHEGEEEGGHHHHEEHHHHHHHHHEEGHEGECGGGGHHHEHECGGEHECEECHECGGGGGECHEC
```

## Backbone H-bond Network

- total=50 · helix(i→i+4)=11 · sheet=39
  - F35 ↔ R39  (helix)
  - S38 ↔ N42  (helix)
  - Q52 ↔ R56  (helix)
  - E53 ↔ G57  (helix)
  - R56 ↔ E60  (helix)
  - G57 ↔ G61  (helix)
  - W58 ↔ V62  (helix)
  - E59 ↔ A63  (helix)
  - E60 ↔ Q64  (helix)
  - Q64 ↔ G68  (helix)
  - P77 ↔ Y81  (helix)
  - V3 ↔ P8  (sheet)
  - P8 ↔ F14  (sheet)
  - G9 ↔ F14  (sheet)
  - F14 ↔ Q19  (sheet)
  - V23 ↔ S37  (sheet)
  - V23 ↔ R41  (sheet)
  - V23 ↔ K43  (sheet)
  - Y25 ↔ D36  (sheet)
  - Y25 ↔ S37  (sheet)
  - … +30 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=23 · exposed=57 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=440 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=257 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.0087 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=5 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 88 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
