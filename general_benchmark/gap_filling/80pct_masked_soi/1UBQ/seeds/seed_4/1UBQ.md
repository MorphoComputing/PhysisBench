# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1UBQ\sequence\1UBQ.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1UBQ\seeds\seed_4\1UBQ.pdb`
- residues: 74
- mode: oracle
- ca_rmsd: 2.741 A
- tm_score_ca_ordered: 0.7284413966714756
- heavy_atom_rmsd: 3.792 A
- sidechain_heavy_atom_rmsd: 4.413 A
- **all-atom quality (honest):** heavy 3.792 A, sidechain 4.413 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/67 (0.0)
- lj_severe: 0
- lj_near: 15
- distogram_pairs: 797
- bin_accuracy: 0.668

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=45
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 2.7408302943194154
- ga_delta_rmsd: 2.3260324891610136  ga_fitness_mode: energy
- pre_local_rmsd: 2.7512904721553912  localized_anchor_rmsd: 2.740818665424886

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** G74 → 24 conflicts (55%)
- explained: 24/44 conflicts by 1 root cause(s)
- metrics: hubs=18 (frac 0.243), conflicts/hub=2.4, max_incompat=4.63Å, chain_span=0.838
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): G74 — explain ~24/44 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **G74** — severity 14.56, 8 conflict(s); suspect input ~`I12` (group: push_out)
  - push-out (wants farther): K32@23.3Å(now 16.8,conf 0.76), L66@24.3Å(now 21.8,conf 0.72), I12@25.6Å(now 19.6,conf 0.70), Q30@19.5Å(now 15.4,conf 0.57), I35@15.5Å(now 10.9,conf 0.55)
  - H67↔L66: targets 17.2/24.3Å but partners are 4.0Å apart → too_close_together by 3.1Å
  - V69↔I12: targets 11.2/25.6Å but partners are 11.3Å apart → too_close_together by 3.1Å
  - R71↔I12: targets 6.0/25.6Å but partners are 16.9Å apart → too_close_together by 2.8Å
- **L49** — severity 6.90, 4 conflict(s); suspect input ~`G9` (group: push_out)
  - push-out (wants farther): G9@20.4Å(now 17.1,conf 0.59), T13@17.6Å(now 13.9,conf 0.55)
  - I43↔G9: targets 5.4/20.4Å but partners are 11.3Å apart → too_close_together by 3.6Å
  - L42↔G9: targets 5.0/20.4Å but partners are 12.1Å apart → too_close_together by 3.3Å
  - G9↔H67: targets 20.4/10.2Å but partners are 7.3Å apart → too_close_together by 3.0Å
- **Q30** — severity 6.64, 5 conflict(s); suspect input ~`G74` (group: push_out)
  - push-out (wants farther): G74@19.5Å(now 15.4,conf 0.57)
  - I35↔G74: targets 4.8/19.5Å but partners are 10.9Å apart → too_close_together by 3.9Å
  - G74↔L72: targets 19.5/14.5Å but partners are 2.6Å apart → too_close_together by 2.4Å
  - G34↔G74: targets 5.0/19.5Å but partners are 12.5Å apart → too_close_together by 2.0Å
- **L66** — severity 6.62, 4 conflict(s); suspect input ~`G74` (group: push_out)
  - push-out (wants farther): G74@24.3Å(now 21.8,conf 0.72), K10@12.3Å(now 9.3,conf 0.55), T13@10.3Å(now 6.0,conf 0.55), T8@14.1Å(now 10.7,conf 0.55)
  - V69↔G74: targets 10.0/24.3Å but partners are 11.1Å apart → too_close_together by 3.2Å
  - L72↔G74: targets 19.1/24.3Å but partners are 2.6Å apart → too_close_together by 2.6Å
  - L70↔G74: targets 13.0/24.3Å but partners are 9.1Å apart → too_close_together by 2.1Å
- **K32** — severity 6.54, 3 conflict(s); suspect input ~`G74` (group: push_out)
  - push-out (wants farther): G74@23.3Å(now 16.8,conf 0.76), R73@20.9Å(now 17.4,conf 0.59)
  - I35↔G74: targets 8.6/23.3Å but partners are 10.9Å apart → too_close_together by 3.9Å
  - I29↔G74: targets 5.0/23.3Å but partners are 15.8Å apart → too_close_together by 2.5Å
  - I35↔R73: targets 8.6/20.9Å but partners are 9.4Å apart → too_close_together by 2.9Å
- **I12** — severity 5.18, 3 conflict(s); suspect input ~`E33` (group: push_out)
  - push-out (wants farther): G74@25.6Å(now 19.6,conf 0.70)
  - G74↔E33: targets 25.6/8.5Å but partners are 12.7Å apart → too_close_together by 4.5Å
  - T6↔G74: targets 9.0/25.6Å but partners are 14.2Å apart → too_close_together by 2.4Å
  - G74↔L70: targets 25.6/14.5Å but partners are 9.1Å apart → too_close_together by 1.9Å

## Secondary Structure (DSSP-like)

- helix(H)=18 · strand(E)=32 · 3-10(G)=17 · coil(C)=7

```
EEEGEEEHEEEEGGCHEGHEEGHEHHEGHEHGHCEGGHCEGGGHGEEEGEGHEEGHHEEHCEHEEEGCCECHHE
```

## Backbone H-bond Network

- total=46 · helix(i→i+4)=5 · sheet=41
  - S19 ↔ E23  (helix)
  - V25 ↔ I29  (helix)
  - I29 ↔ E33  (helix)
  - G52 ↔ S56  (helix)
  - S56 ↔ I60  (helix)
  - Q1 ↔ I12  (sheet)
  - Q1 ↔ E17  (sheet)
  - I2 ↔ T11  (sheet)
  - I2 ↔ I12  (sheet)
  - I2 ↔ E17  (sheet)
  - I2 ↔ D20  (sheet)
  - F3 ↔ G9  (sheet)
  - F3 ↔ K10  (sheet)
  - F3 ↔ T11  (sheet)
  - F3 ↔ I12  (sheet)
  - K5 ↔ K10  (sheet)
  - K5 ↔ T11  (sheet)
  - K5 ↔ I12  (sheet)
  - T6 ↔ T11  (sheet)
  - T6 ↔ I12  (sheet)
  - … +26 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=37 · exposed=8 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=299 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=168 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.5461 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=15 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 67 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
