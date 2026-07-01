# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1MSI\sequence\1MSI.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1MSI\seeds\seed_4\1MSI.pdb`
- residues: 64
- mode: oracle
- ca_rmsd: 3.897 A
- tm_score_ca_ordered: 0.4719018556374353
- heavy_atom_rmsd: 5.219 A
- sidechain_heavy_atom_rmsd: 6.362 A
- **all-atom quality (honest):** heavy 5.219 A, sidechain 6.362 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/54 (0.0)
- lj_severe: 0
- lj_near: 22
- distogram_pairs: 612
- bin_accuracy: 0.444

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=36
- rigid_domain_reconvergence: applied=True accepted=5 rmsd=4.453853397497122 -> 4.019716834102705 A
- topology_reconvergence: applied=True accepted=1/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 3.8967763526534194
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 3.8968237876318836  localized_anchor_rmsd: 3.8968237876318836

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** L17-P29 → 59 conflicts (84%); A64 → 4 conflicts (6%)
- explained: 63/70 conflicts by 2 root cause(s)
- metrics: hubs=29 (frac 0.453), conflicts/hub=2.4, max_incompat=5.03Å, chain_span=0.922
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): L17-P29 + A64 — explain ~63/70 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **I32** — severity 11.58, 7 conflict(s); suspect input ~`A64` (group: pull_in)
  - pull-in (wants closer): D58@9.6Å(now 12.3,conf 0.55), V60@9.7Å(now 12.8,conf 0.55), A64@10.1Å(now 15.3,conf 0.55)
  - T28↔A64: targets 12.0/10.1Å but partners are 26.2Å apart → too_far_apart by 4.1Å
  - V27↔A64: targets 10.9/10.1Å but partners are 24.2Å apart → too_far_apart by 3.2Å
  - E25↔A64: targets 11.0/10.1Å but partners are 24.2Å apart → too_far_apart by 3.2Å
- **M21** — severity 10.91, 4 conflict(s); suspect input ~`E25` (group: push_out)
  - push-out (wants farther): V27@17.0Å(now 14.0,conf 1.00), T28@19.0Å(now 14.6,conf 1.00), T18@6.6Å(now 0.6,conf 0.79), P50@10.8Å(now 4.1,conf 0.55), L51@9.2Å(now 4.5,conf 0.55), L55@10.7Å(now 7.7,conf 0.55)
  - E25↔V27: targets 13.0/17.0Å but partners are 0.3Å apart → too_close_together by 3.6Å
  - E25↔T28: targets 13.0/19.0Å but partners are 2.7Å apart → too_close_together by 3.3Å
  - T28↔S24: targets 19.0/10.9Å but partners are 5.4Å apart → too_close_together by 2.7Å
- **V27** — severity 10.87, 5 conflict(s); suspect input ~`V20` (group: push_out)
  - push-out (wants farther): M21@17.0Å(now 14.0,conf 1.00), S24@9.0Å(now 4.5,conf 0.99), V20@18.9Å(now 11.3,conf 0.91), M22@13.1Å(now 10.5,conf 0.91), R23@11.4Å(now 7.9,conf 0.79), Q9@16.4Å(now 13.1,conf 0.55)
  - V20↔T53: targets 18.9/9.6Å but partners are 4.2Å apart → too_close_together by 5.0Å
  - S24↔V20: targets 9.0/18.9Å but partners are 7.1Å apart → too_close_together by 2.8Å
  - V20↔M22: targets 18.9/13.1Å but partners are 3.2Å apart → too_close_together by 2.5Å
- **V20** — severity 8.95, 3 conflict(s); suspect input ~`V27` (group: push_out)
  - push-out (wants farther): S24@11.0Å(now 7.1,conf 1.00), V27@18.9Å(now 11.3,conf 0.91), V26@18.0Å(now 14.0,conf 0.55), N8@7.0Å(now 4.4,conf 0.55), E25@14.3Å(now 11.4,conf 0.55)
  - R23↔V27: targets 7.0/18.9Å but partners are 7.9Å apart → too_close_together by 3.9Å
  - S24↔V27: targets 11.0/18.9Å but partners are 4.5Å apart → too_close_together by 3.4Å
  - V27↔E25: targets 18.9/14.3Å but partners are 0.3Å apart → too_close_together by 4.2Å
- **M22** — severity 8.32, 5 conflict(s); suspect input ~`E25` (group: push_out)
  - push-out (wants farther): T28@17.0Å(now 11.4,conf 1.00), P29@17.0Å(now 13.2,conf 1.00), V27@13.1Å(now 10.5,conf 0.91), L19@5.7Å(now 3.0,conf 0.55), L51@9.8Å(now 7.1,conf 0.55)
  - T28↔E25: targets 17.0/10.6Å but partners are 2.7Å apart → too_close_together by 3.8Å
  - P29↔A7: targets 17.0/5.1Å but partners are 8.8Å apart → too_close_together by 3.2Å
  - V27↔E25: targets 13.1/10.6Å but partners are 0.3Å apart → too_close_together by 2.2Å
- **G52** — severity 8.21, 5 conflict(s); suspect input ~`T18` (group: push_out)
  - push-out (wants farther): R39@19.6Å(now 15.5,conf 0.57), P29@12.9Å(now 9.2,conf 0.55), T18@15.5Å(now 9.1,conf 0.55)
  - T18↔M21: targets 15.5/10.2Å but partners are 0.6Å apart → too_close_together by 4.7Å
  - R39↔M22: targets 19.6/9.4Å but partners are 6.9Å apart → too_close_together by 3.3Å
  - A7↔T18: targets 5.1/15.5Å but partners are 7.7Å apart → too_close_together by 2.8Å

## Secondary Structure (DSSP-like)

- helix(H)=29 · strand(E)=23 · 3-10(G)=8 · coil(C)=4

```
CEEEEGGHGCEGHGEEGHHHHEHEEHEHGHEHGEHEHHEHHCEEEHEHHEHHHEHHEHHEHHHC
```

## Backbone H-bond Network

- total=57 · helix(i→i+4)=9 · sheet=48
  - L19 ↔ R23  (helix)
  - V26 ↔ V30  (helix)
  - T28 ↔ I32  (helix)
  - I37 ↔ V41  (helix)
  - A48 ↔ G52  (helix)
  - V49 ↔ T53  (helix)
  - G52 ↔ M56  (helix)
  - D58 ↔ G62  (helix)
  - M59 ↔ Y63  (helix)
  - S4 ↔ M22  (sheet)
  - S4 ↔ S24  (sheet)
  - V5 ↔ I11  (sheet)
  - V5 ↔ M22  (sheet)
  - V5 ↔ S24  (sheet)
  - V5 ↔ E25  (sheet)
  - I11 ↔ A16  (sheet)
  - I11 ↔ M22  (sheet)
  - A16 ↔ M22  (sheet)
  - M22 ↔ V27  (sheet)
  - M22 ↔ G31  (sheet)
  - … +37 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=23 · exposed=13 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=347 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=238 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=4.0767 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=22 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 54 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
