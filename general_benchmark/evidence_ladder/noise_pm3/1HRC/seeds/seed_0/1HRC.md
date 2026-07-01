# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1HRC\sequence\1HRC.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm3\1HRC\seeds\seed_0\1HRC.pdb`
- residues: 102
- mode: oracle
- ca_rmsd: 2.846 A
- tm_score_ca_ordered: 0.6990321261903636
- heavy_atom_rmsd: 4.086 A
- sidechain_heavy_atom_rmsd: 4.920 A
- **all-atom quality (honest):** heavy 4.086 A, sidechain 4.920 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/85 (0.0)
- lj_severe: 0
- lj_near: 18
- distogram_pairs: 3256
- bin_accuracy: 0.310

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=45
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 2.8464728598230837
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 2.862385523851085  localized_anchor_rmsd: 2.846479435385919

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** L93-N102 → 774 conflicts (32%); G28-R37 → 483 conflicts (20%); K12-V19 → 280 conflicts (12%)
- explained: 1537/2397 conflicts by 3 root cause(s)
- metrics: hubs=102 (frac 1.0), conflicts/hub=23.5, max_incompat=12.09Å, chain_span=0.99
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): L93-N102 + G28-R37 + K12-V19 — explain ~1537/2397 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **L67** — severity 64.34, 84 conflict(s); suspect input ~`G76` (group: pull_in)
  - pull-in (wants closer): G76@10.3Å(now 14.9,conf 0.15), P75@10.3Å(now 13.4,conf 0.15), L93@7.2Å(now 10.0,conf 0.26), L97@7.7Å(now 13.2,conf 0.24), Y96@8.2Å(now 13.4,conf 0.21), I8@6.8Å(now 12.7,conf 0.28), L34@7.4Å(now 12.3,conf 0.25), N51@6.1Å(now 11.3,conf 0.34)
  - push-out (wants farther): I84@9.7Å(now 4.9,conf 0.17), N53@18.2Å(now 15.4,conf 0.18), Y47@19.8Å(now 16.6,conf 0.22), T48@19.0Å(now 14.8,conf 0.20), K52@18.4Å(now 13.7,conf 0.19), R37@18.7Å(now 16.1,conf 0.20), K6@19.0Å(now 15.2,conf 0.20), P29@20.2Å(now 13.2,conf 0.24), V19@20.1Å(now 16.3,conf 0.23), L31@16.7Å(now 12.4,conf 0.16), F35@20.0Å(now 14.7,conf 0.23)
  - F35↔L34: targets 20.0/7.4Å but partners are 2.9Å apart → too_close_together by 9.7Å
  - I8↔N51: targets 6.8/6.1Å but partners are 20.3Å apart → too_far_apart by 7.4Å
  - N51↔E89: targets 6.1/7.2Å but partners are 20.1Å apart → too_far_apart by 6.8Å
- **L63** — severity 40.81, 65 conflict(s); suspect input ~`N69` (group: pull_in)
  - pull-in (wants closer): A100@10.4Å(now 15.9,conf 0.15), K98@7.4Å(now 12.2,conf 0.25), G36@9.2Å(now 12.1,conf 0.18), K72@7.8Å(now 11.0,conf 0.23), P70@7.2Å(now 10.4,conf 0.26), L97@8.1Å(now 11.6,conf 0.22)
  - push-out (wants farther): Y66@9.4Å(now 4.4,conf 0.17), K59@9.1Å(now 6.3,conf 0.18), K4@19.2Å(now 16.3,conf 0.21), V19@20.3Å(now 16.8,conf 0.24), P75@16.7Å(now 13.2,conf 0.16), N51@16.8Å(now 13.2,conf 0.16), K52@19.5Å(now 14.4,conf 0.21), Y96@16.8Å(now 11.4,conf 0.16), N53@17.9Å(now 14.9,conf 0.18), G28@19.5Å(now 16.2,conf 0.21), N69@17.6Å(now 8.7,conf 0.17), L34@16.5Å(now 10.3,conf 0.15)
  - K98↔K72: targets 7.4/7.8Å but partners are 21.8Å apart → too_far_apart by 6.6Å
  - E68↔N69: targets 6.0/17.6Å but partners are 3.8Å apart → too_close_together by 7.8Å
  - K98↔P70: targets 7.4/7.2Å but partners are 20.0Å apart → too_far_apart by 5.4Å
- **L97** — severity 39.59, 53 conflict(s); suspect input ~`K85` (group: pull_in)
  - pull-in (wants closer): C13@7.4Å(now 11.5,conf 0.25), E89@7.4Å(now 11.6,conf 0.25), L67@7.7Å(now 13.2,conf 0.24), Q11@9.1Å(now 13.6,conf 0.18), L63@8.1Å(now 11.6,conf 0.22), M64@7.6Å(now 12.9,conf 0.24)
  - push-out (wants farther): I94@7.3Å(now 4.5,conf 0.25), L93@10.2Å(now 6.2,conf 0.15), K85@19.0Å(now 16.2,conf 0.20), G40@21.2Å(now 14.3,conf 0.27), Q41@16.8Å(now 13.5,conf 0.16), H32@9.2Å(now 6.6,conf 0.18), T57@16.7Å(now 12.6,conf 0.16), K24@18.9Å(now 15.5,conf 0.20), L34@8.0Å(now 5.1,conf 0.22), A42@18.2Å(now 13.6,conf 0.18), G23@16.6Å(now 12.8,conf 0.15), G22@22.0Å(now 12.7,conf 0.30)
  - G22↔N30: targets 22.0/7.6Å but partners are 7.5Å apart → too_close_together by 6.9Å
  - T18↔G22: targets 8.5/22.0Å but partners are 5.9Å apart → too_close_together by 7.6Å
  - V19↔G22: targets 8.4/22.0Å but partners are 6.3Å apart → too_close_together by 7.3Å
- **Y96** — severity 39.19, 57 conflict(s); suspect input ~`A14` (group: pull_in)
  - pull-in (wants closer): M64@8.2Å(now 12.3,conf 0.21), K7@7.7Å(now 10.3,conf 0.23), E89@8.1Å(now 10.6,conf 0.22), L67@8.2Å(now 13.4,conf 0.21), C13@6.7Å(now 12.2,conf 0.29)
  - push-out (wants farther): G55@21.7Å(now 18.7,conf 0.29), I80@24.5Å(now 20.2,conf 0.48), R37@23.1Å(now 11.1,conf 0.37), N30@17.1Å(now 11.7,conf 0.16), V10@16.5Å(now 12.7,conf 0.15), A14@19.9Å(now 14.3,conf 0.23), K21@17.3Å(now 12.3,conf 0.17), E60@17.6Å(now 8.9,conf 0.17), W58@16.9Å(now 9.6,conf 0.16), K87@17.2Å(now 14.5,conf 0.16), L63@16.8Å(now 11.4,conf 0.16), F35@16.3Å(now 6.8,conf 0.15)
  - A14↔C13: targets 19.9/6.7Å but partners are 3.8Å apart → too_close_together by 9.4Å
  - K99↔R37: targets 7.0/23.1Å but partners are 8.4Å apart → too_close_together by 7.7Å
  - A100↔R37: targets 7.9/23.1Å but partners are 8.2Å apart → too_close_together by 7.0Å
- **K12** — severity 34.27, 53 conflict(s); suspect input ~`N30` (group: pull_in)
  - pull-in (wants closer): I56@19.3Å(now 22.4,conf 0.21), R37@19.0Å(now 22.0,conf 0.20), T77@17.4Å(now 20.1,conf 0.17), K85@7.3Å(now 12.8,conf 0.25), N30@9.0Å(now 14.2,conf 0.18), I80@9.5Å(now 14.2,conf 0.17), M79@10.3Å(now 14.5,conf 0.15), A82@9.6Å(now 12.4,conf 0.17), K6@7.3Å(now 10.3,conf 0.25)
  - push-out (wants farther): T57@25.4Å(now 22.2,conf 0.57), Q41@24.6Å(now 21.2,conf 0.48), G23@22.4Å(now 15.7,conf 0.33), L34@19.4Å(now 16.4,conf 0.21), K24@19.1Å(now 14.9,conf 0.20), I94@18.2Å(now 13.9,conf 0.18), P29@17.0Å(now 13.1,conf 0.16), P70@17.8Å(now 15.1,conf 0.17), K86@16.5Å(now 10.6,conf 0.15), K26@17.8Å(now 12.4,conf 0.17), T18@17.8Å(now 12.8,conf 0.17)
  - G23↔H17: targets 22.4/8.1Å but partners are 7.4Å apart → too_close_together by 7.0Å
  - G23↔N30: targets 22.4/9.0Å but partners are 6.1Å apart → too_close_together by 7.4Å
  - G23↔C16: targets 22.4/7.4Å but partners are 10.0Å apart → too_close_together by 5.1Å
- **L34** — severity 34.13, 53 conflict(s); suspect input ~`A14` (group: pull_in)
  - pull-in (wants closer): K52@8.5Å(now 13.5,conf 0.20), T62@9.0Å(now 11.5,conf 0.18), A14@8.6Å(now 15.5,conf 0.20), L67@7.4Å(now 12.3,conf 0.25)
  - push-out (wants farther): D49@19.9Å(now 16.6,conf 0.23), K12@19.4Å(now 16.4,conf 0.21), I8@19.7Å(now 14.9,conf 0.22), W58@8.4Å(now 5.5,conf 0.20), V10@18.6Å(now 15.8,conf 0.19), T48@21.1Å(now 15.1,conf 0.27), Y73@21.0Å(now 16.4,conf 0.26), L97@8.0Å(now 5.1,conf 0.22), D92@17.8Å(now 12.6,conf 0.18), Y47@17.4Å(now 14.3,conf 0.17), K24@20.3Å(now 15.6,conf 0.24), Y66@17.1Å(now 13.1,conf 0.16), G44@16.3Å(now 13.3,conf 0.15), M79@21.5Å(now 14.6,conf 0.28), L63@16.5Å(now 10.3,conf 0.15)
  - T48↔K52: targets 21.1/8.5Å but partners are 4.3Å apart → too_close_together by 8.2Å
  - D49↔K52: targets 19.9/8.5Å but partners are 3.8Å apart → too_close_together by 7.6Å
  - A14↔K38: targets 8.6/6.4Å but partners are 21.4Å apart → too_far_apart by 6.4Å

## Secondary Structure (DSSP-like)

- helix(H)=54 · strand(E)=38 · 3-10(G)=6 · coil(C)=4

```
EEHEHHEHHHEGHHHHEHHHHEEGGEHEEGHEHHEHEEEHCHHCECEECHHEHHGEEHEHEHHHEHEHEHEEHHHHEHHHHHEHHEEHHHEHHEHEGHHEHE
```

## Backbone H-bond Network

- total=95 · helix(i→i+4)=25 · sheet=70
  - G5 ↔ F9  (helix)
  - K6 ↔ V10  (helix)
  - F9 ↔ C13  (helix)
  - V10 ↔ A14  (helix)
  - A14 ↔ T18  (helix)
  - Q15 ↔ V19  (helix)
  - C16 ↔ E20  (helix)
  - T27 ↔ L31  (helix)
  - G36 ↔ G40  (helix)
  - A50 ↔ K54  (helix)
  - K54 ↔ W58  (helix)
  - W58 ↔ T62  (helix)
  - E60 ↔ M64  (helix)
  - T62 ↔ Y66  (helix)
  - M64 ↔ E68  (helix)
  - Y66 ↔ P70  (helix)
  - P70 ↔ I74  (helix)
  - I74 ↔ K78  (helix)
  - P75 ↔ M79  (helix)
  - K78 ↔ A82  (helix)
  - … +75 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=18 · exposed=55 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=479 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=249 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.733 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=18 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 85 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
