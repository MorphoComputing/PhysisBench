# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1KTH\sequence\1KTH.pdb`
- output_pdb: `general_benchmark\model_refinement\af2\1KTH\seeds\seed_1\1KTH.pdb`
- residues: 56
- mode: oracle
- ca_rmsd: 9.548 A
- tm_score_ca_ordered: 0.10882670871803536
- heavy_atom_rmsd: 10.362 A
- sidechain_heavy_atom_rmsd: 11.423 A
- **all-atom quality (honest):** heavy 10.362 A, sidechain 11.423 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/48 (0.0)
- lj_severe: 0
- lj_near: 39
- distogram_pairs: 159
- bin_accuracy: 0.176

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=39
- rigid_domain_reconvergence: applied=True accepted=18 rmsd=8.432822155088965 -> 7.466674728450973 A
- topology_reconvergence: applied=True accepted=0/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 9.547968102572334
- ga_delta_rmsd: -2.2047754577113556  ga_fitness_mode: energy
- pre_local_rmsd: 9.548024281528658  localized_anchor_rmsd: 9.548024281528658

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** N25-Y34 → 189 conflicts (93%)
- explained: 189/203 conflicts by 1 root cause(s)
- metrics: hubs=16 (frac 0.286), conflicts/hub=12.7, max_incompat=7.45Å, chain_span=0.982
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): N25-Y34 — explain ~189/203 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **N25** — severity 58.83, 38 conflict(s); suspect input ~`A30` (group: push_out)
  - push-out (wants farther): E51@27.4Å(now 19.2,conf 0.94), K5@27.2Å(now 19.8,conf 0.90), V53@26.8Å(now 20.1,conf 0.80), G11@26.8Å(now 15.8,conf 0.80), K52@26.0Å(now 18.2,conf 0.66), P56@25.2Å(now 17.8,conf 0.59), R14@24.9Å(now 15.6,conf 0.58), T1@24.3Å(now 20.1,conf 0.54), G45@23.4Å(now 13.3,conf 0.51), K48@24.6Å(now 16.0,conf 0.50), S46@22.8Å(now 15.4,conf 0.49), L18@15.8Å(now 12.8,conf 0.34), Y34@10.6Å(now 7.2,conf 0.34), F16@19.8Å(now 14.2,conf 0.27)
  - G45↔A30: targets 23.4/6.5Å but partners are 9.7Å apart → too_close_together by 7.2Å
  - K48↔A30: targets 24.6/6.5Å but partners are 11.0Å apart → too_close_together by 7.2Å
  - K48↔S28: targets 24.6/5.8Å but partners are 12.6Å apart → too_close_together by 6.2Å
- **T26** — severity 42.47, 29 conflict(s); suspect input ~`A30` (group: push_out)
  - push-out (wants farther): E51@26.7Å(now 18.2,conf 0.79), K5@26.6Å(now 20.9,conf 0.76), G11@26.2Å(now 16.4,conf 0.70), V53@24.4Å(now 19.6,conf 0.55), R14@24.0Å(now 16.4,conf 0.53), K52@24.4Å(now 18.7,conf 0.48), P56@21.8Å(now 17.0,conf 0.46), G45@21.7Å(now 13.5,conf 0.46), S46@20.7Å(now 13.2,conf 0.42), K48@22.7Å(now 14.3,conf 0.37), L18@16.3Å(now 13.7,conf 0.35), Y34@9.7Å(now 6.9,conf 0.34), F16@19.5Å(now 14.8,conf 0.27)
  - G45↔A30: targets 21.7/5.5Å but partners are 9.7Å apart → too_close_together by 6.4Å
  - E51↔A30: targets 26.7/5.5Å but partners are 14.9Å apart → too_close_together by 6.4Å
  - G11↔A30: targets 26.2/5.5Å but partners are 14.9Å apart → too_close_together by 5.8Å
- **S28** — severity 38.09, 25 conflict(s); suspect input ~`Y34` (group: push_out)
  - push-out (wants farther): K5@27.0Å(now 20.5,conf 0.85), G11@26.8Å(now 16.8,conf 0.80), E51@25.9Å(now 16.5,conf 0.67), R14@25.9Å(now 17.0,conf 0.66), V53@24.1Å(now 18.0,conf 0.53), P56@22.1Å(now 15.4,conf 0.47), K52@23.8Å(now 16.9,conf 0.44), G45@20.1Å(now 12.1,conf 0.41), S46@19.4Å(now 11.7,conf 0.39), L18@18.3Å(now 14.7,conf 0.37), K48@21.6Å(now 12.6,conf 0.33), F32@6.8Å(now 4.2,conf 0.31), F16@20.8Å(now 15.6,conf 0.30)
  - E51↔Y34: targets 25.9/6.3Å but partners are 12.2Å apart → too_close_together by 7.5Å
  - G45↔Y34: targets 20.1/6.3Å but partners are 7.6Å apart → too_close_together by 6.2Å
  - K52↔Y34: targets 23.8/6.3Å but partners are 11.9Å apart → too_close_together by 5.5Å
- **E51** — severity 25.18, 19 conflict(s); suspect input ~`K48` (group: push_out)
  - push-out (wants farther): N25@27.4Å(now 19.2,conf 0.94), G11@26.9Å(now 23.8,conf 0.82), T26@26.7Å(now 18.2,conf 0.79), S28@25.9Å(now 16.5,conf 0.67), A30@24.0Å(now 14.9,conf 0.53), Y34@21.1Å(now 12.2,conf 0.44), S46@8.9Å(now 6.3,conf 0.34), P56@9.0Å(now 3.1,conf 0.34), G45@11.5Å(now 8.2,conf 0.34), F32@21.1Å(now 12.9,conf 0.31)
  - S28↔K48: targets 25.9/6.5Å but partners are 12.6Å apart → too_close_together by 6.8Å
  - A30↔K48: targets 24.0/6.5Å but partners are 11.0Å apart → too_close_together by 6.6Å
  - T26↔K48: targets 26.7/6.5Å but partners are 14.3Å apart → too_close_together by 6.0Å
- **V53** — severity 23.30, 19 conflict(s); suspect input ~`K48` (group: push_out)
  - push-out (wants farther): N25@26.8Å(now 20.1,conf 0.80), T26@24.4Å(now 19.6,conf 0.55), S28@24.1Å(now 18.0,conf 0.53), A30@21.8Å(now 16.1,conf 0.46), Y34@19.9Å(now 13.3,conf 0.40), G45@11.6Å(now 8.0,conf 0.34), F32@19.0Å(now 14.1,conf 0.25)
  - N25↔P56: targets 26.8/4.8Å but partners are 17.8Å apart → too_close_together by 4.1Å
  - S28↔P56: targets 24.1/4.8Å but partners are 15.4Å apart → too_close_together by 3.8Å
  - P56↔Y34: targets 4.8/19.9Å but partners are 11.0Å apart → too_close_together by 4.0Å
- **A30** — severity 14.77, 12 conflict(s); suspect input ~`Y34` (group: push_out)
  - push-out (wants farther): K5@24.5Å(now 18.0,conf 0.55), E51@24.0Å(now 14.9,conf 0.53), G11@23.9Å(now 14.9,conf 0.52), R14@22.4Å(now 15.6,conf 0.47), V53@21.8Å(now 16.1,conf 0.46), P56@20.0Å(now 13.4,conf 0.41), G45@17.9Å(now 9.7,conf 0.36), K52@22.4Å(now 15.5,conf 0.35), S46@17.2Å(now 9.8,conf 0.35), K48@19.8Å(now 11.0,conf 0.27), F16@18.0Å(now 14.3,conf 0.23)
  - E51↔Y34: targets 24.0/5.5Å but partners are 12.2Å apart → too_close_together by 6.3Å
  - Y34↔K52: targets 5.5/22.4Å but partners are 11.9Å apart → too_close_together by 4.9Å
  - Y34↔G45: targets 5.5/17.9Å but partners are 7.6Å apart → too_close_together by 4.8Å

## Secondary Structure (DSSP-like)

- helix(H)=42 · strand(E)=7 · 3-10(G)=6 · coil(C)=1

```
CEHHGHHEEHHHHHHHHHEHHHHHHHHHHHHHGHHHHHHHHHEHHHGHHEGHGGHE
```

## Backbone H-bond Network

- total=42 · helix(i→i+4)=34 · sheet=8
  - I3 ↔ P7  (helix)
  - L6 ↔ E10  (helix)
  - P7 ↔ G11  (helix)
  - E10 ↔ R14  (helix)
  - G11 ↔ D15  (helix)
  - T12 ↔ F16  (helix)
  - C13 ↔ I17  (helix)
  - R14 ↔ L18  (helix)
  - F16 ↔ W20  (helix)
  - I17 ↔ Y21  (helix)
  - L18 ↔ Y22  (helix)
  - W20 ↔ P24  (helix)
  - Y21 ↔ N25  (helix)
  - Y22 ↔ T26  (helix)
  - D23 ↔ K27  (helix)
  - P24 ↔ S28  (helix)
  - N25 ↔ C29  (helix)
  - T26 ↔ A30  (helix)
  - K27 ↔ R31  (helix)
  - S28 ↔ F32  (helix)
  - … +22 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=23 · exposed=18 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=414 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=275 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=3.477 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=39 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C4–C54, C13–C37, C29–C50

## Side-chain Rotamers (χ1/χ2)

- 48 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
