# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1CRN\sequence\1CRN.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm1\1CRN\seeds\seed_0\1CRN.pdb`
- residues: 44
- mode: oracle
- ca_rmsd: 0.646 A
- tm_score_ca_ordered: 0.9150662884983791
- heavy_atom_rmsd: 2.457 A
- sidechain_heavy_atom_rmsd: 3.347 A
- **all-atom quality (honest):** heavy 2.457 A, sidechain 3.347 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/35 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 861
- bin_accuracy: 0.667

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=27
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.6463808402448606
- ga_delta_rmsd: 0.0028891780832793756  ga_fitness_mode: energy
- pre_local_rmsd: 0.6829562425471277  localized_anchor_rmsd: 0.6462932260564308

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** I32 → 25 conflicts (81%)
- explained: 25/31 conflicts by 1 root cause(s)
- metrics: hubs=8 (frac 0.182), conflicts/hub=3.9, max_incompat=4.1Å, chain_span=0.864
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): I32 — explain ~25/31 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **I32** — severity 10.71, 13 conflict(s); suspect input ~`D42` (group: pull_in)
  - pull-in (wants closer): D42@8.1Å(now 11.4,conf 0.35), T27@5.3Å(now 8.1,conf 0.46)
  - T27↔T38: targets 5.3/9.7Å but partners are 19.1Å apart → too_far_apart by 4.1Å
  - D42↔T27: targets 8.1/5.3Å but partners are 17.0Å apart → too_far_apart by 3.6Å
  - D42↔A23: targets 8.1/8.4Å but partners are 19.3Å apart → too_far_apart by 2.8Å
- **T27** — severity 7.46, 9 conflict(s); suspect input ~`T38` (group: push_out)
  - pull-in (wants closer): I32@5.3Å(now 8.1,conf 0.46)
  - push-out (wants farther): N11@13.8Å(now 11.2,conf 0.34)
  - T38↔I32: targets 19.7/5.3Å but partners are 11.1Å apart → too_close_together by 3.3Å
  - I34↔I32: targets 14.0/5.3Å but partners are 5.9Å apart → too_close_together by 2.8Å
  - P35↔I32: targets 17.7/5.3Å but partners are 9.9Å apart → too_close_together by 2.6Å
- **D42** — severity 2.92, 4 conflict(s); suspect input ~`I32` (group: pull_in)
  - pull-in (wants closer): I32@8.1Å(now 11.4,conf 0.35)
  - E22↔I32: targets 19.6/8.1Å but partners are 9.2Å apart → too_close_together by 2.3Å
  - I32↔A26: targets 8.1/16.0Å but partners are 5.8Å apart → too_close_together by 2.1Å
  - A23↔I32: targets 18.1/8.1Å but partners are 8.1Å apart → too_close_together by 2.0Å
- **I33** — severity 1.38, 1 conflict(s); suspect input ~`T20` (group: push_out)
  - push-out (wants farther): T20@16.4Å(now 13.7,conf 0.35)
  - E22↔T20: targets 6.1/16.4Å but partners are 6.3Å apart → too_close_together by 4.0Å
- **G36** — severity 1.01, 1 conflict(s); suspect input ~`Y43` (group: push_out)
  - push-out (wants farther): P4@19.3Å(now 16.4,conf 0.39)
  - P4↔Y43: targets 19.3/12.4Å but partners are 3.9Å apart → too_close_together by 3.0Å
- **N11** — severity 0.77, 1 conflict(s); suspect input ~`T27` (group: push_out)
  - push-out (wants farther): T27@13.8Å(now 11.2,conf 0.34)
  - T29↔T27: targets 6.2/13.8Å but partners are 5.3Å apart → too_close_together by 2.3Å

## Secondary Structure (DSSP-like)

- helix(H)=23 · strand(E)=12 · 3-10(G)=6 · coil(C)=3

```
EEGCEHHHEHHHHHHHHGHHEGHHHHGHEHEEHECECEGGHHHE
```

## Backbone H-bond Network

- total=19 · helix(i→i+4)=11 · sheet=8
  - I6 ↔ S10  (helix)
  - V7 ↔ N11  (helix)
  - A8 ↔ F12  (helix)
  - S10 ↔ V14  (helix)
  - N11 ↔ C15  (helix)
  - N13 ↔ L17  (helix)
  - C15 ↔ G19  (helix)
  - G19 ↔ A23  (helix)
  - T20 ↔ I24  (helix)
  - I24 ↔ Y28  (helix)
  - A26 ↔ G30  (helix)
  - T1 ↔ R9  (sheet)
  - T1 ↔ P21  (sheet)
  - C2 ↔ R9  (sheet)
  - R9 ↔ T29  (sheet)
  - C31 ↔ A44  (sheet)
  - I32 ↔ T38  (sheet)
  - I32 ↔ A44  (sheet)
  - T38 ↔ A44  (sheet)

## Solvent Accessibility (burial)

- buried=16 · exposed=15 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=144 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=46 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.1721 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C2–C39, C3–C31, C15–C25

## Side-chain Rotamers (χ1/χ2)

- 35 residues with modelled χ angles (full table in report JSON)

## Warnings

- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
