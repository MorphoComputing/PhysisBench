# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1YCC\sequence\1YCC.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm3\1YCC\seeds\seed_0\1YCC.pdb`
- residues: 103
- mode: oracle
- ca_rmsd: 1.871 A
- tm_score_ca_ordered: 0.8207887376592631
- heavy_atom_rmsd: 3.514 A
- sidechain_heavy_atom_rmsd: 4.472 A
- **all-atom quality (honest):** heavy 3.514 A, sidechain 4.472 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/84 (0.0)
- lj_severe: 0
- lj_near: 3
- distogram_pairs: 3282
- bin_accuracy: 0.311

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=54
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 1.8712794052530861
- ga_delta_rmsd: 1.30636888142745  ga_fitness_mode: energy
- pre_local_rmsd: 1.904051620751334  localized_anchor_rmsd: 1.8713027286173076

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** T79-K100 → 1080 conflicts (50%); H30-Q46 → 625 conflicts (29%); M68-T73 → 195 conflicts (9%)
- explained: 1900/2165 conflicts by 3 root cause(s)
- metrics: hubs=103 (frac 1.0), conflicts/hub=21.0, max_incompat=10.75Å, chain_span=0.99
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): T79-K100 + H30-Q46 + M68-T73 — explain ~1900/2165 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **K80** — severity 42.32, 61 conflict(s); suspect input ~`C18` (group: pull_in)
  - pull-in (wants closer): A102@20.6Å(now 24.4,conf 0.25), T97@17.4Å(now 23.4,conf 0.17), K100@16.7Å(now 23.0,conf 0.16), K101@21.7Å(now 25.2,conf 0.29), I76@6.6Å(now 9.9,conf 0.30), K31@9.6Å(now 14.6,conf 0.17), G33@7.5Å(now 10.9,conf 0.24), K59@10.0Å(now 12.9,conf 0.16), S44@8.4Å(now 12.4,conf 0.20), S51@6.7Å(now 11.3,conf 0.29), N74@8.9Å(now 12.1,conf 0.19), C18@8.0Å(now 14.1,conf 0.22)
  - push-out (wants farther): E89@25.5Å(now 20.8,conf 0.58), C103@25.6Å(now 22.2,conf 0.59), R92@23.5Å(now 20.4,conf 0.39), K87@18.2Å(now 15.3,conf 0.18), T53@7.7Å(now 5.0,conf 0.24), G49@20.0Å(now 16.2,conf 0.23), A47@20.5Å(now 16.8,conf 0.24), P34@19.2Å(now 14.6,conf 0.21)
  - G49↔S51: targets 20.0/6.7Å but partners are 5.8Å apart → too_close_together by 7.5Å
  - G33↔P34: targets 7.5/19.2Å but partners are 4.5Å apart → too_close_together by 7.2Å
  - S51↔A47: targets 6.7/20.5Å but partners are 8.2Å apart → too_close_together by 5.6Å
- **L95** — severity 39.18, 53 conflict(s); suspect input ~`F2` (group: push_out)
  - pull-in (wants closer): K88@8.2Å(now 11.0,conf 0.21), L36@9.2Å(now 12.1,conf 0.18), F2@7.3Å(now 11.0,conf 0.26), L19@7.8Å(now 13.2,conf 0.23), G85@9.6Å(now 12.2,conf 0.17), C18@6.6Å(now 10.0,conf 0.30), K15@6.2Å(now 11.3,conf 0.33), T23@10.1Å(now 13.0,conf 0.16)
  - push-out (wants farther): R92@8.3Å(now 4.6,conf 0.21), S44@21.4Å(now 16.9,conf 0.28), T16@16.6Å(now 13.7,conf 0.15), F83@16.5Å(now 13.8,conf 0.15), H37@16.8Å(now 13.8,conf 0.16), V24@17.3Å(now 13.2,conf 0.17), N66@18.6Å(now 10.7,conf 0.19)
  - F2↔K15: targets 7.3/6.2Å but partners are 21.7Å apart → too_far_apart by 8.2Å
  - F2↔L19: targets 7.3/7.8Å but partners are 24.0Å apart → too_far_apart by 8.9Å
  - F2↔C18: targets 7.3/6.6Å but partners are 20.3Å apart → too_far_apart by 6.4Å
- **M68** — severity 38.09, 60 conflict(s); suspect input ~`G5` (group: pull_in)
  - pull-in (wants closer): R17@10.4Å(now 15.9,conf 0.15), V24@10.3Å(now 17.2,conf 0.15), G5@8.9Å(now 12.9,conf 0.19), G33@8.6Å(now 14.8,conf 0.20), Y75@5.8Å(now 9.2,conf 0.36)
  - push-out (wants farther): G78@18.1Å(now 14.9,conf 0.18), K58@21.2Å(now 14.7,conf 0.27), I57@20.5Å(now 14.6,conf 0.25), A7@18.8Å(now 14.2,conf 0.20), Y98@17.0Å(now 12.0,conf 0.16), F14@18.3Å(now 13.8,conf 0.18), K101@16.5Å(now 13.5,conf 0.15)
  - G33↔F2: targets 8.6/7.8Å but partners are 23.6Å apart → too_far_apart by 7.2Å
  - K58↔I76: targets 21.2/7.9Å but partners are 7.6Å apart → too_close_together by 5.7Å
  - Y71↔K58: targets 5.6/21.2Å but partners are 11.7Å apart → too_close_together by 3.9Å
- **Q46** — severity 37.83, 47 conflict(s); suspect input ~`Y71` (group: push_out)
  - pull-in (wants closer): Y71@9.0Å(now 15.2,conf 0.18), K58@7.8Å(now 11.6,conf 0.23), N35@6.8Å(now 11.0,conf 0.28), L62@7.0Å(now 10.8,conf 0.27), N60@7.2Å(now 11.7,conf 0.26), H30@7.5Å(now 10.9,conf 0.24), G28@10.0Å(now 14.4,conf 0.16)
  - push-out (wants farther): L99@19.5Å(now 15.8,conf 0.21), E65@20.0Å(now 17.1,conf 0.23), C21@18.8Å(now 15.9,conf 0.20), R42@10.3Å(now 6.1,conf 0.15), E25@19.2Å(now 15.8,conf 0.21), K31@19.7Å(now 12.8,conf 0.22), P29@18.6Å(now 13.6,conf 0.19), T23@17.5Å(now 14.8,conf 0.17)
  - N35↔K31: targets 6.8/19.7Å but partners are 4.6Å apart → too_close_together by 8.2Å
  - K31↔H30: targets 19.7/7.5Å but partners are 4.5Å apart → too_close_together by 7.6Å
  - N35↔P29: targets 6.8/18.6Å but partners are 3.4Å apart → too_close_together by 8.3Å
- **F14** — severity 36.08, 58 conflict(s); suspect input ~`M68` (group: push_out)
  - pull-in (wants closer): H43@16.8Å(now 19.3,conf 0.16), G85@7.3Å(now 12.3,conf 0.26), T73@9.5Å(now 13.8,conf 0.17), A102@10.2Å(now 13.6,conf 0.15), R92@6.5Å(now 10.6,conf 0.31), K101@9.9Å(now 13.7,conf 0.16), L36@7.8Å(now 11.3,conf 0.23), P34@9.2Å(now 14.5,conf 0.18), L72@5.6Å(now 11.4,conf 0.38)
  - push-out (wants farther): R17@9.0Å(now 5.4,conf 0.18), D64@20.0Å(now 16.8,conf 0.23), K87@17.0Å(now 14.0,conf 0.16), I39@19.4Å(now 14.0,conf 0.21), G33@17.4Å(now 12.9,conf 0.17), G84@16.8Å(now 14.1,conf 0.16), F40@19.3Å(now 15.6,conf 0.21), M68@18.3Å(now 13.8,conf 0.18), K100@16.6Å(now 12.6,conf 0.15)
  - K59↔L72: targets 23.4/5.6Å but partners are 14.0Å apart → too_close_together by 3.7Å
  - M68↔L72: targets 18.3/5.6Å but partners are 5.2Å apart → too_close_together by 7.5Å
  - A11↔L72: targets 5.7/5.6Å but partners are 15.0Å apart → too_far_apart by 3.7Å
- **L99** — severity 33.75, 47 conflict(s); suspect input ~`E70` (group: pull_in)
  - pull-in (wants closer): G5@8.2Å(now 11.0,conf 0.21), S69@8.6Å(now 13.4,conf 0.20), E70@9.3Å(now 15.6,conf 0.17), K15@10.3Å(now 13.0,conf 0.15), R92@5.8Å(now 11.3,conf 0.36)
  - push-out (wants farther): Q46@19.5Å(now 15.8,conf 0.21), N74@21.1Å(now 18.0,conf 0.27), V61@19.9Å(now 16.6,conf 0.23), K3@16.6Å(now 13.6,conf 0.15), P29@18.3Å(now 12.8,conf 0.18), H30@18.1Å(now 14.0,conf 0.18), W63@18.1Å(now 11.4,conf 0.18), G27@18.1Å(now 11.5,conf 0.18)
  - E25↔R92: targets 6.3/5.8Å but partners are 19.4Å apart → too_far_apart by 7.2Å
  - C103↔R92: targets 5.6/5.8Å but partners are 16.2Å apart → too_far_apart by 4.7Å
  - E25↔G27: targets 6.3/18.1Å but partners are 3.4Å apart → too_close_together by 8.3Å

## Secondary Structure (DSSP-like)

- helix(H)=51 · strand(E)=42 · 3-10(G)=6 · coil(C)=4

```
EEEEEEHEHGHHHHEHEHHHEEEEEHEEHHEHEHHHHHHHHEGECHEHEEEEGEHEHHEEEHHEHEHHHGHHHCEEGCEHEHEHEHHEEHHEHHHHEHHHGHC
```

## Backbone H-bond Network

- total=103 · helix(i→i+4)=24 · sheet=79
  - A7 ↔ A11  (helix)
  - K9 ↔ L13  (helix)
  - F14 ↔ C18  (helix)
  - T16 ↔ Q20  (helix)
  - K26 ↔ H30  (helix)
  - H30 ↔ P34  (helix)
  - P34 ↔ G38  (helix)
  - N35 ↔ I39  (helix)
  - H37 ↔ G41  (helix)
  - K58 ↔ L62  (helix)
  - W63 ↔ N67  (helix)
  - E65 ↔ S69  (helix)
  - N67 ↔ Y71  (helix)
  - S69 ↔ T73  (helix)
  - K80 ↔ G84  (helix)
  - A82 ↔ L86  (helix)
  - L86 ↔ K90  (helix)
  - K87 ↔ D91  (helix)
  - K90 ↔ D94  (helix)
  - D91 ↔ L95  (helix)
  - … +83 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=35 · exposed=43 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=446 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=214 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.6468 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=3 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 84 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`1YCC.ensemble.pdb`)
- RMSF mean=0.406Å max=1.432Å (per-residue in .per_residue.csv)
- most flexible residues: 49, 48, 1, 4, 20

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1YCC.pae.csv`
- mean=0.269Å · max=1.904Å · AlphaFold-PAE analog (low block = rigid unit/domain)
