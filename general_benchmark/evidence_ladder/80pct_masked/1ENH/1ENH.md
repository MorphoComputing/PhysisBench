# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set/general_benchmark/1ENH/sequence/1ENH.pdb`
- output_pdb: `general_benchmark/evidence_ladder/80pct_masked/1ENH/seeds/seed_0/1ENH.pdb`
- residues: 52
- mode: oracle
- ca_rmsd: 4.038 A
- tm_score_ca_ordered: 0.4233488365316518
- heavy_atom_rmsd: 5.693 A
- sidechain_heavy_atom_rmsd: 6.837 A
- **all-atom quality (honest):** heavy 5.693 A, sidechain 6.837 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/47 (0.0)
- lj_severe: 0
- lj_near: 16
- distogram_pairs: 245
- bin_accuracy: 0.424

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=36
- rigid_domain_reconvergence: applied=True accepted=9 rmsd=7.198159447500755 -> 6.407330003377127 A
- topology_reconvergence: applied=True accepted=2/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 4.038384473706536
- ga_delta_rmsd: 0.9009010097280763  ga_fitness_mode: energy
- pre_local_rmsd: 4.15358126917107  localized_anchor_rmsd: 4.038376577657938

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** Q29-G36 → 27 conflicts (57%); Y22-R26 → 6 conflicts (13%); E19 → 4 conflicts (8%)
- explained: 37/47 conflicts by 3 root cause(s)
- metrics: hubs=28 (frac 0.538), conflicts/hub=1.7, max_incompat=5.34Å, chain_span=0.981
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): Q29-G36 + Y22-R26 + E19 — explain ~37/47 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **R26** — severity 8.75, 6 conflict(s); suspect input ~`L35` (group: pull_in)
  - pull-in (wants closer): Q29@5.1Å(now 8.1,conf 0.57)
  - push-out (wants farther): Y22@11.6Å(now 5.3,conf 0.55), L35@14.1Å(now 9.3,conf 0.55), R21@14.1Å(now 10.1,conf 0.55)
  - Q29↔L35: targets 5.1/14.1Å but partners are 4.5Å apart → too_close_together by 4.5Å
  - Q29↔E34: targets 5.1/12.4Å but partners are 4.7Å apart → too_close_together by 2.6Å
  - Q29↔Q41: targets 5.1/14.7Å but partners are 7.1Å apart → too_close_together by 2.5Å
- **P1** — severity 5.29, 4 conflict(s); suspect input ~`I44` (group: push_out)
  - push-out (wants farther): S33@20.0Å(now 8.7,conf 0.58), L35@18.2Å(now 14.9,conf 0.55), R50@18.1Å(now 14.9,conf 0.55), Q9@17.3Å(now 13.0,conf 0.55)
  - S33↔E39: targets 20.0/13.3Å but partners are 3.1Å apart → too_close_together by 3.6Å
  - R50↔I44: targets 18.1/9.6Å but partners are 6.2Å apart → too_close_together by 2.3Å
  - R50↔W45: targets 18.1/11.2Å but partners are 5.0Å apart → too_close_together by 2.0Å
- **A11** — severity 4.19, 2 conflict(s); suspect input ~`E16` (group: push_out)
  - push-out (wants farther): T24@19.4Å(now 13.4,conf 0.57)
  - T24↔E16: targets 19.4/8.7Å but partners are 6.2Å apart → too_close_together by 4.5Å
  - T24↔F17: targets 19.4/9.9Å but partners are 6.3Å apart → too_close_together by 3.2Å
- **S33** — severity 3.74, 3 conflict(s); suspect input ~`G36` (group: push_out)
  - push-out (wants farther): K49@20.4Å(now 15.4,conf 0.59), P1@20.0Å(now 8.7,conf 0.58), N18@19.5Å(now 16.2,conf 0.57), Y22@17.9Å(now 10.3,conf 0.55), A4@16.9Å(now 13.3,conf 0.55), I44@16.4Å(now 8.6,conf 0.55), N38@8.5Å(now 3.5,conf 0.55), K43@13.7Å(now 7.7,conf 0.55)
  - P1↔G36: targets 20.0/5.6Å but partners are 11.7Å apart → too_close_together by 2.6Å
  - P1↔N38: targets 20.0/8.5Å but partners are 9.1Å apart → too_close_together by 2.4Å
  - G36↔Y22: targets 5.6/17.9Å but partners are 10.5Å apart → too_close_together by 1.8Å
- **R2** — severity 3.68, 3 conflict(s); suspect input ~`A40` (group: push_out)
  - push-out (wants farther): E19@22.6Å(now 18.0,conf 0.68), Q30@19.3Å(now 14.5,conf 0.56)
  - E19↔A40: targets 22.6/9.1Å but partners are 10.7Å apart → too_close_together by 2.8Å
  - Q30↔A40: targets 19.3/9.1Å but partners are 8.0Å apart → too_close_together by 2.2Å
  - Q30↔N38: targets 19.3/10.2Å but partners are 7.3Å apart → too_close_together by 1.8Å
- **L37** — severity 3.60, 2 conflict(s); suspect input ~`E16` (group: push_out)
  - push-out (wants farther): E19@19.2Å(now 14.0,conf 0.56), Q41@6.5Å(now 3.4,conf 0.55)
  - E19↔E16: targets 19.2/14.4Å but partners are 0.5Å apart → too_close_together by 4.3Å
  - S32↔E19: targets 5.1/19.2Å but partners are 11.8Å apart → too_close_together by 2.3Å

## Secondary Structure (DSSP-like)

- helix(H)=30 · strand(E)=13 · 3-10(G)=9 · coil(C)=0

```
EEEHEEHEHHEHGHHGHHGHHGHHHHHEHHHEHEHGHHHHHEGGGHGHHHEE
```

## Backbone H-bond Network

- total=23 · helix(i→i+4)=14 · sheet=9
  - L10 ↔ K14  (helix)
  - K14 ↔ N18  (helix)
  - F17 ↔ R21  (helix)
  - R21 ↔ E25  (helix)
  - L23 ↔ R27  (helix)
  - E25 ↔ Q29  (helix)
  - R26 ↔ Q30  (helix)
  - R27 ↔ L31  (helix)
  - Q29 ↔ S33  (helix)
  - L31 ↔ L35  (helix)
  - S33 ↔ L37  (helix)
  - L35 ↔ E39  (helix)
  - L37 ↔ Q41  (helix)
  - F46 ↔ R50  (helix)
  - R2 ↔ E8  (sheet)
  - T3 ↔ E8  (sheet)
  - F5 ↔ A11  (sheet)
  - S6 ↔ A11  (sheet)
  - A11 ↔ R28  (sheet)
  - R28 ↔ E34  (sheet)
  - … +3 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=29 · exposed=8 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=277 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=122 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.4921 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=16 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 47 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`1ENH.ensemble.pdb`)
- RMSF mean=2.982Å max=9.277Å (per-residue in .per_residue.csv)
- most flexible residues: 7, 4, 10, 33, 11

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1ENH.pae.csv`
- mean=1.078Å · max=5.32Å · AlphaFold-PAE analog (low block = rigid unit/domain)
