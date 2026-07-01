# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set/general_benchmark/1CRN/sequence/1CRN.pdb`
- output_pdb: `general_benchmark/evidence_ladder/80pct_masked/1CRN/seeds/seed_1/1CRN.pdb`
- residues: 44
- mode: oracle
- ca_rmsd: 3.420 A
- tm_score_ca_ordered: 0.41618323139071955
- heavy_atom_rmsd: 4.302 A
- sidechain_heavy_atom_rmsd: 5.128 A
- **all-atom quality (honest):** heavy 4.302 A, sidechain 5.128 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/35 (0.0)
- lj_severe: 0
- lj_near: 6
- distogram_pairs: 172
- bin_accuracy: 0.517

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=36
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 3.4199584444168507
- ga_delta_rmsd: 1.4062593715400622  ga_fitness_mode: energy
- pre_local_rmsd: 3.556132658538792  localized_anchor_rmsd: 3.4199131636374203

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** A23 → 3 conflicts (43%)
- explained: 3/7 conflicts by 1 root cause(s)
- metrics: hubs=5 (frac 0.114), conflicts/hub=1.4, max_incompat=4.15Å, chain_span=0.659
- **fix-first:** [LOW_CONFLICT] Root cause(s): A23 — explain ~3/7 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **A23** — severity 5.16, 3 conflict(s); suspect input ~`T1` (group: push_out)
  - push-out (wants farther): G41@20.5Å(now 16.9,conf 0.59), R16@10.3Å(now 7.2,conf 0.55), L17@14.0Å(now 9.2,conf 0.55), V14@14.0Å(now 9.0,conf 0.55)
  - G41↔T1: targets 20.5/9.7Å but partners are 6.7Å apart → too_close_together by 4.2Å
  - G41↔C2: targets 20.5/12.0Å but partners are 5.2Å apart → too_close_together by 3.3Å
  - G41↔I32: targets 20.5/8.0Å but partners are 10.4Å apart → too_close_together by 2.0Å
- **A26** — severity 1.47, 1 conflict(s); suspect input ~`L17` (group: push_out)
  - push-out (wants farther): L17@13.8Å(now 10.4,conf 0.55)
  - E22↔L17: targets 6.0/13.8Å but partners are 5.1Å apart → too_close_together by 2.7Å
- **V7** — severity 1.10, 1 conflict(s); suspect input ~`G30` (group: push_out)
  - push-out (wants farther): I33@16.8Å(now 13.8,conf 0.55)
  - I33↔G30: targets 16.8/10.2Å but partners are 4.6Å apart → too_close_together by 2.0Å
- **I34** — severity 1.02, 1 conflict(s); suspect input ~`C2` (group: push_out)
  - push-out (wants farther): T29@15.1Å(now 11.3,conf 0.55), Y43@10.9Å(now 8.1,conf 0.55), P4@13.3Å(now 10.7,conf 0.55), G41@13.5Å(now 9.5,conf 0.55)
  - P4↔C2: targets 13.3/7.7Å but partners are 3.8Å apart → too_close_together by 1.9Å
- **G36** — severity 0.90, 1 conflict(s); suspect input ~`A26` (group: push_out)
  - push-out (wants farther): T29@19.8Å(now 17.1,conf 0.57), G41@14.2Å(now 9.7,conf 0.55)
  - T29↔A26: targets 19.8/16.0Å but partners are 2.2Å apart → too_close_together by 1.6Å

## Secondary Structure (DSSP-like)

- helix(H)=29 · strand(E)=10 · 3-10(G)=3 · coil(C)=2

```
CEHHHHHHHHHEHHHEHHHHGHHHHEHHEHHEGEGCHHHEHHEE
```

## Backbone H-bond Network

- total=35 · helix(i→i+4)=15 · sheet=20
  - C3 ↔ V7  (helix)
  - P4 ↔ A8  (helix)
  - I6 ↔ S10  (helix)
  - V7 ↔ N11  (helix)
  - R9 ↔ N13  (helix)
  - N11 ↔ C15  (helix)
  - N13 ↔ L17  (helix)
  - C15 ↔ G19  (helix)
  - P18 ↔ E22  (helix)
  - G19 ↔ A23  (helix)
  - A23 ↔ T27  (helix)
  - I24 ↔ Y28  (helix)
  - T27 ↔ C31  (helix)
  - A37 ↔ G41  (helix)
  - T38 ↔ D42  (helix)
  - C2 ↔ F12  (sheet)
  - F12 ↔ A26  (sheet)
  - F12 ↔ T29  (sheet)
  - F12 ↔ I32  (sheet)
  - R16 ↔ A26  (sheet)
  - … +15 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=16 · exposed=17 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=225 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=113 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.3616 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=6 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C2–C39, C3–C31, C15–C25

## Side-chain Rotamers (χ1/χ2)

- 35 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
