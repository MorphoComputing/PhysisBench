# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1HRC\sequence\1HRC.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm3\1HRC\seeds\seed_1\1HRC.pdb`
- residues: 102
- mode: oracle
- ca_rmsd: 2.222 A
- tm_score_ca_ordered: 0.7797439850787006
- heavy_atom_rmsd: 3.826 A
- sidechain_heavy_atom_rmsd: 4.766 A
- **all-atom quality (honest):** heavy 3.826 A, sidechain 4.766 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/85 (0.0)
- lj_severe: 0
- lj_near: 10
- distogram_pairs: 3256
- bin_accuracy: 0.311

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=57
- rigid_domain_reconvergence: applied=True accepted=11 rmsd=2.7784695011033507 -> 2.5153723796207954 A
- topology_reconvergence: applied=True accepted=3/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 2.2219224569765013
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 2.236160431798264  localized_anchor_rmsd: 2.221865594477975

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** G28-R37 → 791 conflicts (35%); L93-N102 → 518 conflicts (23%); K12-V19 → 258 conflicts (11%)
- explained: 1567/2285 conflicts by 3 root cause(s)
- metrics: hubs=102 (frac 1.0), conflicts/hub=22.4, max_incompat=11.74Å, chain_span=0.99
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): G28-R37 + L93-N102 + K12-V19 — explain ~1567/2285 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **L67** — severity 68.30, 87 conflict(s); suspect input ~`G76` (group: pull_in)
  - pull-in (wants closer): G76@10.3Å(now 14.5,conf 0.15), P75@10.3Å(now 13.8,conf 0.15), L97@7.7Å(now 11.6,conf 0.24), Y96@8.2Å(now 12.5,conf 0.21), I8@6.8Å(now 12.2,conf 0.28), L34@7.4Å(now 13.1,conf 0.25), N51@6.1Å(now 12.3,conf 0.34), E89@7.2Å(now 9.9,conf 0.26)
  - push-out (wants farther): I84@9.7Å(now 4.8,conf 0.17), Y47@19.8Å(now 16.7,conf 0.22), T48@19.0Å(now 15.5,conf 0.20), K52@18.4Å(now 14.8,conf 0.19), R37@18.7Å(now 16.1,conf 0.20), K6@19.0Å(now 14.7,conf 0.20), P29@20.2Å(now 14.2,conf 0.24), V19@20.1Å(now 16.3,conf 0.23), K4@19.6Å(now 16.6,conf 0.22), L31@16.7Å(now 12.9,conf 0.16), F35@20.0Å(now 14.7,conf 0.23)
  - I8↔N51: targets 6.8/6.1Å but partners are 21.1Å apart → too_far_apart by 8.2Å
  - F35↔L34: targets 20.0/7.4Å but partners are 3.0Å apart → too_close_together by 9.6Å
  - N51↔E89: targets 6.1/7.2Å but partners are 21.4Å apart → too_far_apart by 8.1Å
- **L97** — severity 37.24, 55 conflict(s); suspect input ~`N30` (group: pull_in)
  - pull-in (wants closer): C13@7.4Å(now 10.8,conf 0.25), T18@8.5Å(now 11.2,conf 0.20), E89@7.4Å(now 10.2,conf 0.25), L67@7.7Å(now 11.6,conf 0.24), Q11@9.1Å(now 12.8,conf 0.18), N30@7.6Å(now 11.3,conf 0.24), M64@7.6Å(now 11.0,conf 0.24)
  - push-out (wants farther): I94@7.3Å(now 3.5,conf 0.25), L93@10.2Å(now 5.3,conf 0.15), K85@19.0Å(now 15.1,conf 0.20), M79@19.8Å(now 17.1,conf 0.22), F81@20.2Å(now 17.1,conf 0.23), G40@21.2Å(now 14.7,conf 0.27), Q41@16.8Å(now 14.2,conf 0.16), T57@16.7Å(now 12.7,conf 0.16), K87@16.9Å(now 14.3,conf 0.16), A42@18.2Å(now 14.5,conf 0.18), E68@17.0Å(now 14.3,conf 0.16), G5@10.1Å(now 7.4,conf 0.16), I84@16.5Å(now 13.5,conf 0.15), G23@16.6Å(now 14.0,conf 0.15), G83@17.0Å(now 14.3,conf 0.16), G22@22.0Å(now 14.9,conf 0.30)
  - G22↔N30: targets 22.0/7.6Å but partners are 7.3Å apart → too_close_together by 7.1Å
  - V19↔G22: targets 8.4/22.0Å but partners are 7.5Å apart → too_close_together by 6.1Å
  - T18↔G22: targets 8.5/22.0Å but partners are 7.5Å apart → too_close_together by 6.0Å
- **L63** — severity 34.58, 56 conflict(s); suspect input ~`N69` (group: pull_in)
  - pull-in (wants closer): A100@10.4Å(now 14.9,conf 0.15), K98@7.4Å(now 11.0,conf 0.25), G36@9.2Å(now 11.9,conf 0.18), K72@7.8Å(now 11.2,conf 0.23), P70@7.2Å(now 10.4,conf 0.26)
  - push-out (wants farther): Y66@9.4Å(now 4.6,conf 0.17), K4@19.2Å(now 16.2,conf 0.21), V19@20.3Å(now 16.9,conf 0.24), N51@16.8Å(now 13.6,conf 0.16), K52@19.5Å(now 15.0,conf 0.21), V2@17.4Å(now 14.8,conf 0.17), Y96@16.8Å(now 10.6,conf 0.16), N53@17.9Å(now 15.0,conf 0.18), K99@17.1Å(now 14.3,conf 0.16), G28@19.5Å(now 16.8,conf 0.21), N69@17.6Å(now 9.0,conf 0.17), L34@16.5Å(now 11.1,conf 0.15)
  - K98↔K72: targets 7.4/7.8Å but partners are 21.2Å apart → too_far_apart by 5.9Å
  - E68↔N69: targets 6.0/17.6Å but partners are 3.8Å apart → too_close_together by 7.8Å
  - P70↔N69: targets 7.2/17.6Å but partners are 3.6Å apart → too_close_together by 6.8Å
- **Y96** — severity 33.21, 47 conflict(s); suspect input ~`A14` (group: pull_in)
  - pull-in (wants closer): M64@8.2Å(now 11.2,conf 0.21), L67@8.2Å(now 12.5,conf 0.21), C13@6.7Å(now 12.0,conf 0.29)
  - push-out (wants farther): G55@21.7Å(now 18.8,conf 0.29), I80@24.5Å(now 20.0,conf 0.48), D92@9.4Å(now 6.8,conf 0.17), R37@23.1Å(now 11.9,conf 0.37), N30@17.1Å(now 12.9,conf 0.16), V10@16.5Å(now 12.5,conf 0.15), A14@19.9Å(now 14.2,conf 0.23), K21@17.3Å(now 13.6,conf 0.17), E60@17.6Å(now 8.3,conf 0.17), I84@17.1Å(now 14.0,conf 0.16), W58@16.9Å(now 10.1,conf 0.16), K87@17.2Å(now 14.0,conf 0.16), L63@16.8Å(now 10.6,conf 0.16), F35@16.3Å(now 7.0,conf 0.15)
  - A14↔C13: targets 19.9/6.7Å but partners are 3.7Å apart → too_close_together by 9.5Å
  - K99↔R37: targets 7.0/23.1Å but partners are 9.4Å apart → too_close_together by 6.8Å
  - A100↔R37: targets 7.9/23.1Å but partners are 8.6Å apart → too_close_together by 6.6Å
- **F35** — severity 33.15, 44 conflict(s); suspect input ~`H17` (group: pull_in)
  - pull-in (wants closer): H17@8.0Å(now 13.7,conf 0.22), M64@6.2Å(now 14.1,conf 0.33), G40@8.9Å(now 11.9,conf 0.19)
  - push-out (wants farther): K26@19.9Å(now 17.3,conf 0.23), T46@24.0Å(now 17.9,conf 0.43), E68@22.5Å(now 17.7,conf 0.33), K98@9.8Å(now 3.3,conf 0.16), F45@18.9Å(now 15.7,conf 0.20), N102@8.9Å(now 4.4,conf 0.19), G55@17.6Å(now 14.8,conf 0.17), G22@17.0Å(now 13.2,conf 0.16), G5@21.0Å(now 13.4,conf 0.26), L67@20.0Å(now 14.7,conf 0.23), Y96@16.3Å(now 7.0,conf 0.15)
  - E68↔M64: targets 22.5/6.2Å but partners are 7.4Å apart → too_close_together by 8.9Å
  - M64↔L67: targets 6.2/20.0Å but partners are 6.3Å apart → too_close_together by 7.5Å
  - K26↔H17: targets 19.9/8.0Å but partners are 5.1Å apart → too_close_together by 6.8Å
- **L34** — severity 31.49, 49 conflict(s); suspect input ~`A14` (group: pull_in)
  - pull-in (wants closer): K52@8.5Å(now 13.5,conf 0.20), T62@9.0Å(now 12.2,conf 0.18), A14@8.6Å(now 15.4,conf 0.20), L67@7.4Å(now 13.1,conf 0.25)
  - push-out (wants farther): D49@19.9Å(now 16.4,conf 0.23), K12@19.4Å(now 16.9,conf 0.21), I8@19.7Å(now 15.5,conf 0.22), V10@18.6Å(now 15.8,conf 0.19), T48@21.1Å(now 14.8,conf 0.27), Y73@21.0Å(now 17.5,conf 0.26), D92@17.8Å(now 14.1,conf 0.18), Y47@17.4Å(now 14.0,conf 0.17), K24@20.3Å(now 15.0,conf 0.24), N102@8.5Å(now 5.9,conf 0.20), Y66@17.1Å(now 14.1,conf 0.16), G44@16.3Å(now 12.6,conf 0.15), M79@21.5Å(now 15.4,conf 0.28), L63@16.5Å(now 11.1,conf 0.15)
  - T48↔K52: targets 21.1/8.5Å but partners are 4.4Å apart → too_close_together by 8.1Å
  - D49↔K52: targets 19.9/8.5Å but partners are 3.5Å apart → too_close_together by 7.8Å
  - A14↔K38: targets 8.6/6.4Å but partners are 21.3Å apart → too_far_apart by 6.3Å

## Secondary Structure (DSSP-like)

- helix(H)=57 · strand(E)=33 · 3-10(G)=9 · coil(C)=3

```
EEHEHHEHHHEHHHHHEHHEGCEGGGHEEGHEHHEHEEHHHEHGECEECHHEHEHHHGEHHHHHEHHGEHEEHHHHEHHHHGEHHEHHHHEHHHHEHHEEHE
```

## Backbone H-bond Network

- total=82 · helix(i→i+4)=20 · sheet=62
  - K6 ↔ V10  (helix)
  - I8 ↔ K12  (helix)
  - V10 ↔ A14  (helix)
  - A14 ↔ T18  (helix)
  - Q15 ↔ V19  (helix)
  - T27 ↔ L31  (helix)
  - G36 ↔ G40  (helix)
  - N53 ↔ T57  (helix)
  - E60 ↔ M64  (helix)
  - T62 ↔ Y66  (helix)
  - Y66 ↔ P70  (helix)
  - P70 ↔ I74  (helix)
  - I74 ↔ K78  (helix)
  - P75 ↔ M79  (helix)
  - F81 ↔ K85  (helix)
  - K85 ↔ E89  (helix)
  - T88 ↔ D92  (helix)
  - E89 ↔ L93  (helix)
  - L93 ↔ L97  (helix)
  - L97 ↔ T101  (helix)
  - … +62 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=20 · exposed=54 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=448 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=221 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.6968 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=10 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 85 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`1HRC.ensemble.pdb`)
- RMSF mean=0.453Å max=1.798Å (per-residue in .per_residue.csv)
- most flexible residues: 76, 75, 101, 22, 65

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1HRC.pae.csv`
- mean=0.28Å · max=1.814Å · AlphaFold-PAE analog (low block = rigid unit/domain)
