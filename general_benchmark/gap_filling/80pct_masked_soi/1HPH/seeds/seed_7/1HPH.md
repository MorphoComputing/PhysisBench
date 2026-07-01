# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1HPH\sequence\1HPH.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1HPH\seeds\seed_7\1HPH.pdb`
- residues: 35
- mode: oracle
- ca_rmsd: 5.079 A
- tm_score_ca_ordered: 0.22233429659462145
- heavy_atom_rmsd: 6.548 A
- sidechain_heavy_atom_rmsd: 7.669 A
- **all-atom quality (honest):** heavy 6.548 A, sidechain 7.669 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/33 (0.0)
- lj_severe: 0
- lj_near: 3
- distogram_pairs: 235
- bin_accuracy: 0.638

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=global reason=rejected_local_chirality_regression tested=30
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 5.079014099774712
- ga_delta_rmsd: 0.9571970731899935  ga_fitness_mode: energy
- pre_local_rmsd: 5.078912960213099  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** L6 → 4 conflicts (50%)
- explained: 4/8 conflicts by 1 root cause(s)
- metrics: hubs=5 (frac 0.143), conflicts/hub=1.6, max_incompat=3.47Å, chain_span=0.429
- **fix-first:** [LOW_CONFLICT] Root cause(s): L6 — explain ~4/8 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **N9** — severity 4.59, 3 conflict(s); suspect input ~`L6` (group: pull_in)
  - pull-in (wants closer): L6@5.1Å(now 8.9,conf 0.57)
  - N15↔L6: targets 7.4/5.1Å but partners are 15.9Å apart → too_far_apart by 3.5Å
  - S16↔L6: targets 11.1/5.1Å but partners are 18.9Å apart → too_far_apart by 2.8Å
  - L6↔L14: targets 5.1/7.2Å but partners are 14.3Å apart → too_far_apart by 2.0Å
- **V20** — severity 2.19, 2 conflict(s); suspect input ~`F33` (group: push_out)
  - push-out (wants farther): M17@8.1Å(now 5.1,conf 0.67), F33@17.9Å(now 15.1,conf 0.55)
  - R24↔F33: targets 9.2/17.9Å but partners are 6.2Å apart → too_close_together by 2.5Å
  - L23↔F33: targets 7.1/17.9Å but partners are 9.3Å apart → too_close_together by 1.5Å
- **L6** — severity 1.64, 1 conflict(s); suspect input ~`N9` (group: push_out)
  - pull-in (wants closer): N9@5.1Å(now 8.9,conf 0.57)
  - push-out (wants farther): V1@13.2Å(now 7.6,conf 0.49)
  - M17↔N9: targets 19.6/5.1Å but partners are 11.6Å apart → too_close_together by 2.9Å
- **E21** — severity 1.16, 1 conflict(s); suspect input ~`H31` (group: push_out)
  - push-out (wants farther): H31@17.1Å(now 12.2,conf 0.55)
  - R24↔H31: targets 7.6/17.1Å but partners are 7.3Å apart → too_close_together by 2.1Å
- **M7** — severity 0.84, 1 conflict(s); suspect input ~`E3` (group: push_out)
  - push-out (wants farther): V1@11.6Å(now 8.2,conf 0.69)
  - V1↔E3: targets 11.6/5.8Å but partners are 4.3Å apart → too_close_together by 1.5Å

## Secondary Structure (DSSP-like)

- helix(H)=20 · strand(E)=9 · 3-10(G)=4 · coil(C)=2

```
EHHHEEEECGGEEGHHHHHHHHHHEHHGEHHHHHC
```

## Backbone H-bond Network

- total=16 · helix(i→i+4)=8 · sheet=8
  - N15 ↔ R19  (helix)
  - S16 ↔ V20  (helix)
  - E18 ↔ W22  (helix)
  - R19 ↔ L23  (helix)
  - V20 ↔ R24  (helix)
  - W22 ↔ K26  (helix)
  - K26 ↔ V30  (helix)
  - V30 ↔ V34  (helix)
  - V1 ↔ L6  (sheet)
  - V1 ↔ M7  (sheet)
  - V1 ↔ H8  (sheet)
  - Q5 ↔ K12  (sheet)
  - L6 ↔ K12  (sheet)
  - M7 ↔ K12  (sheet)
  - M7 ↔ H13  (sheet)
  - H8 ↔ H13  (sheet)

## Solvent Accessibility (burial)

- buried=16 · exposed=8 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=101 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=14 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.6188 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=3 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 33 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
