# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1MSI\sequence\1MSI.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1MSI\seeds\seed_3\1MSI.pdb`
- residues: 64
- mode: oracle
- ca_rmsd: 6.347 A
- tm_score_ca_ordered: 0.32412572432137143
- heavy_atom_rmsd: 7.058 A
- sidechain_heavy_atom_rmsd: 7.812 A
- **all-atom quality (honest):** heavy 7.058 A, sidechain 7.812 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/54 (0.0)
- lj_severe: 0
- lj_near: 32
- distogram_pairs: 612
- bin_accuracy: 0.366

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=36
- rigid_domain_reconvergence: applied=True accepted=2 rmsd=6.5320680142164145 -> 6.225780855856658 A
- topology_reconvergence: applied=True accepted=0/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 6.347178241932954
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 6.358159064611801  localized_anchor_rmsd: 6.3471515365892195

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** A34-L55 → 306 conflicts (94%)
- explained: 306/327 conflicts by 1 root cause(s)
- metrics: hubs=52 (frac 0.812), conflicts/hub=6.3, max_incompat=11.63Å, chain_span=0.953
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): A34-L55 — explain ~306/327 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **P38** — severity 43.50, 20 conflict(s); suspect input ~`P50` (group: pull_in)
  - pull-in (wants closer): V41@5.8Å(now 11.0,conf 0.69), V20@11.7Å(now 16.6,conf 0.55)
  - push-out (wants farther): G31@15.0Å(now 7.5,conf 1.00), V45@15.0Å(now 5.4,conf 1.00), A34@9.0Å(now 5.9,conf 0.99), Q44@13.0Å(now 8.7,conf 0.99), I32@11.1Å(now 5.9,conf 0.91), P50@20.3Å(now 12.4,conf 0.59), R47@19.9Å(now 9.5,conf 0.58), G52@18.8Å(now 13.1,conf 0.56), N46@18.3Å(now 8.7,conf 0.55), V49@18.2Å(now 9.6,conf 0.55), P33@10.9Å(now 5.9,conf 0.55), P57@14.5Å(now 4.6,conf 0.55)
  - V41↔P50: targets 5.8/20.3Å but partners are 4.1Å apart → too_close_together by 10.4Å
  - V41↔G52: targets 5.8/18.8Å but partners are 3.7Å apart → too_close_together by 9.3Å
  - V41↔V49: targets 5.8/18.2Å but partners are 5.5Å apart → too_close_together by 6.9Å
- **P50** — severity 39.82, 21 conflict(s); suspect input ~`P38` (group: pull_in)
  - pull-in (wants closer): T53@5.0Å(now 8.1,conf 0.99), R47@9.4Å(now 12.7,conf 0.79), L10@4.5Å(now 7.9,conf 0.60)
  - push-out (wants farther): M43@16.9Å(now 5.1,conf 0.91), Q44@14.9Å(now 10.1,conf 0.91), A1@22.6Å(now 19.8,conf 0.69), P38@20.3Å(now 12.4,conf 0.59), M21@10.8Å(now 5.7,conf 0.55), T28@16.3Å(now 13.7,conf 0.55), I32@15.8Å(now 11.6,conf 0.55)
  - T53↔A1: targets 5.0/22.6Å but partners are 12.6Å apart → too_close_together by 5.0Å
  - T53↔P38: targets 5.0/20.3Å but partners are 10.2Å apart → too_close_together by 5.0Å
  - T53↔T28: targets 5.0/16.3Å but partners are 5.9Å apart → too_close_together by 5.4Å
- **E35** — severity 34.62, 14 conflict(s); suspect input ~`A48` (group: push_out)
  - push-out (wants farther): T28@17.0Å(now 10.3,conf 0.99), V30@13.0Å(now 10.0,conf 0.99), S42@15.0Å(now 3.8,conf 0.99), V41@12.9Å(now 9.4,conf 0.91), A48@21.9Å(now 13.0,conf 0.63), R47@21.7Å(now 16.7,conf 0.62), K61@17.8Å(now 14.5,conf 0.55), T53@17.0Å(now 7.0,conf 0.55), P29@16.4Å(now 7.5,conf 0.55), V60@15.2Å(now 9.8,conf 0.55)
  - R39↔A48: targets 8.6/21.9Å but partners are 5.6Å apart → too_close_together by 7.8Å
  - L40↔A48: targets 10.0/21.9Å but partners are 4.8Å apart → too_close_together by 7.1Å
  - A48↔P38: targets 21.9/7.4Å but partners are 7.3Å apart → too_close_together by 7.2Å
- **N14** — severity 32.90, 14 conflict(s); suspect input ~`V45` (group: push_out)
  - pull-in (wants closer): V45@5.3Å(now 9.7,conf 0.56), T54@16.9Å(now 20.6,conf 0.55), T53@16.1Å(now 20.3,conf 0.55), L55@14.1Å(now 18.6,conf 0.55)
  - push-out (wants farther): R39@16.8Å(now 10.7,conf 0.55)
  - Q2↔L55: targets 27.3/14.1Å but partners are 6.4Å apart → too_close_together by 6.8Å
  - Q2↔V45: targets 27.3/5.3Å but partners are 15.5Å apart → too_close_together by 6.6Å
  - V45↔R39: targets 5.3/16.8Å but partners are 4.9Å apart → too_close_together by 6.5Å
- **A3** — severity 27.39, 13 conflict(s); suspect input ~`A34` (group: pull_in)
  - pull-in (wants closer): A34@5.5Å(now 12.8,conf 0.56)
  - push-out (wants farther): N46@21.8Å(now 16.1,conf 0.62), S42@20.6Å(now 15.4,conf 0.59), L10@19.2Å(now 14.4,conf 0.56), V49@17.7Å(now 13.7,conf 0.55)
  - S42↔A34: targets 20.6/5.5Å but partners are 3.4Å apart → too_close_together by 11.6Å
  - A34↔V49: targets 5.5/17.7Å but partners are 6.1Å apart → too_close_together by 6.1Å
  - N46↔A34: targets 21.8/5.5Å but partners are 10.4Å apart → too_close_together by 5.8Å
- **A1** — severity 23.17, 10 conflict(s); suspect input ~`R47` (group: pull_in)
  - pull-in (wants closer): A34@11.1Å(now 15.3,conf 0.55)
  - push-out (wants farther): R47@27.2Å(now 18.3,conf 0.89), P50@22.6Å(now 19.8,conf 0.69), G52@17.4Å(now 14.1,conf 0.55)
  - S4↔R47: targets 9.1/27.2Å but partners are 10.4Å apart → too_close_together by 7.7Å
  - V5↔R47: targets 13.0/27.2Å but partners are 10.6Å apart → too_close_together by 3.6Å
  - R47↔A34: targets 27.2/11.1Å but partners are 11.3Å apart → too_close_together by 4.9Å

## Secondary Structure (DSSP-like)

- helix(H)=30 · strand(E)=22 · 3-10(G)=5 · coil(C)=7

```
CHHEHHHHECCEEHEEEEHCEHEEEHHEHEHEGGHGHEHEHHEGHHHEEHGHEHCCHHHEHHHC
```

## Backbone H-bond Network

- total=63 · helix(i→i+4)=13 · sheet=50
  - Q2 ↔ V6  (helix)
  - A3 ↔ A7  (helix)
  - M22 ↔ V26  (helix)
  - V27 ↔ G31  (helix)
  - G31 ↔ E35  (helix)
  - E35 ↔ R39  (helix)
  - I37 ↔ V41  (helix)
  - V41 ↔ V45  (helix)
  - S42 ↔ N46  (helix)
  - N46 ↔ P50  (helix)
  - P50 ↔ T54  (helix)
  - P57 ↔ K61  (helix)
  - M59 ↔ Y63  (helix)
  - S4 ↔ R23  (sheet)
  - Q9 ↔ L17  (sheet)
  - Q9 ↔ T18  (sheet)
  - Q9 ↔ M21  (sheet)
  - Q9 ↔ R23  (sheet)
  - Q9 ↔ S24  (sheet)
  - Q9 ↔ E25  (sheet)
  - … +43 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=25 · exposed=18 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=415 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=310 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=6.1066 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=32 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 54 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
