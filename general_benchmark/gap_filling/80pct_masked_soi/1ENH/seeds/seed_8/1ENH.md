# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1ENH\sequence\1ENH.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1ENH\seeds\seed_8\1ENH.pdb`
- residues: 52
- mode: oracle
- ca_rmsd: 2.298 A
- tm_score_ca_ordered: 0.6894336176078563
- heavy_atom_rmsd: 4.049 A
- sidechain_heavy_atom_rmsd: 4.875 A
- **all-atom quality (honest):** heavy 4.049 A, sidechain 4.875 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/47 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 438
- bin_accuracy: 0.808

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=45
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 2.298388373745905
- ga_delta_rmsd: -0.7651546986895601  ga_fitness_mode: energy
- pre_local_rmsd: 2.3165315712469985  localized_anchor_rmsd: 2.298350247269572

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** R12 → 7 conflicts (78%)
- explained: 7/9 conflicts by 1 root cause(s)
- metrics: hubs=4 (frac 0.077), conflicts/hub=2.2, max_incompat=5.8Å, chain_span=0.846
- **fix-first:** [LOW_CONFLICT] Root cause(s): R12 — explain ~7/9 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **R12** — severity 6.81, 4 conflict(s); suspect input ~`A51` (group: push_out)
  - push-out (wants farther): A51@18.9Å(now 10.3,conf 0.56), R50@16.0Å(now 12.0,conf 0.55), N48@16.0Å(now 11.2,conf 0.55)
  - R15↔A51: targets 5.0/18.9Å but partners are 8.1Å apart → too_close_together by 5.8Å
  - E16↔A51: targets 6.0/18.9Å but partners are 10.5Å apart → too_close_together by 2.4Å
  - A51↔F17: targets 18.9/8.6Å but partners are 8.2Å apart → too_close_together by 2.0Å
- **A51** — severity 4.01, 2 conflict(s); suspect input ~`R12` (group: push_out)
  - push-out (wants farther): R12@18.9Å(now 10.3,conf 0.56)
  - Q47↔R12: targets 6.0/18.9Å but partners are 8.3Å apart → too_close_together by 4.6Å
  - N48↔R12: targets 5.0/18.9Å but partners are 11.2Å apart → too_close_together by 2.6Å
- **S7** — severity 2.88, 2 conflict(s); suspect input ~`N48` (group: push_out)
  - push-out (wants farther): N48@17.6Å(now 13.8,conf 0.55)
  - L10↔N48: targets 5.1/17.6Å but partners are 9.6Å apart → too_close_together by 2.9Å
  - A11↔N48: targets 6.6/17.6Å but partners are 8.7Å apart → too_close_together by 2.3Å
- **R50** — severity 1.59, 1 conflict(s); suspect input ~`R12` (group: push_out)
  - push-out (wants farther): R12@16.0Å(now 12.0,conf 0.55)
  - Q47↔R12: targets 4.8/16.0Å but partners are 8.3Å apart → too_close_together by 2.9Å

## Secondary Structure (DSSP-like)

- helix(H)=25 · strand(E)=19 · 3-10(G)=6 · coil(C)=2

```
EEECEEEHHEHHHEHHGHHEGEEEGHHHEHHGHHEGECHEHHHHHHGHEHEE
```

## Backbone H-bond Network

- total=25 · helix(i→i+4)=11 · sheet=14
  - E8 ↔ R12  (helix)
  - Q9 ↔ L13  (helix)
  - R12 ↔ E16  (helix)
  - R26 ↔ Q30  (helix)
  - R27 ↔ L31  (helix)
  - Q30 ↔ E34  (helix)
  - E39 ↔ K43  (helix)
  - Q41 ↔ W45  (helix)
  - I42 ↔ F46  (helix)
  - I44 ↔ N48  (helix)
  - F46 ↔ R50  (helix)
  - T3 ↔ L10  (sheet)
  - F5 ↔ L10  (sheet)
  - S6 ↔ K14  (sheet)
  - S7 ↔ K14  (sheet)
  - K14 ↔ N20  (sheet)
  - K14 ↔ Y22  (sheet)
  - L23 ↔ Q29  (sheet)
  - L23 ↔ A40  (sheet)
  - T24 ↔ Q29  (sheet)
  - … +5 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=14 · exposed=24 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=167 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=36 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.8284 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 47 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
