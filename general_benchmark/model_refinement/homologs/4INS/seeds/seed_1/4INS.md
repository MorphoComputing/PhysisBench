# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\4INS\sequence\4INS.pdb`
- output_pdb: `general_benchmark\model_refinement\homologs\4INS\seeds\seed_1\4INS.pdb`
- residues: 94
- mode: oracle
- ca_rmsd: 10.785 A
- tm_score_ca_ordered: 0.21762060601916544
- heavy_atom_rmsd: 11.988 A
- sidechain_heavy_atom_rmsd: 13.176 A
- **all-atom quality (honest):** heavy 11.988 A, sidechain 13.176 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 6/6
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/86 (0.0)
- lj_severe: 0
- lj_near: 49
- distogram_pairs: 911
- bin_accuracy: 0.404

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=rejected_lj_regression tested=48
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 10.78539389864167
- ga_delta_rmsd: -0.9887379963400882  ga_fitness_mode: energy
- pre_local_rmsd: 10.817655105554856  localized_anchor_rmsd: 10.785403136628034

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** C84 → 49 conflicts (32%); C10-L12 → 31 conflicts (20%); E78 → 16 conflicts (11%)
- explained: 96/151 conflicts by 3 root cause(s)
- metrics: hubs=34 (frac 0.362), conflicts/hub=4.4, max_incompat=5.74Å, chain_span=0.979
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): C84 + C10-L12 + E78 — explain ~96/151 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **E16** — severity 16.96, 17 conflict(s); suspect input ~`C84` (group: pull_in)
  - pull-in (wants closer): C84@8.8Å(now 15.4,conf 0.34), F90@10.0Å(now 12.9,conf 0.34), E78@11.0Å(now 14.6,conf 0.34), Y91@11.8Å(now 14.3,conf 0.34)
  - push-out (wants farther): Q22@15.5Å(now 11.2,conf 0.34), N21@15.4Å(now 8.9,conf 0.34), H23@15.2Å(now 11.6,conf 0.34), A32@10.0Å(now 7.2,conf 0.34), E31@13.3Å(now 9.6,conf 0.34), L24@13.2Å(now 10.6,conf 0.34), V20@12.1Å(now 4.8,conf 0.34)
  - Y13↔C84: targets 5.6/8.8Å but partners are 20.1Å apart → too_far_apart by 5.7Å
  - L12↔N21: targets 6.4/15.4Å but partners are 3.7Å apart → too_close_together by 5.3Å
  - C84↔R87: targets 8.8/15.6Å but partners are 2.8Å apart → too_close_together by 4.1Å
- **N17** — severity 10.04, 10 conflict(s); suspect input ~`V20` (group: pull_in)
  - pull-in (wants closer): C84@10.4Å(now 14.3,conf 0.34)
  - push-out (wants farther): N21@18.2Å(now 12.1,conf 0.37), Q22@17.9Å(now 13.8,conf 0.36), H23@16.9Å(now 13.5,conf 0.35), V20@15.4Å(now 8.1,conf 0.34), E31@14.9Å(now 11.1,conf 0.34), L24@14.3Å(now 11.4,conf 0.34), V30@13.4Å(now 10.6,conf 0.34), L29@13.0Å(now 10.4,conf 0.34), A32@12.1Å(now 8.8,conf 0.34)
  - N21↔L12: targets 18.2/9.3Å but partners are 3.7Å apart → too_close_together by 5.2Å
  - Y13↔V20: targets 7.8/15.4Å but partners are 3.8Å apart → too_close_together by 3.8Å
  - Q14↔N21: targets 6.4/18.2Å but partners are 8.6Å apart → too_close_together by 3.2Å
- **L15** — severity 9.97, 10 conflict(s); suspect input ~`C84` (group: pull_in)
  - pull-in (wants closer): F90@9.6Å(now 12.5,conf 0.34), C84@10.2Å(now 14.8,conf 0.34), Y91@10.2Å(now 13.3,conf 0.34), E78@10.4Å(now 14.3,conf 0.34)
  - push-out (wants farther): V20@10.7Å(now 5.7,conf 0.34), N21@13.3Å(now 8.2,conf 0.34), E31@11.2Å(now 8.7,conf 0.34), Q22@12.8Å(now 9.5,conf 0.34), H23@11.8Å(now 9.1,conf 0.34)
  - C10↔C84: targets 9.7/10.2Å but partners are 24.2Å apart → too_far_apart by 4.3Å
  - C10↔E78: targets 9.7/10.4Å but partners are 24.2Å apart → too_far_apart by 4.0Å
  - L12↔N21: targets 5.6/13.3Å but partners are 3.7Å apart → too_close_together by 4.0Å
- **A32** — severity 9.03, 10 conflict(s); suspect input ~`C10` (group: pull_in)
  - pull-in (wants closer): E78@5.8Å(now 10.1,conf 0.42), C84@9.1Å(now 12.1,conf 0.34)
  - push-out (wants farther): E16@10.0Å(now 7.2,conf 0.34), N21@10.7Å(now 8.1,conf 0.34), N17@12.1Å(now 8.8,conf 0.34)
  - E78↔C10: targets 5.8/12.7Å but partners are 24.2Å apart → too_far_apart by 5.7Å
  - E78↔C6: targets 5.8/12.1Å but partners are 21.1Å apart → too_far_apart by 3.2Å
  - E78↔C5: targets 5.8/13.1Å but partners are 22.0Å apart → too_far_apart by 3.1Å
- **V83** — severity 7.12, 9 conflict(s); suspect input ~`C10` (group: pull_in)
  - pull-in (wants closer): L12@8.3Å(now 12.1,conf 0.35), C10@15.0Å(now 19.8,conf 0.34), Y13@10.0Å(now 13.5,conf 0.34), S11@12.1Å(now 15.4,conf 0.34)
  - push-out (wants farther): G26@16.8Å(now 14.1,conf 0.35), Y18@8.2Å(now 5.6,conf 0.35), P93@16.0Å(now 11.1,conf 0.34), F90@8.9Å(now 5.0,conf 0.34), S27@14.7Å(now 12.1,conf 0.34), V30@10.1Å(now 7.0,conf 0.34), Y91@11.3Å(now 7.0,conf 0.34), G88@12.9Å(now 9.7,conf 0.34), R87@11.5Å(now 8.6,conf 0.34), T92@12.8Å(now 9.4,conf 0.34)
  - E78↔C10: targets 5.8/15.0Å but partners are 24.2Å apart → too_far_apart by 3.4Å
  - E78↔Y13: targets 5.8/10.0Å but partners are 18.9Å apart → too_far_apart by 3.1Å
  - E86↔C10: targets 9.2/15.0Å but partners are 27.3Å apart → too_far_apart by 3.0Å
- **Y18** — severity 5.95, 7 conflict(s); suspect input ~`N21` (group: push_out)
  - pull-in (wants closer): F90@5.7Å(now 8.7,conf 0.43), Y91@6.9Å(now 10.4,conf 0.37), C84@8.6Å(now 11.7,conf 0.35), E78@9.8Å(now 12.5,conf 0.34), T92@10.2Å(now 13.2,conf 0.34)
  - push-out (wants farther): N21@18.1Å(now 13.0,conf 0.36), Q22@17.1Å(now 13.8,conf 0.35), V83@8.2Å(now 5.6,conf 0.35), H23@16.1Å(now 13.5,conf 0.34)
  - L15↔N21: targets 5.9/18.1Å but partners are 8.2Å apart → too_close_together by 4.0Å
  - N21↔L12: targets 18.1/10.3Å but partners are 3.7Å apart → too_close_together by 4.1Å
  - F90↔Y13: targets 5.7/10.1Å but partners are 17.7Å apart → too_far_apart by 1.9Å

## Secondary Structure (DSSP-like)

- helix(H)=58 · strand(E)=24 · 3-10(G)=10 · coil(C)=2

```
CGHHEGCEHHEHHHHHHHHEEEEGHEHHHHHEHGHHHEHEHHHEEHHHHHEGHGEHHEHHGHHHHHHEHHHHEHHHEHEHHGHHHEGHHHEEGE
```

## Backbone H-bond Network

- total=92 · helix(i→i+4)=32 · sheet=60
  - I9 ↔ Y13  (helix)
  - C10 ↔ Q14  (helix)
  - L12 ↔ E16  (helix)
  - Y13 ↔ N17  (helix)
  - Q14 ↔ Y18  (helix)
  - L15 ↔ C19  (helix)
  - C25 ↔ L29  (helix)
  - S27 ↔ E31  (helix)
  - L29 ↔ L33  (helix)
  - E31 ↔ L35  (helix)
  - L33 ↔ C37  (helix)
  - L35 ↔ E39  (helix)
  - C37 ↔ G41  (helix)
  - E39 ↔ F43  (helix)
  - F42 ↔ P46  (helix)
  - F43 ↔ K47  (helix)
  - P46 ↔ E50  (helix)
  - C53 ↔ C57  (helix)
  - I56 ↔ Y60  (helix)
  - L59 ↔ E63  (helix)
  - … +72 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=33 · exposed=31 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=864 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=661 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.4556 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=49 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=6: C5–C10, C6–C25, C19–C37, C52–C57, C53–C72, C66–C84

## Side-chain Rotamers (χ1/χ2)

- 86 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
