# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1EGF\sequence\1EGF.pdb`
- output_pdb: `general_benchmark\model_refinement\af2\1EGF\seeds\seed_1\1EGF.pdb`
- residues: 51
- mode: oracle
- ca_rmsd: 2.653 A
- tm_score_ca_ordered: 0.5782759366024983
- heavy_atom_rmsd: 4.125 A
- sidechain_heavy_atom_rmsd: 4.974 A
- **all-atom quality (honest):** heavy 4.125 A, sidechain 4.974 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/45 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 1176
- bin_accuracy: 0.693

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=33
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 2.653242375078332
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 2.7281201054212105  localized_anchor_rmsd: 2.6533673715831947

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** S1 → 35 conflicts (62%); I22 → 5 conflicts (9%); Y2-H21 → 4 conflicts (7%)
- explained: 44/56 conflicts by 3 root cause(s)
- metrics: hubs=17 (frac 0.333), conflicts/hub=3.3, max_incompat=6.95Å, chain_span=0.569
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): S1 + I22 + Y2-H21 — explain ~44/56 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **S27** — severity 7.32, 5 conflict(s); suspect input ~`S1` (group: push_out)
  - push-out (wants farther): S1@18.5Å(now 13.5,conf 0.37), Y2@15.1Å(now 11.6,conf 0.34)
  - I22↔S1: targets 6.0/18.5Å but partners are 6.8Å apart → too_close_together by 5.8Å
  - S1↔E23: targets 18.5/7.2Å but partners are 6.6Å apart → too_close_together by 4.7Å
  - I22↔Y2: targets 6.0/15.1Å but partners are 5.5Å apart → too_close_together by 3.6Å
- **D26** — severity 6.28, 5 conflict(s); suspect input ~`S1` (group: push_out)
  - push-out (wants farther): S1@17.9Å(now 12.2,conf 0.36), Y2@14.6Å(now 11.1,conf 0.34)
  - E23↔S1: targets 5.6/17.9Å but partners are 6.6Å apart → too_close_together by 5.7Å
  - I22↔S1: targets 6.2/17.9Å but partners are 6.8Å apart → too_close_together by 4.9Å
  - I22↔Y2: targets 6.2/14.6Å but partners are 5.5Å apart → too_close_together by 2.8Å
- **T29** — severity 6.04, 6 conflict(s); suspect input ~`Y2` (group: push_out)
  - push-out (wants farther): S1@18.8Å(now 15.0,conf 0.38), Y2@15.4Å(now 12.8,conf 0.34)
  - S1↔I22: targets 18.8/7.3Å but partners are 6.8Å apart → too_close_together by 4.7Å
  - H21↔S1: targets 6.7/18.8Å but partners are 8.9Å apart → too_close_together by 3.2Å
  - H21↔Y2: targets 6.7/15.4Å but partners are 5.9Å apart → too_close_together by 2.8Å
- **L25** — severity 5.80, 4 conflict(s); suspect input ~`S1` (group: push_out)
  - push-out (wants farther): S1@19.8Å(now 13.6,conf 0.40), Y2@16.4Å(now 13.2,conf 0.35)
  - I22↔S1: targets 6.0/19.8Å but partners are 6.8Å apart → too_close_together by 7.0Å
  - I22↔Y2: targets 6.0/16.4Å but partners are 5.5Å apart → too_close_together by 4.8Å
  - S1↔H21: targets 19.8/8.7Å but partners are 8.9Å apart → too_close_together by 2.2Å
- **D39** — severity 5.72, 6 conflict(s); suspect input ~`I22` (group: push_out)
  - push-out (wants farther): S1@24.6Å(now 20.7,conf 0.56)
  - S1↔I22: targets 24.6/13.2Å but partners are 6.8Å apart → too_close_together by 4.7Å
  - S1↔T29: targets 24.6/6.8Å but partners are 15.0Å apart → too_close_together by 2.8Å
  - S1↔H21: targets 24.6/13.1Å but partners are 8.9Å apart → too_close_together by 2.7Å
- **Y28** — severity 4.84, 5 conflict(s); suspect input ~`S1` (group: push_out)
  - push-out (wants farther): S1@17.3Å(now 13.2,conf 0.35), Y2@13.9Å(now 10.6,conf 0.34)
  - I22↔S1: targets 6.4/17.3Å but partners are 6.8Å apart → too_close_together by 4.2Å
  - H21↔S1: targets 5.3/17.3Å but partners are 8.9Å apart → too_close_together by 3.2Å
  - H21↔Y2: targets 5.3/13.9Å but partners are 5.9Å apart → too_close_together by 2.7Å

## Secondary Structure (DSSP-like)

- helix(H)=13 · strand(E)=17 · 3-10(G)=14 · coil(C)=7

```
EEEEGCHHHHGHEGHHEGGECGCGHHEGEEGEGCGEEEHGHHECGGHEECC
```

## Backbone H-bond Network

- total=35 · helix(i→i+4)=2 · sheet=33
  - S8 ↔ Y12  (helix)
  - Y12 ↔ G16  (helix)
  - S1 ↔ M20  (sheet)
  - Y2 ↔ M20  (sheet)
  - P3 ↔ M20  (sheet)
  - G4 ↔ M20  (sheet)
  - C13 ↔ M20  (sheet)
  - C13 ↔ T29  (sheet)
  - C13 ↔ C30  (sheet)
  - C13 ↔ C32  (sheet)
  - G17 ↔ T29  (sheet)
  - G17 ↔ C30  (sheet)
  - G17 ↔ C32  (sheet)
  - G17 ↔ Y36  (sheet)
  - G17 ↔ S37  (sheet)
  - M20 ↔ S27  (sheet)
  - M20 ↔ T29  (sheet)
  - M20 ↔ C30  (sheet)
  - M20 ↔ C32  (sheet)
  - T29 ↔ S37  (sheet)
  - … +15 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=18 · exposed=18 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=176 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=89 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.9833 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C19, C13–C30, C32–C41

## Side-chain Rotamers (χ1/χ2)

- 45 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
