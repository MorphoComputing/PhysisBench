# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2KNM\sequence\2KNM.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm3\2KNM\seeds\seed_0\2KNM.pdb`
- residues: 28
- mode: oracle
- ca_rmsd: 1.925 A
- tm_score_ca_ordered: 0.3614704711651842
- heavy_atom_rmsd: 3.184 A
- sidechain_heavy_atom_rmsd: 3.801 A
- **all-atom quality (honest):** heavy 3.184 A, sidechain 3.801 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 1
- distogram_pairs: 325
- bin_accuracy: 0.348

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=27
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 1.9253864722513192
- ga_delta_rmsd: 0.028662836554333992  ga_fitness_mode: energy
- pre_local_rmsd: 1.9253540913414764  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** C7-W9 → 37 conflicts (50%); I17-S20 → 21 conflicts (28%); K24-V25 → 8 conflicts (11%)
- explained: 66/74 conflicts by 3 root cause(s)
- metrics: hubs=20 (frac 0.714), conflicts/hub=3.7, max_incompat=7.65Å, chain_span=0.929
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): C7-W9 + I17-S20 + K24-V25 — explain ~66/74 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **S14** — severity 6.39, 10 conflict(s); suspect input ~`C7` (group: pull_in)
  - pull-in (wants closer): C3@7.0Å(now 10.1,conf 0.27), R28@7.7Å(now 11.8,conf 0.23)
  - push-out (wants farther): C19@9.9Å(now 6.1,conf 0.16), C7@17.7Å(now 9.0,conf 0.17), K24@18.2Å(now 10.9,conf 0.18)
  - C26↔K24: targets 6.4/18.2Å but partners are 6.1Å apart → too_close_together by 5.7Å
  - V25↔K24: targets 9.4/18.2Å but partners are 4.4Å apart → too_close_together by 4.5Å
  - C26↔C7: targets 6.4/17.7Å but partners are 6.8Å apart → too_close_together by 4.4Å
- **S23** — severity 4.75, 4 conflict(s); suspect input ~`C19` (group: pull_in)
  - pull-in (wants closer): C19@7.4Å(now 12.3,conf 0.25)
  - push-out (wants farther): I17@21.0Å(now 16.3,conf 0.26)
  - I17↔C19: targets 21.0/7.4Å but partners are 5.9Å apart → too_close_together by 7.7Å
  - A16↔C19: targets 18.0/7.4Å but partners are 4.6Å apart → too_close_together by 6.0Å
  - I17↔Y27: targets 21.0/7.6Å but partners are 9.2Å apart → too_close_together by 4.1Å
- **C7** — severity 4.38, 7 conflict(s); suspect input ~`S14` (group: push_out)
  - pull-in (wants closer): C3@7.8Å(now 10.3,conf 0.23)
  - push-out (wants farther): S14@17.7Å(now 9.0,conf 0.17)
  - I13↔S14: targets 9.1/17.7Å but partners are 3.2Å apart → too_close_together by 5.3Å
  - C26↔S14: targets 6.2/17.7Å but partners are 6.7Å apart → too_close_together by 4.8Å
  - S15↔S14: targets 10.0/17.7Å but partners are 3.4Å apart → too_close_together by 4.3Å
- **V25** — severity 4.34, 7 conflict(s); suspect input ~`G18` (group: pull_in)
  - pull-in (wants closer): P11@8.8Å(now 11.7,conf 0.19)
  - push-out (wants farther): K22@8.9Å(now 4.6,conf 0.19), G18@17.5Å(now 10.9,conf 0.17), W9@16.3Å(now 11.9,conf 0.15)
  - A16↔G18: targets 9.7/17.5Å but partners are 1.9Å apart → too_close_together by 5.8Å
  - C7↔W9: targets 5.6/16.3Å but partners are 5.4Å apart → too_close_together by 5.3Å
  - G18↔S20: targets 17.5/8.8Å but partners are 4.3Å apart → too_close_together by 4.3Å
- **G18** — severity 3.69, 5 conflict(s); suspect input ~`V25` (group: push_out)
  - push-out (wants farther): W9@18.8Å(now 16.2,conf 0.20), V25@17.5Å(now 10.9,conf 0.17)
  - V25↔C26: targets 17.5/5.9Å but partners are 3.9Å apart → too_close_together by 7.6Å
  - V25↔Y27: targets 17.5/7.7Å but partners are 4.6Å apart → too_close_together by 5.2Å
  - V25↔C21: targets 17.5/8.4Å but partners are 4.7Å apart → too_close_together by 4.5Å
- **W9** — severity 3.67, 7 conflict(s); suspect input ~`C26` (group: pull_in)
  - pull-in (wants closer): C26@8.8Å(now 11.6,conf 0.19)
  - push-out (wants farther): G18@18.8Å(now 16.2,conf 0.20), V25@16.3Å(now 11.9,conf 0.15)
  - I17↔C26: targets 22.3/8.8Å but partners are 10.0Å apart → too_close_together by 3.5Å
  - R28↔C26: targets 19.2/8.8Å but partners are 7.0Å apart → too_close_together by 3.3Å
  - S6↔V25: targets 6.0/16.3Å but partners are 6.2Å apart → too_close_together by 4.2Å

## Secondary Structure (DSSP-like)

- helix(H)=13 · strand(E)=9 · 3-10(G)=5 · coil(C)=1

```
CEHHEEGHEGHHHEHEHGHGGEHHHHEE
```

## Backbone H-bond Network

- total=21 · helix(i→i+4)=6 · sheet=15
  - G4 ↔ V8  (helix)
  - V8 ↔ C12  (helix)
  - P11 ↔ S15  (helix)
  - I13 ↔ I17  (helix)
  - S15 ↔ C19  (helix)
  - C19 ↔ S23  (helix)
  - P2 ↔ K22  (sheet)
  - E5 ↔ S14  (sheet)
  - E5 ↔ A16  (sheet)
  - E5 ↔ K22  (sheet)
  - S6 ↔ S14  (sheet)
  - S6 ↔ K22  (sheet)
  - W9 ↔ S14  (sheet)
  - S14 ↔ K22  (sheet)
  - S14 ↔ Y27  (sheet)
  - S14 ↔ R28  (sheet)
  - A16 ↔ K22  (sheet)
  - A16 ↔ Y27  (sheet)
  - A16 ↔ R28  (sheet)
  - K22 ↔ Y27  (sheet)
  - … +1 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=6 · exposed=14 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=96 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=42 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.7702 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=1 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C19, C7–C21, C12–C26

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
