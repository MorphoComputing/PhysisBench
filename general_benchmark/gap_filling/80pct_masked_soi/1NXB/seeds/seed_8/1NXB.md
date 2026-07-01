# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1NXB\sequence\1NXB.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1NXB\seeds\seed_8\1NXB.pdb`
- residues: 60
- mode: oracle
- ca_rmsd: 7.034 A
- tm_score_ca_ordered: 0.317585039745787
- heavy_atom_rmsd: 8.036 A
- sidechain_heavy_atom_rmsd: 8.860 A
- **all-atom quality (honest):** heavy 8.036 A, sidechain 8.860 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 4/4
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/55 (0.0)
- lj_severe: 0
- lj_near: 6
- distogram_pairs: 546
- bin_accuracy: 0.650

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=global reason=rejected_local_chirality_regression tested=36
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 7.034283615004946
- ga_delta_rmsd: 0.8601358334463596  ga_fitness_mode: energy
- pre_local_rmsd: 7.036151832665006  localized_anchor_rmsd: 7.034342426183107

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** E57-N60 → 20 conflicts (67%); C16 → 5 conflicts (17%)
- explained: 25/30 conflicts by 2 root cause(s)
- metrics: hubs=13 (frac 0.217), conflicts/hub=2.3, max_incompat=4.04Å, chain_span=0.967
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): E57-N60 + C16 — explain ~25/30 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **S29** — severity 10.87, 5 conflict(s); suspect input ~`C16` (group: push_out)
  - push-out (wants farther): C16@26.6Å(now 22.8,conf 0.78)
  - I35↔C16: targets 6.9/26.6Å but partners are 16.3Å apart → too_close_together by 3.5Å
  - I36↔C16: targets 9.0/26.6Å but partners are 14.7Å apart → too_close_together by 2.9Å
  - C16↔E37: targets 26.6/11.1Å but partners are 11.4Å apart → too_close_together by 4.0Å
- **C2** — severity 8.14, 5 conflict(s); suspect input ~`E57` (group: pull_in)
  - pull-in (wants closer): E57@6.0Å(now 9.1,conf 0.55)
  - push-out (wants farther): L51@15.0Å(now 12.3,conf 0.55), E37@11.4Å(now 8.7,conf 0.55)
  - S8↔E57: targets 13.1/6.0Å but partners are 23.0Å apart → too_far_apart by 3.9Å
  - S7↔E57: targets 14.0/6.0Å but partners are 23.3Å apart → too_far_apart by 3.2Å
  - Q9↔E57: targets 13.8/6.0Å but partners are 22.9Å apart → too_far_apart by 3.1Å
- **Q11** — severity 5.04, 3 conflict(s); suspect input ~`V58` (group: pull_in)
  - pull-in (wants closer): V58@10.3Å(now 15.2,conf 0.55)
  - P18↔V58: targets 22.2/10.3Å but partners are 8.7Å apart → too_close_together by 3.3Å
  - S17↔V58: targets 19.0/10.3Å but partners are 5.5Å apart → too_close_together by 3.2Å
  - S8↔V58: targets 6.6/10.3Å but partners are 19.7Å apart → too_far_apart by 2.8Å
- **V58** — severity 4.26, 3 conflict(s); suspect input ~`Q11` (group: pull_in)
  - pull-in (wants closer): S7@15.0Å(now 19.8,conf 0.55), Q11@10.3Å(now 15.2,conf 0.55)
  - push-out (wants farther): P43@17.3Å(now 14.0,conf 0.55), C40@10.1Å(now 5.7,conf 0.55)
  - E55↔Q11: targets 8.6/10.3Å but partners are 22.5Å apart → too_far_apart by 3.6Å
  - P43↔Y24: targets 17.3/10.0Å but partners are 4.8Å apart → too_close_together by 2.5Å
  - C53↔P43: targets 11.1/17.3Å but partners are 4.5Å apart → too_close_together by 1.7Å
- **I36** — severity 3.67, 4 conflict(s); suspect input ~`C59` (group: pull_in)
  - pull-in (wants closer): C59@14.3Å(now 16.8,conf 0.55), Q9@10.1Å(now 13.2,conf 0.55)
  - push-out (wants farther): P18@23.8Å(now 21.1,conf 0.75), I1@17.7Å(now 14.2,conf 0.55), N4@9.9Å(now 7.4,conf 0.55)
  - F31↔C59: targets 13.6/14.3Å but partners are 29.8Å apart → too_far_apart by 1.8Å
  - C59↔G33: targets 14.3/10.1Å but partners are 26.2Å apart → too_far_apart by 1.8Å
  - R32↔C59: targets 12.5/14.3Å but partners are 28.4Å apart → too_far_apart by 1.6Å
- **N60** — severity 3.39, 3 conflict(s); suspect input ~`H6` (group: pull_in)
  - pull-in (wants closer): H6@11.3Å(now 14.7,conf 0.55)
  - push-out (wants farther): I1@10.7Å(now 5.5,conf 0.82), T44@16.4Å(now 13.7,conf 0.55), E20@14.1Å(now 7.0,conf 0.55)
  - E55↔H6: targets 8.9/11.3Å but partners are 22.5Å apart → too_far_apart by 2.3Å
  - S56↔H6: targets 9.0/11.3Å but partners are 22.3Å apart → too_far_apart by 2.0Å
  - C54↔H6: targets 7.0/11.3Å but partners are 20.2Å apart → too_far_apart by 1.9Å

## Secondary Structure (DSSP-like)

- helix(H)=13 · strand(E)=25 · 3-10(G)=14 · coil(C)=8

```
CHGGEEGEECEEEEGGEHGHGCEGCEECEEGHEHEHHEEHEHEHEEGGGGGECCHEEHHC
```

## Backbone H-bond Network

- total=48 · helix(i→i+4)=4 · sheet=44
  - R32 ↔ I36  (helix)
  - I36 ↔ C40  (helix)
  - C40 ↔ T44  (helix)
  - E55 ↔ C59  (helix)
  - Q5 ↔ Q11  (sheet)
  - Q5 ↔ T12  (sheet)
  - Q5 ↔ T13  (sheet)
  - Q5 ↔ K14  (sheet)
  - H6 ↔ Q11  (sheet)
  - H6 ↔ T12  (sheet)
  - H6 ↔ T13  (sheet)
  - H6 ↔ K26  (sheet)
  - S8 ↔ T13  (sheet)
  - S8 ↔ Q27  (sheet)
  - T13 ↔ C23  (sheet)
  - K14 ↔ C23  (sheet)
  - S17 ↔ C23  (sheet)
  - C23 ↔ R38  (sheet)
  - C23 ↔ G39  (sheet)
  - C23 ↔ G41  (sheet)
  - … +28 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=21 · exposed=19 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=245 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=166 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.0114 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=6 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=4: C2–C23, C16–C40, C42–C53, C54–C59

## Side-chain Rotamers (χ1/χ2)

- 55 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
