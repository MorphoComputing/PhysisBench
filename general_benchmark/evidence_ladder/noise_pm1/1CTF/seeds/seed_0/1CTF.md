# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1CTF\sequence\1CTF.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm1\1CTF\seeds\seed_0\1CTF.pdb`
- residues: 66
- mode: oracle
- ca_rmsd: 0.515 A
- tm_score_ca_ordered: 0.9680377495743823
- heavy_atom_rmsd: 2.308 A
- sidechain_heavy_atom_rmsd: 3.076 A
- **all-atom quality (honest):** heavy 2.308 A, sidechain 3.076 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/45 (0.0)
- lj_severe: 0
- lj_near: 1
- distogram_pairs: 2016
- bin_accuracy: 0.644

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=45
- rigid_domain_reconvergence: applied=True accepted=6 rmsd=0.6951401121900682 -> 0.5921379983916818 A
- topology_reconvergence: applied=True accepted=1/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.514635153445837
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 0.5258105355032024  localized_anchor_rmsd: 0.514660157580722

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** A8 → 9 conflicts (33%); E43-V45 → 9 conflicts (33%)
- explained: 18/27 conflicts by 2 root cause(s)
- metrics: hubs=14 (frac 0.212), conflicts/hub=1.9, max_incompat=3.83Å, chain_span=0.939
- **fix-first:** [LOW_CONFLICT] Root cause(s): A8 + E43-V45 — explain ~18/27 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **P38** — severity 3.93, 4 conflict(s); suspect input ~`A10` (group: pull_in)
  - pull-in (wants closer): A8@6.6Å(now 9.2,conf 0.39)
  - A10↔A8: targets 16.1/6.6Å but partners are 6.5Å apart → too_close_together by 3.1Å
  - A8↔V13: targets 6.6/18.6Å but partners are 9.2Å apart → too_close_together by 2.8Å
  - A14↔A8: targets 18.3/6.6Å but partners are 9.1Å apart → too_close_together by 2.6Å
- **A8** — severity 3.30, 4 conflict(s); suspect input ~`P38` (group: pull_in)
  - pull-in (wants closer): P38@6.6Å(now 9.2,conf 0.39)
  - A14↔P38: targets 7.5/6.6Å but partners are 17.2Å apart → too_far_apart by 3.1Å
  - N11↔P38: targets 6.0/6.6Å but partners are 14.9Å apart → too_far_apart by 2.4Å
  - G61↔P38: targets 6.3/6.6Å but partners are 14.5Å apart → too_far_apart by 1.6Å
- **V34** — severity 2.33, 2 conflict(s); suspect input ~`K42` (group: push_out)
  - push-out (wants farther): V45@21.8Å(now 18.7,conf 0.46)
  - V45↔K42: targets 21.8/11.2Å but partners are 6.7Å apart → too_close_together by 3.8Å
  - V45↔L41: targets 21.8/8.4Å but partners are 10.4Å apart → too_close_together by 3.0Å
- **V45** — severity 2.17, 3 conflict(s); suspect input ~`V3` (group: push_out)
  - push-out (wants farther): V34@21.8Å(now 18.7,conf 0.46)
  - V34↔V3: targets 21.8/7.1Å but partners are 12.4Å apart → too_close_together by 2.3Å
  - V34↔L41: targets 21.8/10.8Å but partners are 8.7Å apart → too_close_together by 2.2Å
  - V34↔L5: targets 21.8/12.9Å but partners are 7.2Å apart → too_close_together by 1.7Å
- **G26** — severity 1.74, 2 conflict(s); suspect input ~`I16` (group: push_out)
  - push-out (wants farther): V15@16.6Å(now 13.5,conf 0.35)
  - V15↔I16: targets 16.6/9.9Å but partners are 3.6Å apart → too_close_together by 3.2Å
  - V15↔V19: targets 16.6/8.7Å but partners are 6.1Å apart → too_close_together by 1.9Å
- **E65** — severity 1.66, 2 conflict(s); suspect input ~`E43` (group: push_out)
  - pull-in (wants closer): V13@16.4Å(now 20.0,conf 0.35)
  - push-out (wants farther): E43@13.6Å(now 11.1,conf 0.34)
  - D2↔E43: targets 7.1/13.6Å but partners are 3.3Å apart → too_close_together by 3.2Å
  - V3↔E43: targets 6.0/13.6Å but partners are 6.0Å apart → too_close_together by 1.7Å

## Secondary Structure (DSSP-like)

- helix(H)=31 · strand(E)=16 · 3-10(G)=16 · coil(C)=3

```
CEEGHHEHEGHEHHHGHHHHHGEHEGGHCHGGGHHEGHEHGEEHEHGHHHHHGEHHHHGHGEGEEC
```

## Backbone H-bond Network

- total=25 · helix(i→i+4)=15 · sheet=10
  - N11 ↔ V15  (helix)
  - V13 ↔ K17  (helix)
  - A14 ↔ A18  (helix)
  - V15 ↔ V19  (helix)
  - K17 ↔ G21  (helix)
  - R20 ↔ G24  (helix)
  - G24 ↔ K28  (helix)
  - A30 ↔ V34  (helix)
  - V34 ↔ P38  (helix)
  - A40 ↔ G44  (helix)
  - G44 ↔ D48  (helix)
  - D48 ↔ A52  (helix)
  - E51 ↔ K55  (helix)
  - A52 ↔ A56  (helix)
  - A56 ↔ A60  (helix)
  - V3 ↔ T23  (sheet)
  - A7 ↔ K12  (sheet)
  - T23 ↔ K42  (sheet)
  - L25 ↔ K42  (sheet)
  - K42 ↔ K54  (sheet)
  - … +5 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=27 · exposed=19 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=249 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=101 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.1666 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=1 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 45 residues with modelled χ angles (full table in report JSON)

## Warnings

- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
