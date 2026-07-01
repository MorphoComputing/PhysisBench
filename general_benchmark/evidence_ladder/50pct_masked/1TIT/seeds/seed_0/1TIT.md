# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1TIT\sequence\1TIT.pdb`
- output_pdb: `general_benchmark\evidence_ladder\50pct_masked\1TIT\seeds\seed_0\1TIT.pdb`
- residues: 87
- mode: oracle
- ca_rmsd: 0.253 A
- tm_score_ca_ordered: 0.9945361117124453
- heavy_atom_rmsd: 2.719 A
- sidechain_heavy_atom_rmsd: 3.620 A
- **all-atom quality (honest):** heavy 2.719 A, sidechain 3.620 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/73 (0.0)
- lj_severe: 0
- lj_near: 3
- distogram_pairs: 1785
- bin_accuracy: 0.955

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=45
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.2531453623807698
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 0.25988968795972645  localized_anchor_rmsd: 0.25312581599146206

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** E87 → 19 conflicts (73%); I1 → 3 conflicts (12%)
- explained: 22/26 conflicts by 2 root cause(s)
- metrics: hubs=10 (frac 0.115), conflicts/hub=2.6, max_incompat=4.69Å, chain_span=0.736
- **fix-first:** [LOW_CONFLICT] Root cause(s): E87 + I1 — explain ~22/26 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **F13** — severity 13.63, 8 conflict(s); suspect input ~`E87` (group: pull_in)
  - pull-in (wants closer): I1@27.5Å(now 34.2,conf 1.00), D28@27.5Å(now 33.8,conf 1.00), P27@27.5Å(now 32.8,conf 1.00), S25@27.5Å(now 32.1,conf 1.00), V29@27.5Å(now 31.6,conf 1.00)
  - D28↔E87: targets 27.5/5.8Å but partners are 37.9Å apart → too_far_apart by 4.6Å
  - I1↔E87: targets 27.5/5.8Å but partners are 37.7Å apart → too_far_apart by 4.4Å
  - P27↔E87: targets 27.5/5.8Å but partners are 37.2Å apart → too_far_apart by 3.9Å
- **V14** — severity 7.97, 5 conflict(s); suspect input ~`E87` (group: pull_in)
  - pull-in (wants closer): E26@27.5Å(now 33.7,conf 1.00), S25@27.5Å(now 32.2,conf 1.00), P27@27.5Å(now 32.3,conf 1.00), A75@27.5Å(now 31.1,conf 1.00), V29@27.5Å(now 30.4,conf 1.00)
  - E26↔E87: targets 27.5/6.0Å but partners are 38.2Å apart → too_far_apart by 4.7Å
  - P27↔E87: targets 27.5/6.0Å but partners are 37.2Å apart → too_far_apart by 3.6Å
  - S25↔E87: targets 27.5/6.0Å but partners are 36.2Å apart → too_far_apart by 2.7Å
- **V12** — severity 4.74, 5 conflict(s); suspect input ~`E87` (group: pull_in)
  - pull-in (wants closer): E26@27.5Å(now 30.7,conf 1.00), D28@27.5Å(now 30.8,conf 1.00), I1@27.5Å(now 30.7,conf 1.00)
  - E26↔E87: targets 27.5/8.6Å but partners are 38.2Å apart → too_far_apart by 2.1Å
  - D28↔E87: targets 27.5/8.6Å but partners are 37.9Å apart → too_far_apart by 1.8Å
  - D28↔K86: targets 27.5/6.3Å but partners are 35.5Å apart → too_far_apart by 1.7Å
- **S25** — severity 3.45, 2 conflict(s); suspect input ~`I1` (group: pull_in)
  - pull-in (wants closer): E87@27.5Å(now 36.2,conf 1.00), K86@27.5Å(now 33.2,conf 1.00), V14@27.5Å(now 32.2,conf 1.00), F13@27.5Å(now 32.1,conf 1.00), V85@27.5Å(now 30.1,conf 1.00)
  - E87↔I1: targets 27.5/5.5Å but partners are 37.7Å apart → too_far_apart by 4.7Å
  - K86↔I1: targets 27.5/5.5Å but partners are 34.6Å apart → too_far_apart by 1.5Å
- **N76** — severity 2.26, 1 conflict(s); suspect input ~`I1` (group: pull_in)
  - pull-in (wants closer): E87@27.5Å(now 35.1,conf 1.00)
  - E87↔I1: targets 27.5/6.1Å but partners are 37.7Å apart → too_far_apart by 4.1Å
- **V29** — severity 1.44, 1 conflict(s); suspect input ~`E26` (group: pull_in)
  - pull-in (wants closer): E87@27.5Å(now 35.4,conf 1.00), F13@27.5Å(now 31.6,conf 1.00), V14@27.5Å(now 30.4,conf 1.00)
  - E87↔E26: targets 27.5/8.1Å but partners are 38.2Å apart → too_far_apart by 2.6Å

## Secondary Structure (DSSP-like)

- helix(H)=11 · strand(E)=46 · 3-10(G)=21 · coil(C)=9

```
CECHEEEECEEGGGHEEEEEEEEGGECCEEEEEEGHCEGEEGEHHEGCCEGCHEEEGGGGGGEHHHHEEGGGEEHGEEEEEEEEGEE
```

## Backbone H-bond Network

- total=94 · helix(i→i+4)=0 · sheet=94
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
  - … +74 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=37 · exposed=24 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=339 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=217 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.5731 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=3 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 73 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
