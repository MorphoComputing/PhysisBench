# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1MSI\sequence\1MSI.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm3\1MSI\seeds\seed_0\1MSI.pdb`
- residues: 64
- mode: oracle
- ca_rmsd: 2.328 A
- tm_score_ca_ordered: 0.6670530923022733
- heavy_atom_rmsd: 3.749 A
- sidechain_heavy_atom_rmsd: 4.724 A
- **all-atom quality (honest):** heavy 3.749 A, sidechain 4.724 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/54 (0.0)
- lj_severe: 0
- lj_near: 10
- distogram_pairs: 1891
- bin_accuracy: 0.299

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=45
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 2.3283918291137957
- ga_delta_rmsd: 0.250442062474189  ga_fitness_mode: energy
- pre_local_rmsd: 2.338325235686092  localized_anchor_rmsd: 2.3284091860186096

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** V30-Q44 → 736 conflicts (53%); A1-I11 → 340 conflicts (24%); T53-A64 → 188 conflicts (14%)
- explained: 1264/1391 conflicts by 3 root cause(s)
- metrics: hubs=64 (frac 1.0), conflicts/hub=21.7, max_incompat=9.68Å, chain_span=0.984
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): V30-Q44 + A1-I11 + T53-A64 — explain ~1264/1391 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **A1** — severity 52.60, 60 conflict(s); suspect input ~`A34` (group: pull_in)
  - pull-in (wants closer): R47@21.5Å(now 25.0,conf 0.28), S42@21.7Å(now 25.5,conf 0.29), K61@23.1Å(now 28.1,conf 0.36), T18@19.5Å(now 22.1,conf 0.21), L10@19.1Å(now 22.6,conf 0.20), Y63@20.6Å(now 23.5,conf 0.25), A34@6.7Å(now 11.9,conf 0.29), P33@6.5Å(now 12.8,conf 0.31)
  - push-out (wants farther): V49@24.1Å(now 21.4,conf 0.44), V20@24.3Å(now 19.5,conf 0.46), L51@22.4Å(now 19.2,conf 0.32), N8@24.2Å(now 16.8,conf 0.45), A7@19.2Å(now 16.0,conf 0.21), T53@20.5Å(now 15.9,conf 0.24), I37@19.6Å(now 16.3,conf 0.22), L55@18.4Å(now 14.8,conf 0.19), G31@16.9Å(now 12.0,conf 0.16)
  - N8↔E25: targets 24.2/7.0Å but partners are 9.4Å apart → too_close_together by 7.8Å
  - N8↔S4: targets 24.2/6.9Å but partners are 10.7Å apart → too_close_together by 6.6Å
  - V20↔E25: targets 24.3/7.0Å but partners are 10.8Å apart → too_close_together by 6.4Å
- **E35** — severity 28.84, 34 conflict(s); suspect input ~`P57` (group: push_out)
  - pull-in (wants closer): P12@20.0Å(now 22.8,conf 0.23), A48@16.6Å(now 21.7,conf 0.15), L10@16.8Å(now 22.2,conf 0.16), M22@5.9Å(now 12.5,conf 0.36), A3@8.8Å(now 11.4,conf 0.19), Q2@7.0Å(now 12.9,conf 0.27)
  - push-out (wants farther): V49@21.7Å(now 18.9,conf 0.29), Q44@21.9Å(now 17.7,conf 0.30), G62@19.6Å(now 14.6,conf 0.22), V60@17.8Å(now 13.6,conf 0.17), P57@19.3Å(now 11.7,conf 0.21)
  - L51↔M22: targets 21.1/5.9Å but partners are 7.2Å apart → too_close_together by 8.1Å
  - V49↔M22: targets 21.7/5.9Å but partners are 9.7Å apart → too_close_together by 6.1Å
  - Q9↔M22: targets 20.5/5.9Å but partners are 8.1Å apart → too_close_together by 6.5Å
- **P57** — severity 28.84, 45 conflict(s); suspect input ~`A7` (group: pull_in)
  - pull-in (wants closer): S4@8.2Å(now 12.5,conf 0.21), A7@8.8Å(now 14.0,conf 0.19), V49@8.3Å(now 12.0,conf 0.21), K61@6.2Å(now 11.5,conf 0.33), V5@9.0Å(now 11.7,conf 0.18), V6@10.3Å(now 13.1,conf 0.15)
  - push-out (wants farther): V20@21.1Å(now 17.3,conf 0.27), L19@20.9Å(now 15.3,conf 0.26), L51@18.4Å(now 15.7,conf 0.19), S42@17.1Å(now 11.7,conf 0.16), E35@19.3Å(now 11.7,conf 0.21), V41@16.3Å(now 11.3,conf 0.15), A48@18.6Å(now 13.7,conf 0.19)
  - K61↔V30: targets 6.2/8.0Å but partners are 20.9Å apart → too_far_apart by 6.8Å
  - V49↔A48: targets 8.3/18.6Å but partners are 3.1Å apart → too_close_together by 7.3Å
  - S4↔K61: targets 8.2/6.2Å but partners are 20.5Å apart → too_far_apart by 6.2Å
- **M22** — severity 28.56, 35 conflict(s); suspect input ~`L10` (group: push_out)
  - pull-in (wants closer): I32@6.8Å(now 10.8,conf 0.28), A34@7.7Å(now 10.8,conf 0.24), E35@5.9Å(now 12.5,conf 0.36), R39@8.8Å(now 12.1,conf 0.19), L10@7.8Å(now 10.3,conf 0.23)
  - push-out (wants farther): A7@7.3Å(now 4.3,conf 0.26), G62@20.3Å(now 16.3,conf 0.24), L55@10.0Å(now 6.5,conf 0.16), M43@16.8Å(now 13.4,conf 0.16), S42@17.8Å(now 12.6,conf 0.17)
  - E35↔L10: targets 5.9/7.8Å but partners are 22.2Å apart → too_far_apart by 8.6Å
  - N8↔E35: targets 6.0/5.9Å but partners are 17.3Å apart → too_far_apart by 5.4Å
  - E35↔Q9: targets 5.9/7.7Å but partners are 20.6Å apart → too_far_apart by 7.1Å
- **R47** — severity 28.29, 35 conflict(s); suspect input ~`L55` (group: pull_in)
  - pull-in (wants closer): A1@21.5Å(now 25.0,conf 0.28), E25@16.8Å(now 20.1,conf 0.16), L55@8.2Å(now 11.8,conf 0.21), V60@6.2Å(now 9.5,conf 0.33)
  - push-out (wants farther): V27@22.2Å(now 19.2,conf 0.31), D36@24.2Å(now 17.3,conf 0.45), N14@8.8Å(now 5.9,conf 0.19), L40@17.3Å(now 14.7,conf 0.17), T54@16.3Å(now 11.8,conf 0.15), V41@18.3Å(now 15.8,conf 0.19), L17@18.4Å(now 14.5,conf 0.19)
  - D36↔V60: targets 24.2/6.2Å but partners are 9.7Å apart → too_close_together by 8.3Å
  - D36↔M59: targets 24.2/7.0Å but partners are 9.3Å apart → too_close_together by 7.9Å
  - D36↔L55: targets 24.2/8.2Å but partners are 7.3Å apart → too_close_together by 8.7Å
- **A48** — severity 27.73, 47 conflict(s); suspect input ~`L55` (group: pull_in)
  - pull-in (wants closer): E35@16.6Å(now 21.7,conf 0.15), A3@17.6Å(now 21.4,conf 0.17), A64@17.2Å(now 21.2,conf 0.16), M59@8.2Å(now 12.1,conf 0.21), L55@9.3Å(now 11.8,conf 0.17), D58@10.0Å(now 12.7,conf 0.16), Q44@7.0Å(now 9.7,conf 0.27), V20@9.5Å(now 15.9,conf 0.17)
  - push-out (wants farther): A34@21.8Å(now 18.8,conf 0.30), V27@21.4Å(now 18.1,conf 0.28), I11@9.7Å(now 6.7,conf 0.17), S24@20.3Å(now 17.6,conf 0.24), I37@23.1Å(now 17.3,conf 0.37), S42@19.2Å(now 16.1,conf 0.21), I32@20.8Å(now 17.1,conf 0.26), A16@17.1Å(now 11.2,conf 0.16), V41@19.7Å(now 16.6,conf 0.22), P57@18.6Å(now 13.7,conf 0.19)
  - M59↔P57: targets 8.2/18.6Å but partners are 3.1Å apart → too_close_together by 7.3Å
  - I37↔L55: targets 23.1/9.3Å but partners are 6.6Å apart → too_close_together by 7.2Å
  - I37↔M59: targets 23.1/8.2Å but partners are 10.2Å apart → too_close_together by 4.7Å

## Secondary Structure (DSSP-like)

- helix(H)=27 · strand(E)=22 · 3-10(G)=7 · coil(C)=8

```
CEHHGGGHEHGGEHEECEHHHCEEECEEECEHHEHHHHHEHHEHHHEGGHHHEHHECHEEHCEC
```

## Backbone H-bond Network

- total=39 · helix(i→i+4)=9 · sheet=30
  - S4 ↔ N8  (helix)
  - L10 ↔ N14  (helix)
  - I32 ↔ D36  (helix)
  - P33 ↔ I37  (helix)
  - E35 ↔ R39  (helix)
  - I37 ↔ V41  (helix)
  - V41 ↔ V45  (helix)
  - N46 ↔ P50  (helix)
  - L51 ↔ L55  (helix)
  - Q9 ↔ T15  (sheet)
  - Q9 ↔ T18  (sheet)
  - Q9 ↔ R23  (sheet)
  - I13 ↔ T18  (sheet)
  - T18 ↔ R23  (sheet)
  - T18 ↔ S24  (sheet)
  - R23 ↔ A34  (sheet)
  - R23 ↔ L40  (sheet)
  - S24 ↔ G31  (sheet)
  - S24 ↔ A34  (sheet)
  - S24 ↔ L40  (sheet)
  - … +19 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=12 · exposed=24 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=269 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=159 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.8044 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=10 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 54 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
