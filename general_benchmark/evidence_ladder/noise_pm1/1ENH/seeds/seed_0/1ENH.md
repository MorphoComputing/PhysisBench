# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1ENH\sequence\1ENH.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm1\1ENH\seeds\seed_0\1ENH.pdb`
- residues: 52
- mode: oracle
- ca_rmsd: 0.608 A
- tm_score_ca_ordered: 0.9407440012192917
- heavy_atom_rmsd: 3.162 A
- sidechain_heavy_atom_rmsd: 4.071 A
- **all-atom quality (honest):** heavy 3.162 A, sidechain 4.071 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/47 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 1225
- bin_accuracy: 0.630

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=36
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.6080539014610489
- ga_delta_rmsd: 0.1796215054999416  ga_fitness_mode: energy
- pre_local_rmsd: 0.6204498325658596  localized_anchor_rmsd: 0.607987835332196

## Failure Classification

- primary_reason: `HEAVY_ATOM_RMSD_HIGH`
- reasons: `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** R28-Q29 → 5 conflicts (46%); Q41-I42 → 4 conflicts (36%)
- explained: 9/11 conflicts by 2 root cause(s)
- metrics: hubs=8 (frac 0.154), conflicts/hub=1.4, max_incompat=3.59Å, chain_span=0.75
- **fix-first:** [LOW_CONFLICT] Root cause(s): R28-Q29 + Q41-I42 — explain ~9/11 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **L10** — severity 2.37, 2 conflict(s); suspect input ~`Q41` (group: push_out)
  - push-out (wants farther): A40@17.6Å(now 14.2,conf 0.36), A4@13.3Å(now 9.2,conf 0.34)
  - A40↔Q41: targets 17.6/10.5Å but partners are 3.5Å apart → too_close_together by 3.6Å
  - F5↔A4: targets 6.4/13.3Å but partners are 3.5Å apart → too_close_together by 3.4Å
- **N18** — severity 2.33, 3 conflict(s); suspect input ~`R28` (group: pull_in)
  - pull-in (wants closer): R28@11.6Å(now 14.8,conf 0.34)
  - push-out (wants farther): R50@13.4Å(now 9.8,conf 0.34)
  - E25↔R28: targets 20.0/11.6Å but partners are 5.3Å apart → too_close_together by 3.2Å
  - Q29↔R28: targets 17.8/11.6Å but partners are 4.1Å apart → too_close_together by 2.1Å
  - S32↔R28: targets 19.1/11.6Å but partners are 6.0Å apart → too_close_together by 1.6Å
- **Q29** — severity 1.09, 1 conflict(s); suspect input ~`K49` (group: pull_in)
  - pull-in (wants closer): K49@16.2Å(now 19.2,conf 0.35)
  - K52↔K49: targets 24.2/16.2Å but partners are 4.8Å apart → too_close_together by 3.2Å
- **R15** — severity 0.87, 1 conflict(s); suspect input ~`I42` (group: pull_in)
  - pull-in (wants closer): L37@13.0Å(now 15.6,conf 0.34)
  - push-out (wants farther): Q41@18.5Å(now 15.9,conf 0.37)
  - I42↔Q41: targets 12.2/18.5Å but partners are 3.8Å apart → too_close_together by 2.6Å
- **G36** — severity 0.83, 1 conflict(s); suspect input ~`I42` (group: push_out)
  - push-out (wants farther): F46@18.6Å(now 15.6,conf 0.37)
  - I42↔F46: targets 10.0/18.6Å but partners are 6.2Å apart → too_close_together by 2.4Å
- **Q41** — severity 0.71, 1 conflict(s); suspect input ~`L13` (group: push_out)
  - push-out (wants farther): W45@8.5Å(now 5.9,conf 0.35), R15@18.5Å(now 15.9,conf 0.37)
  - L13↔R15: targets 11.1/18.5Å but partners are 5.3Å apart → too_close_together by 2.1Å

## Secondary Structure (DSSP-like)

- helix(H)=28 · strand(E)=14 · 3-10(G)=9 · coil(C)=1

```
EEECEEHHEHHHHHGHHHGEGEGGHEHHHGHHGEHGEHHGHHHHEHEHHHHE
```

## Backbone H-bond Network

- total=19 · helix(i→i+4)=15 · sheet=4
  - S7 ↔ A11  (helix)
  - E8 ↔ R12  (helix)
  - L10 ↔ K14  (helix)
  - R12 ↔ E16  (helix)
  - L13 ↔ F17  (helix)
  - K14 ↔ N18  (helix)
  - E25 ↔ Q29  (helix)
  - R27 ↔ L31  (helix)
  - R28 ↔ S32  (helix)
  - L31 ↔ L35  (helix)
  - L35 ↔ E39  (helix)
  - E39 ↔ K43  (helix)
  - I42 ↔ F46  (helix)
  - I44 ↔ N48  (helix)
  - F46 ↔ R50  (helix)
  - T3 ↔ Q9  (sheet)
  - L37 ↔ W45  (sheet)
  - W45 ↔ K52  (sheet)
  - Q47 ↔ K52  (sheet)

## Solvent Accessibility (burial)

- buried=12 · exposed=23 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=151 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=21 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.2077 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 47 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
