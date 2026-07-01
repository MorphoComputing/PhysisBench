# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1CRN\sequence\1CRN.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm1\1CRN\seeds\seed_1\1CRN.pdb`
- residues: 44
- mode: oracle
- ca_rmsd: 0.555 A
- tm_score_ca_ordered: 0.9336730941377535
- heavy_atom_rmsd: 2.400 A
- sidechain_heavy_atom_rmsd: 3.193 A
- **all-atom quality (honest):** heavy 2.400 A, sidechain 3.193 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/35 (0.0)
- lj_severe: 0
- lj_near: 1
- distogram_pairs: 861
- bin_accuracy: 0.662

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=36
- rigid_domain_reconvergence: applied=True accepted=4 rmsd=0.7232429459776782 -> 0.6232215255043981 A
- topology_reconvergence: applied=True accepted=1/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.5550844885025736
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 0.5800406829154625  localized_anchor_rmsd: 0.5550565427819714

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** I32 → 25 conflicts (89%)
- explained: 25/28 conflicts by 1 root cause(s)
- metrics: hubs=6 (frac 0.136), conflicts/hub=4.7, max_incompat=3.97Å, chain_span=0.614
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): I32 — explain ~25/28 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **I32** — severity 9.70, 12 conflict(s); suspect input ~`D42` (group: pull_in)
  - pull-in (wants closer): D42@8.1Å(now 11.2,conf 0.35), T27@5.3Å(now 8.0,conf 0.46)
  - T27↔T38: targets 5.3/9.7Å but partners are 19.0Å apart → too_far_apart by 4.0Å
  - D42↔T27: targets 8.1/5.3Å but partners are 16.8Å apart → too_far_apart by 3.4Å
  - T27↔A37: targets 5.3/11.2Å but partners are 19.3Å apart → too_far_apart by 2.9Å
- **T27** — severity 6.77, 8 conflict(s); suspect input ~`T38` (group: pull_in)
  - pull-in (wants closer): I32@5.3Å(now 8.0,conf 0.46)
  - T38↔I32: targets 19.7/5.3Å but partners are 11.1Å apart → too_close_together by 3.4Å
  - P35↔I32: targets 17.7/5.3Å but partners are 9.8Å apart → too_close_together by 2.7Å
  - I34↔I32: targets 14.0/5.3Å but partners are 6.0Å apart → too_close_together by 2.7Å
- **D42** — severity 3.51, 5 conflict(s); suspect input ~`I32` (group: pull_in)
  - pull-in (wants closer): I32@8.1Å(now 11.2,conf 0.35)
  - E22↔I32: targets 19.6/8.1Å but partners are 9.2Å apart → too_close_together by 2.3Å
  - I32↔A26: targets 8.1/16.0Å but partners are 5.7Å apart → too_close_together by 2.2Å
  - A23↔I32: targets 18.1/8.1Å but partners are 8.0Å apart → too_close_together by 2.0Å
- **I33** — severity 1.34, 1 conflict(s); suspect input ~`T20` (group: push_out)
  - push-out (wants farther): T20@16.4Å(now 13.8,conf 0.35)
  - E22↔T20: targets 6.1/16.4Å but partners are 6.4Å apart → too_close_together by 3.9Å
- **G36** — severity 1.11, 1 conflict(s); suspect input ~`Y43` (group: push_out)
  - push-out (wants farther): P4@19.3Å(now 16.4,conf 0.39)
  - P4↔Y43: targets 19.3/12.4Å but partners are 3.6Å apart → too_close_together by 3.3Å
- **C15** — severity 0.52, 1 conflict(s); suspect input ~`I24` (group: push_out)
  - push-out (wants farther): I24@11.2Å(now 8.6,conf 0.34)
  - C25↔I24: targets 5.7/11.2Å but partners are 4.0Å apart → too_close_together by 1.5Å

## Secondary Structure (DSSP-like)

- helix(H)=22 · strand(E)=8 · 3-10(G)=10 · coil(C)=4

```
CCGGEHHHHGHHHHHCGGGHEHHHHHGHEHEEHEHEHEGGHGHC
```

## Backbone H-bond Network

- total=11 · helix(i→i+4)=10 · sheet=1
  - V7 ↔ N11  (helix)
  - A8 ↔ F12  (helix)
  - R9 ↔ N13  (helix)
  - N11 ↔ C15  (helix)
  - T20 ↔ I24  (helix)
  - E22 ↔ A26  (helix)
  - I24 ↔ Y28  (helix)
  - A26 ↔ G30  (helix)
  - I33 ↔ A37  (helix)
  - A37 ↔ G41  (helix)
  - I32 ↔ T38  (sheet)

## Solvent Accessibility (burial)

- buried=16 · exposed=15 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=146 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=48 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.1694 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=1 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C2–C39, C3–C31, C15–C25

## Side-chain Rotamers (χ1/χ2)

- 35 residues with modelled χ angles (full table in report JSON)

## Warnings

- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
