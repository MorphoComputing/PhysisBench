# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1MSI\sequence\1MSI.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1MSI\seeds\seed_5\1MSI.pdb`
- residues: 64
- mode: oracle
- ca_rmsd: 6.685 A
- tm_score_ca_ordered: 0.3007717508971967
- heavy_atom_rmsd: 7.121 A
- sidechain_heavy_atom_rmsd: 7.572 A
- **all-atom quality (honest):** heavy 7.121 A, sidechain 7.572 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/54 (0.0)
- lj_severe: 0
- lj_near: 18
- distogram_pairs: 612
- bin_accuracy: 0.420

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=42
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 6.684649173819311
- ga_delta_rmsd: 0.327295606547505  ga_fitness_mode: energy
- pre_local_rmsd: 6.722604353897107  localized_anchor_rmsd: 6.684614237707537

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** P38-G52 → 229 conflicts (70%); A1-A3 → 70 conflicts (21%)
- explained: 299/327 conflicts by 2 root cause(s)
- metrics: hubs=53 (frac 0.828), conflicts/hub=6.2, max_incompat=10.89Å, chain_span=0.984
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): P38-G52 + A1-A3 — explain ~299/327 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **P38** — severity 56.06, 19 conflict(s); suspect input ~`S42` (group: pull_in)
  - pull-in (wants closer): V41@5.1Å(now 11.1,conf 0.91), A3@14.5Å(now 21.3,conf 0.55)
  - push-out (wants farther): G31@15.0Å(now 10.9,conf 1.00), A34@9.0Å(now 5.2,conf 1.00), V45@15.0Å(now 10.2,conf 1.00), I32@11.4Å(now 7.7,conf 0.79), P50@20.3Å(now 14.9,conf 0.59), R47@19.9Å(now 13.0,conf 0.58), N46@18.3Å(now 7.4,conf 0.55), V49@18.2Å(now 12.5,conf 0.55), P33@10.9Å(now 7.6,conf 0.55), P57@14.5Å(now 10.6,conf 0.55)
  - V41↔P50: targets 5.1/20.3Å but partners are 4.3Å apart → too_close_together by 10.9Å
  - V41↔R47: targets 5.1/19.9Å but partners are 5.9Å apart → too_close_together by 8.9Å
  - V41↔V49: targets 5.1/18.2Å but partners are 4.3Å apart → too_close_together by 8.8Å
- **R23** — severity 46.43, 16 conflict(s); suspect input ~`A1` (group: pull_in)
  - pull-in (wants closer): A1@14.8Å(now 25.6,conf 0.55), Q2@13.3Å(now 22.7,conf 0.55), A3@9.6Å(now 20.5,conf 0.55)
  - push-out (wants farther): N46@18.8Å(now 10.7,conf 0.56), R47@18.1Å(now 8.7,conf 0.55), S42@15.3Å(now 8.7,conf 0.55)
  - L19↔A1: targets 7.1/14.8Å but partners are 31.1Å apart → too_far_apart by 9.2Å
  - L19↔A3: targets 7.1/9.6Å but partners are 25.4Å apart → too_far_apart by 8.7Å
  - V20↔A1: targets 8.0/14.8Å but partners are 31.0Å apart → too_far_apart by 8.3Å
- **A34** — severity 45.94, 15 conflict(s); suspect input ~`A1` (group: pull_in)
  - pull-in (wants closer): V5@5.0Å(now 11.7,conf 0.57), A3@5.5Å(now 16.4,conf 0.56), A1@11.1Å(now 22.0,conf 0.55)
  - push-out (wants farther): P38@9.0Å(now 5.2,conf 1.00), V41@13.0Å(now 9.6,conf 1.00), G31@9.0Å(now 6.5,conf 0.99), L40@10.8Å(now 5.5,conf 0.82), I13@20.7Å(now 14.9,conf 0.59), Q44@16.8Å(now 10.4,conf 0.55), M56@11.3Å(now 5.9,conf 0.55), T53@13.5Å(now 10.3,conf 0.55), A64@14.4Å(now 10.7,conf 0.55)
  - I37↔A3: targets 7.0/5.5Å but partners are 21.7Å apart → too_far_apart by 9.2Å
  - I37↔A1: targets 7.0/11.1Å but partners are 27.3Å apart → too_far_apart by 9.3Å
  - R39↔A1: targets 10.6/11.1Å but partners are 28.7Å apart → too_far_apart by 7.1Å
- **N14** — severity 42.47, 19 conflict(s); suspect input ~`V45` (group: pull_in)
  - pull-in (wants closer): V45@5.3Å(now 13.6,conf 0.56), N46@5.5Å(now 9.1,conf 0.56), A48@7.8Å(now 13.7,conf 0.55)
  - V45↔N8: targets 5.3/16.5Å but partners are 4.2Å apart → too_close_together by 7.0Å
  - P29↔V45: targets 23.2/5.3Å but partners are 11.8Å apart → too_close_together by 6.1Å
  - Q2↔V45: targets 27.3/5.3Å but partners are 16.6Å apart → too_close_together by 5.4Å
- **E35** — severity 32.32, 12 conflict(s); suspect input ~`A48` (group: push_out)
  - push-out (wants farther): T28@16.9Å(now 14.2,conf 0.91), A48@21.9Å(now 11.3,conf 0.63), R47@21.7Å(now 15.9,conf 0.62), K61@17.8Å(now 13.3,conf 0.55), V60@15.2Å(now 11.3,conf 0.55)
  - L40↔A48: targets 10.0/21.9Å but partners are 3.9Å apart → too_close_together by 8.1Å
  - R39↔A48: targets 8.6/21.9Å but partners are 6.0Å apart → too_close_together by 7.3Å
  - V41↔A48: targets 12.0/21.9Å but partners are 3.2Å apart → too_close_together by 6.7Å
- **P33** — severity 30.53, 11 conflict(s); suspect input ~`A1` (group: pull_in)
  - pull-in (wants closer): A1@10.9Å(now 23.2,conf 0.55)
  - push-out (wants farther): N46@18.4Å(now 12.2,conf 0.55), S42@16.7Å(now 13.7,conf 0.55), P38@10.9Å(now 7.6,conf 0.55), M43@15.3Å(now 11.3,conf 0.55)
  - I37↔A1: targets 7.0/10.9Å but partners are 27.3Å apart → too_far_apart by 9.4Å
  - D36↔A1: targets 5.7/10.9Å but partners are 25.1Å apart → too_far_apart by 8.6Å
  - R39↔A1: targets 10.6/10.9Å but partners are 28.7Å apart → too_far_apart by 7.3Å

## Secondary Structure (DSSP-like)

- helix(H)=24 · strand(E)=19 · 3-10(G)=14 · coil(C)=7

```
CECEGGGHCCEEEHEGEGHHHEGECGCEGEHEHHHHHHHHHHHEHHEHGHHGEGGGEHHEGEEC
```

## Backbone H-bond Network

- total=24 · helix(i→i+4)=10 · sheet=14
  - G31 ↔ E35  (helix)
  - P33 ↔ I37  (helix)
  - A34 ↔ P38  (helix)
  - E35 ↔ R39  (helix)
  - I37 ↔ V41  (helix)
  - P38 ↔ S42  (helix)
  - R39 ↔ M43  (helix)
  - V41 ↔ V45  (helix)
  - S42 ↔ N46  (helix)
  - N46 ↔ P50  (helix)
  - I11 ↔ L17  (sheet)
  - I11 ↔ M22  (sheet)
  - P12 ↔ L17  (sheet)
  - L17 ↔ M22  (sheet)
  - L17 ↔ I32  (sheet)
  - M22 ↔ I32  (sheet)
  - S24 ↔ V30  (sheet)
  - S24 ↔ I32  (sheet)
  - I32 ↔ Q44  (sheet)
  - Q44 ↔ T53  (sheet)
  - … +4 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=35 · exposed=8 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=321 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=205 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=4.3622 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=18 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 54 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
