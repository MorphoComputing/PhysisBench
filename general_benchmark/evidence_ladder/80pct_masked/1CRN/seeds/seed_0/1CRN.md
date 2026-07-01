# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set/general_benchmark/1CRN/sequence/1CRN.pdb`
- output_pdb: `general_benchmark/evidence_ladder/80pct_masked/1CRN/seeds/seed_0/1CRN.pdb`
- residues: 44
- mode: oracle
- ca_rmsd: 3.577 A
- tm_score_ca_ordered: 0.37752554655360465
- heavy_atom_rmsd: 4.252 A
- sidechain_heavy_atom_rmsd: 4.999 A
- **all-atom quality (honest):** heavy 4.252 A, sidechain 4.999 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/35 (0.0)
- lj_severe: 0
- lj_near: 7
- distogram_pairs: 172
- bin_accuracy: 0.558

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=30
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 3.5771112755243237
- ga_delta_rmsd: 0.8782714591614127  ga_fitness_mode: energy
- pre_local_rmsd: 3.6241589117730353  localized_anchor_rmsd: 3.577183346366779

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** G41 → 5 conflicts (62%)
- explained: 5/8 conflicts by 1 root cause(s)
- metrics: hubs=5 (frac 0.114), conflicts/hub=1.6, max_incompat=4.6Å, chain_span=0.886
- **fix-first:** [LOW_CONFLICT] Root cause(s): G41 — explain ~5/8 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **A23** — severity 5.87, 4 conflict(s); suspect input ~`C2` (group: push_out)
  - push-out (wants farther): G41@20.5Å(now 17.6,conf 0.59), T27@6.7Å(now 3.8,conf 0.55)
  - G41↔C2: targets 20.5/12.0Å but partners are 5.0Å apart → too_close_together by 3.5Å
  - G41↔I32: targets 20.5/8.0Å but partners are 9.1Å apart → too_close_together by 3.4Å
  - G41↔T1: targets 20.5/9.7Å but partners are 8.8Å apart → too_close_together by 2.0Å
- **A44** — severity 2.50, 1 conflict(s); suspect input ~`P35` (group: push_out)
  - push-out (wants farther): P35@15.7Å(now 11.0,conf 0.55), G36@14.1Å(now 11.3,conf 0.55), T1@10.1Å(now 3.3,conf 0.55), C31@10.1Å(now 5.3,conf 0.55)
  - C39↔P35: targets 6.3/15.7Å but partners are 4.8Å apart → too_close_together by 4.6Å
- **C15** — severity 1.21, 1 conflict(s); suspect input ~`T29` (group: push_out)
  - push-out (wants farther): G41@22.9Å(now 18.1,conf 0.72)
  - G41↔T29: targets 22.9/8.7Å but partners are 12.0Å apart → too_close_together by 2.2Å
- **I34** — severity 0.96, 1 conflict(s); suspect input ~`C31` (group: push_out)
  - push-out (wants farther): A37@7.4Å(now 4.1,conf 0.55), T29@15.1Å(now 11.7,conf 0.55), Y43@10.9Å(now 7.3,conf 0.55), G41@13.5Å(now 7.1,conf 0.55)
  - T29↔C31: targets 15.1/10.1Å but partners are 3.3Å apart → too_close_together by 1.8Å
- **S5** — severity 0.87, 1 conflict(s); suspect input ~`A44` (group: push_out)
  - push-out (wants farther): P35@19.8Å(now 17.1,conf 0.57)
  - P35↔A44: targets 19.8/7.2Å but partners are 11.0Å apart → too_close_together by 1.6Å

## Secondary Structure (DSSP-like)

- helix(H)=30 · strand(E)=11 · 3-10(G)=2 · coil(C)=1

```
CHHGEEHEHHHHHGHEHEHEHHHHHHHHHHHEHHHHEHHEHHEE
```

## Backbone H-bond Network

- total=24 · helix(i→i+4)=15 · sheet=9
  - C3 ↔ V7  (helix)
  - V7 ↔ N11  (helix)
  - R9 ↔ N13  (helix)
  - N11 ↔ C15  (helix)
  - C15 ↔ G19  (helix)
  - G19 ↔ A23  (helix)
  - P21 ↔ C25  (helix)
  - E22 ↔ A26  (helix)
  - A23 ↔ T27  (helix)
  - I24 ↔ Y28  (helix)
  - A26 ↔ G30  (helix)
  - T27 ↔ C31  (helix)
  - C31 ↔ P35  (helix)
  - P35 ↔ C39  (helix)
  - T38 ↔ D42  (helix)
  - A8 ↔ R16  (sheet)
  - R16 ↔ I32  (sheet)
  - T20 ↔ I32  (sheet)
  - I32 ↔ A37  (sheet)
  - I32 ↔ P40  (sheet)
  - … +4 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=15 · exposed=14 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=201 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=88 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.3799 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=7 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C2–C39, C3–C31, C15–C25

## Side-chain Rotamers (χ1/χ2)

- 35 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
