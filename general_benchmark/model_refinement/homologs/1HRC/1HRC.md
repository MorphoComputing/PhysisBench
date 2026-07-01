# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1HRC\sequence\1HRC.pdb`
- output_pdb: `general_benchmark\model_refinement\homologs\1HRC\seeds\seed_1\1HRC.pdb`
- residues: 102
- mode: oracle
- ca_rmsd: 8.095 A
- tm_score_ca_ordered: 0.26689616430905994
- heavy_atom_rmsd: 8.813 A
- sidechain_heavy_atom_rmsd: 9.581 A
- **all-atom quality (honest):** heavy 8.813 A, sidechain 9.581 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/85 (0.0)
- lj_severe: 0
- lj_near: 26
- distogram_pairs: 1779
- bin_accuracy: 0.430

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=global reason=rejected_window_topology_regression tested=54
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 8.095287348265156
- ga_delta_rmsd: 4.559852206357947  ga_fitness_mode: energy
- pre_local_rmsd: 8.188982027254422  localized_anchor_rmsd: 8.095297793292925

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** L93-T101 → 1423 conflicts (54%); K54-W58 → 577 conflicts (22%); A14-H17 → 293 conflicts (11%)
- explained: 2293/2648 conflicts by 3 root cause(s)
- metrics: hubs=87 (frac 0.853), conflicts/hub=30.4, max_incompat=16.57Å, chain_span=0.98
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): L93-T101 + K54-W58 + A14-H17 — explain ~2293/2648 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **N51** — severity 163.84, 105 conflict(s); suspect input ~`T39` (group: push_out)
  - push-out (wants farther): K87@27.5Å(now 24.2,conf 1.00), L63@27.4Å(now 16.8,conf 0.95), T62@27.4Å(now 16.0,conf 0.94), E61@27.1Å(now 13.4,conf 0.86), T57@27.1Å(now 8.2,conf 0.86), L97@27.1Å(now 14.9,conf 0.86), A100@26.9Å(now 16.3,conf 0.83), I94@27.0Å(now 17.9,conf 0.82), K98@26.7Å(now 14.9,conf 0.78), T101@24.5Å(now 13.4,conf 0.55), K59@21.3Å(now 10.3,conf 0.44), W58@21.1Å(now 8.1,conf 0.44), G40@6.5Å(now 3.8,conf 0.39), E60@18.9Å(now 5.6,conf 0.38), I56@18.2Å(now 7.7,conf 0.37), C16@17.3Å(now 11.5,conf 0.35), K26@17.3Å(now 12.3,conf 0.35), G55@17.1Å(now 8.2,conf 0.35), Y47@8.3Å(now 5.0,conf 0.35), H25@16.4Å(now 12.6,conf 0.35), H17@15.9Å(now 11.4,conf 0.34), Q41@10.1Å(now 6.0,conf 0.34), G44@13.3Å(now 8.3,conf 0.34), A42@11.4Å(now 7.7,conf 0.34), P29@12.5Å(now 9.1,conf 0.34), F45@9.8Å(now 3.2,conf 0.21), T46@10.0Å(now 3.0,conf 0.20)
  - T57↔T39: targets 27.1/5.7Å but partners are 7.7Å apart → too_close_together by 13.6Å
  - T57↔G40: targets 27.1/6.5Å but partners are 8.9Å apart → too_close_together by 11.7Å
  - E61↔T39: targets 27.1/5.7Å but partners are 12.3Å apart → too_close_together by 9.1Å
- **C16** — severity 155.53, 77 conflict(s); suspect input ~`C13` (group: push_out)
  - push-out (wants farther): K86@27.5Å(now 17.3,conf 1.00), K85@27.5Å(now 19.1,conf 1.00), K87@27.5Å(now 14.6,conf 1.00), E61@27.4Å(now 11.6,conf 0.95), I94@26.7Å(now 10.7,conf 0.77), L97@25.4Å(now 4.4,conf 0.61), K98@25.1Å(now 4.4,conf 0.59), A100@22.0Å(now 5.1,conf 0.46), T57@21.4Å(now 10.9,conf 0.45), T101@20.6Å(now 3.7,conf 0.42), K4@17.7Å(now 15.0,conf 0.36), N51@17.3Å(now 11.5,conf 0.35), G44@17.0Å(now 13.8,conf 0.35), N53@16.9Å(now 12.3,conf 0.35), A42@16.7Å(now 12.3,conf 0.35), G33@16.5Å(now 12.8,conf 0.35), L34@16.2Å(now 11.3,conf 0.35), I56@15.9Å(now 8.0,conf 0.34), G55@15.3Å(now 10.3,conf 0.34), G5@14.9Å(now 12.4,conf 0.34), T46@16.8Å(now 13.2,conf 0.21), F45@16.0Å(now 11.4,conf 0.20)
  - L97↔C13: targets 25.4/6.1Å but partners are 4.3Å apart → too_close_together by 14.9Å
  - K98↔C13: targets 25.1/6.1Å but partners are 4.2Å apart → too_close_together by 14.7Å
  - I94↔C13: targets 26.7/6.1Å but partners are 7.8Å apart → too_close_together by 12.8Å
- **G23** — severity 151.96, 84 conflict(s); suspect input ~`T18` (group: push_out)
  - push-out (wants farther): M79@27.5Å(now 23.2,conf 1.00), D92@27.5Å(now 22.2,conf 1.00), L93@27.5Å(now 20.5,conf 1.00), L63@27.5Å(now 23.8,conf 1.00), E61@27.5Å(now 22.6,conf 1.00), A95@27.5Å(now 19.0,conf 1.00), Y96@27.5Å(now 16.4,conf 1.00), K59@27.5Å(now 24.6,conf 1.00), L97@27.5Å(now 13.8,conf 1.00), E20@5.1Å(now 1.9,conf 0.47)
  - L97↔T18: targets 27.5/5.5Å but partners are 10.7Å apart → too_close_together by 11.3Å
  - L97↔V19: targets 27.5/5.6Å but partners are 11.7Å apart → too_close_together by 10.1Å
  - L97↔H17: targets 27.5/8.6Å but partners are 6.8Å apart → too_close_together by 12.1Å
- **E61** — severity 150.34, 81 conflict(s); suspect input ~`K98` (group: push_out)
  - push-out (wants farther): G22@27.5Å(now 23.3,conf 1.00), K24@27.5Å(now 21.7,conf 1.00), G23@27.5Å(now 22.6,conf 1.00), E20@27.5Å(now 22.8,conf 1.00), Y47@27.5Å(now 14.7,conf 0.99), T48@27.5Å(now 15.2,conf 0.98), G28@27.5Å(now 15.0,conf 0.98), Q15@27.4Å(now 13.0,conf 0.97), C16@27.4Å(now 11.6,conf 0.95), A14@27.4Å(now 15.3,conf 0.94), D49@27.3Å(now 13.0,conf 0.93), N51@27.1Å(now 13.4,conf 0.86), K52@26.9Å(now 13.5,conf 0.81), A50@26.8Å(now 12.6,conf 0.79), K54@26.3Å(now 11.2,conf 0.71), T57@20.3Å(now 5.6,conf 0.41), K72@18.0Å(now 15.0,conf 0.36), I56@17.0Å(now 11.7,conf 0.35), N53@16.7Å(now 3.4,conf 0.35), G55@16.1Å(now 6.1,conf 0.35), Y73@15.5Å(now 12.9,conf 0.34), W58@15.1Å(now 8.8,conf 0.34)
  - Q15↔K98: targets 27.4/8.2Å but partners are 3.2Å apart → too_close_together by 16.0Å
  - C16↔K98: targets 27.4/8.2Å but partners are 4.4Å apart → too_close_together by 14.8Å
  - Q15↔L97: targets 27.4/9.5Å but partners are 3.2Å apart → too_close_together by 14.7Å
- **L97** — severity 147.51, 73 conflict(s); suspect input ~`T101` (group: push_out)
  - push-out (wants farther): G22@27.5Å(now 16.0,conf 1.00), E20@27.5Å(now 14.0,conf 1.00), G23@27.5Å(now 13.8,conf 1.00), Y47@27.5Å(now 17.3,conf 0.98), K52@27.3Å(now 18.2,conf 0.93), F45@27.2Å(now 15.3,conf 0.90), T46@27.2Å(now 16.2,conf 0.88), N51@27.1Å(now 14.9,conf 0.86), A50@26.8Å(now 17.8,conf 0.80), C16@25.4Å(now 4.4,conf 0.61), K86@16.9Å(now 12.9,conf 0.35), N53@16.2Å(now 12.3,conf 0.35), K87@15.9Å(now 10.2,conf 0.34), W58@9.5Å(now 6.9,conf 0.34), I56@14.3Å(now 10.9,conf 0.34)
  - C16↔T101: targets 25.4/5.5Å but partners are 3.7Å apart → too_close_together by 16.1Å
  - C16↔A100: targets 25.4/5.8Å but partners are 5.1Å apart → too_close_together by 14.5Å
  - G23↔A100: targets 27.5/5.8Å but partners are 9.1Å apart → too_close_together by 12.6Å
- **E20** — severity 146.41, 83 conflict(s); suspect input ~`C13` (group: push_out)
  - push-out (wants farther): D92@27.5Å(now 21.9,conf 1.00), L63@27.5Å(now 24.2,conf 1.00), L93@27.5Å(now 20.4,conf 1.00), E61@27.5Å(now 22.8,conf 1.00), A95@27.5Å(now 18.8,conf 1.00), Y96@27.5Å(now 16.1,conf 1.00), L97@27.5Å(now 14.0,conf 1.00), K98@27.5Å(now 14.0,conf 0.99), G23@5.1Å(now 1.9,conf 0.47), K24@8.4Å(now 5.9,conf 0.35), H25@10.8Å(now 7.6,conf 0.34), G28@13.4Å(now 10.7,conf 0.34), K26@13.2Å(now 10.0,conf 0.34)
  - K98↔G23: targets 27.5/5.1Å but partners are 13.7Å apart → too_close_together by 8.6Å
  - L97↔G23: targets 27.5/5.1Å but partners are 13.8Å apart → too_close_together by 8.6Å
  - K98↔H17: targets 27.5/10.1Å but partners are 6.7Å apart → too_close_together by 10.6Å

## Secondary Structure (DSSP-like)

- helix(H)=57 · strand(E)=36 · 3-10(G)=8 · coil(C)=1

```
EHHGHHHHEHEHHHEHEHHHHHHEGEHEEHHHHHHEEEEEEHEHEHEHHEHHHHHHGHHHHHEHHGHHEHEHEHGHEHEGGEEEHEEHEHHHEHEGCEHHEE
```

## Backbone H-bond Network

- total=106 · helix(i→i+4)=27 · sheet=79
  - V2 ↔ K6  (helix)
  - E3 ↔ K7  (helix)
  - K6 ↔ V10  (helix)
  - I8 ↔ K12  (helix)
  - V10 ↔ A14  (helix)
  - K12 ↔ C16  (helix)
  - C16 ↔ E20  (helix)
  - V19 ↔ G23  (helix)
  - G23 ↔ T27  (helix)
  - N30 ↔ L34  (helix)
  - A42 ↔ T46  (helix)
  - G44 ↔ T48  (helix)
  - T48 ↔ K52  (helix)
  - D49 ↔ N53  (helix)
  - N51 ↔ G55  (helix)
  - K52 ↔ I56  (helix)
  - K54 ↔ W58  (helix)
  - G55 ↔ K59  (helix)
  - I56 ↔ E60  (helix)
  - W58 ↔ T62  (helix)
  - … +86 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=23 · exposed=52 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=508 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=272 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=4.8803 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=26 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 85 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`1HRC.ensemble.pdb`)
- RMSF mean=4.284Å max=10.968Å (per-residue in .per_residue.csv)
- most flexible residues: 88, 49, 87, 52, 48

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1HRC.pae.csv`
- mean=1.924Å · max=12.573Å · AlphaFold-PAE analog (low block = rigid unit/domain)
