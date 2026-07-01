# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\4INS\sequence\4INS.pdb`
- output_pdb: `general_benchmark\model_refinement\homologs\4INS\seeds\seed_0\4INS.pdb`
- residues: 94
- mode: oracle
- ca_rmsd: 11.974 A
- tm_score_ca_ordered: 0.14966907515960087
- heavy_atom_rmsd: 13.036 A
- sidechain_heavy_atom_rmsd: 14.078 A
- **all-atom quality (honest):** heavy 13.036 A, sidechain 14.078 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 6/6
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/86 (0.0)
- lj_severe: 0
- lj_near: 50
- distogram_pairs: 911
- bin_accuracy: 0.595

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=rejected_lj_regression tested=48
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 11.973832706177763
- ga_delta_rmsd: -1.2639571677653674  ga_fitness_mode: energy
- pre_local_rmsd: 11.98201199077656  localized_anchor_rmsd: 11.973825184396052

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** Y18-C19 → 83 conflicts (69%); L82 → 28 conflicts (23%)
- explained: 111/121 conflicts by 2 root cause(s)
- metrics: hubs=26 (frac 0.277), conflicts/hub=4.7, max_incompat=6.53Å, chain_span=0.894
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): Y18-C19 + L82 — explain ~111/121 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **F90** — severity 18.42, 15 conflict(s); suspect input ~`V20` (group: push_out)
  - pull-in (wants closer): C19@5.5Å(now 15.2,conf 0.44), Y18@5.7Å(now 10.7,conf 0.43), N17@9.0Å(now 12.9,conf 0.34)
  - push-out (wants farther): E78@7.8Å(now 4.4,conf 0.36), C84@7.8Å(now 4.9,conf 0.35)
  - C19↔P93: targets 5.5/9.5Å but partners are 21.5Å apart → too_far_apart by 6.5Å
  - C19↔R87: targets 5.5/7.3Å but partners are 18.8Å apart → too_far_apart by 5.9Å
  - C19↔V20: targets 5.5/18.1Å but partners are 7.5Å apart → too_close_together by 5.0Å
- **G88** — severity 14.52, 13 conflict(s); suspect input ~`C19` (group: push_out)
  - pull-in (wants closer): C19@9.3Å(now 19.6,conf 0.34), N17@14.4Å(now 17.3,conf 0.34), L82@13.7Å(now 16.3,conf 0.34), Y18@10.9Å(now 15.4,conf 0.34)
  - push-out (wants farther): E78@10.2Å(now 7.4,conf 0.34)
  - V20↔C19: targets 22.4/9.3Å but partners are 7.5Å apart → too_close_together by 5.6Å
  - L12↔C19: targets 19.2/9.3Å but partners are 5.5Å apart → too_close_together by 4.4Å
  - Y13↔C19: targets 19.9/9.3Å but partners are 6.3Å apart → too_close_together by 4.3Å
- **I9** — severity 6.31, 6 conflict(s); suspect input ~`L12` (group: push_out)
  - push-out (wants farther): C19@19.4Å(now 13.6,conf 0.39), Y18@16.7Å(now 12.7,conf 0.35), N17@16.4Å(now 13.2,conf 0.35)
  - C19↔V20: targets 19.4/7.3Å but partners are 7.5Å apart → too_close_together by 4.6Å
  - C19↔L12: targets 19.4/9.1Å but partners are 5.5Å apart → too_close_together by 4.8Å
  - N17↔L12: targets 16.4/9.1Å but partners are 4.6Å apart → too_close_together by 2.7Å
- **Y91** — severity 6.29, 7 conflict(s); suspect input ~`C19` (group: push_out)
  - pull-in (wants closer): Y18@6.9Å(now 11.9,conf 0.37), C19@8.3Å(now 16.7,conf 0.35), N17@10.5Å(now 14.4,conf 0.34), I1@11.6Å(now 14.1,conf 0.34)
  - push-out (wants farther): R87@9.3Å(now 6.6,conf 0.34), E78@9.3Å(now 4.3,conf 0.34), C84@11.0Å(now 7.9,conf 0.34)
  - G88↔C19: targets 7.6/8.3Å but partners are 19.6Å apart → too_far_apart by 3.7Å
  - Y18↔V20: targets 6.9/18.4Å but partners are 8.1Å apart → too_close_together by 3.4Å
  - Y18↔L12: targets 6.9/14.7Å but partners are 5.0Å apart → too_close_together by 2.8Å
- **R87** — severity 5.55, 6 conflict(s); suspect input ~`C19` (group: push_out)
  - pull-in (wants closer): C19@10.2Å(now 18.8,conf 0.34), L82@11.5Å(now 15.2,conf 0.34), Y18@12.1Å(now 14.7,conf 0.34)
  - push-out (wants farther): Y91@9.3Å(now 6.6,conf 0.34)
  - V20↔C19: targets 21.3/10.2Å but partners are 7.5Å apart → too_close_together by 3.6Å
  - Y13↔C19: targets 19.9/10.2Å but partners are 6.3Å apart → too_close_together by 3.4Å
  - L12↔C19: targets 18.7/10.2Å but partners are 5.5Å apart → too_close_together by 3.0Å
- **E31** — severity 5.46, 6 conflict(s); suspect input ~`L82` (group: push_out)
  - pull-in (wants closer): L82@6.7Å(now 12.6,conf 0.38), E86@11.9Å(now 14.9,conf 0.34)
  - push-out (wants farther): S27@6.6Å(now 3.9,conf 0.39)
  - L82↔N17: targets 6.7/14.9Å but partners are 4.6Å apart → too_close_together by 3.6Å
  - S27↔L82: targets 6.6/6.7Å but partners are 16.2Å apart → too_far_apart by 2.9Å
  - L82↔G26: targets 6.7/9.5Å but partners are 18.8Å apart → too_far_apart by 2.6Å

## Secondary Structure (DSSP-like)

- helix(H)=59 · strand(E)=20 · 3-10(G)=10 · coil(C)=5

```
CHHHHGHEHHEHHGHHHHHECECEHEHHHHGGEGHHHEEHCHHEHEHEHHHGHEEHHGHEHHHHEHHGEHEHGHHHHHHHEHHHGHEHHHHHHC
```

## Backbone H-bond Network

- total=74 · helix(i→i+4)=24 · sheet=50
  - E3 ↔ T7  (helix)
  - I9 ↔ Y13  (helix)
  - L12 ↔ E16  (helix)
  - Y13 ↔ N17  (helix)
  - L15 ↔ C19  (helix)
  - C25 ↔ L29  (helix)
  - V36 ↔ R40  (helix)
  - F43 ↔ K47  (helix)
  - T45 ↔ V49  (helix)
  - K47 ↔ Q51  (helix)
  - V49 ↔ C53  (helix)
  - C53 ↔ C57  (helix)
  - C57 ↔ Q61  (helix)
  - L59 ↔ E63  (helix)
  - L62 ↔ C66  (helix)
  - E63 ↔ V67  (helix)
  - C66 ↔ H70  (helix)
  - H70 ↔ S74  (helix)
  - C72 ↔ L76  (helix)
  - S74 ↔ E78  (helix)
  - … +54 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=33 · exposed=35 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=793 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=589 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.3811 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=50 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=6: C5–C10, C6–C25, C19–C37, C52–C57, C53–C72, C66–C84

## Side-chain Rotamers (χ1/χ2)

- 86 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
