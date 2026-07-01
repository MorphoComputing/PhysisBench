# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set/general_benchmark/1MSI/sequence/1MSI.pdb`
- output_pdb: `general_benchmark/evidence_ladder/80pct_masked/1MSI/seeds/seed_0/1MSI.pdb`
- residues: 64
- mode: oracle
- ca_rmsd: 6.579 A
- tm_score_ca_ordered: 0.24459784065404347
- heavy_atom_rmsd: 7.423 A
- sidechain_heavy_atom_rmsd: 8.399 A
- **all-atom quality (honest):** heavy 7.423 A, sidechain 8.399 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/54 (0.0)
- lj_severe: 0
- lj_near: 18
- distogram_pairs: 378
- bin_accuracy: 0.392

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=48
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 6.579310499353524
- ga_delta_rmsd: 0.7903722842299885  ga_fitness_mode: energy
- pre_local_rmsd: 6.579562779096855  localized_anchor_rmsd: 6.579306734846996

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** P33-V45 → 49 conflicts (55%); G52-T53 → 15 conflicts (17%); V26 → 7 conflicts (8%)
- explained: 71/89 conflicts by 3 root cause(s)
- metrics: hubs=37 (frac 0.578), conflicts/hub=2.4, max_incompat=5.09Å, chain_span=0.984
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): P33-V45 + G52-T53 + V26 — explain ~71/89 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **N14** — severity 13.62, 9 conflict(s); suspect input ~`V45` (group: pull_in)
  - pull-in (wants closer): V45@5.3Å(now 8.6,conf 0.56), L55@14.1Å(now 17.6,conf 0.55)
  - push-out (wants farther): Q2@27.3Å(now 24.0,conf 0.93), P29@23.2Å(now 19.7,conf 0.75), T53@16.1Å(now 13.6,conf 0.55)
  - Q2↔V45: targets 27.3/5.3Å but partners are 17.3Å apart → too_close_together by 4.7Å
  - V45↔T53: targets 5.3/16.1Å but partners are 7.2Å apart → too_close_together by 3.7Å
  - V45↔N8: targets 5.3/16.5Å but partners are 7.9Å apart → too_close_together by 3.3Å
- **V49** — severity 9.00, 7 conflict(s); suspect input ~`M59` (group: pull_in)
  - pull-in (wants closer): M59@8.3Å(now 12.2,conf 0.55)
  - push-out (wants farther): A3@17.7Å(now 15.0,conf 0.55), M22@10.9Å(now 5.9,conf 0.55), S24@14.7Å(now 9.7,conf 0.55), T18@13.5Å(now 5.3,conf 0.55), E25@15.6Å(now 12.4,conf 0.55)
  - T53↔S24: targets 6.3/14.7Å but partners are 4.8Å apart → too_close_together by 3.6Å
  - L10↔M59: targets 5.7/8.3Å but partners are 17.0Å apart → too_far_apart by 3.1Å
  - P57↔M59: targets 12.5/8.3Å but partners are 1.6Å apart → too_close_together by 2.6Å
- **Q2** — severity 7.97, 5 conflict(s); suspect input ~`V26` (group: pull_in)
  - pull-in (wants closer): P57@15.5Å(now 18.3,conf 0.55)
  - push-out (wants farther): N14@27.3Å(now 24.0,conf 0.93), R23@13.3Å(now 9.7,conf 0.55)
  - N14↔V26: targets 27.3/6.1Å but partners are 17.8Å apart → too_close_together by 3.5Å
  - N14↔G31: targets 27.3/9.4Å but partners are 14.6Å apart → too_close_together by 3.3Å
  - V26↔R23: targets 6.1/13.3Å but partners are 4.2Å apart → too_close_together by 3.1Å
- **Q44** — severity 6.92, 5 conflict(s); suspect input ~`L40` (group: push_out)
  - pull-in (wants closer): L40@8.2Å(now 10.9,conf 0.55)
  - push-out (wants farther): T53@15.4Å(now 11.6,conf 0.55)
  - T28↔L40: targets 22.7/8.2Å but partners are 10.9Å apart → too_close_together by 3.6Å
  - A34↔L40: targets 16.8/8.2Å but partners are 5.6Å apart → too_close_together by 3.1Å
  - L40↔I32: targets 8.2/14.2Å but partners are 3.6Å apart → too_close_together by 2.4Å
- **A48** — severity 6.56, 4 conflict(s); suspect input ~`M59` (group: pull_in)
  - pull-in (wants closer): M59@8.9Å(now 12.7,conf 0.55)
  - push-out (wants farther): E35@21.9Å(now 17.9,conf 0.63), V5@15.0Å(now 12.2,conf 0.55), A16@11.5Å(now 4.9,conf 0.55), V41@16.2Å(now 11.5,conf 0.55), G31@16.0Å(now 10.8,conf 0.55), G52@12.0Å(now 6.2,conf 0.55)
  - M59↔V41: targets 8.9/16.2Å but partners are 3.4Å apart → too_close_together by 3.9Å
  - E35↔M59: targets 21.9/8.9Å but partners are 9.6Å apart → too_close_together by 3.4Å
  - P12↔M59: targets 4.6/8.9Å but partners are 15.9Å apart → too_far_apart by 2.4Å
- **R39** — severity 6.49, 4 conflict(s); suspect input ~`V30` (group: push_out)
  - push-out (wants farther): T28@21.3Å(now 14.9,conf 0.60), G52@19.6Å(now 13.4,conf 0.57), D36@5.2Å(now 2.1,conf 0.56), V30@17.4Å(now 9.0,conf 0.55), M56@13.7Å(now 4.4,conf 0.55), T54@16.0Å(now 9.2,conf 0.55)
  - D36↔V30: targets 5.2/17.4Å but partners are 7.5Å apart → too_close_together by 4.6Å
  - T28↔D36: targets 21.3/5.2Å but partners are 13.3Å apart → too_close_together by 2.8Å
  - D36↔M56: targets 5.2/13.7Å but partners are 5.6Å apart → too_close_together by 2.9Å

## Secondary Structure (DSSP-like)

- helix(H)=26 · strand(E)=15 · 3-10(G)=13 · coil(C)=10

```
CEHEHHECGCHGEHHCECEGHHEEHHGEHGHGGHEHHHHHCGEGHHGCCEHHGCEEEHGHHGHC
```

## Backbone H-bond Network

- total=28 · helix(i→i+4)=6 · sheet=22
  - I11 ↔ T15  (helix)
  - M21 ↔ E25  (helix)
  - M22 ↔ V26  (helix)
  - E25 ↔ P29  (helix)
  - A34 ↔ P38  (helix)
  - D36 ↔ L40  (helix)
  - S4 ↔ L19  (sheet)
  - S4 ↔ R23  (sheet)
  - S4 ↔ S24  (sheet)
  - A7 ↔ I13  (sheet)
  - A7 ↔ L17  (sheet)
  - A7 ↔ L19  (sheet)
  - A7 ↔ R23  (sheet)
  - A7 ↔ S24  (sheet)
  - I13 ↔ L19  (sheet)
  - L17 ↔ R23  (sheet)
  - L19 ↔ S24  (sheet)
  - L19 ↔ T28  (sheet)
  - R23 ↔ T28  (sheet)
  - S24 ↔ E35  (sheet)
  - … +8 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=23 · exposed=18 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=423 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=282 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.5266 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=18 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 54 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
