# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1TIT\sequence\1TIT.pdb`
- output_pdb: `general_benchmark\evidence_ladder\50pct_masked\1TIT\seeds\seed_1\1TIT.pdb`
- residues: 87
- mode: oracle
- ca_rmsd: 0.226 A
- tm_score_ca_ordered: 0.9956082899045647
- heavy_atom_rmsd: 2.683 A
- sidechain_heavy_atom_rmsd: 3.557 A
- **all-atom quality (honest):** heavy 2.683 A, sidechain 3.557 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/73 (0.0)
- lj_severe: 0
- lj_near: 3
- distogram_pairs: 1785
- bin_accuracy: 0.960

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=45
- rigid_domain_reconvergence: applied=True accepted=2 rmsd=0.291172879307818 -> 0.2649124457802863 A
- topology_reconvergence: applied=True accepted=4/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.2262400619946929
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 0.2327273426895387  localized_anchor_rmsd: 0.22623885461335416

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** E87 → 21 conflicts (72%)
- explained: 21/29 conflicts by 1 root cause(s)
- metrics: hubs=11 (frac 0.126), conflicts/hub=2.6, max_incompat=4.78Å, chain_span=0.736
- **fix-first:** [LOW_CONFLICT] Root cause(s): E87 — explain ~21/29 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **F13** — severity 14.16, 8 conflict(s); suspect input ~`E87` (group: pull_in)
  - pull-in (wants closer): I1@27.5Å(now 34.3,conf 1.00), D28@27.5Å(now 33.9,conf 1.00), P27@27.5Å(now 33.1,conf 1.00), S25@27.5Å(now 32.3,conf 1.00), V29@27.5Å(now 31.7,conf 1.00)
  - D28↔E87: targets 27.5/5.8Å but partners are 38.0Å apart → too_far_apart by 4.7Å
  - I1↔E87: targets 27.5/5.8Å but partners are 37.8Å apart → too_far_apart by 4.5Å
  - P27↔E87: targets 27.5/5.8Å but partners are 37.4Å apart → too_far_apart by 4.1Å
- **V14** — severity 9.14, 6 conflict(s); suspect input ~`E87` (group: pull_in)
  - pull-in (wants closer): E26@27.5Å(now 33.8,conf 1.00), S25@27.5Å(now 32.4,conf 1.00), P27@27.5Å(now 32.5,conf 1.00), A75@27.5Å(now 31.2,conf 1.00), V29@27.5Å(now 30.5,conf 1.00)
  - E26↔E87: targets 27.5/6.0Å but partners are 38.3Å apart → too_far_apart by 4.8Å
  - P27↔E87: targets 27.5/6.0Å but partners are 37.4Å apart → too_far_apart by 3.9Å
  - S25↔E87: targets 27.5/6.0Å but partners are 36.4Å apart → too_far_apart by 2.9Å
- **V12** — severity 4.95, 5 conflict(s); suspect input ~`E87` (group: pull_in)
  - pull-in (wants closer): E26@27.5Å(now 30.7,conf 1.00), D28@27.5Å(now 30.9,conf 1.00), I1@27.5Å(now 30.8,conf 1.00)
  - E26↔E87: targets 27.5/8.6Å but partners are 38.3Å apart → too_far_apart by 2.2Å
  - D28↔E87: targets 27.5/8.6Å but partners are 38.0Å apart → too_far_apart by 1.8Å
  - D28↔K86: targets 27.5/6.3Å but partners are 35.6Å apart → too_far_apart by 1.8Å
- **S25** — severity 3.52, 2 conflict(s); suspect input ~`I1` (group: pull_in)
  - pull-in (wants closer): E87@27.5Å(now 36.4,conf 1.00), K86@27.5Å(now 33.4,conf 1.00), V14@27.5Å(now 32.4,conf 1.00), F13@27.5Å(now 32.3,conf 1.00), N61@27.5Å(now 30.0,conf 1.00), V85@27.5Å(now 30.3,conf 1.00)
  - E87↔I1: targets 27.5/5.5Å but partners are 37.8Å apart → too_far_apart by 4.7Å
  - K86↔I1: targets 27.5/5.5Å but partners are 34.6Å apart → too_far_apart by 1.6Å
- **N76** — severity 2.30, 1 conflict(s); suspect input ~`I1` (group: pull_in)
  - pull-in (wants closer): E87@27.5Å(now 35.1,conf 1.00)
  - E87↔I1: targets 27.5/6.1Å but partners are 37.8Å apart → too_far_apart by 4.2Å
- **Q63** — severity 1.98, 2 conflict(s); suspect input ~`E87` (group: pull_in)
  - pull-in (wants closer): I1@27.5Å(now 32.6,conf 1.00), P27@27.5Å(now 31.8,conf 1.00)
  - I1↔E87: targets 27.5/8.3Å but partners are 37.8Å apart → too_far_apart by 2.0Å
  - P27↔E87: targets 27.5/8.3Å but partners are 37.4Å apart → too_far_apart by 1.6Å

## Secondary Structure (DSSP-like)

- helix(H)=11 · strand(E)=48 · 3-10(G)=20 · coil(C)=8

```
CECHEEEECEEGGGHEEEEEEEEGGEECEEEEEEGHCEGEEGEHHEGCCEGGHEEEGGGEGGEHHHHEECGGEEHGEEEEEEEEGEE
```

## Backbone H-bond Network

- total=97 · helix(i→i+4)=0 · sheet=97
  - E2 ↔ I22  (sheet)
  - K5 ↔ F20  (sheet)
  - K5 ↔ E21  (sheet)
  - K5 ↔ I22  (sheet)
  - K5 ↔ E23  (sheet)
  - P6 ↔ H19  (sheet)
  - P6 ↔ F20  (sheet)
  - P6 ↔ E21  (sheet)
  - P6 ↔ I22  (sheet)
  - P6 ↔ E23  (sheet)
  - L7 ↔ A18  (sheet)
  - L7 ↔ H19  (sheet)
  - L7 ↔ F20  (sheet)
  - L7 ↔ E21  (sheet)
  - L7 ↔ I22  (sheet)
  - L7 ↔ E23  (sheet)
  - Y8 ↔ A18  (sheet)
  - Y8 ↔ H19  (sheet)
  - Y8 ↔ F20  (sheet)
  - Y8 ↔ E21  (sheet)
  - … +77 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=37 · exposed=24 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=340 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=219 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.5728 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=3 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 73 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
