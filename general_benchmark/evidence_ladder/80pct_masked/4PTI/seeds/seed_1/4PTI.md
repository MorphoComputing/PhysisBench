# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set/general_benchmark/4PTI/sequence/4PTI.pdb`
- output_pdb: `general_benchmark/evidence_ladder/80pct_masked/4PTI/seeds/seed_1/4PTI.pdb`
- residues: 56
- mode: oracle
- ca_rmsd: 5.404 A
- tm_score_ca_ordered: 0.3355312118306882
- heavy_atom_rmsd: 7.248 A
- sidechain_heavy_atom_rmsd: 8.676 A
- **all-atom quality (honest):** heavy 7.248 A, sidechain 8.676 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/45 (0.0)
- lj_severe: 0
- lj_near: 22
- distogram_pairs: 286
- bin_accuracy: 0.458

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=rejected_lj_regression tested=39
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=374 mode=rotamer
- phase_b_ca_rmsd_after: 5.404261585281855
- ga_delta_rmsd: -0.7504802173628722  ga_fitness_mode: energy
- pre_local_rmsd: 5.409588341445183  localized_anchor_rmsd: 5.404262727238729

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** G56 → 17 conflicts (30%); T31 → 13 conflicts (23%); N23 → 7 conflicts (12%)
- explained: 37/57 conflicts by 3 root cause(s)
- metrics: hubs=25 (frac 0.446), conflicts/hub=2.3, max_incompat=6.15Å, chain_span=0.964
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): G56 + T31 + N23 — explain ~37/57 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **C37** — severity 17.40, 9 conflict(s); suspect input ~`R41` (group: push_out)
  - push-out (wants farther): G56@27.2Å(now 20.6,conf 0.89), I18@12.7Å(now 9.2,conf 0.55), R19@12.3Å(now 9.1,conf 0.55), I17@10.1Å(now 6.3,conf 0.55)
  - G56↔R41: targets 27.2/12.1Å but partners are 8.9Å apart → too_close_together by 6.2Å
  - G56↔K40: targets 27.2/9.3Å but partners are 13.2Å apart → too_close_together by 4.7Å
  - G56↔A47: targets 27.2/19.9Å but partners are 3.5Å apart → too_close_together by 3.8Å
- **I18** — severity 15.52, 7 conflict(s); suspect input ~`T31` (group: pull_in)
  - pull-in (wants closer): T31@6.5Å(now 10.5,conf 0.55)
  - push-out (wants farther): P1@21.8Å(now 17.8,conf 0.62), C37@12.7Å(now 9.2,conf 0.55), K40@14.4Å(now 9.4,conf 0.55)
  - P1↔T31: targets 21.8/6.5Å but partners are 9.8Å apart → too_close_together by 5.5Å
  - T31↔N23: targets 6.5/15.3Å but partners are 3.5Å apart → too_close_together by 5.4Å
  - F3↔T31: targets 19.0/6.5Å but partners are 8.1Å apart → too_close_together by 4.4Å
- **I17** — severity 7.53, 5 conflict(s); suspect input ~`T31` (group: pull_in)
  - pull-in (wants closer): T31@9.9Å(now 13.3,conf 0.55)
  - push-out (wants farther): R41@15.2Å(now 10.8,conf 0.55), K40@14.1Å(now 10.3,conf 0.55), C37@10.1Å(now 6.3,conf 0.55)
  - N23↔T31: targets 18.1/9.9Å but partners are 3.5Å apart → too_close_together by 4.7Å
  - A24↔T31: targets 21.4/9.9Å but partners are 8.6Å apart → too_close_together by 2.9Å
  - R41↔T31: targets 15.2/9.9Å but partners are 3.1Å apart → too_close_together by 2.2Å
- **A15** — severity 6.92, 5 conflict(s); suspect input ~`V33` (group: pull_in)
  - pull-in (wants closer): V33@8.4Å(now 13.3,conf 0.55)
  - push-out (wants farther): D2@27.2Å(now 23.2,conf 0.91)
  - D2↔F21: targets 27.2/17.1Å but partners are 6.2Å apart → too_close_together by 3.9Å
  - D2↔V33: targets 27.2/8.4Å but partners are 15.5Å apart → too_close_together by 3.3Å
  - D2↔P7: targets 27.2/19.0Å but partners are 6.2Å apart → too_close_together by 2.0Å
- **S46** — severity 5.72, 4 conflict(s); suspect input ~`A39` (group: push_out)
  - push-out (wants farther): E6@17.4Å(now 14.7,conf 0.55), A39@15.1Å(now 9.7,conf 0.55), N42@11.6Å(now 8.9,conf 0.55)
  - R19↔A39: targets 6.8/15.1Å but partners are 3.3Å apart → too_close_together by 5.0Å
  - Y20↔A39: targets 6.0/15.1Å but partners are 6.9Å apart → too_close_together by 2.1Å
  - E6↔T31: targets 17.4/8.9Å but partners are 6.7Å apart → too_close_together by 1.8Å
- **A26** — severity 3.56, 2 conflict(s); suspect input ~`Q30` (group: pull_in)
  - pull-in (wants closer): Q30@9.1Å(now 11.9,conf 0.55)
  - push-out (wants farther): R41@18.1Å(now 15.3,conf 0.55), L5@11.1Å(now 6.5,conf 0.55)
  - R41↔Q30: targets 18.1/9.1Å but partners are 4.9Å apart → too_close_together by 4.2Å
  - R41↔T31: targets 18.1/12.7Å but partners are 3.1Å apart → too_close_together by 2.4Å

## Secondary Structure (DSSP-like)

- helix(H)=30 · strand(E)=16 · 3-10(G)=8 · coil(C)=2

```
EEHHHEHEEEEHCEHEGGGEHHHHHHEGHHEGECHGHHHHHHEGHEHHHHHGHHHE
```

## Backbone H-bond Network

- total=36 · helix(i→i+4)=13 · sheet=23
  - F3 ↔ P7  (helix)
  - F21 ↔ K25  (helix)
  - Y22 ↔ A26  (helix)
  - K25 ↔ C29  (helix)
  - A26 ↔ Q30  (helix)
  - G35 ↔ A39  (helix)
  - C37 ↔ R41  (helix)
  - R41 ↔ K45  (helix)
  - K45 ↔ D49  (helix)
  - A47 ↔ M51  (helix)
  - D49 ↔ T53  (helix)
  - C50 ↔ C54  (helix)
  - M51 ↔ G55  (helix)
  - P1 ↔ E6  (sheet)
  - P1 ↔ P8  (sheet)
  - P1 ↔ Y20  (sheet)
  - D2 ↔ P8  (sheet)
  - D2 ↔ Y9  (sheet)
  - D2 ↔ Y20  (sheet)
  - E6 ↔ Y20  (sheet)
  - … +16 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=18 · exposed=22 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=320 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=211 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.8829 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=22 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C4–C54, C13–C37, C29–C50

## Side-chain Rotamers (χ1/χ2)

- 45 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
