# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2CRD\sequence\2CRD.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm3\2CRD\seeds\seed_0\2CRD.pdb`
- residues: 34
- mode: oracle
- ca_rmsd: 2.133 A
- tm_score_ca_ordered: 0.45800267674233996
- heavy_atom_rmsd: 4.235 A
- sidechain_heavy_atom_rmsd: 5.476 A
- **all-atom quality (honest):** heavy 4.235 A, sidechain 5.476 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/33 (0.0)
- lj_severe: 0
- lj_near: 2
- distogram_pairs: 496
- bin_accuracy: 0.343

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=27
- rigid_domain_reconvergence: applied=False accepted=6 rmsd=2.6805050730901483 -> 2.3090650050927266 A
- topology_reconvergence: applied=False accepted=4/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 2.133161494680009
- ga_delta_rmsd: -0.19986304358608598  ga_fitness_mode: energy
- pre_local_rmsd: 2.1332106562827025  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** V3-Y34 → 209 conflicts (100%)
- explained: 209/209 conflicts by 1 root cause(s)
- metrics: hubs=33 (frac 0.971), conflicts/hub=6.3, max_incompat=9.28Å, chain_span=0.941
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): V3-Y34 — explain ~209/209 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **N28** — severity 9.43, 11 conflict(s); suspect input ~`R32` (group: pull_in)
  - pull-in (wants closer): R32@7.9Å(now 10.8,conf 0.23)
  - push-out (wants farther): T21@23.2Å(now 20.3,conf 0.37), K9@16.9Å(now 14.2,conf 0.16), C33@20.7Å(now 14.0,conf 0.25), Y34@19.1Å(now 15.7,conf 0.20)
  - C33↔R32: targets 20.7/7.9Å but partners are 3.5Å apart → too_close_together by 9.3Å
  - T21↔R32: targets 23.2/7.9Å but partners are 9.5Å apart → too_close_together by 5.8Å
  - Y34↔R32: targets 19.1/7.9Å but partners are 6.4Å apart → too_close_together by 4.8Å
- **K9** — severity 8.39, 14 conflict(s); suspect input ~`S22` (group: push_out)
  - pull-in (wants closer): R17@9.4Å(now 12.7,conf 0.17), C15@6.5Å(now 9.6,conf 0.30), Q16@5.9Å(now 11.2,conf 0.36), V3@7.9Å(now 11.9,conf 0.23)
  - push-out (wants farther): S22@16.6Å(now 10.9,conf 0.15), N28@16.9Å(now 14.2,conf 0.16)
  - S22↔Q16: targets 16.6/5.9Å but partners are 4.5Å apart → too_close_together by 6.3Å
  - S22↔G24: targets 16.6/5.9Å but partners are 4.5Å apart → too_close_together by 6.3Å
  - C15↔H19: targets 6.5/17.8Å but partners are 7.1Å apart → too_close_together by 4.1Å
- **C5** — severity 7.83, 14 conflict(s); suspect input ~`Y34` (group: push_out)
  - pull-in (wants closer): V14@9.7Å(now 13.1,conf 0.17), Y34@9.5Å(now 15.9,conf 0.17), S13@8.0Å(now 11.5,conf 0.22)
  - push-out (wants farther): L18@20.5Å(now 17.1,conf 0.24), S22@19.1Å(now 15.7,conf 0.20)
  - N20↔Y34: targets 21.8/9.5Å but partners are 5.6Å apart → too_close_together by 6.7Å
  - Q16↔S13: targets 18.7/8.0Å but partners are 7.1Å apart → too_close_together by 3.6Å
  - V14↔L18: targets 9.7/20.5Å but partners are 7.2Å apart → too_close_together by 3.7Å
- **M27** — severity 7.46, 13 conflict(s); suspect input ~`C15` (group: pull_in)
  - pull-in (wants closer): G24@9.8Å(now 12.8,conf 0.16), C15@8.8Å(now 13.3,conf 0.19)
  - push-out (wants farther): R17@19.7Å(now 16.0,conf 0.22), T21@19.5Å(now 16.0,conf 0.21), S13@18.4Å(now 14.8,conf 0.19)
  - R17↔C15: targets 19.7/8.8Å but partners are 3.5Å apart → too_close_together by 7.4Å
  - Q16↔C15: targets 18.0/8.8Å but partners are 4.3Å apart → too_close_together by 4.8Å
  - S13↔C15: targets 18.4/8.8Å but partners are 5.1Å apart → too_close_together by 4.5Å
- **S8** — severity 7.26, 12 conflict(s); suspect input ~`V14` (group: pull_in)
  - pull-in (wants closer): T1@10.2Å(now 13.7,conf 0.15), C33@6.2Å(now 12.1,conf 0.33)
  - push-out (wants farther): K25@9.2Å(now 4.3,conf 0.18), C11@8.0Å(now 4.7,conf 0.22), G24@9.8Å(now 7.3,conf 0.16), V14@18.1Å(now 12.0,conf 0.18), N2@19.8Å(now 16.1,conf 0.22), S4@16.9Å(now 10.9,conf 0.16)
  - T1↔N2: targets 10.2/19.8Å but partners are 3.5Å apart → too_close_together by 6.1Å
  - S13↔V14: targets 9.6/18.1Å but partners are 2.9Å apart → too_close_together by 5.6Å
  - W12↔V14: targets 9.0/18.1Å but partners are 4.2Å apart → too_close_together by 4.8Å
- **L18** — severity 6.93, 12 conflict(s); suspect input ~`S4` (group: pull_in)
  - pull-in (wants closer): S4@8.8Å(now 13.2,conf 0.19), S13@6.2Å(now 9.9,conf 0.33), G24@9.0Å(now 12.8,conf 0.18)
  - push-out (wants farther): K29@19.7Å(now 16.5,conf 0.22), K25@17.0Å(now 14.4,conf 0.16), C26@18.3Å(now 15.6,conf 0.18), C5@20.5Å(now 17.1,conf 0.24)
  - S4↔C5: targets 8.8/20.5Å but partners are 5.2Å apart → too_close_together by 6.5Å
  - S13↔C5: targets 6.2/20.5Å but partners are 11.5Å apart → too_close_together by 2.8Å
  - K29↔S4: targets 19.7/8.8Å but partners are 7.5Å apart → too_close_together by 3.4Å

## Secondary Structure (DSSP-like)

- helix(H)=15 · strand(E)=18 · 3-10(G)=1 · coil(C)=0

```
EHEEEHEHEHHHHHGHEHEEEEEHEEHHHEHEEE
```

## Backbone H-bond Network

- total=49 · helix(i→i+4)=6 · sheet=43
  - N2 ↔ T6  (helix)
  - T6 ↔ E10  (helix)
  - E10 ↔ V14  (helix)
  - V14 ↔ L18  (helix)
  - G24 ↔ N28  (helix)
  - M27 ↔ C31  (helix)
  - T1 ↔ R17  (sheet)
  - T1 ↔ H19  (sheet)
  - T1 ↔ T21  (sheet)
  - V3 ↔ K9  (sheet)
  - V3 ↔ R17  (sheet)
  - S4 ↔ K9  (sheet)
  - C5 ↔ K25  (sheet)
  - T7 ↔ R23  (sheet)
  - T7 ↔ K25  (sheet)
  - T7 ↔ C26  (sheet)
  - K9 ↔ S22  (sheet)
  - K9 ↔ R23  (sheet)
  - K9 ↔ K25  (sheet)
  - K9 ↔ C26  (sheet)
  - … +29 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=9 · exposed=15 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=131 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=75 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.7991 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=2 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C26, C11–C31, C15–C33

## Side-chain Rotamers (χ1/χ2)

- 33 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`2CRD.ensemble.pdb`)
- RMSF mean=0.643Å max=1.809Å (per-residue in .per_residue.csv)
- most flexible residues: 1, 2, 3, 34, 16

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `2CRD.pae.csv`
- mean=0.366Å · max=2.274Å · AlphaFold-PAE analog (low block = rigid unit/domain)
