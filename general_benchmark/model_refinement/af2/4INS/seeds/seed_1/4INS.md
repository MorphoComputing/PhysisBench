# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\4INS\sequence\4INS.pdb`
- output_pdb: `general_benchmark\model_refinement\af2\4INS\seeds\seed_1\4INS.pdb`
- residues: 94
- mode: oracle
- ca_rmsd: 10.341 A
- tm_score_ca_ordered: 0.21906717348114688
- heavy_atom_rmsd: 11.358 A
- sidechain_heavy_atom_rmsd: 12.409 A
- **all-atom quality (honest):** heavy 11.358 A, sidechain 12.409 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 6/6
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/86 (0.0)
- lj_severe: 0
- lj_near: 38
- distogram_pairs: 582
- bin_accuracy: 0.569

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=rejected_domain_topology_regression tested=54
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 10.341450725361529
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 10.361590293314942  localized_anchor_rmsd: 10.34144110133695

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** K94 → 54 conflicts (26%); L71-G73 → 49 conflicts (24%); E86-G88 → 28 conflicts (14%)
- explained: 131/208 conflicts by 3 root cause(s)
- metrics: hubs=34 (frac 0.362), conflicts/hub=6.1, max_incompat=13.97Å, chain_span=0.819
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): K94 + L71-G73 + E86-G88 — explain ~131/208 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **E86** — severity 27.83, 12 conflict(s); suspect input ~`L82` (group: push_out)
  - push-out (wants farther): V30@27.5Å(now 20.0,conf 1.00), L29@27.5Å(now 24.7,conf 1.00), S27@27.5Å(now 22.6,conf 1.00), C25@27.5Å(now 24.9,conf 0.99), Q61@27.0Å(now 11.7,conf 0.84), L71@23.7Å(now 11.7,conf 0.52), G73@21.9Å(now 11.0,conf 0.46), V67@22.7Å(now 4.8,conf 0.37), L76@18.4Å(now 7.9,conf 0.37), K94@16.0Å(now 12.6,conf 0.34), A79@12.5Å(now 8.0,conf 0.34)
  - Q61↔L82: targets 27.0/4.8Å but partners are 11.6Å apart → too_close_together by 10.6Å
  - L82↔V67: targets 4.8/22.7Å but partners are 3.9Å apart → too_close_together by 14.0Å
  - L71↔L80: targets 23.7/10.0Å but partners are 5.3Å apart → too_close_together by 8.5Å
- **L82** — severity 26.22, 11 conflict(s); suspect input ~`V67` (group: pull_in)
  - pull-in (wants closer): N17@27.5Å(now 31.3,conf 1.00)
  - push-out (wants farther): Q61@27.3Å(now 11.6,conf 0.92), L71@21.7Å(now 13.6,conf 0.46), G73@19.8Å(now 12.5,conf 0.40), K94@19.0Å(now 13.8,conf 0.38), G88@7.3Å(now 3.9,conf 0.36), V67@22.4Å(now 3.9,conf 0.36), L76@15.4Å(now 9.5,conf 0.34)
  - Q61↔E86: targets 27.3/4.8Å but partners are 11.7Å apart → too_close_together by 10.8Å
  - E86↔V67: targets 4.8/22.4Å but partners are 4.8Å apart → too_close_together by 12.7Å
  - G88↔V67: targets 7.3/22.4Å but partners are 4.9Å apart → too_close_together by 10.2Å
- **G73** — severity 17.02, 12 conflict(s); suspect input ~`L76` (group: push_out)
  - push-out (wants farther): Q61@27.3Å(now 14.3,conf 0.92), K94@27.2Å(now 18.5,conf 0.90), G88@22.3Å(now 14.1,conf 0.47), E86@21.9Å(now 11.0,conf 0.46), L82@19.8Å(now 12.5,conf 0.40), L80@15.8Å(now 4.0,conf 0.34), A79@12.4Å(now 7.5,conf 0.34)
  - K94↔L76: targets 27.2/6.8Å but partners are 12.3Å apart → too_close_together by 8.1Å
  - E86↔L76: targets 21.9/6.8Å but partners are 7.9Å apart → too_close_together by 7.2Å
  - L76↔L80: targets 6.8/15.8Å but partners are 3.7Å apart → too_close_together by 5.3Å
- **V67** — severity 16.48, 16 conflict(s); suspect input ~`L71` (group: push_out)
  - push-out (wants farther): L33@27.5Å(now 24.9,conf 1.00), F42@27.5Å(now 17.8,conf 1.00), F43@27.5Å(now 17.3,conf 1.00), V30@27.5Å(now 22.6,conf 1.00), S27@27.5Å(now 24.3,conf 1.00), Y44@27.5Å(now 18.6,conf 1.00), T45@27.5Å(now 20.6,conf 0.99), P46@27.5Å(now 22.2,conf 0.99), K47@27.5Å(now 21.3,conf 0.98), E86@22.7Å(now 4.8,conf 0.37), L82@22.4Å(now 3.9,conf 0.36), K94@21.4Å(now 16.9,conf 0.32), G88@21.3Å(now 4.9,conf 0.32), L80@21.0Å(now 12.1,conf 0.30), A79@19.8Å(now 12.3,conf 0.27), L76@17.9Å(now 11.8,conf 0.23), Q61@16.7Å(now 8.0,conf 0.21)
  - F43↔L71: targets 27.5/12.2Å but partners are 4.8Å apart → too_close_together by 10.4Å
  - Y44↔L71: targets 27.5/12.2Å but partners are 5.3Å apart → too_close_together by 10.0Å
  - T45↔L71: targets 27.5/12.2Å but partners are 6.7Å apart → too_close_together by 8.6Å
- **G88** — severity 14.62, 9 conflict(s); suspect input ~`L82` (group: push_out)
  - push-out (wants farther): E31@27.5Å(now 24.2,conf 1.00), L33@27.5Å(now 22.8,conf 1.00), K47@27.5Å(now 23.0,conf 1.00), P46@27.5Å(now 23.2,conf 1.00), V30@27.5Å(now 20.9,conf 1.00), S27@27.5Å(now 22.6,conf 1.00), C25@27.5Å(now 24.3,conf 0.98), Q61@25.2Å(now 12.4,conf 0.60), L71@23.8Å(now 14.8,conf 0.52), G73@22.3Å(now 14.1,conf 0.47), L76@19.7Å(now 10.8,conf 0.40), L82@7.3Å(now 3.9,conf 0.36), A79@14.6Å(now 10.6,conf 0.34), V67@21.3Å(now 4.9,conf 0.32)
  - L82↔V67: targets 7.3/21.3Å but partners are 3.9Å apart → too_close_together by 10.1Å
  - Q61↔L82: targets 25.2/7.3Å but partners are 11.6Å apart → too_close_together by 6.3Å
  - L71↔L80: targets 23.8/12.6Å but partners are 5.3Å apart → too_close_together by 5.9Å
- **C37** — severity 14.46, 9 conflict(s); suspect input ~`R40` (group: pull_in)
  - pull-in (wants closer): R40@6.2Å(now 8.9,conf 0.40)
  - push-out (wants farther): K94@27.5Å(now 17.6,conf 1.00), C25@25.2Å(now 20.0,conf 0.59), V2@24.7Å(now 16.3,conf 0.50), I1@24.4Å(now 16.8,conf 0.48), S27@20.6Å(now 17.2,conf 0.42), Y34@6.6Å(now 3.5,conf 0.39)
  - K94↔R40: targets 27.5/6.2Å but partners are 10.6Å apart → too_close_together by 10.8Å
  - K94↔G41: targets 27.5/6.8Å but partners are 12.1Å apart → too_close_together by 8.5Å
  - K94↔F42: targets 27.5/7.5Å but partners are 15.1Å apart → too_close_together by 4.9Å

## Secondary Structure (DSSP-like)

- helix(H)=43 · strand(E)=30 · 3-10(G)=15 · coil(C)=6

```
CHHHEHGHEHEHHEHEHHHECEECHGCGEHCEGGEHHEGEEECEEGEHHHHHEHEGHGEEHGHHHHHHHEHHEEHHEHHHGHGHHGHGEHEGEE
```

## Backbone H-bond Network

- total=93 · helix(i→i+4)=17 · sheet=76
  - V2 ↔ C6  (helix)
  - Q4 ↔ S8  (helix)
  - C6 ↔ C10  (helix)
  - S8 ↔ L12  (helix)
  - Y13 ↔ N17  (helix)
  - L15 ↔ C19  (helix)
  - I48 ↔ C52  (helix)
  - E50 ↔ T54  (helix)
  - C57 ↔ Q61  (helix)
  - E63 ↔ V67  (helix)
  - V67 ↔ L71  (helix)
  - L71 ↔ H75  (helix)
  - C72 ↔ L76  (helix)
  - H75 ↔ A79  (helix)
  - L76 ↔ L80  (helix)
  - E78 ↔ L82  (helix)
  - L80 ↔ C84  (helix)
  - C5 ↔ S11  (sheet)
  - C5 ↔ Q14  (sheet)
  - C5 ↔ E16  (sheet)
  - … +73 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=32 · exposed=32 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=596 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=388 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=3.0396 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=38 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=6: C5–C10, C6–C25, C19–C37, C52–C57, C53–C72, C66–C84

## Side-chain Rotamers (χ1/χ2)

- 86 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
