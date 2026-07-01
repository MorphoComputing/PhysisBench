# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set/general_benchmark/2YXF/sequence/2YXF.pdb`
- output_pdb: `general_benchmark/evidence_ladder/80pct_masked/2YXF/seeds/seed_1/2YXF.pdb`
- residues: 97
- mode: oracle
- ca_rmsd: 8.869 A
- tm_score_ca_ordered: 0.31581071663640725
- heavy_atom_rmsd: 9.969 A
- sidechain_heavy_atom_rmsd: 10.817 A
- **all-atom quality (honest):** heavy 9.969 A, sidechain 10.817 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 1/1
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/92 (0.0)
- lj_severe: 0
- lj_near: 24
- distogram_pairs: 890
- bin_accuracy: 0.636

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=rejected_lj_regression tested=48
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 8.869209419030442
- ga_delta_rmsd: 1.5444291733599496  ga_fitness_mode: energy
- pre_local_rmsd: 8.869244764101099  localized_anchor_rmsd: 8.869244764101099

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** F56-W60 → 18 conflicts (32%); I7 → 12 conflicts (21%); Q2 → 7 conflicts (12%)
- explained: 37/56 conflicts by 3 root cause(s)
- metrics: hubs=25 (frac 0.258), conflicts/hub=2.2, max_incompat=4.94Å, chain_span=0.866
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): F56-W60 + I7 + Q2 — explain ~37/56 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **I7** — severity 18.99, 10 conflict(s); suspect input ~`N24` (group: push_out)
  - push-out (wants farther): E16@27.0Å(now 21.6,conf 0.85), K19@25.7Å(now 22.9,conf 0.70), I1@18.9Å(now 15.7,conf 0.56), I35@12.4Å(now 9.0,conf 0.55), V37@10.1Å(now 6.2,conf 0.55)
  - E16↔N24: targets 27.0/10.2Å but partners are 11.9Å apart → too_close_together by 4.9Å
  - E16↔S11: targets 27.0/13.6Å but partners are 8.5Å apart → too_close_together by 4.9Å
  - E16↔R12: targets 27.0/16.1Å but partners are 6.6Å apart → too_close_together by 4.3Å
- **Y10** — severity 7.66, 5 conflict(s); suspect input ~`G29` (group: push_out)
  - push-out (wants farther): I1@27.5Å(now 23.3,conf 0.99), D59@27.1Å(now 22.9,conf 0.87), Q2@25.4Å(now 21.1,conf 0.70), T71@13.2Å(now 10.4,conf 0.55)
  - D59↔F56: targets 27.1/21.0Å but partners are 2.2Å apart → too_close_together by 3.9Å
  - Q2↔I7: targets 25.4/10.1Å but partners are 12.3Å apart → too_close_together by 3.0Å
  - Q2↔G29: targets 25.4/17.5Å but partners are 5.0Å apart → too_close_together by 2.9Å
- **F56** — severity 6.96, 5 conflict(s); suspect input ~`Y63` (group: pull_in)
  - pull-in (wants closer): E74@27.5Å(now 35.1,conf 1.00)
  - push-out (wants farther): R45@26.0Å(now 22.6,conf 0.72), I46@25.0Å(now 21.9,conf 0.69)
  - R45↔Y63: targets 26.0/5.9Å but partners are 16.9Å apart → too_close_together by 3.2Å
  - I46↔Y63: targets 25.0/5.9Å but partners are 16.6Å apart → too_close_together by 2.5Å
  - I46↔Y66: targets 25.0/14.6Å but partners are 7.9Å apart → too_close_together by 2.4Å
- **Q2** — severity 4.21, 3 conflict(s); suspect input ~`W60` (group: pull_in)
  - pull-in (wants closer): T73@27.5Å(now 33.0,conf 1.00), H31@4.9Å(now 8.1,conf 0.58), T86@7.2Å(now 11.6,conf 0.55), L87@10.9Å(now 15.5,conf 0.55)
  - push-out (wants farther): F22@27.5Å(now 24.9,conf 1.00), L23@27.4Å(now 23.1,conf 0.94), Y10@25.4Å(now 21.1,conf 0.70), K6@12.7Å(now 8.0,conf 0.55), S28@12.6Å(now 8.5,conf 0.55)
  - T86↔W60: targets 7.2/8.2Å but partners are 18.8Å apart → too_far_apart by 3.4Å
  - L87↔W60: targets 10.9/8.2Å but partners are 21.5Å apart → too_far_apart by 2.4Å
  - T73↔H31: targets 27.5/4.9Å but partners are 34.3Å apart → too_far_apart by 1.9Å
- **S57** — severity 3.50, 3 conflict(s); suspect input ~`L54` (group: push_out)
  - pull-in (wants closer): P72@27.5Å(now 32.6,conf 1.00), G43@27.5Å(now 30.4,conf 1.00), E44@27.5Å(now 30.1,conf 1.00), G18@27.5Å(now 30.3,conf 1.00)
  - push-out (wants farther): V49@23.4Å(now 20.4,conf 0.76)
  - V49↔L54: targets 23.4/10.6Å but partners are 10.2Å apart → too_close_together by 2.6Å
  - V49↔L64: targets 23.4/11.5Å but partners are 9.7Å apart → too_close_together by 2.2Å
  - V49↔Y66: targets 23.4/17.4Å but partners are 4.4Å apart → too_close_together by 1.6Å
- **D59** — severity 3.23, 2 conflict(s); suspect input ~`S55` (group: pull_in)
  - pull-in (wants closer): T71@27.5Å(now 30.5,conf 1.00), E77@27.5Å(now 31.0,conf 1.00), R97@27.5Å(now 30.9,conf 1.00)
  - push-out (wants farther): Y10@27.1Å(now 22.9,conf 0.87), V49@26.8Å(now 19.1,conf 0.80), V9@24.1Å(now 21.3,conf 0.73), L65@17.6Å(now 13.8,conf 0.55), S55@9.9Å(now 6.2,conf 0.55)
  - V49↔S55: targets 26.8/9.9Å but partners are 13.7Å apart → too_close_together by 3.2Å
  - V49↔L65: targets 26.8/17.6Å but partners are 6.4Å apart → too_close_together by 2.8Å

## Secondary Structure (DSSP-like)

- helix(H)=43 · strand(E)=36 · 3-10(G)=11 · coil(C)=7

```
CEHHHHHGEEECHHHHHHHGEGHEGEEEHGEHHHEHGHHHEHHGECCHHHHHEGEEGHHHEEEECEEHEEHEGHHEEECCEEGEHHHHEHEHEEHHE
```

## Backbone H-bond Network

- total=76 · helix(i→i+4)=14 · sheet=62
  - R3 ↔ I7  (helix)
  - H13 ↔ N17  (helix)
  - P14 ↔ G18  (helix)
  - A15 ↔ K19  (helix)
  - K19 ↔ L23  (helix)
  - G29 ↔ S33  (helix)
  - P32 ↔ E36  (helix)
  - E36 ↔ L40  (helix)
  - L39 ↔ G43  (helix)
  - K48 ↔ S52  (helix)
  - T71 ↔ K75  (helix)
  - T86 ↔ P90  (helix)
  - S88 ↔ I92  (helix)
  - I92 ↔ D96  (helix)
  - V9 ↔ N21  (sheet)
  - V9 ↔ N24  (sheet)
  - V9 ↔ Y26  (sheet)
  - V9 ↔ V27  (sheet)
  - V9 ↔ S28  (sheet)
  - Y10 ↔ N21  (sheet)
  - … +56 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=32 · exposed=38 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=421 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=260 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.9364 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=24 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=1: C25–C80

## Side-chain Rotamers (χ1/χ2)

- 92 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
