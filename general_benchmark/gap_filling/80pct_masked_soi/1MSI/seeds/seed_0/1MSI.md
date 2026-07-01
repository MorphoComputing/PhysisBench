# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1MSI\sequence\1MSI.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1MSI\seeds\seed_0\1MSI.pdb`
- residues: 64
- mode: oracle
- ca_rmsd: 9.344 A
- tm_score_ca_ordered: 0.19062602956410168
- heavy_atom_rmsd: 10.323 A
- sidechain_heavy_atom_rmsd: 11.379 A
- **all-atom quality (honest):** heavy 10.323 A, sidechain 11.379 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/54 (0.0)
- lj_severe: 0
- lj_near: 5
- distogram_pairs: 612
- bin_accuracy: 0.528

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=global reason=rejected_local_chirality_regression tested=30
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 9.344130789344497
- ga_delta_rmsd: 0.7168321644308371  ga_fitness_mode: energy
- pre_local_rmsd: 9.461471474051738  localized_anchor_rmsd: 9.34403875784031

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** V60-A64 → 24 conflicts (44%); Q44 → 8 conflicts (14%); M56-P57 → 7 conflicts (13%)
- explained: 39/55 conflicts by 3 root cause(s)
- metrics: hubs=16 (frac 0.25), conflicts/hub=3.4, max_incompat=6.36Å, chain_span=0.859
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): V60-A64 + Q44 + M56-P57 — explain ~39/55 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **I32** — severity 18.88, 8 conflict(s); suspect input ~`A64` (group: pull_in)
  - pull-in (wants closer): V60@9.7Å(now 12.8,conf 0.55), A64@10.1Å(now 15.2,conf 0.55)
  - V26↔A64: targets 11.2/10.1Å but partners are 27.6Å apart → too_far_apart by 6.4Å
  - A1↔A64: targets 13.4/10.1Å but partners are 29.1Å apart → too_far_apart by 5.6Å
  - E25↔A64: targets 11.0/10.1Å but partners are 26.4Å apart → too_far_apart by 5.3Å
- **M56** — severity 16.50, 12 conflict(s); suspect input ~`V26` (group: push_out)
  - pull-in (wants closer): A1@17.0Å(now 20.5,conf 0.55), V26@13.7Å(now 17.3,conf 0.55)
  - push-out (wants farther): Q44@12.6Å(now 9.9,conf 0.55), T15@15.5Å(now 12.7,conf 0.55)
  - K61↔V26: targets 11.0/13.7Å but partners are 28.1Å apart → too_far_apart by 3.5Å
  - K61↔A1: targets 11.0/17.0Å but partners are 31.2Å apart → too_far_apart by 3.2Å
  - G62↔V26: targets 11.1/13.7Å but partners are 27.5Å apart → too_far_apart by 2.8Å
- **P57** — severity 13.21, 8 conflict(s); suspect input ~`Q2` (group: pull_in)
  - pull-in (wants closer): A1@18.9Å(now 23.4,conf 0.56), Q2@15.5Å(now 20.8,conf 0.55)
  - K61↔Q2: targets 9.0/15.5Å but partners are 28.6Å apart → too_far_apart by 4.1Å
  - A64↔Q2: targets 7.2/15.5Å but partners are 26.5Å apart → too_far_apart by 3.8Å
  - K61↔A1: targets 9.0/18.9Å but partners are 31.2Å apart → too_far_apart by 3.3Å
- **L17** — severity 6.90, 7 conflict(s); suspect input ~`Q44` (group: pull_in)
  - pull-in (wants closer): Q44@6.0Å(now 8.8,conf 0.55)
  - R23↔Q44: targets 11.1/6.0Å but partners are 19.4Å apart → too_far_apart by 2.4Å
  - Q44↔N8: targets 6.0/10.9Å but partners are 18.9Å apart → too_far_apart by 2.0Å
  - V20↔Q44: targets 8.9/6.0Å but partners are 16.6Å apart → too_far_apart by 1.8Å
- **T53** — severity 5.56, 4 conflict(s); suspect input ~`I13` (group: push_out)
  - push-out (wants farther): I13@13.6Å(now 10.3,conf 0.55), N14@16.1Å(now 13.6,conf 0.55)
  - P50↔I13: targets 5.4/13.6Å but partners are 4.8Å apart → too_close_together by 3.4Å
  - V49↔I13: targets 6.3/13.6Å but partners are 4.2Å apart → too_close_together by 3.1Å
  - V49↔N14: targets 6.3/16.1Å but partners are 7.7Å apart → too_close_together by 2.1Å
- **V5** — severity 4.69, 4 conflict(s); suspect input ~`N8` (group: pull_in)
  - pull-in (wants closer): A34@5.0Å(now 8.4,conf 0.57), G62@16.2Å(now 19.3,conf 0.55), V60@11.6Å(now 14.8,conf 0.55)
  - A34↔N8: targets 5.0/8.9Å but partners are 16.8Å apart → too_far_apart by 2.8Å
  - A34↔G52: targets 5.0/9.4Å but partners are 16.9Å apart → too_far_apart by 2.4Å
  - A34↔Q9: targets 5.0/11.9Å but partners are 18.8Å apart → too_far_apart by 1.8Å

## Secondary Structure (DSSP-like)

- helix(H)=15 · strand(E)=30 · 3-10(G)=12 · coil(C)=7

```
CEEGHEEHEGHEGCEEEEHHHEEEECEEHEEHGEHHCEEGGGEEGECCHEHCGEEGGGHEHEHE
```

## Backbone H-bond Network

- total=59 · helix(i→i+4)=2 · sheet=57
  - I32 ↔ D36  (helix)
  - M59 ↔ Y63  (helix)
  - A3 ↔ M22  (sheet)
  - A3 ↔ R23  (sheet)
  - V6 ↔ P12  (sheet)
  - V6 ↔ L17  (sheet)
  - V6 ↔ T18  (sheet)
  - V6 ↔ M22  (sheet)
  - V6 ↔ R23  (sheet)
  - V6 ↔ S24  (sheet)
  - V6 ↔ E25  (sheet)
  - A7 ↔ P12  (sheet)
  - A7 ↔ L17  (sheet)
  - A7 ↔ T18  (sheet)
  - A7 ↔ M22  (sheet)
  - A7 ↔ R23  (sheet)
  - A7 ↔ S24  (sheet)
  - A7 ↔ E25  (sheet)
  - A7 ↔ V27  (sheet)
  - Q9 ↔ T15  (sheet)
  - … +39 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=13 · exposed=17 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=241 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=133 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.183 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=5 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 54 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
