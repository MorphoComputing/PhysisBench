# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1MSI\sequence\1MSI.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1MSI\seeds\seed_8\1MSI.pdb`
- residues: 64
- mode: oracle
- ca_rmsd: 8.215 A
- tm_score_ca_ordered: 0.23476333092577087
- heavy_atom_rmsd: 8.931 A
- sidechain_heavy_atom_rmsd: 9.795 A
- **all-atom quality (honest):** heavy 8.931 A, sidechain 9.795 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/54 (0.0)
- lj_severe: 0
- lj_near: 30
- distogram_pairs: 614
- bin_accuracy: 0.321

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=residue_block reason=accepted tested=36
- rigid_domain_reconvergence: applied=True accepted=4 rmsd=7.316703397680916 -> 6.695293649368716 A
- topology_reconvergence: applied=True accepted=0/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 8.215368846323305
- ga_delta_rmsd: -2.358270171269514  ga_fitness_mode: energy
- pre_local_rmsd: 8.26187930391279  localized_anchor_rmsd: 8.2153467840039

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** M22-T53 → 372 conflicts (87%); A1-S4 → 40 conflicts (9%)
- explained: 412/428 conflicts by 2 root cause(s)
- metrics: hubs=60 (frac 0.938), conflicts/hub=7.1, max_incompat=12.64Å, chain_span=0.984
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): M22-T53 + A1-S4 — explain ~412/428 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **L10** — severity 66.73, 18 conflict(s); suspect input ~`A3` (group: push_out)
  - push-out (wants farther): A1@23.7Å(now 10.6,conf 0.75), A3@19.2Å(now 10.1,conf 0.56), S4@16.3Å(now 12.2,conf 0.55)
  - A1↔P50: targets 23.7/4.5Å but partners are 6.5Å apart → too_close_together by 12.6Å
  - A1↔L51: targets 23.7/4.7Å but partners are 7.4Å apart → too_close_together by 11.6Å
  - V6↔A1: targets 9.4/23.7Å but partners are 5.4Å apart → too_close_together by 8.8Å
- **A1** — severity 44.36, 17 conflict(s); suspect input ~`P50` (group: pull_in)
  - pull-in (wants closer): V27@8.6Å(now 13.1,conf 0.79), A64@22.9Å(now 25.8,conf 0.79), P33@10.9Å(now 16.7,conf 0.55)
  - push-out (wants farther): V5@13.0Å(now 7.8,conf 1.00), V6@15.0Å(now 5.4,conf 0.99), N8@19.0Å(now 7.2,conf 0.99), R47@27.2Å(now 13.7,conf 0.89), L10@23.7Å(now 10.6,conf 0.75), I11@24.0Å(now 13.2,conf 0.73), P50@22.6Å(now 6.5,conf 0.69), A7@18.0Å(now 9.9,conf 0.55), G52@17.4Å(now 9.2,conf 0.55)
  - R47↔V27: targets 27.2/8.6Å but partners are 10.9Å apart → too_close_together by 7.7Å
  - R47↔A34: targets 27.2/11.1Å but partners are 6.9Å apart → too_close_together by 9.2Å
  - S4↔P50: targets 9.0/22.6Å but partners are 7.2Å apart → too_close_together by 6.4Å
- **P38** — severity 41.36, 18 conflict(s); suspect input ~`R47` (group: push_out)
  - push-out (wants farther): V45@15.0Å(now 8.7,conf 1.00), G31@15.0Å(now 7.6,conf 0.99), I32@11.0Å(now 5.1,conf 0.99), P50@20.3Å(now 9.8,conf 0.59), R47@19.9Å(now 13.6,conf 0.58), G52@18.8Å(now 10.7,conf 0.56), N46@18.3Å(now 13.7,conf 0.55), V49@18.2Å(now 10.4,conf 0.55), P33@10.9Å(now 5.2,conf 0.55), S42@9.2Å(now 5.6,conf 0.55), P57@14.5Å(now 9.7,conf 0.55)
  - V45↔V41: targets 15.0/6.0Å but partners are 3.5Å apart → too_close_together by 5.5Å
  - V41↔P50: targets 6.0/20.3Å but partners are 7.8Å apart → too_close_together by 6.5Å
  - V41↔R47: targets 6.0/19.9Å but partners are 7.7Å apart → too_close_together by 6.2Å
- **T28** — severity 39.47, 16 conflict(s); suspect input ~`Q44` (group: push_out)
  - push-out (wants farther): E35@17.0Å(now 10.8,conf 0.99), G62@22.9Å(now 17.2,conf 0.73), A34@14.0Å(now 10.5,conf 0.72), Q44@22.7Å(now 15.2,conf 0.70), R39@21.3Å(now 6.8,conf 0.60), A48@19.8Å(now 13.2,conf 0.57), P50@16.3Å(now 11.7,conf 0.55)
  - E25↔Q44: targets 9.4/22.7Å but partners are 6.0Å apart → too_close_together by 7.3Å
  - E25↔R39: targets 9.4/21.3Å but partners are 4.5Å apart → too_close_together by 7.3Å
  - S24↔Q44: targets 12.9/22.7Å but partners are 3.6Å apart → too_close_together by 6.2Å
- **N14** — severity 35.09, 14 conflict(s); suspect input ~`V45` (group: pull_in)
  - pull-in (wants closer): V45@5.3Å(now 11.7,conf 0.56), L55@14.1Å(now 16.9,conf 0.55)
  - push-out (wants farther): Q2@27.3Å(now 23.1,conf 0.93), L19@16.9Å(now 14.3,conf 0.91), E35@22.1Å(now 14.8,conf 0.64), M22@15.5Å(now 9.8,conf 0.55)
  - E35↔V45: targets 22.1/5.3Å but partners are 7.8Å apart → too_close_together by 9.0Å
  - Q2↔V45: targets 27.3/5.3Å but partners are 15.0Å apart → too_close_together by 7.0Å
  - V45↔R39: targets 5.3/16.8Å but partners are 5.0Å apart → too_close_together by 6.5Å
- **A3** — severity 33.52, 14 conflict(s); suspect input ~`A34` (group: pull_in)
  - pull-in (wants closer): G62@21.1Å(now 25.2,conf 0.60), A34@5.5Å(now 14.4,conf 0.56), V60@17.5Å(now 20.1,conf 0.55), R23@9.6Å(now 16.1,conf 0.55)
  - push-out (wants farther): V6@9.0Å(now 3.3,conf 1.00), A7@13.0Å(now 8.6,conf 1.00), Q9@18.0Å(now 8.6,conf 0.72), S42@20.6Å(now 17.1,conf 0.59), L10@19.2Å(now 10.1,conf 0.56), V49@17.7Å(now 10.8,conf 0.55), T53@13.0Å(now 8.8,conf 0.55), G52@13.2Å(now 6.5,conf 0.55), N8@13.9Å(now 6.2,conf 0.55)
  - S42↔A34: targets 20.6/5.5Å but partners are 4.2Å apart → too_close_together by 10.8Å
  - N46↔A34: targets 21.8/5.5Å but partners are 6.8Å apart → too_close_together by 9.4Å
  - A34↔V49: targets 5.5/17.7Å but partners are 5.4Å apart → too_close_together by 6.7Å

## Secondary Structure (DSSP-like)

- helix(H)=29 · strand(E)=20 · 3-10(G)=12 · coil(C)=3

```
CEHHHHEGHECEEGEHHEHHEHEGEGEEGEHGGHHGHHHHHHHHHHHEEGGHEEGEGHHEHEHC
```

## Backbone H-bond Network

- total=45 · helix(i→i+4)=13 · sheet=32
  - V5 ↔ Q9  (helix)
  - A16 ↔ V20  (helix)
  - G31 ↔ E35  (helix)
  - A34 ↔ P38  (helix)
  - E35 ↔ R39  (helix)
  - I37 ↔ V41  (helix)
  - P38 ↔ S42  (helix)
  - R39 ↔ M43  (helix)
  - L40 ↔ Q44  (helix)
  - V41 ↔ V45  (helix)
  - S42 ↔ N46  (helix)
  - M43 ↔ R47  (helix)
  - M59 ↔ Y63  (helix)
  - Q2 ↔ A7  (sheet)
  - A7 ↔ P12  (sheet)
  - A7 ↔ T15  (sheet)
  - A7 ↔ T18  (sheet)
  - A7 ↔ M21  (sheet)
  - A7 ↔ R23  (sheet)
  - L10 ↔ T15  (sheet)
  - … +25 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=22 · exposed=21 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=419 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=296 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=6.924 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=30 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 54 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
