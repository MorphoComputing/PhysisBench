# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\5WOW\sequence\5WOW.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\5WOW\seeds\seed_3\5WOW.pdb`
- residues: 37
- mode: oracle
- ca_rmsd: 5.512 A
- tm_score_ca_ordered: 0.27096829208107337
- heavy_atom_rmsd: 7.038 A
- sidechain_heavy_atom_rmsd: 8.238 A
- **all-atom quality (honest):** heavy 7.038 A, sidechain 8.238 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/31 (0.0)
- lj_severe: 0
- lj_near: 12
- distogram_pairs: 247
- bin_accuracy: 0.482

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=global reason=rejected_local_chirality_regression tested=30
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 5.511770587228668
- ga_delta_rmsd: 1.1348249635794376  ga_fitness_mode: energy
- pre_local_rmsd: 5.511814653028073  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** C20-I21 → 16 conflicts (50%); P4 → 8 conflicts (25%)
- explained: 24/32 conflicts by 2 root cause(s)
- metrics: hubs=10 (frac 0.27), conflicts/hub=3.2, max_incompat=4.98Å, chain_span=0.595
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): C20-I21 + P4 — explain ~24/32 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **R11** — severity 13.78, 10 conflict(s); suspect input ~`I21` (group: push_out)
  - push-out (wants farther): P4@19.0Å(now 14.2,conf 0.99), K5@17.0Å(now 14.4,conf 0.99), G1@16.9Å(now 13.2,conf 0.55)
  - P4↔C16: targets 19.0/9.0Å but partners are 7.7Å apart → too_close_together by 2.3Å
  - P4↔I21: targets 19.0/9.9Å but partners are 5.0Å apart → too_close_together by 4.1Å
  - P4↔C22: targets 19.0/7.2Å but partners are 8.7Å apart → too_close_together by 3.1Å
- **D15** — severity 8.35, 4 conflict(s); suspect input ~`P4` (group: push_out)
  - push-out (wants farther): G1@14.8Å(now 9.0,conf 0.55), P4@15.4Å(now 10.9,conf 0.55)
  - I21↔P4: targets 5.4/15.4Å but partners are 5.0Å apart → too_close_together by 5.0Å
  - I21↔G1: targets 5.4/14.8Å but partners are 5.4Å apart → too_close_together by 3.9Å
  - C20↔P4: targets 7.4/15.4Å but partners are 4.1Å apart → too_close_together by 3.9Å
- **S14** — severity 5.86, 2 conflict(s); suspect input ~`I21` (group: push_out)
  - push-out (wants farther): R9@11.0Å(now 7.2,conf 0.99), L7@15.0Å(now 10.3,conf 0.94), Q8@12.9Å(now 10.2,conf 0.91)
  - L7↔I21: targets 15.0/6.6Å but partners are 3.9Å apart → too_close_together by 4.5Å
  - L7↔C20: targets 15.0/8.6Å but partners are 3.5Å apart → too_close_together by 2.9Å
- **D13** — severity 5.41, 3 conflict(s); suspect input ~`C20` (group: push_out)
  - push-out (wants farther): C10@7.0Å(now 3.0,conf 0.99), L7@14.9Å(now 8.9,conf 0.94), R9@10.6Å(now 4.4,conf 0.79), I6@15.3Å(now 11.5,conf 0.55), Q8@11.4Å(now 6.9,conf 0.55), V2@13.6Å(now 9.5,conf 0.55)
  - L7↔C20: targets 14.9/8.0Å but partners are 3.5Å apart → too_close_together by 3.4Å
  - C20↔I6: targets 8.0/15.3Å but partners are 3.8Å apart → too_close_together by 3.5Å
  - C20↔V2: targets 8.0/13.6Å but partners are 3.6Å apart → too_close_together by 2.0Å
- **R23** — severity 4.83, 4 conflict(s); suspect input ~`P4` (group: push_out)
  - push-out (wants farther): G26@6.9Å(now 3.1,conf 0.91), Y27@6.6Å(now 3.4,conf 0.79), V2@11.3Å(now 8.1,conf 0.55), P4@15.7Å(now 10.3,conf 0.55), L7@11.7Å(now 8.4,conf 0.55)
  - C28↔P4: targets 6.2/15.7Å but partners are 6.5Å apart → too_close_together by 3.0Å
  - G29↔P4: targets 7.0/15.7Å but partners are 6.4Å apart → too_close_together by 2.3Å
  - V2↔P4: targets 11.3/15.7Å but partners are 2.4Å apart → too_close_together by 2.0Å
- **I6** — severity 4.65, 2 conflict(s); suspect input ~`D36` (group: push_out)
  - push-out (wants farther): R12@17.0Å(now 13.5,conf 0.99), V2@10.1Å(now 3.8,conf 0.67), A19@12.8Å(now 4.8,conf 0.55), D13@15.3Å(now 11.5,conf 0.55), G1@13.3Å(now 3.9,conf 0.55), G18@11.7Å(now 7.1,conf 0.55), D36@15.8Å(now 12.4,conf 0.55)
  - D33↔D36: targets 8.3/15.8Å but partners are 2.8Å apart → too_close_together by 4.7Å
  - P31↔D36: targets 5.9/15.8Å but partners are 6.1Å apart → too_close_together by 3.8Å

## Secondary Structure (DSSP-like)

- helix(H)=14 · strand(E)=14 · 3-10(G)=5 · coil(C)=4

```
CCHHEHEHGEGGHHHEEHEEECECGGEHEEHHEHHHE
```

## Backbone H-bond Network

- total=48 · helix(i→i+4)=5 · sheet=43
  - P4 ↔ Q8  (helix)
  - S14 ↔ G18  (helix)
  - C28 ↔ Y32  (helix)
  - P31 ↔ P35  (helix)
  - Y32 ↔ D36  (helix)
  - K5 ↔ C10  (sheet)
  - K5 ↔ C16  (sheet)
  - K5 ↔ P17  (sheet)
  - K5 ↔ A19  (sheet)
  - K5 ↔ C20  (sheet)
  - K5 ↔ I21  (sheet)
  - K5 ↔ R23  (sheet)
  - L7 ↔ C16  (sheet)
  - L7 ↔ P17  (sheet)
  - L7 ↔ A19  (sheet)
  - L7 ↔ C20  (sheet)
  - L7 ↔ I21  (sheet)
  - L7 ↔ R23  (sheet)
  - L7 ↔ Y27  (sheet)
  - C10 ↔ C16  (sheet)
  - … +28 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=16 · exposed=13 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=196 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=119 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=4.2358 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=12 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C20, C10–C22, C16–C28

## Side-chain Rotamers (χ1/χ2)

- 31 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
