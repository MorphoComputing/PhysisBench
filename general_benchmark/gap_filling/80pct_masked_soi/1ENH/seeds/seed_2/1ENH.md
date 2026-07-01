# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1ENH\sequence\1ENH.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1ENH\seeds\seed_2\1ENH.pdb`
- residues: 52
- mode: oracle
- ca_rmsd: 2.508 A
- tm_score_ca_ordered: 0.5692140419695402
- heavy_atom_rmsd: 3.756 A
- sidechain_heavy_atom_rmsd: 4.404 A
- **all-atom quality (honest):** heavy 3.756 A, sidechain 4.404 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/47 (0.0)
- lj_severe: 0
- lj_near: 1
- distogram_pairs: 438
- bin_accuracy: 0.724

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=39
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 2.5081147623061977
- ga_delta_rmsd: 0.9125439336516368  ga_fitness_mode: energy
- pre_local_rmsd: 2.6000999061533148  localized_anchor_rmsd: 2.508158352675646

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** L10-R12 → 18 conflicts (78%); S7 → 4 conflicts (17%)
- explained: 22/23 conflicts by 2 root cause(s)
- metrics: hubs=9 (frac 0.173), conflicts/hub=2.6, max_incompat=4.29Å, chain_span=0.865
- **fix-first:** [LOW_CONFLICT] Root cause(s): L10-R12 + S7 — explain ~22/23 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **S7** — severity 13.53, 8 conflict(s); suspect input ~`R50` (group: push_out)
  - push-out (wants farther): R50@19.5Å(now 15.1,conf 0.57), K43@17.9Å(now 14.2,conf 0.55), N48@17.6Å(now 12.4,conf 0.55)
  - A11↔R50: targets 5.1/19.5Å but partners are 10.1Å apart → too_close_together by 4.3Å
  - L10↔N48: targets 5.1/17.6Å but partners are 8.4Å apart → too_close_together by 4.1Å
  - L10↔K43: targets 5.1/17.9Å but partners are 9.0Å apart → too_close_together by 3.8Å
- **A51** — severity 4.36, 3 conflict(s); suspect input ~`R12` (group: push_out)
  - push-out (wants farther): R12@18.9Å(now 14.7,conf 0.56)
  - Q47↔R12: targets 6.6/18.9Å but partners are 8.7Å apart → too_close_together by 3.6Å
  - F46↔R12: targets 9.0/18.9Å but partners are 7.5Å apart → too_close_together by 2.4Å
  - N48↔R12: targets 5.0/18.9Å but partners are 12.1Å apart → too_close_together by 1.8Å
- **S6** — severity 3.85, 3 conflict(s); suspect input ~`I42` (group: pull_in)
  - pull-in (wants closer): E34@13.3Å(now 16.0,conf 0.55)
  - push-out (wants farther): W45@12.9Å(now 8.4,conf 0.55), I42@12.8Å(now 10.1,conf 0.55)
  - L10↔W45: targets 4.6/12.9Å but partners are 4.9Å apart → too_close_together by 3.5Å
  - L10↔I42: targets 4.6/12.8Å but partners are 6.3Å apart → too_close_together by 1.9Å
  - Q9↔I42: targets 5.0/12.8Å but partners are 6.0Å apart → too_close_together by 1.7Å
- **R50** — severity 3.70, 3 conflict(s); suspect input ~`R12` (group: push_out)
  - push-out (wants farther): S7@19.5Å(now 15.1,conf 0.57), R12@16.0Å(now 11.7,conf 0.55)
  - Q47↔S7: targets 5.4/19.5Å but partners are 10.9Å apart → too_close_together by 3.2Å
  - Q47↔R12: targets 5.4/16.0Å but partners are 8.7Å apart → too_close_together by 1.9Å
  - F46↔R12: targets 7.0/16.0Å but partners are 7.5Å apart → too_close_together by 1.5Å
- **N48** — severity 2.02, 2 conflict(s); suspect input ~`S7` (group: push_out)
  - push-out (wants farther): S7@17.6Å(now 12.4,conf 0.55), R12@16.0Å(now 12.1,conf 0.55)
  - W45↔S7: targets 5.4/17.6Å but partners are 10.0Å apart → too_close_together by 2.1Å
  - W45↔R12: targets 5.4/16.0Å but partners are 9.0Å apart → too_close_together by 1.6Å
- **A11** — severity 1.65, 1 conflict(s); suspect input ~`F46` (group: push_out)
  - push-out (wants farther): I42@12.9Å(now 9.0,conf 0.55), F46@13.2Å(now 7.6,conf 0.55)
  - K14↔F46: targets 5.1/13.2Å but partners are 5.1Å apart → too_close_together by 3.0Å

## Secondary Structure (DSSP-like)

- helix(H)=24 · strand(E)=19 · 3-10(G)=8 · coil(C)=1

```
EEEEEEEHGHEHHGEHHHEHHEEGGGHHEGHHHHEHEGHGEHHHEHEHHHCE
```

## Backbone H-bond Network

- total=24 · helix(i→i+4)=11 · sheet=13
  - E8 ↔ R12  (helix)
  - R12 ↔ E16  (helix)
  - L13 ↔ F17  (helix)
  - F17 ↔ R21  (helix)
  - R27 ↔ L31  (helix)
  - R28 ↔ S32  (helix)
  - S32 ↔ G36  (helix)
  - E39 ↔ K43  (helix)
  - I42 ↔ F46  (helix)
  - I44 ↔ N48  (helix)
  - F46 ↔ R50  (helix)
  - F5 ↔ A11  (sheet)
  - S6 ↔ A11  (sheet)
  - R15 ↔ Y22  (sheet)
  - L23 ↔ Q29  (sheet)
  - Q29 ↔ L35  (sheet)
  - Q29 ↔ L37  (sheet)
  - Q29 ↔ Q41  (sheet)
  - L35 ↔ Q41  (sheet)
  - L35 ↔ W45  (sheet)
  - … +4 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=10 · exposed=26 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=185 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=51 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.0685 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=1 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 47 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
