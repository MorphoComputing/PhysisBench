# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1NXB\sequence\1NXB.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm3\1NXB\seeds\seed_0\1NXB.pdb`
- residues: 60
- mode: oracle
- ca_rmsd: 2.226 A
- tm_score_ca_ordered: 0.6878334925110312
- heavy_atom_rmsd: 3.805 A
- sidechain_heavy_atom_rmsd: 4.788 A
- **all-atom quality (honest):** heavy 3.805 A, sidechain 4.788 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 4/4
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/55 (0.0)
- lj_severe: 0
- lj_near: 4
- distogram_pairs: 1653
- bin_accuracy: 0.336

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=39
- rigid_domain_reconvergence: applied=True accepted=7 rmsd=2.609947859094112 -> 2.358982957956151 A
- topology_reconvergence: applied=True accepted=1/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 2.226095281958176
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 2.2531373490538975  localized_anchor_rmsd: 2.226035169335563

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** S22-S29 → 448 conflicts (46%); C2-T12 → 257 conflicts (26%); T34-C40 → 119 conflicts (12%)
- explained: 824/981 conflicts by 3 root cause(s)
- metrics: hubs=60 (frac 1.0), conflicts/hub=16.4, max_incompat=9.72Å, chain_span=0.983
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): S22-S29 + C2-T12 + T34-C40 — explain ~824/981 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **S29** — severity 39.89, 53 conflict(s); suspect input ~`N60` (group: pull_in)
  - pull-in (wants closer): N60@9.3Å(now 16.4,conf 0.17), S7@6.5Å(now 9.9,conf 0.30), H6@8.3Å(now 11.0,conf 0.21)
  - push-out (wants farther): V58@23.9Å(now 20.8,conf 0.42), C2@25.0Å(now 19.9,conf 0.53), C54@23.2Å(now 20.6,conf 0.37), C40@22.6Å(now 19.8,conf 0.33), C23@23.6Å(now 19.6,conf 0.40), Q11@21.1Å(now 18.4,conf 0.27), N4@19.2Å(now 16.3,conf 0.21), R32@8.8Å(now 5.7,conf 0.19), Q5@20.9Å(now 14.6,conf 0.26), Q9@19.8Å(now 15.2,conf 0.22), V45@17.5Å(now 15.0,conf 0.17)
  - S7↔Q5: targets 6.5/20.9Å but partners are 6.5Å apart → too_close_together by 7.9Å
  - Q5↔H6: targets 20.9/8.3Å but partners are 3.7Å apart → too_close_together by 8.9Å
  - V58↔N60: targets 23.9/9.3Å but partners are 4.9Å apart → too_close_together by 9.7Å
- **W28** — severity 28.79, 37 conflict(s); suspect input ~`G39` (group: pull_in)
  - pull-in (wants closer): E20@18.9Å(now 22.1,conf 0.20), S17@19.6Å(now 22.6,conf 0.22), K14@16.3Å(now 20.1,conf 0.15), I36@5.6Å(now 8.6,conf 0.38), G39@9.3Å(now 15.3,conf 0.18), T44@9.1Å(now 13.3,conf 0.18)
  - push-out (wants farther): S22@22.5Å(now 19.5,conf 0.33), I35@8.9Å(now 5.3,conf 0.19), K50@7.8Å(now 4.9,conf 0.23), G48@8.8Å(now 5.7,conf 0.19), G41@19.1Å(now 15.9,conf 0.20), N60@17.9Å(now 14.2,conf 0.18), Y24@22.0Å(now 11.8,conf 0.30), Q9@21.1Å(now 17.1,conf 0.27), N4@17.9Å(now 15.0,conf 0.18)
  - I36↔Y24: targets 5.6/22.0Å but partners are 8.5Å apart → too_close_together by 7.9Å
  - Y24↔H25: targets 22.0/9.5Å but partners are 3.5Å apart → too_close_together by 9.0Å
  - I1↔G39: targets 23.2/9.3Å but partners are 6.0Å apart → too_close_together by 8.0Å
- **H25** — severity 24.95, 37 conflict(s); suspect input ~`Q11` (group: pull_in)
  - pull-in (wants closer): Q11@9.9Å(now 13.9,conf 0.16), H6@6.7Å(now 9.7,conf 0.29), Q5@6.3Å(now 10.4,conf 0.32)
  - push-out (wants farther): R38@7.8Å(now 5.0,conf 0.23), P18@21.9Å(now 18.8,conf 0.30), N60@7.4Å(now 4.8,conf 0.25), E37@6.9Å(now 4.2,conf 0.28), I36@8.4Å(now 5.5,conf 0.20), S17@19.5Å(now 16.9,conf 0.21), D30@19.6Å(now 15.8,conf 0.22), C16@19.9Å(now 14.2,conf 0.23), P47@19.2Å(now 15.2,conf 0.21), G48@17.4Å(now 13.9,conf 0.17)
  - G39↔C16: targets 6.2/19.9Å but partners are 6.6Å apart → too_close_together by 7.1Å
  - C16↔C40: targets 19.9/7.8Å but partners are 6.0Å apart → too_close_together by 6.1Å
  - S52↔Q5: targets 5.6/6.3Å but partners are 16.1Å apart → too_far_apart by 4.1Å
- **T44** — severity 24.79, 36 conflict(s); suspect input ~`C23` (group: push_out)
  - pull-in (wants closer): T12@20.7Å(now 23.9,conf 0.25), T13@18.2Å(now 22.0,conf 0.18), C23@8.3Å(now 12.5,conf 0.21), S22@8.3Å(now 12.5,conf 0.21), K50@5.6Å(now 10.8,conf 0.38), W28@9.1Å(now 13.3,conf 0.18)
  - push-out (wants farther): C59@20.8Å(now 17.7,conf 0.25), C16@21.0Å(now 17.4,conf 0.26), E20@17.2Å(now 14.5,conf 0.16), C54@19.8Å(now 13.3,conf 0.22), G48@17.7Å(now 11.2,conf 0.17)
  - T34↔K50: targets 21.9/5.6Å but partners are 11.7Å apart → too_close_together by 4.7Å
  - C23↔C54: targets 8.3/19.8Å but partners are 5.4Å apart → too_close_together by 6.0Å
  - C59↔C23: targets 20.8/8.3Å but partners are 6.4Å apart → too_close_together by 6.0Å
- **G39** — severity 22.38, 36 conflict(s); suspect input ~`W28` (group: push_out)
  - pull-in (wants closer): K26@6.3Å(now 9.2,conf 0.32), W28@9.3Å(now 15.3,conf 0.18), I36@7.8Å(now 11.4,conf 0.23), T12@7.6Å(now 10.6,conf 0.24), S7@9.8Å(now 13.4,conf 0.16)
  - push-out (wants farther): R32@23.2Å(now 20.3,conf 0.38), C23@8.9Å(now 4.7,conf 0.19), C2@7.4Å(now 3.3,conf 0.25), S22@10.3Å(now 7.7,conf 0.15)
  - C42↔T12: targets 6.9/7.6Å but partners are 19.6Å apart → too_far_apart by 5.2Å
  - R32↔K26: targets 23.2/6.3Å but partners are 13.8Å apart → too_close_together by 3.1Å
  - S17↔I36: targets 8.5/7.8Å but partners are 20.8Å apart → too_far_apart by 4.5Å
- **C54** — severity 21.98, 30 conflict(s); suspect input ~`K50` (group: pull_in)
  - pull-in (wants closer): G19@10.4Å(now 16.2,conf 0.15), R38@7.9Å(now 10.4,conf 0.22), F3@10.1Å(now 13.0,conf 0.16), K50@9.6Å(now 13.4,conf 0.17)
  - push-out (wants farther): S29@23.2Å(now 20.6,conf 0.37), P10@25.2Å(now 22.2,conf 0.55), P47@24.1Å(now 19.3,conf 0.44), K46@22.1Å(now 15.9,conf 0.31), T44@19.8Å(now 13.3,conf 0.22), C16@20.6Å(now 14.2,conf 0.25)
  - T44↔P43: targets 19.8/8.6Å but partners are 3.6Å apart → too_close_together by 7.7Å
  - C23↔C16: targets 5.8/20.6Å but partners are 9.1Å apart → too_close_together by 5.7Å
  - S21↔C16: targets 7.3/20.6Å but partners are 7.6Å apart → too_close_together by 5.7Å

## Secondary Structure (DSSP-like)

- helix(H)=13 · strand(E)=29 · 3-10(G)=11 · coil(C)=7

```
CCGHEEEEECEEGECGHHEEHEGEHHHEGEHEEGGEEEEEGCEHGEEGCEGECEHEHHHE
```

## Backbone H-bond Network

- total=58 · helix(i→i+4)=4 · sheet=54
  - S17 ↔ S21  (helix)
  - S21 ↔ H25  (helix)
  - Q27 ↔ F31  (helix)
  - E55 ↔ C59  (helix)
  - Q5 ↔ Q11  (sheet)
  - Q5 ↔ T12  (sheet)
  - Q5 ↔ K14  (sheet)
  - Q5 ↔ Y24  (sheet)
  - H6 ↔ Q11  (sheet)
  - H6 ↔ T12  (sheet)
  - H6 ↔ K14  (sheet)
  - H6 ↔ Y24  (sheet)
  - S7 ↔ T12  (sheet)
  - K14 ↔ G19  (sheet)
  - K14 ↔ Y24  (sheet)
  - G19 ↔ G39  (sheet)
  - E20 ↔ G39  (sheet)
  - E20 ↔ C40  (sheet)
  - S22 ↔ R38  (sheet)
  - S22 ↔ G39  (sheet)
  - … +38 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=17 · exposed=25 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=222 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=137 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.6097 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=4 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=4: C2–C23, C16–C40, C42–C53, C54–C59

## Side-chain Rotamers (χ1/χ2)

- 55 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`1NXB.ensemble.pdb`)
- RMSF mean=0.479Å max=1.759Å (per-residue in .per_residue.csv)
- most flexible residues: 10, 12, 27, 26, 3

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1NXB.pae.csv`
- mean=0.233Å · max=1.337Å · AlphaFold-PAE analog (low block = rigid unit/domain)
