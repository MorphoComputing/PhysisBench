# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1FKF\sequence\1FKF.pdb`
- output_pdb: `general_benchmark\model_refinement\homologs\1FKF\seeds\seed_0\1FKF.pdb`
- residues: 105
- mode: oracle
- ca_rmsd: 1.701 A
- tm_score_ca_ordered: 0.8888026778449628
- heavy_atom_rmsd: 3.283 A
- sidechain_heavy_atom_rmsd: 4.147 A
- **all-atom quality (honest):** heavy 3.283 A, sidechain 4.147 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/88 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 3422
- bin_accuracy: 0.827

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=54
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 1.7010269906686177
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 1.7054734822908515  localized_anchor_rmsd: 1.701031159753715

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** R12 → 8 conflicts (53%)
- explained: 8/15 conflicts by 1 root cause(s)
- metrics: hubs=8 (frac 0.076), conflicts/hub=1.9, max_incompat=3.21Å, chain_span=0.733
- **fix-first:** [LOW_CONFLICT] Root cause(s): R12 — explain ~8/15 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **E60** — severity 2.79, 3 conflict(s); suspect input ~`R12` (group: push_out)
  - push-out (wants farther): R12@17.0Å(now 12.8,conf 0.35), G11@16.7Å(now 14.0,conf 0.35)
  - Q64↔R12: targets 6.9/17.0Å but partners are 7.1Å apart → too_close_together by 3.0Å
  - A63↔R12: targets 5.7/17.0Å but partners are 8.7Å apart → too_close_together by 2.6Å
  - Q64↔G11: targets 6.9/16.7Å but partners are 7.5Å apart → too_close_together by 2.3Å
- **D78** — severity 2.39, 3 conflict(s); suspect input ~`G88` (group: push_out)
  - pull-in (wants closer): N42@27.2Å(now 30.1,conf 0.89), R41@25.2Å(now 28.1,conf 0.56)
  - push-out (wants farther): G88@18.4Å(now 15.8,conf 0.37), P87@16.4Å(now 13.6,conf 0.35)
  - Y81↔G88: targets 6.7/18.4Å but partners are 9.3Å apart → too_close_together by 2.4Å
  - Y81↔P87: targets 6.7/16.4Å but partners are 7.4Å apart → too_close_together by 2.4Å
  - G88↔G85: targets 18.4/10.2Å but partners are 6.3Å apart → too_close_together by 2.0Å
- **G61** — severity 2.14, 3 conflict(s); suspect input ~`R12` (group: push_out)
  - push-out (wants farther): R12@16.0Å(now 12.3,conf 0.34), G11@15.0Å(now 12.4,conf 0.34)
  - Q64↔R12: targets 5.9/16.0Å but partners are 7.1Å apart → too_close_together by 3.0Å
  - M65↔R12: targets 7.2/16.0Å but partners are 7.1Å apart → too_close_together by 1.6Å
  - Q64↔G11: targets 5.9/15.0Å but partners are 7.5Å apart → too_close_together by 1.6Å
- **V1** — severity 1.85, 2 conflict(s); suspect input ~`Q64` (group: push_out)
  - push-out (wants farther): D10@20.8Å(now 18.2,conf 0.43), R12@20.6Å(now 16.2,conf 0.42), G11@19.3Å(now 15.8,conf 0.39)
  - R12↔Q64: targets 20.6/10.3Å but partners are 7.1Å apart → too_close_together by 3.2Å
  - R12↔G61: targets 20.6/6.4Å but partners are 12.3Å apart → too_close_together by 1.9Å
- **Q2** — severity 0.86, 1 conflict(s); suspect input ~`Q64` (group: push_out)
  - push-out (wants farther): R12@19.8Å(now 15.9,conf 0.40), G11@17.8Å(now 14.6,conf 0.36)
  - R12↔Q64: targets 19.8/10.2Å but partners are 7.1Å apart → too_close_together by 2.5Å
- **W58** — severity 0.68, 1 conflict(s); suspect input ~`A80` (group: push_out)
  - push-out (wants farther): T84@17.5Å(now 14.9,conf 0.36), A83@17.4Å(now 14.8,conf 0.36)
  - A83↔A80: targets 17.4/8.1Å but partners are 7.3Å apart → too_close_together by 1.9Å

## Secondary Structure (DSSP-like)

- helix(H)=31 · strand(E)=32 · 3-10(G)=27 · coil(C)=15

```
CEGGEHEEECGCHECEGHECGCEGEGCEGHHHEGHEGHHHGHECGEEEEGEHHEEGHHHHHHHHEEGHEGECGGGGGHHEHHHHHHEECEECHECGGGGGGCCEC
```

## Backbone H-bond Network

- total=34 · helix(i→i+4)=12 · sheet=22
  - D31 ↔ F35  (helix)
  - F35 ↔ R39  (helix)
  - S38 ↔ N42  (helix)
  - E53 ↔ G57  (helix)
  - G57 ↔ G61  (helix)
  - W58 ↔ V62  (helix)
  - E59 ↔ A63  (helix)
  - E60 ↔ Q64  (helix)
  - Q64 ↔ G68  (helix)
  - D78 ↔ G82  (helix)
  - Y81 ↔ G85  (helix)
  - G82 ↔ H86  (helix)
  - P8 ↔ F14  (sheet)
  - G9 ↔ F14  (sheet)
  - F14 ↔ Q19  (sheet)
  - V23 ↔ K43  (sheet)
  - Y25 ↔ D36  (sheet)
  - Y25 ↔ K43  (sheet)
  - M28 ↔ K33  (sheet)
  - M28 ↔ D36  (sheet)
  - … +14 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=28 · exposed=52 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=435 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=256 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.0076 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 88 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
