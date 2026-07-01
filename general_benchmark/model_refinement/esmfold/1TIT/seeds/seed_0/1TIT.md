# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1TIT\sequence\1TIT.pdb`
- output_pdb: `general_benchmark\model_refinement\esmfold\1TIT\seeds\seed_0\1TIT.pdb`
- residues: 87
- mode: oracle
- ca_rmsd: 1.235 A
- tm_score_ca_ordered: 0.8945518293823491
- heavy_atom_rmsd: 2.943 A
- sidechain_heavy_atom_rmsd: 3.781 A
- **all-atom quality (honest):** heavy 2.943 A, sidechain 3.781 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/73 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 3570
- bin_accuracy: 0.912

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=51
- rigid_domain_reconvergence: applied=True accepted=5 rmsd=1.2770840335582674 -> 1.177433116454952 A
- topology_reconvergence: applied=True accepted=0/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 1.2351442167217683
- ga_delta_rmsd: -0.10146927491138902  ga_fitness_mode: energy
- pre_local_rmsd: 1.248020117745764  localized_anchor_rmsd: 1.2351847968971805

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_NEAR_MISS_LT_1A`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** E87 → 46 conflicts (90%)
- explained: 46/51 conflicts by 1 root cause(s)
- metrics: hubs=23 (frac 0.264), conflicts/hub=2.2, max_incompat=4.25Å, chain_span=0.874
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): E87 — explain ~46/51 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **F13** — severity 9.84, 9 conflict(s); suspect input ~`E87` (group: pull_in)
  - pull-in (wants closer): I1@27.5Å(now 33.7,conf 0.99), E26@27.5Å(now 32.9,conf 0.98), D28@27.5Å(now 32.3,conf 0.98), N76@27.5Å(now 32.5,conf 0.98), P27@27.5Å(now 32.1,conf 0.98), A75@27.4Å(now 32.3,conf 0.97), S25@27.4Å(now 31.5,conf 0.97), E2@27.4Å(now 31.3,conf 0.96), V29@27.4Å(now 31.4,conf 0.96)
  - I1↔E87: targets 27.5/6.1Å but partners are 37.3Å apart → too_far_apart by 3.8Å
  - E26↔E87: targets 27.5/6.1Å but partners are 37.3Å apart → too_far_apart by 3.7Å
  - D28↔E87: targets 27.5/6.1Å but partners are 36.9Å apart → too_far_apart by 3.4Å
- **V14** — severity 9.29, 8 conflict(s); suspect input ~`E87` (group: pull_in)
  - pull-in (wants closer): I1@27.5Å(now 34.7,conf 0.99), E26@27.5Å(now 34.0,conf 0.99), S25@27.5Å(now 33.0,conf 0.99), P27@27.5Å(now 33.0,conf 0.99), N76@27.5Å(now 33.1,conf 0.98), D28@27.5Å(now 32.8,conf 0.98), E2@27.5Å(now 32.6,conf 0.98), A75@27.5Å(now 32.7,conf 0.98), V29@27.4Å(now 31.7,conf 0.97), G52@27.4Å(now 30.2,conf 0.94), A77@27.3Å(now 30.2,conf 0.93)
  - I1↔E87: targets 27.5/6.0Å but partners are 37.3Å apart → too_far_apart by 3.8Å
  - E26↔E87: targets 27.5/6.0Å but partners are 37.3Å apart → too_far_apart by 3.8Å
  - D28↔E87: targets 27.5/6.0Å but partners are 36.9Å apart → too_far_apart by 3.4Å
- **K53** — severity 5.45, 4 conflict(s); suspect input ~`P27` (group: pull_in)
  - pull-in (wants closer): E87@27.5Å(now 33.1,conf 0.99), K86@27.4Å(now 30.4,conf 0.94), L64@27.4Å(now 30.3,conf 0.94), G65@27.3Å(now 29.9,conf 0.92)
  - E87↔P27: targets 27.5/5.0Å but partners are 36.7Å apart → too_far_apart by 4.2Å
  - E87↔E26: targets 27.5/6.0Å but partners are 37.3Å apart → too_far_apart by 3.8Å
  - E87↔D28: targets 27.5/6.7Å but partners are 36.9Å apart → too_far_apart by 2.7Å
- **G52** — severity 3.94, 3 conflict(s); suspect input ~`P27` (group: pull_in)
  - pull-in (wants closer): E87@27.5Å(now 34.3,conf 0.99), K86@27.4Å(now 31.8,conf 0.97), L64@27.4Å(now 31.5,conf 0.96), G65@27.4Å(now 31.1,conf 0.95), V14@27.4Å(now 30.2,conf 0.94)
  - E87↔P27: targets 27.5/5.3Å but partners are 36.7Å apart → too_far_apart by 4.0Å
  - E87↔D28: targets 27.5/5.9Å but partners are 36.9Å apart → too_far_apart by 3.5Å
  - E87↔E26: targets 27.5/7.9Å but partners are 37.3Å apart → too_far_apart by 1.9Å
- **L64** — severity 2.96, 4 conflict(s); suspect input ~`E87` (group: pull_in)
  - pull-in (wants closer): E26@27.5Å(now 34.1,conf 0.99), P27@27.5Å(now 33.4,conf 0.99), I1@27.5Å(now 33.5,conf 0.99), S25@27.5Å(now 33.0,conf 0.98), D28@27.5Å(now 33.0,conf 0.98), E2@27.4Å(now 31.5,conf 0.97), G52@27.4Å(now 31.5,conf 0.96), V29@27.4Å(now 31.2,conf 0.96), N76@27.4Å(now 30.8,conf 0.95), A75@27.4Å(now 30.6,conf 0.94), K53@27.4Å(now 30.3,conf 0.94)
  - I1↔E87: targets 27.5/7.5Å but partners are 37.3Å apart → too_far_apart by 2.3Å
  - E26↔E87: targets 27.5/7.5Å but partners are 37.3Å apart → too_far_apart by 2.3Å
  - D28↔E87: targets 27.5/7.5Å but partners are 36.9Å apart → too_far_apart by 1.9Å
- **A77** — severity 2.15, 2 conflict(s); suspect input ~`I1` (group: pull_in)
  - pull-in (wants closer): E87@27.5Å(now 32.6,conf 0.98), G15@27.4Å(now 30.4,conf 0.94), V14@27.3Å(now 30.2,conf 0.93)
  - E87↔I1: targets 27.5/6.2Å but partners are 37.3Å apart → too_far_apart by 3.7Å
  - E87↔E2: targets 27.5/5.8Å but partners are 34.8Å apart → too_far_apart by 1.6Å

## Secondary Structure (DSSP-like)

- helix(H)=14 · strand(E)=40 · 3-10(G)=23 · coil(C)=10

```
CECHEECECGEEECHEEEEGEEEGHEEHEEGEEEGHHECEECEHHEGGGGECHEGGGGGEHGEHHHCEEGGGEEGHCEEGEEGGGEE
```

## Backbone H-bond Network

- total=57 · helix(i→i+4)=1 · sheet=56
  - N61 ↔ G65  (helix)
  - E2 ↔ I22  (sheet)
  - K5 ↔ E21  (sheet)
  - K5 ↔ I22  (sheet)
  - K5 ↔ E23  (sheet)
  - P6 ↔ E21  (sheet)
  - P6 ↔ I22  (sheet)
  - P6 ↔ E23  (sheet)
  - Y8 ↔ A18  (sheet)
  - Y8 ↔ H19  (sheet)
  - Y8 ↔ E21  (sheet)
  - Y8 ↔ I22  (sheet)
  - Y8 ↔ E23  (sheet)
  - E11 ↔ E16  (sheet)
  - E11 ↔ T17  (sheet)
  - E11 ↔ A18  (sheet)
  - E11 ↔ H19  (sheet)
  - V12 ↔ T17  (sheet)
  - V12 ↔ A18  (sheet)
  - V12 ↔ H19  (sheet)
  - … +37 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=35 · exposed=24 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=341 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=220 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.9101 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 73 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
