# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1YCC\sequence\1YCC.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1YCC\seeds\seed_4\1YCC.pdb`
- residues: 103
- mode: oracle
- ca_rmsd: 6.250 A
- tm_score_ca_ordered: 0.4990076099831572
- heavy_atom_rmsd: 7.082 A
- sidechain_heavy_atom_rmsd: 7.742 A
- **all-atom quality (honest):** heavy 7.082 A, sidechain 7.742 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/84 (0.0)
- lj_severe: 0
- lj_near: 22
- distogram_pairs: 1050
- bin_accuracy: 0.522

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=57
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 6.249499786476592
- ga_delta_rmsd: -1.0235198240968835  ga_fitness_mode: energy
- pre_local_rmsd: 6.270723035086539  localized_anchor_rmsd: 6.249547068443796

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** E1-R17 → 344 conflicts (61%); Y98-C103 → 155 conflicts (27%)
- explained: 499/567 conflicts by 2 root cause(s)
- metrics: hubs=78 (frac 0.757), conflicts/hub=7.3, max_incompat=12.82Å, chain_span=0.99
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): E1-R17 + Y98-C103 — explain ~499/567 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **P77** — severity 59.17, 12 conflict(s); suspect input ~`A102` (group: push_out)
  - push-out (wants farther): A102@27.3Å(now 14.9,conf 0.92)
  - A102↔N74: targets 27.3/9.2Å but partners are 5.3Å apart → too_close_together by 12.8Å
  - T73↔A102: targets 13.0/27.3Å but partners are 4.6Å apart → too_close_together by 9.7Å
  - Y71↔A102: targets 11.0/27.3Å but partners are 7.6Å apart → too_close_together by 8.7Å
- **P29** — severity 53.35, 10 conflict(s); suspect input ~`N35` (group: push_out)
  - push-out (wants farther): K3@27.5Å(now 17.1,conf 1.00), T23@6.6Å(now 3.8,conf 0.79), R17@17.6Å(now 12.0,conf 0.55), H22@8.2Å(now 3.9,conf 0.55)
  - K3↔N35: targets 27.5/5.1Å but partners are 12.8Å apart → too_close_together by 9.6Å
  - K3↔L36: targets 27.5/7.4Å but partners are 9.4Å apart → too_close_together by 10.6Å
  - K3↔V24: targets 27.5/7.4Å but partners are 10.6Å apart → too_close_together by 9.4Å
- **R17** — severity 50.62, 26 conflict(s); suspect input ~`G27` (group: pull_in)
  - pull-in (wants closer): T79@17.2Å(now 22.3,conf 0.55), T73@13.0Å(now 17.4,conf 0.55), L72@11.1Å(now 14.0,conf 0.55), A82@11.2Å(now 18.8,conf 0.55), N74@13.7Å(now 17.5,conf 0.55)
  - push-out (wants farther): G27@20.8Å(now 14.2,conf 0.59), K26@19.7Å(now 15.7,conf 0.57), G38@19.4Å(now 15.2,conf 0.57), P29@17.6Å(now 12.0,conf 0.55), A7@14.7Å(now 10.9,conf 0.55), S6@15.9Å(now 12.3,conf 0.55)
  - F14↔G27: targets 5.0/20.8Å but partners are 9.1Å apart → too_close_together by 6.6Å
  - T12↔A82: targets 7.1/11.2Å but partners are 25.2Å apart → too_far_apart by 6.8Å
  - F14↔G38: targets 5.0/19.4Å but partners are 9.3Å apart → too_close_together by 5.1Å
- **E48** — severity 44.37, 13 conflict(s); suspect input ~`R42` (group: pull_in)
  - pull-in (wants closer): R42@11.0Å(now 13.6,conf 0.99)
  - push-out (wants farther): E1@27.5Å(now 20.6,conf 1.00), S6@27.5Å(now 19.0,conf 1.00), T79@17.5Å(now 12.9,conf 0.55), C21@16.6Å(now 10.6,conf 0.55), H22@14.6Å(now 9.9,conf 0.55)
  - E1↔R42: targets 27.5/11.0Å but partners are 9.8Å apart → too_close_together by 6.7Å
  - E1↔G41: targets 27.5/14.9Å but partners are 7.2Å apart → too_close_together by 5.5Å
  - S6↔R42: targets 27.5/11.0Å but partners are 11.5Å apart → too_close_together by 5.0Å
- **G78** — severity 43.80, 10 conflict(s); suspect input ~`N74` (group: pull_in)
  - pull-in (wants closer): K58@10.8Å(now 15.1,conf 0.55)
  - push-out (wants farther): K101@27.5Å(now 18.5,conf 0.99)
  - K101↔N74: targets 27.5/10.0Å but partners are 7.7Å apart → too_close_together by 9.8Å
  - K101↔Y75: targets 27.5/8.9Å but partners are 11.0Å apart → too_close_together by 7.6Å
  - K101↔Y71: targets 27.5/12.6Å but partners are 7.6Å apart → too_close_together by 7.3Å
- **L99** — severity 41.53, 20 conflict(s); suspect input ~`E25` (group: pull_in)
  - pull-in (wants closer): K9@11.2Å(now 13.9,conf 0.55), K15@11.6Å(now 14.7,conf 0.55), F14@8.4Å(now 12.2,conf 0.55), E25@10.3Å(now 20.5,conf 0.55), G27@15.7Å(now 19.3,conf 0.55)
  - push-out (wants farther): I96@5.0Å(now 1.8,conf 0.94), R92@10.9Å(now 6.5,conf 0.91), N93@9.1Å(now 3.4,conf 0.91), L95@6.2Å(now 3.6,conf 0.55), M81@17.5Å(now 14.9,conf 0.55), F83@16.9Å(now 12.2,conf 0.55), G85@15.9Å(now 10.4,conf 0.55), K90@14.2Å(now 9.7,conf 0.55)
  - C103↔E25: targets 6.0/10.3Å but partners are 25.1Å apart → too_far_apart by 8.7Å
  - A102↔E25: targets 5.1/10.3Å but partners are 23.4Å apart → too_far_apart by 7.9Å
  - A102↔G85: targets 5.1/15.9Å but partners are 5.0Å apart → too_close_together by 5.8Å

## Secondary Structure (DSSP-like)

- helix(H)=47 · strand(E)=31 · 3-10(G)=22 · coil(C)=3

```
EHHHHGHHHHGHHGGEEHHEHEGHHHEEEGGHEHHGEHEHHEGGCHEGHECGECHEHEGGEGHEHEHGHEHGHEEEGEHHEGEGEGHHHHHHHHEHHGEHHHE
```

## Backbone H-bond Network

- total=80 · helix(i→i+4)=18 · sheet=62
  - K3 ↔ A7  (helix)
  - A4 ↔ K8  (helix)
  - G5 ↔ K9  (helix)
  - K8 ↔ T12  (helix)
  - K9 ↔ L13  (helix)
  - C21 ↔ E25  (helix)
  - P34 ↔ G38  (helix)
  - W63 ↔ N67  (helix)
  - E65 ↔ S69  (helix)
  - N67 ↔ Y71  (helix)
  - S69 ↔ T73  (helix)
  - K87 ↔ D91  (helix)
  - E89 ↔ N93  (helix)
  - K90 ↔ D94  (helix)
  - R92 ↔ I96  (helix)
  - N93 ↔ T97  (helix)
  - I96 ↔ K100  (helix)
  - T97 ↔ K101  (helix)
  - T16 ↔ H22  (sheet)
  - T16 ↔ P29  (sheet)
  - … +60 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=38 · exposed=39 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=507 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=274 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=3.4327 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=22 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 84 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
