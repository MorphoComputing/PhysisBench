# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1MSI\sequence\1MSI.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1MSI\seeds\seed_6\1MSI.pdb`
- residues: 64
- mode: oracle
- ca_rmsd: 8.595 A
- tm_score_ca_ordered: 0.23718550615173
- heavy_atom_rmsd: 9.367 A
- sidechain_heavy_atom_rmsd: 10.189 A
- **all-atom quality (honest):** heavy 9.367 A, sidechain 10.189 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/54 (0.0)
- lj_severe: 0
- lj_near: 34
- distogram_pairs: 614
- bin_accuracy: 0.472

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=global reason=rejected_domain_topology_regression tested=39
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 8.595078856569076
- ga_delta_rmsd: 0.6295101214524053  ga_fitness_mode: energy
- pre_local_rmsd: 8.599457663282488  localized_anchor_rmsd: 8.595096681618525

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** V49-M56 → 69 conflicts (54%); P38-Q44 → 14 conflicts (11%); T28-P29 → 11 conflicts (9%)
- explained: 94/127 conflicts by 3 root cause(s)
- metrics: hubs=42 (frac 0.656), conflicts/hub=3.0, max_incompat=7.13Å, chain_span=0.969
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): V49-M56 + P38-Q44 + T28-P29 — explain ~94/127 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **P38** — severity 13.82, 7 conflict(s); suspect input ~`P50` (group: push_out)
  - push-out (wants farther): P50@20.3Å(now 10.9,conf 0.59), G52@18.8Å(now 8.9,conf 0.56), V49@18.2Å(now 12.8,conf 0.55), V20@11.7Å(now 8.2,conf 0.55)
  - V41↔P50: targets 6.0/20.3Å but partners are 8.3Å apart → too_close_together by 6.0Å
  - V41↔V49: targets 6.0/18.2Å but partners are 7.8Å apart → too_close_together by 4.4Å
  - V41↔G52: targets 6.0/18.8Å but partners are 8.6Å apart → too_close_together by 4.2Å
- **D36** — severity 13.26, 5 conflict(s); suspect input ~`I32` (group: push_out)
  - push-out (wants farther): P29@17.0Å(now 9.9,conf 1.00), T54@13.1Å(now 6.0,conf 0.55)
  - P29↔I32: targets 17.0/7.1Å but partners are 5.1Å apart → too_close_together by 4.8Å
  - P29↔P33: targets 17.0/5.7Å but partners are 4.2Å apart → too_close_together by 7.1Å
  - R39↔T54: targets 5.2/13.1Å but partners are 3.2Å apart → too_close_together by 4.6Å
- **M43** — severity 10.42, 3 conflict(s); suspect input ~`P50` (group: pull_in)
  - pull-in (wants closer): L40@5.1Å(now 8.8,conf 0.91)
  - push-out (wants farther): P50@16.6Å(now 13.2,conf 0.79), V49@14.0Å(now 10.8,conf 0.72), L19@11.2Å(now 4.7,conf 0.55)
  - L40↔P50: targets 5.1/16.6Å but partners are 4.4Å apart → too_close_together by 7.1Å
  - L40↔V49: targets 5.1/14.0Å but partners are 4.3Å apart → too_close_together by 4.6Å
  - L40↔L10: targets 5.1/15.4Å but partners are 7.5Å apart → too_close_together by 2.8Å
- **T18** — severity 10.37, 7 conflict(s); suspect input ~`M59` (group: push_out)
  - push-out (wants farther): M59@15.0Å(now 4.7,conf 0.55), Y63@15.0Å(now 12.0,conf 0.55), V45@11.2Å(now 6.4,conf 0.55), V49@13.5Å(now 6.5,conf 0.55), G52@15.5Å(now 10.5,conf 0.55), Q44@9.6Å(now 5.5,conf 0.55), K61@14.3Å(now 10.4,conf 0.55), L40@8.1Å(now 5.2,conf 0.55)
  - M21↔V49: targets 5.1/13.5Å but partners are 3.6Å apart → too_close_together by 4.8Å
  - M21↔M59: targets 5.1/15.0Å but partners are 6.2Å apart → too_close_together by 3.7Å
  - M22↔G52: targets 7.0/15.5Å but partners are 5.8Å apart → too_close_together by 2.8Å
- **G52** — severity 10.11, 7 conflict(s); suspect input ~`R39` (group: push_out)
  - push-out (wants farther): R39@19.6Å(now 6.7,conf 0.57), P38@18.8Å(now 8.9,conf 0.56), M22@9.4Å(now 5.8,conf 0.55), T18@15.5Å(now 10.5,conf 0.55), A34@14.0Å(now 10.3,conf 0.55)
  - A7↔R39: targets 5.1/19.6Å but partners are 10.2Å apart → too_close_together by 4.3Å
  - R39↔M22: targets 19.6/9.4Å but partners are 6.7Å apart → too_close_together by 3.5Å
  - L55↔R39: targets 9.0/19.6Å but partners are 7.3Å apart → too_close_together by 3.2Å
- **T53** — severity 9.79, 7 conflict(s); suspect input ~`T28` (group: pull_in)
  - pull-in (wants closer): A3@13.0Å(now 15.8,conf 0.55), D58@13.1Å(now 15.8,conf 0.55), T28@10.7Å(now 18.2,conf 0.55), V27@9.6Å(now 14.0,conf 0.55)
  - push-out (wants farther): P50@5.4Å(now 1.4,conf 0.79), E35@17.0Å(now 13.9,conf 0.55), V41@17.0Å(now 7.6,conf 0.55), Q44@15.4Å(now 12.8,conf 0.55)
  - V49↔T28: targets 6.3/10.7Å but partners are 21.2Å apart → too_far_apart by 4.2Å
  - P50↔V41: targets 5.4/17.0Å but partners are 8.3Å apart → too_close_together by 3.2Å
  - P50↔T28: targets 5.4/10.7Å but partners are 19.2Å apart → too_far_apart by 3.0Å

## Secondary Structure (DSSP-like)

- helix(H)=22 · strand(E)=25 · 3-10(G)=11 · coil(C)=6

```
CEEECCHCEGEEEHECEGHHHEGGGHHHEHEHEHHEHHEEGEGEHHEEHHHHGGCEEGHGHEEE
```

## Backbone H-bond Network

- total=51 · helix(i→i+4)=5 · sheet=46
  - V26 ↔ V30  (helix)
  - T28 ↔ I32  (helix)
  - V30 ↔ A34  (helix)
  - A34 ↔ P38  (helix)
  - N46 ↔ P50  (helix)
  - A3 ↔ M22  (sheet)
  - S4 ↔ M22  (sheet)
  - Q9 ↔ L17  (sheet)
  - Q9 ↔ M22  (sheet)
  - I11 ↔ L17  (sheet)
  - I11 ↔ M22  (sheet)
  - P12 ↔ L17  (sheet)
  - L17 ↔ M22  (sheet)
  - L17 ↔ G31  (sheet)
  - M22 ↔ P29  (sheet)
  - M22 ↔ G31  (sheet)
  - M22 ↔ P33  (sheet)
  - M22 ↔ D36  (sheet)
  - M22 ↔ R39  (sheet)
  - M22 ↔ L40  (sheet)
  - … +31 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=25 · exposed=12 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=379 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=279 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=3.9648 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=34 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 54 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
