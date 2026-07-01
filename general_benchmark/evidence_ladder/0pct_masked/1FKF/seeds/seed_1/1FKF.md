# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set/general_benchmark/1FKF/sequence/1FKF.pdb`
- output_pdb: `general_benchmark/evidence_ladder/0pct_masked/1FKF/seeds/seed_1/1FKF.pdb`
- residues: 105
- mode: oracle
- ca_rmsd: 1.687 A
- tm_score_ca_ordered: 0.8994453794122175
- heavy_atom_rmsd: 3.300 A
- sidechain_heavy_atom_rmsd: 4.155 A
- **all-atom quality (honest):** heavy 3.300 A, sidechain 4.155 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/88 (0.0)
- lj_severe: 0
- lj_near: 6
- distogram_pairs: 3441
- bin_accuracy: 0.839

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=54
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 1.6873551622365988
- ga_delta_rmsd: 0.009065077528692678  ga_fitness_mode: energy
- pre_local_rmsd: 1.6903839262656615  localized_anchor_rmsd: 1.687392505800487

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** I55-G57 → 22 conflicts (55%); R12 → 14 conflicts (35%)
- explained: 36/40 conflicts by 2 root cause(s)
- metrics: hubs=14 (frac 0.133), conflicts/hub=2.9, max_incompat=3.89Å, chain_span=0.867
- **fix-first:** [LOW_CONFLICT] Root cause(s): I55-G57 + R12 — explain ~36/40 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **R56** — severity 10.67, 9 conflict(s); suspect input ~`Y81` (group: push_out)
  - push-out (wants farther): P91@17.9Å(now 15.4,conf 0.55), P92@16.9Å(now 12.8,conf 0.55), A83@15.1Å(now 10.6,conf 0.55), T84@15.5Å(now 10.6,conf 0.55)
  - P92↔Y81: targets 16.9/9.8Å but partners are 3.5Å apart → too_close_together by 3.6Å
  - A80↔P92: targets 6.6/16.9Å but partners are 7.3Å apart → too_close_together by 2.9Å
  - A80↔A83: targets 6.6/15.1Å but partners are 6.4Å apart → too_close_together by 2.1Å
- **G57** — severity 7.85, 6 conflict(s); suspect input ~`A83` (group: push_out)
  - push-out (wants farther): A83@15.3Å(now 12.1,conf 0.55), P92@16.3Å(now 13.7,conf 0.55), T84@16.1Å(now 12.6,conf 0.55)
  - A80↔P92: targets 6.3/16.3Å but partners are 7.3Å apart → too_close_together by 2.6Å
  - P92↔Y81: targets 16.3/10.2Å but partners are 3.5Å apart → too_close_together by 2.6Å
  - A80↔T84: targets 6.3/16.1Å but partners are 7.2Å apart → too_close_together by 2.6Å
- **I55** — severity 6.98, 5 conflict(s); suspect input ~`A83` (group: push_out)
  - push-out (wants farther): G88@17.5Å(now 13.3,conf 0.55), P92@15.2Å(now 11.3,conf 0.55), P87@15.2Å(now 10.5,conf 0.55), P91@15.7Å(now 12.9,conf 0.55), T84@13.7Å(now 8.7,conf 0.55), A83@14.2Å(now 9.9,conf 0.55)
  - P92↔Y81: targets 15.2/7.9Å but partners are 3.5Å apart → too_close_together by 3.9Å
  - A80↔P92: targets 5.4/15.2Å but partners are 7.3Å apart → too_close_together by 2.5Å
  - A80↔A83: targets 5.4/14.2Å but partners are 6.4Å apart → too_close_together by 2.4Å
- **E60** — severity 5.72, 4 conflict(s); suspect input ~`R12` (group: push_out)
  - push-out (wants farther): R12@17.2Å(now 12.7,conf 0.55), G11@16.8Å(now 14.1,conf 0.55)
  - A63↔R12: targets 5.4/17.2Å but partners are 8.2Å apart → too_close_together by 3.6Å
  - Q64↔R12: targets 6.9/17.2Å but partners are 7.1Å apart → too_close_together by 3.2Å
  - Q64↔G11: targets 6.9/16.8Å but partners are 7.7Å apart → too_close_together by 2.2Å
- **V1** — severity 4.17, 3 conflict(s); suspect input ~`Q64` (group: push_out)
  - push-out (wants farther): R12@20.9Å(now 16.9,conf 0.59)
  - R12↔Q64: targets 20.9/10.3Å but partners are 7.1Å apart → too_close_together by 3.4Å
  - R12↔G61: targets 20.9/6.0Å but partners are 12.2Å apart → too_close_together by 2.6Å
  - R12↔A63: targets 20.9/11.1Å but partners are 8.2Å apart → too_close_together by 1.6Å
- **G61** — severity 2.76, 2 conflict(s); suspect input ~`R12` (group: push_out)
  - push-out (wants farther): R12@16.0Å(now 12.2,conf 0.55)
  - Q64↔R12: targets 5.6/16.0Å but partners are 7.1Å apart → too_close_together by 3.3Å
  - M65↔R12: targets 7.2/16.0Å but partners are 7.1Å apart → too_close_together by 1.7Å

## Secondary Structure (DSSP-like)

- helix(H)=29 · strand(E)=34 · 3-10(G)=32 · coil(C)=10

```
CECGEHEEEGGHHEEGGHECGCEGEGCEGGHHEGHEGHHHGHEEGGEEEHGHHEEHHHHGHHHHEEGHEGECGGGEHHHEGHEGGEHCEEEGCEGEGGGGGCHEC
```

## Backbone H-bond Network

- total=51 · helix(i→i+4)=10 · sheet=41
  - D31 ↔ F35  (helix)
  - F35 ↔ R39  (helix)
  - S38 ↔ N42  (helix)
  - Q52 ↔ R56  (helix)
  - E53 ↔ G57  (helix)
  - G57 ↔ G61  (helix)
  - W58 ↔ V62  (helix)
  - E59 ↔ A63  (helix)
  - Q64 ↔ G68  (helix)
  - D78 ↔ G82  (helix)
  - P8 ↔ F14  (sheet)
  - G9 ↔ F14  (sheet)
  - G9 ↔ P15  (sheet)
  - F14 ↔ Q19  (sheet)
  - P15 ↔ V23  (sheet)
  - V23 ↔ K43  (sheet)
  - Y25 ↔ D36  (sheet)
  - Y25 ↔ K43  (sheet)
  - Y25 ↔ P44  (sheet)
  - M28 ↔ K33  (sheet)
  - … +31 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=25 · exposed=58 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=439 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=251 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.6838 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=6 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 88 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
