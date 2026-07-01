# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1MSI\sequence\1MSI.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1MSI\seeds\seed_1\1MSI.pdb`
- residues: 64
- mode: oracle
- ca_rmsd: 3.294 A
- tm_score_ca_ordered: 0.5667783159688271
- heavy_atom_rmsd: 4.617 A
- sidechain_heavy_atom_rmsd: 5.714 A
- **all-atom quality (honest):** heavy 4.617 A, sidechain 5.714 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/54 (0.0)
- lj_severe: 0
- lj_near: 17
- distogram_pairs: 614
- bin_accuracy: 0.555

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=39
- rigid_domain_reconvergence: applied=True accepted=10 rmsd=6.278273324202664 -> 5.4598600500472125 A
- topology_reconvergence: applied=True accepted=9/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 3.2941408038953837
- ga_delta_rmsd: 0.7763586639469455  ga_fitness_mode: energy
- pre_local_rmsd: 3.335270780280498  localized_anchor_rmsd: 3.2941407311937816

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** T53-M59 → 39 conflicts (64%); A64 → 7 conflicts (12%); V49-P50 → 6 conflicts (10%)
- explained: 52/61 conflicts by 3 root cause(s)
- metrics: hubs=23 (frac 0.359), conflicts/hub=2.7, max_incompat=5.12Å, chain_span=0.984
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): T53-M59 + A64 + V49-P50 — explain ~52/61 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **V49** — severity 10.81, 7 conflict(s); suspect input ~`M59` (group: pull_in)
  - pull-in (wants closer): M59@8.3Å(now 12.8,conf 0.55)
  - push-out (wants farther): A3@17.7Å(now 14.8,conf 0.55), P33@16.5Å(now 14.0,conf 0.55)
  - P38↔M59: targets 18.2/8.3Å but partners are 5.3Å apart → too_close_together by 4.7Å
  - P57↔M59: targets 12.5/8.3Å but partners are 1.1Å apart → too_close_together by 3.1Å
  - L55↔P33: targets 8.4/16.5Å but partners are 5.1Å apart → too_close_together by 3.0Å
- **P50** — severity 9.58, 7 conflict(s); suspect input ~`I32` (group: push_out)
  - push-out (wants farther): A1@22.6Å(now 17.9,conf 0.69), T28@16.3Å(now 12.5,conf 0.55), I32@15.8Å(now 11.1,conf 0.55), P29@16.0Å(now 12.9,conf 0.55)
  - T53↔A1: targets 6.0/22.6Å but partners are 13.8Å apart → too_close_together by 2.8Å
  - T53↔I32: targets 6.0/15.8Å but partners are 6.5Å apart → too_close_together by 3.3Å
  - T54↔I32: targets 9.0/15.8Å but partners are 3.8Å apart → too_close_together by 3.0Å
- **M59** — severity 8.85, 5 conflict(s); suspect input ~`V26` (group: pull_in)
  - pull-in (wants closer): A48@8.9Å(now 14.5,conf 0.55), V49@8.3Å(now 12.8,conf 0.55)
  - push-out (wants farther): Q2@19.2Å(now 15.9,conf 0.56), V26@18.6Å(now 13.4,conf 0.55), T18@15.0Å(now 10.7,conf 0.55), A64@11.1Å(now 8.4,conf 0.55), V41@13.6Å(now 3.9,conf 0.55)
  - M56↔V26: targets 5.0/18.6Å but partners are 8.5Å apart → too_close_together by 5.1Å
  - M56↔Q2: targets 5.0/19.2Å but partners are 10.7Å apart → too_close_together by 3.5Å
  - L55↔V26: targets 6.9/18.6Å but partners are 8.5Å apart → too_close_together by 3.2Å
- **A64** — severity 7.37, 5 conflict(s); suspect input ~`I32` (group: push_out)
  - pull-in (wants closer): I13@18.9Å(now 21.8,conf 0.56), A16@16.3Å(now 19.4,conf 0.55), I32@10.1Å(now 14.0,conf 0.55)
  - push-out (wants farther): M59@11.1Å(now 8.4,conf 0.55)
  - V27↔I32: targets 20.6/10.1Å but partners are 6.2Å apart → too_close_together by 4.3Å
  - G52↔I32: targets 21.9/10.1Å but partners are 8.8Å apart → too_close_together by 3.0Å
  - P57↔M59: targets 7.2/11.1Å but partners are 1.1Å apart → too_close_together by 2.7Å
- **N46** — severity 7.04, 6 conflict(s); suspect input ~`M56` (group: pull_in)
  - pull-in (wants closer): K61@6.0Å(now 8.9,conf 0.55), M56@11.0Å(now 15.1,conf 0.55), Y63@10.9Å(now 15.0,conf 0.55)
  - I13↔Y63: targets 5.6/10.9Å but partners are 19.5Å apart → too_far_apart by 2.9Å
  - N14↔Y63: targets 5.5/10.9Å but partners are 18.8Å apart → too_far_apart by 2.3Å
  - N14↔M56: targets 5.5/11.0Å but partners are 18.8Å apart → too_far_apart by 2.3Å
- **A1** — severity 6.43, 4 conflict(s); suspect input ~`P50` (group: push_out)
  - push-out (wants farther): P50@22.6Å(now 17.9,conf 0.69), G52@17.4Å(now 12.9,conf 0.55), M56@17.0Å(now 14.3,conf 0.55)
  - S4↔P50: targets 9.4/22.6Å but partners are 10.1Å apart → too_close_together by 3.0Å
  - V27↔P50: targets 8.0/22.6Å but partners are 11.7Å apart → too_close_together by 2.9Å
  - V6↔P50: targets 14.6/22.6Å but partners are 6.1Å apart → too_close_together by 1.9Å

## Secondary Structure (DSSP-like)

- helix(H)=18 · strand(E)=26 · 3-10(G)=10 · coil(C)=10

```
EEEEEGHHECGEEHEECEGHHCECECEHGEHHGEHEHGHHHHHGGGCECEEHEEGECEHCHEEC
```

## Backbone H-bond Network

- total=27 · helix(i→i+4)=3 · sheet=24
  - T28 ↔ I32  (helix)
  - G31 ↔ E35  (helix)
  - I37 ↔ V41  (helix)
  - A3 ↔ R23  (sheet)
  - S4 ↔ R23  (sheet)
  - V5 ↔ T18  (sheet)
  - V5 ↔ R23  (sheet)
  - V5 ↔ E25  (sheet)
  - Q9 ↔ T15  (sheet)
  - Q9 ↔ R23  (sheet)
  - T18 ↔ R23  (sheet)
  - R23 ↔ A34  (sheet)
  - R23 ↔ D36  (sheet)
  - E25 ↔ V30  (sheet)
  - E25 ↔ A34  (sheet)
  - E25 ↔ D36  (sheet)
  - V27 ↔ A34  (sheet)
  - V30 ↔ P50  (sheet)
  - A34 ↔ T53  (sheet)
  - A34 ↔ T54  (sheet)
  - … +7 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=28 · exposed=14 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=311 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=201 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.3045 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=17 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 54 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
