# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1TEN\sequence\1TEN.pdb`
- output_pdb: `general_benchmark\evidence_ladder\50pct_masked\1TEN\seeds\seed_1\1TEN.pdb`
- residues: 88
- mode: oracle
- ca_rmsd: 0.316 A
- tm_score_ca_ordered: 0.9921752179501101
- heavy_atom_rmsd: 2.670 A
- sidechain_heavy_atom_rmsd: 3.445 A
- **all-atom quality (honest):** heavy 2.670 A, sidechain 3.445 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.011
- rotamer_outliers: 0/79 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 1828
- bin_accuracy: 0.955

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=48
- rigid_domain_reconvergence: applied=True accepted=4 rmsd=0.48762921512957547 -> 0.4170959341055908 A
- topology_reconvergence: applied=True accepted=5/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.31628573244216474
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 0.3191876235650214  localized_anchor_rmsd: 0.3163138099089009

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** P63-D64 → 9 conflicts (90%)
- explained: 9/10 conflicts by 1 root cause(s)
- metrics: hubs=4 (frac 0.045), conflicts/hub=2.5, max_incompat=3.39Å, chain_span=0.83
- **fix-first:** [LOW_CONFLICT] Root cause(s): P63-D64 — explain ~9/10 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **T88** — severity 4.64, 3 conflict(s); suspect input ~`D64` (group: pull_in)
  - pull-in (wants closer): D77@27.5Å(now 32.2,conf 1.00), G76@27.5Å(now 32.8,conf 1.00), A26@27.5Å(now 30.8,conf 1.00)
  - G76↔D64: targets 27.5/6.4Å but partners are 37.3Å apart → too_far_apart by 3.4Å
  - D77↔D64: targets 27.5/6.4Å but partners are 36.5Å apart → too_far_apart by 2.6Å
  - A26↔D64: targets 27.5/6.4Å but partners are 36.4Å apart → too_far_apart by 2.5Å
- **I28** — severity 4.25, 3 conflict(s); suspect input ~`R75` (group: pull_in)
  - pull-in (wants closer): D64@27.5Å(now 34.7,conf 1.00), P63@27.5Å(now 34.0,conf 1.00), D14@27.5Å(now 32.8,conf 1.00), K62@27.5Å(now 32.1,conf 1.00), T15@27.5Å(now 30.6,conf 1.00), D39@27.5Å(now 30.2,conf 1.00)
  - D64↔R75: targets 27.5/4.9Å but partners are 35.5Å apart → too_far_apart by 3.2Å
  - P63↔R75: targets 27.5/4.9Å but partners are 34.8Å apart → too_far_apart by 2.4Å
  - D14↔R75: targets 27.5/4.9Å but partners are 34.2Å apart → too_far_apart by 1.8Å
- **T15** — severity 3.88, 3 conflict(s); suspect input ~`P63` (group: pull_in)
  - pull-in (wants closer): D77@27.5Å(now 33.3,conf 1.00), A26@27.5Å(now 33.2,conf 1.00), L25@27.5Å(now 31.8,conf 1.00), I28@27.5Å(now 30.6,conf 1.00)
  - A26↔P63: targets 27.5/5.8Å but partners are 36.3Å apart → too_far_apart by 3.0Å
  - D77↔P63: targets 27.5/5.8Å but partners are 35.6Å apart → too_far_apart by 2.4Å
  - L25↔P63: targets 27.5/5.8Å but partners are 34.9Å apart → too_far_apart by 1.6Å
- **R75** — severity 0.93, 1 conflict(s); suspect input ~`I28` (group: pull_in)
  - pull-in (wants closer): P63@27.5Å(now 34.8,conf 1.00)
  - P63↔I28: targets 27.5/4.9Å but partners are 34.0Å apart → too_far_apart by 1.6Å

## Secondary Structure (DSSP-like)

- helix(H)=15 · strand(E)=37 · 3-10(G)=20 · coil(C)=16

```
CEGCEGCECEHCEHCEEGGCEGCEHEHGHEECGEEECGGHHHHEGEGCGCHHEEEEGCEHEHEHEGEEGGGGGEECHCEECEGEEEEE
```

## Backbone H-bond Network

- total=41 · helix(i→i+4)=2 · sheet=39
  - L25 ↔ D29  (helix)
  - N60 ↔ D64  (helix)
  - S5 ↔ W21  (sheet)
  - S5 ↔ P24  (sheet)
  - E8 ↔ A17  (sheet)
  - E8 ↔ W21  (sheet)
  - K10 ↔ T16  (sheet)
  - K10 ↔ A17  (sheet)
  - K10 ↔ W21  (sheet)
  - T16 ↔ Y35  (sheet)
  - A17 ↔ Y35  (sheet)
  - A17 ↔ G36  (sheet)
  - W21 ↔ I31  (sheet)
  - P24 ↔ G30  (sheet)
  - P24 ↔ I31  (sheet)
  - A26 ↔ I31  (sheet)
  - I31 ↔ T46  (sheet)
  - T34 ↔ R44  (sheet)
  - T34 ↔ T46  (sheet)
  - Y35 ↔ R44  (sheet)
  - … +21 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=31 · exposed=37 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=319 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=202 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.539 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0114

## Side-chain Rotamers (χ1/χ2)

- 79 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
