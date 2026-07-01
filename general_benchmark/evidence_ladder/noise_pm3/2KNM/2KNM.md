# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2KNM\sequence\2KNM.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm3\2KNM\seeds\seed_1\2KNM.pdb`
- residues: 28
- mode: oracle
- ca_rmsd: 1.597 A
- tm_score_ca_ordered: 0.5083755570612826
- heavy_atom_rmsd: 2.684 A
- sidechain_heavy_atom_rmsd: 3.021 A
- **all-atom quality (honest):** heavy 2.684 A, sidechain 3.021 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 325
- bin_accuracy: 0.357

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=27
- rigid_domain_reconvergence: applied=True accepted=10 rmsd=2.0997973484760193 -> 1.5951897000914106 A
- topology_reconvergence: applied=True accepted=0/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 1.596658843198658
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 1.5967143519541374  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** E5-I10 → 46 conflicts (60%); I17-G18 → 19 conflicts (25%); S14 → 7 conflicts (9%)
- explained: 72/76 conflicts by 3 root cause(s)
- metrics: hubs=19 (frac 0.679), conflicts/hub=4.0, max_incompat=8.48Å, chain_span=0.929
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): E5-I10 + I17-G18 + S14 — explain ~72/76 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **S14** — severity 6.39, 10 conflict(s); suspect input ~`C7` (group: pull_in)
  - pull-in (wants closer): R28@7.7Å(now 12.6,conf 0.23)
  - push-out (wants farther): C19@9.9Å(now 7.1,conf 0.16), C7@17.7Å(now 9.4,conf 0.17), K24@18.2Å(now 12.0,conf 0.18)
  - C26↔K24: targets 6.4/18.2Å but partners are 6.0Å apart → too_close_together by 5.8Å
  - V25↔K24: targets 9.4/18.2Å but partners are 3.8Å apart → too_close_together by 5.0Å
  - C26↔C7: targets 6.4/17.7Å but partners are 6.8Å apart → too_close_together by 4.5Å
- **I17** — severity 5.24, 9 conflict(s); suspect input ~`E5` (group: pull_in)
  - pull-in (wants closer): E5@9.5Å(now 13.6,conf 0.17)
  - push-out (wants farther): S23@21.0Å(now 16.1,conf 0.26), I10@21.4Å(now 17.2,conf 0.28), G4@16.3Å(now 12.8,conf 0.15)
  - E5↔I10: targets 9.5/21.4Å but partners are 5.3Å apart → too_close_together by 6.5Å
  - E5↔S6: targets 9.5/17.6Å but partners are 3.3Å apart → too_close_together by 4.8Å
  - W9↔E5: targets 22.3/9.5Å but partners are 8.6Å apart → too_close_together by 4.2Å
- **S23** — severity 5.07, 4 conflict(s); suspect input ~`C19` (group: pull_in)
  - pull-in (wants closer): C19@7.4Å(now 11.6,conf 0.25)
  - push-out (wants farther): I17@21.0Å(now 16.1,conf 0.26), G18@16.7Å(now 13.9,conf 0.16)
  - I17↔C19: targets 21.0/7.4Å but partners are 5.2Å apart → too_close_together by 8.4Å
  - A16↔C19: targets 18.0/7.4Å but partners are 4.2Å apart → too_close_together by 6.3Å
  - I17↔Y27: targets 21.0/7.6Å but partners are 9.3Å apart → too_close_together by 4.0Å
- **G18** — severity 4.53, 7 conflict(s); suspect input ~`V25` (group: push_out)
  - push-out (wants farther): V25@17.5Å(now 10.7,conf 0.17), S23@16.7Å(now 13.9,conf 0.16)
  - V25↔C26: targets 17.5/5.9Å but partners are 3.1Å apart → too_close_together by 8.5Å
  - V25↔Y27: targets 17.5/7.7Å but partners are 4.6Å apart → too_close_together by 5.2Å
  - V25↔C21: targets 17.5/8.4Å but partners are 4.5Å apart → too_close_together by 4.6Å
- **C7** — severity 4.26, 7 conflict(s); suspect input ~`S14` (group: push_out)
  - pull-in (wants closer): C3@7.8Å(now 10.4,conf 0.23)
  - push-out (wants farther): S14@17.7Å(now 9.4,conf 0.17)
  - I13↔S14: targets 9.1/17.7Å but partners are 2.3Å apart → too_close_together by 6.2Å
  - S15↔S14: targets 10.0/17.7Å but partners are 3.2Å apart → too_close_together by 4.5Å
  - I10↔S14: targets 5.6/17.7Å but partners are 8.4Å apart → too_close_together by 3.7Å
- **V25** — severity 3.90, 6 conflict(s); suspect input ~`G18` (group: push_out)
  - push-out (wants farther): K22@8.9Å(now 4.7,conf 0.19), G18@17.5Å(now 10.7,conf 0.17), W9@16.3Å(now 11.3,conf 0.15)
  - A16↔G18: targets 9.7/17.5Å but partners are 2.6Å apart → too_close_together by 5.2Å
  - C7↔W9: targets 5.6/16.3Å but partners are 5.6Å apart → too_close_together by 5.1Å
  - G18↔C19: targets 17.5/9.8Å but partners are 3.5Å apart → too_close_together by 4.2Å

## Secondary Structure (DSSP-like)

- helix(H)=11 · strand(E)=11 · 3-10(G)=5 · coil(C)=1

```
CEHGEEGHHEGHHEEEHGHGHEHHEHEE
```

## Backbone H-bond Network

- total=32 · helix(i→i+4)=3 · sheet=29
  - V8 ↔ C12  (helix)
  - I13 ↔ I17  (helix)
  - C19 ↔ S23  (helix)
  - P2 ↔ S14  (sheet)
  - P2 ↔ S15  (sheet)
  - P2 ↔ A16  (sheet)
  - P2 ↔ K22  (sheet)
  - E5 ↔ I10  (sheet)
  - E5 ↔ S14  (sheet)
  - E5 ↔ S15  (sheet)
  - E5 ↔ A16  (sheet)
  - E5 ↔ K22  (sheet)
  - E5 ↔ V25  (sheet)
  - S6 ↔ S14  (sheet)
  - S6 ↔ S15  (sheet)
  - S6 ↔ K22  (sheet)
  - S6 ↔ V25  (sheet)
  - I10 ↔ S15  (sheet)
  - I10 ↔ V25  (sheet)
  - S14 ↔ K22  (sheet)
  - … +12 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=4 · exposed=11 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=101 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=45 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.7575 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C19, C7–C21, C12–C26

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`2KNM.ensemble.pdb`)
- RMSF mean=0.512Å max=1.556Å (per-residue in .per_residue.csv)
- most flexible residues: 15, 17, 8, 13, 1

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `2KNM.pae.csv`
- mean=0.262Å · max=1.526Å · AlphaFold-PAE analog (low block = rigid unit/domain)
