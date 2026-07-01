# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set/general_benchmark/1HPH/sequence/1HPH.pdb`
- output_pdb: `general_benchmark/evidence_ladder/80pct_masked/1HPH/seeds/seed_0/1HPH.pdb`
- residues: 35
- mode: oracle
- ca_rmsd: 5.529 A
- tm_score_ca_ordered: 0.16288240158705372
- heavy_atom_rmsd: 6.660 A
- sidechain_heavy_atom_rmsd: 7.635 A
- **all-atom quality (honest):** heavy 6.660 A, sidechain 7.635 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/33 (0.0)
- lj_severe: 0
- lj_near: 3
- distogram_pairs: 106
- bin_accuracy: 0.264

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=27
- rigid_domain_reconvergence: applied=True accepted=9 rmsd=6.1398852594838775 -> 5.4316220286195485 A
- topology_reconvergence: applied=True accepted=1/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 5.529458450315797
- ga_delta_rmsd: -0.6968778736943095  ga_fitness_mode: energy
- pre_local_rmsd: 5.529438441769024  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** V1-E3 → 14 conflicts (61%); E18-E21 → 5 conflicts (22%)
- explained: 19/23 conflicts by 2 root cause(s)
- metrics: hubs=12 (frac 0.343), conflicts/hub=1.9, max_incompat=8.03Å, chain_span=0.771
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): V1-E3 + E18-E21 — explain ~19/23 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **E18** — severity 8.69, 4 conflict(s); suspect input ~`L14` (group: push_out)
  - push-out (wants farther): V1@21.7Å(now 16.8,conf 0.62), S2@20.6Å(now 15.1,conf 0.59), Q5@18.3Å(now 11.8,conf 0.55), V30@17.4Å(now 11.4,conf 0.55), D29@15.9Å(now 9.3,conf 0.55), K26@11.8Å(now 6.7,conf 0.55)
  - L14↔Q5: targets 5.2/18.3Å but partners are 7.0Å apart → too_close_together by 6.0Å
  - V1↔L14: targets 21.7/5.2Å but partners are 12.3Å apart → too_close_together by 4.2Å
  - S2↔L14: targets 20.6/5.2Å but partners are 11.9Å apart → too_close_together by 3.5Å
- **L6** — severity 6.96, 2 conflict(s); suspect input ~`N9` (group: push_out)
  - push-out (wants farther): E21@20.2Å(now 15.5,conf 0.58), M17@19.6Å(now 12.1,conf 0.57)
  - M17↔N9: targets 19.6/5.1Å but partners are 6.5Å apart → too_close_together by 8.0Å
  - E21↔N9: targets 20.2/5.1Å but partners are 10.9Å apart → too_close_together by 4.2Å
- **V20** — severity 6.42, 2 conflict(s); suspect input ~`N15` (group: push_out)
  - push-out (wants farther): V1@25.9Å(now 17.2,conf 0.71), F33@17.9Å(now 15.3,conf 0.55), S16@6.6Å(now 3.8,conf 0.55), D29@14.3Å(now 11.2,conf 0.55)
  - V1↔N15: targets 25.9/8.7Å but partners are 10.4Å apart → too_close_together by 6.8Å
  - V1↔S16: targets 25.9/6.6Å but partners are 14.3Å apart → too_close_together by 5.0Å
- **K25** — severity 4.19, 3 conflict(s); suspect input ~`L14` (group: pull_in)
  - pull-in (wants closer): E21@6.5Å(now 9.2,conf 0.55)
  - push-out (wants farther): V1@27.5Å(now 24.2,conf 0.99), H8@20.4Å(now 16.0,conf 0.59), D29@6.4Å(now 3.6,conf 0.55), V30@8.9Å(now 6.4,conf 0.55)
  - H8↔L14: targets 20.4/12.7Å but partners are 4.9Å apart → too_close_together by 2.8Å
  - V1↔N15: targets 27.5/14.6Å but partners are 10.4Å apart → too_close_together by 2.5Å
  - V1↔L14: targets 27.5/12.7Å but partners are 12.3Å apart → too_close_together by 2.4Å
- **E3** — severity 3.60, 3 conflict(s); suspect input ~`L10` (group: pull_in)
  - pull-in (wants closer): L10@8.0Å(now 10.7,conf 0.55)
  - push-out (wants farther): L27@26.9Å(now 23.1,conf 0.82), E21@22.1Å(now 17.7,conf 0.64), W22@19.6Å(now 16.6,conf 0.57), R19@17.7Å(now 14.1,conf 0.55)
  - L27↔L10: targets 26.9/8.0Å but partners are 15.4Å apart → too_close_together by 3.5Å
  - E21↔M7: targets 22.1/5.8Å but partners are 14.8Å apart → too_close_together by 1.6Å
  - W22↔L10: targets 19.6/8.0Å but partners are 10.1Å apart → too_close_together by 1.6Å
- **V1** — severity 2.94, 2 conflict(s); suspect input ~`N9` (group: push_out)
  - push-out (wants farther): K25@27.5Å(now 24.2,conf 0.99), M17@23.2Å(now 17.4,conf 0.76), V20@25.9Å(now 17.2,conf 0.71), E18@21.7Å(now 16.8,conf 0.62)
  - M17↔N9: targets 23.2/13.6Å but partners are 6.5Å apart → too_close_together by 3.2Å
  - V20↔N9: targets 25.9/13.6Å but partners are 10.2Å apart → too_close_together by 2.2Å

## Secondary Structure (DSSP-like)

- helix(H)=20 · strand(E)=9 · 3-10(G)=4 · coil(C)=2

```
CEHHEHHEHHHHEHHHHHGHEEHEGHHHHEEGGHC
```

## Backbone H-bond Network

- total=18 · helix(i→i+4)=7 · sheet=11
  - E3 ↔ M7  (helix)
  - L6 ↔ L10  (helix)
  - M7 ↔ G11  (helix)
  - G11 ↔ N15  (helix)
  - K12 ↔ S16  (helix)
  - S16 ↔ V20  (helix)
  - L23 ↔ L27  (helix)
  - S2 ↔ H8  (sheet)
  - Q5 ↔ H13  (sheet)
  - H8 ↔ H13  (sheet)
  - H8 ↔ W22  (sheet)
  - H13 ↔ W22  (sheet)
  - H13 ↔ R24  (sheet)
  - E21 ↔ V30  (sheet)
  - W22 ↔ V30  (sheet)
  - W22 ↔ H31  (sheet)
  - R24 ↔ V30  (sheet)
  - R24 ↔ H31  (sheet)

## Solvent Accessibility (burial)

- buried=17 · exposed=11 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=122 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=31 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=3.363 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=3 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 33 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
