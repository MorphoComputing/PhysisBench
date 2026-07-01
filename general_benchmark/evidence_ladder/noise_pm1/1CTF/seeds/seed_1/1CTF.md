# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1CTF\sequence\1CTF.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm1\1CTF\seeds\seed_1\1CTF.pdb`
- residues: 66
- mode: oracle
- ca_rmsd: 0.541 A
- tm_score_ca_ordered: 0.9650960905659784
- heavy_atom_rmsd: 2.302 A
- sidechain_heavy_atom_rmsd: 3.098 A
- **all-atom quality (honest):** heavy 2.302 A, sidechain 3.098 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/45 (0.0)
- lj_severe: 0
- lj_near: 1
- distogram_pairs: 2016
- bin_accuracy: 0.649

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=36
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.5406660152098755
- ga_delta_rmsd: 0.09494685601036834  ga_fitness_mode: energy
- pre_local_rmsd: 0.5533631978475734  localized_anchor_rmsd: 0.540618154485325

## Failure Classification

- primary_reason: `SIDECHAIN_RMSD_HIGH`
- reasons: `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** A8 → 9 conflicts (32%); E43-V45 → 9 conflicts (32%); D2-V3 → 4 conflicts (14%)
- explained: 22/28 conflicts by 3 root cause(s)
- metrics: hubs=14 (frac 0.212), conflicts/hub=2.0, max_incompat=3.65Å, chain_span=0.955
- **fix-first:** [LOW_CONFLICT] Root cause(s): A8 + E43-V45 + D2-V3 — explain ~22/28 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **P38** — severity 3.78, 4 conflict(s); suspect input ~`V13` (group: pull_in)
  - pull-in (wants closer): A8@6.6Å(now 9.2,conf 0.39)
  - A8↔V13: targets 6.6/18.6Å but partners are 9.2Å apart → too_close_together by 2.8Å
  - A10↔A8: targets 16.1/6.6Å but partners are 6.7Å apart → too_close_together by 2.9Å
  - A14↔A8: targets 18.3/6.6Å but partners are 9.3Å apart → too_close_together by 2.5Å
- **A8** — severity 3.49, 4 conflict(s); suspect input ~`P38` (group: pull_in)
  - pull-in (wants closer): P38@6.6Å(now 9.2,conf 0.39)
  - A14↔P38: targets 7.5/6.6Å but partners are 17.4Å apart → too_far_apart by 3.3Å
  - N11↔P38: targets 6.0/6.6Å but partners are 15.2Å apart → too_far_apart by 2.6Å
  - G61↔P38: targets 6.3/6.6Å but partners are 14.6Å apart → too_far_apart by 1.7Å
- **V34** — severity 2.22, 2 conflict(s); suspect input ~`K42` (group: push_out)
  - push-out (wants farther): V45@21.8Å(now 18.7,conf 0.46)
  - V45↔K42: targets 21.8/11.2Å but partners are 6.8Å apart → too_close_together by 3.6Å
  - V45↔L41: targets 21.8/8.4Å but partners are 10.6Å apart → too_close_together by 2.8Å
- **V45** — severity 2.16, 3 conflict(s); suspect input ~`V3` (group: push_out)
  - push-out (wants farther): V34@21.8Å(now 18.7,conf 0.46)
  - V34↔V3: targets 21.8/7.1Å but partners are 12.4Å apart → too_close_together by 2.2Å
  - V34↔L41: targets 21.8/10.8Å but partners are 8.6Å apart → too_close_together by 2.3Å
  - V34↔L5: targets 21.8/12.9Å but partners are 7.2Å apart → too_close_together by 1.6Å
- **E65** — severity 1.72, 2 conflict(s); suspect input ~`E43` (group: push_out)
  - pull-in (wants closer): V13@16.4Å(now 19.9,conf 0.35)
  - push-out (wants farther): E43@13.6Å(now 11.0,conf 0.34)
  - D2↔E43: targets 7.1/13.6Å but partners are 3.1Å apart → too_close_together by 3.4Å
  - V3↔E43: targets 6.0/13.6Å but partners are 6.0Å apart → too_close_together by 1.7Å
- **G26** — severity 1.71, 2 conflict(s); suspect input ~`I16` (group: push_out)
  - push-out (wants farther): V15@16.6Å(now 13.5,conf 0.35)
  - V15↔I16: targets 16.6/9.9Å but partners are 3.6Å apart → too_close_together by 3.1Å
  - V15↔V19: targets 16.6/8.7Å but partners are 6.1Å apart → too_close_together by 1.8Å

## Secondary Structure (DSSP-like)

- helix(H)=31 · strand(E)=15 · 3-10(G)=17 · coil(C)=3

```
CEEGHHEHEHHHHHHHHGHHHGEGEGGHCHGGGHHGEHEHGEEHEHGHHHGHGEHHHHGHGEGEEC
```

## Backbone H-bond Network

- total=25 · helix(i→i+4)=16 · sheet=9
  - K6 ↔ A10  (helix)
  - A8 ↔ K12  (helix)
  - A10 ↔ A14  (helix)
  - N11 ↔ V15  (helix)
  - K12 ↔ I16  (helix)
  - V13 ↔ K17  (helix)
  - V15 ↔ V19  (helix)
  - I16 ↔ R20  (helix)
  - K17 ↔ G21  (helix)
  - A30 ↔ V34  (helix)
  - V34 ↔ P38  (helix)
  - A40 ↔ G44  (helix)
  - G44 ↔ D48  (helix)
  - D48 ↔ A52  (helix)
  - A52 ↔ A56  (helix)
  - A56 ↔ A60  (helix)
  - V3 ↔ T23  (sheet)
  - T23 ↔ K42  (sheet)
  - L25 ↔ K42  (sheet)
  - K42 ↔ K54  (sheet)
  - … +5 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=27 · exposed=19 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=245 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=97 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.1657 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=1 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 45 residues with modelled χ angles (full table in report JSON)

## Warnings

- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
