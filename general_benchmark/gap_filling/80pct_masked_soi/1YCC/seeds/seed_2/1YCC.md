# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1YCC\sequence\1YCC.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1YCC\seeds\seed_2\1YCC.pdb`
- residues: 103
- mode: oracle
- ca_rmsd: 10.165 A
- tm_score_ca_ordered: 0.23689518505472507
- heavy_atom_rmsd: 10.843 A
- sidechain_heavy_atom_rmsd: 11.547 A
- **all-atom quality (honest):** heavy 10.843 A, sidechain 11.547 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/84 (0.0)
- lj_severe: 0
- lj_near: 43
- distogram_pairs: 1050
- bin_accuracy: 0.344

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=insufficient_rmsd_improvement tested=57
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 10.164987595787867
- ga_delta_rmsd: -0.4733745304240884  ga_fitness_mode: energy
- pre_local_rmsd: 10.19281983595869  localized_anchor_rmsd: 10.164982690545786

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** E89-C103 → 507 conflicts (46%); E1-K15 → 337 conflicts (31%); G78-K80 → 88 conflicts (8%)
- explained: 932/1096 conflicts by 3 root cause(s)
- metrics: hubs=97 (frac 0.942), conflicts/hub=11.3, max_incompat=14.06Å, chain_span=0.99
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): E89-C103 + E1-K15 + G78-K80 — explain ~932/1096 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **T79** — severity 120.42, 50 conflict(s); suspect input ~`A55` (group: pull_in)
  - pull-in (wants closer): A55@5.8Å(now 12.1,conf 0.55), T53@6.2Å(now 10.9,conf 0.55), D54@8.1Å(now 13.7,conf 0.55)
  - push-out (wants farther): L72@13.0Å(now 5.1,conf 1.00), I76@6.9Å(now 4.2,conf 0.91), T73@13.4Å(now 9.0,conf 0.79), K26@23.4Å(now 9.6,conf 0.76), K90@23.7Å(now 20.6,conf 0.75), D91@21.7Å(now 18.2,conf 0.62), R42@17.5Å(now 10.7,conf 0.55), R17@17.2Å(now 12.8,conf 0.55), S44@11.2Å(now 7.9,conf 0.55), M68@14.4Å(now 8.1,conf 0.55), N35@16.2Å(now 9.0,conf 0.55)
  - K26↔T53: targets 23.4/6.2Å but partners are 3.9Å apart → too_close_together by 13.4Å
  - K26↔N56: targets 23.4/6.0Å but partners are 7.0Å apart → too_close_together by 10.4Å
  - K26↔A55: targets 23.4/5.8Å but partners are 7.6Å apart → too_close_together by 10.0Å
- **S6** — severity 107.83, 26 conflict(s); suspect input ~`K9` (group: push_out)
  - push-out (wants farther): T53@27.5Å(now 21.9,conf 1.00), G78@27.5Å(now 12.9,conf 1.00), E48@27.5Å(now 22.9,conf 1.00), L13@9.0Å(now 4.7,conf 0.99), F2@12.9Å(now 4.3,conf 0.91), K3@9.4Å(now 6.8,conf 0.79), L72@16.8Å(now 9.0,conf 0.55), E1@16.5Å(now 8.6,conf 0.55), I96@9.2Å(now 6.5,conf 0.55), A11@8.6Å(now 5.7,conf 0.55), R17@15.9Å(now 5.1,conf 0.55)
  - G78↔K9: targets 27.5/5.1Å but partners are 8.3Å apart → too_close_together by 14.1Å
  - G10↔G78: targets 5.0/27.5Å but partners are 11.8Å apart → too_close_together by 10.7Å
  - G78↔K3: targets 27.5/9.4Å but partners are 6.4Å apart → too_close_together by 11.7Å
- **G78** — severity 95.84, 22 conflict(s); suspect input ~`N74` (group: pull_in)
  - pull-in (wants closer): K58@10.8Å(now 17.4,conf 0.55)
  - push-out (wants farther): S6@27.5Å(now 12.9,conf 1.00), K101@27.5Å(now 18.2,conf 0.99), Y71@13.0Å(now 6.2,conf 0.94), Y75@8.9Å(now 6.3,conf 0.91), M81@9.1Å(now 4.5,conf 0.91), T73@14.6Å(now 7.3,conf 0.79), P34@16.6Å(now 13.5,conf 0.55), L72@14.9Å(now 5.2,conf 0.55)
  - S6↔F83: targets 27.5/11.0Å but partners are 6.2Å apart → too_close_together by 10.3Å
  - S6↔G84: targets 27.5/13.0Å but partners are 5.2Å apart → too_close_together by 9.3Å
  - S6↔Y75: targets 27.5/8.9Å but partners are 9.7Å apart → too_close_together by 8.9Å
- **K8** — severity 87.36, 29 conflict(s); suspect input ~`F2` (group: pull_in)
  - pull-in (wants closer): A11@3.0Å(now 6.0,conf 1.00)
  - push-out (wants farther): D54@27.5Å(now 24.8,conf 1.00), A55@27.5Å(now 23.0,conf 1.00), K59@27.5Å(now 22.3,conf 1.00), F2@17.0Å(now 6.2,conf 0.99), A4@11.4Å(now 8.2,conf 0.79), E1@20.8Å(now 9.4,conf 0.59), I96@11.0Å(now 7.2,conf 0.55), G5@8.9Å(now 3.5,conf 0.55), K3@15.1Å(now 6.7,conf 0.55), E89@16.2Å(now 10.9,conf 0.55), D91@11.7Å(now 7.6,conf 0.55)
  - A11↔F2: targets 3.0/17.0Å but partners are 3.6Å apart → too_close_together by 10.3Å
  - A11↔E1: targets 3.0/20.8Å but partners are 5.7Å apart → too_close_together by 12.1Å
  - F2↔L13: targets 17.0/7.0Å but partners are 3.8Å apart → too_close_together by 6.2Å
- **K101** — severity 87.23, 31 conflict(s); suspect input ~`G84` (group: pull_in)
  - pull-in (wants closer): P34@17.6Å(now 22.8,conf 0.55), G41@13.3Å(now 20.0,conf 0.55), R42@15.3Å(now 21.4,conf 0.55), L19@15.8Å(now 19.4,conf 0.55)
  - push-out (wants farther): D94@11.0Å(now 5.5,conf 1.00), G78@27.5Å(now 18.2,conf 0.99), I96@9.0Å(now 5.8,conf 0.99), L95@10.6Å(now 7.4,conf 0.79), G84@23.2Å(now 12.0,conf 0.76), I76@23.8Å(now 16.9,conf 0.75), E89@18.2Å(now 9.4,conf 0.55), K90@16.9Å(now 9.1,conf 0.55)
  - T97↔G84: targets 7.0/23.2Å but partners are 7.7Å apart → too_close_together by 8.5Å
  - Y98↔G78: targets 5.0/27.5Å but partners are 16.2Å apart → too_close_together by 6.3Å
  - Y98↔G84: targets 5.0/23.2Å but partners are 11.1Å apart → too_close_together by 7.1Å
- **T12** — severity 83.55, 34 conflict(s); suspect input ~`F2` (group: pull_in)
  - pull-in (wants closer): K9@5.0Å(now 9.4,conf 0.94), D91@10.6Å(now 13.2,conf 0.55)
  - push-out (wants farther): A55@27.5Å(now 21.6,conf 0.99), N60@27.5Å(now 24.0,conf 0.99), I57@27.5Å(now 22.5,conf 0.99), G5@13.0Å(now 5.6,conf 0.99), F2@19.3Å(now 6.8,conf 0.56), N35@17.5Å(now 12.8,conf 0.55), F83@16.6Å(now 9.9,conf 0.55), A4@15.7Å(now 7.9,conf 0.55), G85@15.9Å(now 10.3,conf 0.55)
  - K9↔F2: targets 5.0/19.3Å but partners are 4.3Å apart → too_close_together by 9.9Å
  - K15↔F2: targets 4.9/19.3Å but partners are 4.7Å apart → too_close_together by 9.8Å
  - K15↔A4: targets 4.9/15.7Å but partners are 3.5Å apart → too_close_together by 7.3Å

## Secondary Structure (DSSP-like)

- helix(H)=64 · strand(E)=24 · 3-10(G)=12 · coil(C)=3

```
EHHHHHHHHHEHHHGHHHHHEEGGEHEGHEEHEEGHHHHHHHHHHEHHHGHEHHHHGGGECCHHHEHHHHEHHGEHHEHHHHECEEHGEHEHEHHHHGHHHHE
```

## Backbone H-bond Network

- total=79 · helix(i→i+4)=32 · sheet=47
  - F2 ↔ S6  (helix)
  - K3 ↔ A7  (helix)
  - A4 ↔ K8  (helix)
  - S6 ↔ G10  (helix)
  - K8 ↔ T12  (helix)
  - G10 ↔ F14  (helix)
  - T12 ↔ T16  (helix)
  - L13 ↔ R17  (helix)
  - F14 ↔ C18  (helix)
  - T16 ↔ Q20  (helix)
  - V32 ↔ L36  (helix)
  - H37 ↔ G41  (helix)
  - G38 ↔ R42  (helix)
  - G41 ↔ G45  (helix)
  - S44 ↔ E48  (helix)
  - G45 ↔ G49  (helix)
  - G49 ↔ T53  (helix)
  - S51 ↔ A55  (helix)
  - W63 ↔ N67  (helix)
  - D64 ↔ M68  (helix)
  - … +59 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=38 · exposed=33 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=757 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=506 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=6.1982 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=43 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 84 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
