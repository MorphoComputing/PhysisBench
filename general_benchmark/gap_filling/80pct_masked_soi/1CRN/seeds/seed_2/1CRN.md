# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1CRN\sequence\1CRN.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1CRN\seeds\seed_2\1CRN.pdb`
- residues: 44
- mode: oracle
- ca_rmsd: 5.539 A
- tm_score_ca_ordered: 0.30721430162038826
- heavy_atom_rmsd: 6.795 A
- sidechain_heavy_atom_rmsd: 7.988 A
- **all-atom quality (honest):** heavy 6.795 A, sidechain 7.988 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/35 (0.0)
- lj_severe: 0
- lj_near: 1
- distogram_pairs: 329
- bin_accuracy: 0.608

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=global reason=insufficient_rmsd_improvement tested=36
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 5.538807981012948
- ga_delta_rmsd: -0.34032954733012044  ga_fitness_mode: energy
- pre_local_rmsd: 5.550168952474437  localized_anchor_rmsd: 5.538883937268601

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** T1-C3 → 4 conflicts (100%)
- explained: 4/4 conflicts by 1 root cause(s)
- metrics: hubs=3 (frac 0.068), conflicts/hub=1.3, max_incompat=2.94Å, chain_span=0.045
- **fix-first:** [LOW_CONFLICT] Root cause(s): T1-C3 — explain ~4/4 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **I6** — severity 3.59, 2 conflict(s); suspect input ~`C3` (group: push_out)
  - push-out (wants farther): T1@13.0Å(now 9.2,conf 0.99)
  - T1↔C3: targets 13.0/8.6Å but partners are 1.8Å apart → too_close_together by 2.6Å
  - T1↔R9: targets 13.0/5.3Å but partners are 5.8Å apart → too_close_together by 1.9Å
- **V7** — severity 2.04, 1 conflict(s); suspect input ~`T1` (group: push_out)
  - push-out (wants farther): T1@14.2Å(now 10.0,conf 0.69)
  - C3↔T1: targets 9.4/14.2Å but partners are 1.8Å apart → too_close_together by 2.9Å
- **A8** — severity 1.91, 1 conflict(s); suspect input ~`T1` (group: push_out)
  - push-out (wants farther): T1@11.2Å(now 6.1,conf 0.82)
  - C3↔T1: targets 7.0/11.2Å but partners are 1.8Å apart → too_close_together by 2.3Å

## Secondary Structure (DSSP-like)

- helix(H)=20 · strand(E)=10 · 3-10(G)=6 · coil(C)=8

```
EHHEGHHEGHCHHGHHCHEGHHHHHHHCHEGCCEHCEGEECCHE
```

## Backbone H-bond Network

- total=12 · helix(i→i+4)=6 · sheet=6
  - C2 ↔ I6  (helix)
  - C3 ↔ V7  (helix)
  - I6 ↔ S10  (helix)
  - F12 ↔ R16  (helix)
  - P18 ↔ E22  (helix)
  - E22 ↔ A26  (helix)
  - T1 ↔ A8  (sheet)
  - G30 ↔ C39  (sheet)
  - G30 ↔ A44  (sheet)
  - I34 ↔ C39  (sheet)
  - I34 ↔ P40  (sheet)
  - C39 ↔ A44  (sheet)

## Solvent Accessibility (burial)

- buried=16 · exposed=18 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=163 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=58 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.9518 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=1 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C2–C39, C3–C31, C15–C25

## Side-chain Rotamers (χ1/χ2)

- 35 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
