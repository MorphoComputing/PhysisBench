# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1MSI\sequence\1MSI.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm3\1MSI\seeds\seed_1\1MSI.pdb`
- residues: 64
- mode: oracle
- ca_rmsd: 1.948 A
- tm_score_ca_ordered: 0.7298088532196625
- heavy_atom_rmsd: 3.188 A
- sidechain_heavy_atom_rmsd: 4.065 A
- **all-atom quality (honest):** heavy 3.188 A, sidechain 4.065 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/54 (0.0)
- lj_severe: 0
- lj_near: 7
- distogram_pairs: 1891
- bin_accuracy: 0.309

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=39
- rigid_domain_reconvergence: applied=True accepted=8 rmsd=2.82051369279997 -> 2.533225215563363 A
- topology_reconvergence: applied=True accepted=4/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 1.9479007930124612
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 1.9614373307291952  localized_anchor_rmsd: 1.9478854519705395

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** A1-M22 → 840 conflicts (62%); T53-A64 → 357 conflicts (26%); V30-V41 → 108 conflicts (8%)
- explained: 1305/1358 conflicts by 3 root cause(s)
- metrics: hubs=64 (frac 1.0), conflicts/hub=21.2, max_incompat=9.36Å, chain_span=0.984
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): A1-M22 + T53-A64 + V30-V41 — explain ~1305/1358 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **A1** — severity 43.84, 51 conflict(s); suspect input ~`A34` (group: push_out)
  - pull-in (wants closer): N46@23.3Å(now 25.8,conf 0.38), R47@21.5Å(now 25.3,conf 0.28), S42@21.7Å(now 25.5,conf 0.29), K61@23.1Å(now 27.9,conf 0.36), T18@19.5Å(now 22.2,conf 0.21), L10@19.1Å(now 23.4,conf 0.20), A34@6.7Å(now 10.9,conf 0.29), P33@6.5Å(now 11.9,conf 0.31)
  - push-out (wants farther): V20@24.3Å(now 19.6,conf 0.46), L51@22.4Å(now 19.6,conf 0.32), N8@24.2Å(now 17.4,conf 0.45), T53@20.5Å(now 16.6,conf 0.24), I37@19.6Å(now 15.5,conf 0.22), L55@18.4Å(now 15.3,conf 0.19), G31@16.9Å(now 11.6,conf 0.16)
  - N8↔E25: targets 24.2/7.0Å but partners are 10.1Å apart → too_close_together by 7.1Å
  - N8↔V26: targets 24.2/5.9Å but partners are 13.2Å apart → too_close_together by 5.2Å
  - I37↔A34: targets 19.6/6.7Å but partners are 5.4Å apart → too_close_together by 7.5Å
- **R47** — severity 29.47, 38 conflict(s); suspect input ~`L55` (group: pull_in)
  - pull-in (wants closer): A1@21.5Å(now 25.3,conf 0.28), E25@16.8Å(now 21.2,conf 0.16), L55@8.2Å(now 12.0,conf 0.21), V60@6.2Å(now 10.1,conf 0.33)
  - push-out (wants farther): V27@22.2Å(now 19.3,conf 0.31), D36@24.2Å(now 17.7,conf 0.45), N14@8.8Å(now 6.1,conf 0.19), L40@17.3Å(now 14.7,conf 0.17), T54@16.3Å(now 11.8,conf 0.15), V41@18.3Å(now 15.5,conf 0.19), L17@18.4Å(now 14.3,conf 0.19)
  - D36↔V60: targets 24.2/6.2Å but partners are 9.8Å apart → too_close_together by 8.2Å
  - D36↔M59: targets 24.2/7.0Å but partners are 9.7Å apart → too_close_together by 7.5Å
  - D36↔L55: targets 24.2/8.2Å but partners are 7.4Å apart → too_close_together by 8.6Å
- **M22** — severity 26.89, 32 conflict(s); suspect input ~`L10` (group: push_out)
  - pull-in (wants closer): I32@6.8Å(now 10.8,conf 0.28), V49@7.3Å(now 9.8,conf 0.26), A34@7.7Å(now 10.5,conf 0.24), E35@5.9Å(now 12.4,conf 0.36), R39@8.8Å(now 12.2,conf 0.19), L10@7.8Å(now 10.3,conf 0.23)
  - push-out (wants farther): A7@7.3Å(now 4.1,conf 0.26), G62@20.3Å(now 16.9,conf 0.24), L55@10.0Å(now 6.0,conf 0.16), V30@16.6Å(now 14.0,conf 0.15), M43@16.8Å(now 13.0,conf 0.16), S42@17.8Å(now 12.8,conf 0.17)
  - E35↔L10: targets 5.9/7.8Å but partners are 22.1Å apart → too_far_apart by 8.5Å
  - N8↔E35: targets 6.0/5.9Å but partners are 17.1Å apart → too_far_apart by 5.3Å
  - E35↔Q9: targets 5.9/7.7Å but partners are 20.5Å apart → too_far_apart by 7.0Å
- **P57** — severity 26.87, 42 conflict(s); suspect input ~`A7` (group: pull_in)
  - pull-in (wants closer): S4@8.2Å(now 11.6,conf 0.21), A7@8.8Å(now 13.7,conf 0.19), V49@8.3Å(now 11.9,conf 0.21), K61@6.2Å(now 10.9,conf 0.33), V30@8.0Å(now 10.6,conf 0.22)
  - push-out (wants farther): V20@21.1Å(now 17.2,conf 0.27), L19@20.9Å(now 15.4,conf 0.26), S42@17.1Å(now 12.4,conf 0.16), E35@19.3Å(now 11.9,conf 0.21), V41@16.3Å(now 11.1,conf 0.15), A48@18.6Å(now 14.0,conf 0.19)
  - K61↔V30: targets 6.2/8.0Å but partners are 21.1Å apart → too_far_apart by 7.0Å
  - V49↔A48: targets 8.3/18.6Å but partners are 3.4Å apart → too_close_together by 7.0Å
  - S4↔K61: targets 8.2/6.2Å but partners are 20.4Å apart → too_far_apart by 6.1Å
- **E35** — severity 25.14, 32 conflict(s); suspect input ~`P57` (group: pull_in)
  - pull-in (wants closer): P12@20.0Å(now 22.9,conf 0.23), A48@16.6Å(now 22.1,conf 0.15), L10@16.8Å(now 22.1,conf 0.16), M22@5.9Å(now 12.4,conf 0.36), Q2@7.0Å(now 10.8,conf 0.27)
  - push-out (wants farther): V49@21.7Å(now 19.0,conf 0.29), Q44@21.9Å(now 18.2,conf 0.30), G62@19.6Å(now 15.3,conf 0.22), V60@17.8Å(now 13.6,conf 0.17), P57@19.3Å(now 11.9,conf 0.21)
  - L51↔M22: targets 21.1/5.9Å but partners are 7.7Å apart → too_close_together by 7.6Å
  - V49↔M22: targets 21.7/5.9Å but partners are 9.8Å apart → too_close_together by 6.0Å
  - Q9↔M22: targets 20.5/5.9Å but partners are 8.1Å apart → too_close_together by 6.5Å
- **V30** — severity 25.12, 40 conflict(s); suspect input ~`M59` (group: push_out)
  - pull-in (wants closer): G62@16.4Å(now 19.7,conf 0.15), S24@8.5Å(now 11.8,conf 0.20), V5@7.0Å(now 9.6,conf 0.27), D58@8.5Å(now 12.3,conf 0.20), P57@8.0Å(now 10.6,conf 0.22), M59@10.3Å(now 13.5,conf 0.15), V6@6.4Å(now 9.7,conf 0.31)
  - push-out (wants farther): L19@23.3Å(now 19.7,conf 0.38), N46@22.8Å(now 17.3,conf 0.35), P38@20.4Å(now 16.9,conf 0.24), M22@16.6Å(now 14.0,conf 0.15), V49@20.6Å(now 14.8,conf 0.25)
  - L19↔V5: targets 23.3/7.0Å but partners are 10.8Å apart → too_close_together by 5.5Å
  - L19↔V6: targets 23.3/6.4Å but partners are 12.4Å apart → too_close_together by 4.5Å
  - N46↔D58: targets 22.8/8.5Å but partners are 7.7Å apart → too_close_together by 6.6Å

## Secondary Structure (DSSP-like)

- helix(H)=23 · strand(E)=24 · 3-10(G)=10 · coil(C)=7

```
CEHHGGGHEGEGEHEECEHHHCEEECEEEGEEHGHHHHEHEHEHHHEGGHHHEGHECHEEHCEC
```

## Backbone H-bond Network

- total=38 · helix(i→i+4)=6 · sheet=32
  - S4 ↔ N8  (helix)
  - P33 ↔ I37  (helix)
  - P38 ↔ S42  (helix)
  - S42 ↔ N46  (helix)
  - N46 ↔ P50  (helix)
  - L51 ↔ L55  (helix)
  - Q9 ↔ T15  (sheet)
  - Q9 ↔ A16  (sheet)
  - Q9 ↔ T18  (sheet)
  - Q9 ↔ R23  (sheet)
  - I11 ↔ A16  (sheet)
  - I11 ↔ T18  (sheet)
  - I13 ↔ T18  (sheet)
  - T18 ↔ R23  (sheet)
  - T18 ↔ S24  (sheet)
  - R23 ↔ I32  (sheet)
  - S24 ↔ G31  (sheet)
  - S24 ↔ I32  (sheet)
  - E25 ↔ G31  (sheet)
  - E25 ↔ I32  (sheet)
  - … +18 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=10 · exposed=25 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=262 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=158 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.7923 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=7 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 54 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`1MSI.ensemble.pdb`)
- RMSF mean=0.35Å max=1.278Å (per-residue in .per_residue.csv)
- most flexible residues: 3, 43, 2, 25, 26

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1MSI.pae.csv`
- mean=0.229Å · max=1.518Å · AlphaFold-PAE analog (low block = rigid unit/domain)
